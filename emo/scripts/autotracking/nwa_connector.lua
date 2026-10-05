-- Connecteur NWA (Network Access) pour EmoTracker
-- Simule une connexion avec l'outil Bizhawk-nwa-tool :
--   https://github.com/Skarsnik/Bizhawk-nwa-tool
--
-- Le plugin BizHawk ouvre un serveur TCP (port 0xBEEF = 49135, incrementé si occupé,
-- configurable via la variable d'environnement NWA_PORT_RANGE). EmoTracker/LuaConnector
-- se connecte en TCP brut sur ce port et parle le protocole NWA :
--   * commandes texte terminées par "\n", arguments séparés par ';'
--     ex : "CORE_READ EXECUTEMEMORY;0x2ac0;1\n"
--   * réponses simples : hash texte "\nkey:value\n...\n\n" ou OK "\n\n"
--   * erreurs : "\nerror:<kind>\nreason:<texte>\n\n"
--   * données mémoire (après CORE_READ) : bloc binaire = 0x00 + taille u32 BE + bytes
--   * le read est traité par BizHawk à la FRAME SUIVANTE -> on attend la réponse
--     en continuant de "pumper" la socket avec un timeout court.
--
-- Pour tester sans BizHawk : tools/nwa_bizhawk_simulator.py (même protocole, même port).
--
-- Ce fichier fournit :
--   * NWASegment : objet compatible MemorySegment (ReadUInt8/16/32...) qui lit la RAM
--     de la GBA via CORE_READ, avec cache par frame -> utilisable directement par les
--     fonctions d'autotracking.lua (ReadU8/testFlag...).
--   * nwaConnectorConnect() / nwaConnectorDisconnect() : cycle de vie + provider
--     enregistré sous le nom "NWA-BIZHAWK" dans AutoTracker.

NWACONNECTOR_PROVIDERNAME = "NWA-BIZHAWK"
NWA_DOMAIN = "EXECUTEMEMORY"   -- domaine BizHawk exposé en NWA par le plugin

------------------------------------------------------------------
-- Helpers : octets <-> nombres (endianness GBA = little endian)
------------------------------------------------------------------
-- La bibliotheque "socket" fournie par LuaConnector (EmoTracker) est de
-- style luasocket : sock:send(<chaine>). On normalise ici pour accepter
-- aussi la forme sock:send(<nb_octets>) au cas ou.
local function sockSend(sock, data)
        if type(data) == "string" then
                local n, err = sock:send(data)
                if n then return n end
                return nil, err
        end
        return sock:send(data) -- passe-through (forma "nbytes")
end

local function be32(data, i) -- taille du bloc binaire reseau : big endian
        return data:byte(i) * 0x1000000 + data:byte(i + 1) * 0x10000
                + data:byte(i + 2) * 0x100 + data:byte(i + 3)
end

local function leU(data, i, size) -- lecture little endian (domaine GBA)
        local v = 0
        for k = size - 1, 0, -1 do
                v = v * 0x100 + data:byte(i + k)
        end
        return v
end

-- Parse les réponses texte NWA : lignes "cle:valeur" entre deux "\n\n"
local function parseHashReply(payload)
        local out = {}
        for line in payload:gmatch("([^\n]+)") do
                local k, v = line:match("^([^:]+):(.*)$")
                if k then out[k] = v end
        end
        return out
end

------------------------------------------------------------------
-- Segment mémoire : implements l'interface MemorySegment d'EmoTracker
------------------------------------------------------------------
NWASegment = {}
NWASegment.__index = NWASegment

function NWASegment.new(connector)
        return setmetatable({ _c = connector }, NWASegment)
end

-- Lit `size` octets à `address` (aller simple, sans cache)
-- NWA : "CORE_READ <domaine>;<offset>;<size>\n" -> bloc binaire 0x00 + u32 BE + bytes
-- La réponse n'arrive qu'à la frame suivante côté BizHawk -> on pumpe la socket.
function NWASegment:_rawRead(address, size)
        local c = self._c
        if not c.socket then return nil end
        local cmd = string.format("CORE_READ %s;0x%x;%d", NWA_DOMAIN, address, size)
        if not c:_sendCommand(cmd) then return nil end
        local status, payload = c:_readReply()
        if status ~= "OK" or #payload < size then return nil end
        return payload
end

-- Cache par frame : tous les memory watches d'une même frame réutilisent les données
function NWASegment:readCached(address, size)
        local c = self._c
        if c.frame ~= c._lastFrame then
                c._cache = {}
                c._lastFrame = c.frame
        end
        local key = tostring(address) .. ":" .. tostring(size)
        local data = c._cache[key]
        if data == nil then
                data = self:_rawRead(address, size) or false
                c._cache[key] = data
        end
        if data == false then return nil end
        return data
end

function NWASegment:ReadUInt8(address)
        local d = self:readCached(address, 1)
        if not d then return 0 end
        return d:byte(1)
end

function NWASegment:ReadUInt16(address)
        local d = self:readCached(address, 2)
        if not d then return 0 end
        return leU(d, 1, 2)
end

function NWASegment:ReadUInt24(address)
        local d = self:readCached(address, 3)
        if not d then return 0 end
        return leU(d, 1, 3)
end

function NWASegment:ReadUInt32(address)
        local d = self:readCached(address, 4)
        if not d then return 0 end
        return leU(d, 1, 4)
end

function NWASegment:ReadBool(address)
        return self:ReadUInt8(address) ~= 0
end

function NWASegment:ReadBitAtOffset(address, bitOffset)
        return (self:ReadUInt8(address) & (1 << bitOffset)) ~= 0
end

function NWASegment:ReadSegment(startAddress, endAddress)
        local d = self:readCached(startAddress, endAddress - startAddress)
        return d or ""
end

------------------------------------------------------------------
-- Client NWA : protocole + cycle de vie (updateProvider)
------------------------------------------------------------------
NWAConnector = {
        host = "127.0.0.1",
        ports = { 0xBEEF, 0xBF00, 0xBF01, 0xBF02, 0xBF03, 0xBF04 }, -- 49135..49140
        socket = nil,
        port = nil,
        segment = nil,
        frame = 0,          -- compteur de frames pour invalider le cache
        retries = 0,        -- anti-spam de reconnexion
        connectedNotified = false,
        _cache = {},
        _lastFrame = -1,
        _rx = "",           -- buffer de réception
}

local RX_TIMEOUT_MS = 1200  -- patience max pour une réponse (read traité à la frame suivante)

function NWAConnector:_sendCommand(cmd)
        if not self.socket then return false end
        local data = cmd .. "\n"
        local n = self.socket:send(data:len())
        return n == data:len()
end

-- Remplit le buffer de réception en pompant la socket (timeout ms) ;
-- renvoie false si la socket est morte / fermée.
function NWAConnector:_pump(ms)
        self.socket:settimeout(ms)
        while true do
                local chunk, err = self.socket:receive(8192)
                if chunk and chunk ~= "" then
                        self._rx = self._rx .. chunk
                elseif err == "timeout" then
                        return true
                else
                        return false -- closed / erreur réseau
                end
        end
end

-- Lis une réponse complète dans self._rx. Types NWA (cf. NWAServer.cs du plugin) :
--   * erreur      : "\nerror:<kind>\nreason:<...>\n\n"
--   * bloc binaire: 0x00 + taille u32 BE + données (réponse à CORE_READ)
--   * hash/OK     : texte terminé par "\n\n"
-- Retourne (status, payload) avec status in {"OK","ERROR","DISCONNECTED"}
function NWAConnector:_readReply()
        for attempt = 1, 8 do
                -- 1) bloc binaire déjà entamé ?
                if self._rx:sub(1, 1) == "\0" and #self._rx >= 5 then
                        local size = be32(self._rx, 2)
                        if #self._rx >= 5 + size then
                                local payload = self._rx:sub(6, 5 + size)
                                self._rx = self._rx:sub(6 + size)
                                return "OK", payload
                        end
                end
                -- 2) réponse texte terminée par "\n\n" ?
                local e = self._rx:find("\n\n", 2, true)
                if e then
                        local reply = self._rx:sub(2, e - 1)
                        self._rx = self._rx:sub(e + 2)
                        if reply:match("^error:") then
                                print("[NWA] erreur serveur : " .. reply:gsub("\n", " | "))
                                return "ERROR", reply
                        end
                        return "OK", reply
                end
                -- 3) sinon on attend de la donnée
                if not self:_pump(RX_TIMEOUT_MS) then
                        return "DISCONNECTED", ""
                end
        end
        return "DISCONNECTED", ""
end

function NWAConnector:_tryPorts()
        for _, p in ipairs(self.ports) do
                local sock = socket.tcp()
                sock:settimeout(150) -- ms : pas de blocage long si BizHawk absent
                if sock:connect(self.host, p) then
                        sock:settimeout(300)
                        self.socket = sock
                        self.port = p
                        self._rx = ""
                        return true
                end
                sock:close()
        end
        return false
end

function NWAConnector:disconnect(reason)
        if self.socket then
                self.socket:close()
                self.socket = nil
                self.port = nil
        end
        self.segment = nil
        self._rx = ""
        if self.connectedNotified then
                self.connectedNotified = false
                print("[NWA] Déconnecté (" .. (reason or "manuel") .. ")")
        end
end

-- Handshake après connexion : on s'annonce et on vérifie qu'un core GBA est chargé
function NWAConnector:_handshake()
        if not self:_sendCommand("MY_NAME_IS emo-autotracking-test") then return false end
        local s1 = self:_readReply()
        if s1 == "DISCONNECTED" then return false end
        if not self:_sendCommand("CORE_CURRENT_INFO") then return false end
        local status, info = self:_readReply()
        if status ~= "OK" then return false end
        local parsed = parseHashReply(info)
        if parsed.system and parsed.system:upper() ~= "GBA" then
                print(string.format("[NWA] Core %s (%s) non-GBA ignoré",
                        parsed.core or "?", parsed.system))
                return false
        end
        print(string.format("[NWA] Core : %s (%s)", parsed.core or "?", parsed.system or "GBA"))
        return true
end

-- Appelée par EmoTracker à chaque frame quand le provider est actif
function NWAConnector:updateProvider()
        self.frame = self.frame + 1
        if not self.socket then
                self.retries = self.retries + 1
                if self.retries % 60 ~= 1 then return end -- ~1 tentative/seconde
                if self:_tryPorts() and self:_handshake() then
                        self.connectedNotified = true
                        print(string.format("[NWA] Connecté à BizHawk-nwa-tool (127.0.0.1:%d)", self.port))
                        InvalidateReadCaches()
                else
                        self:disconnect("échec connexion")
                end
                return
        end
        -- Vérification alive : EMULATION_STATUS toutes les ~60 frames
        if self.frame % 60 == 0 then
                if self:_sendCommand("EMULATION_STATUS") then
                        local status = self:_readReply()
                        if status == "DISCONNECTED" then
                                self:disconnect("plus de réponse")
                                return
                        end
                else
                        self:disconnect("socket cassé")
                        return
                end
        end
end

------------------------------------------------------------------
-- Enregistrement / activation du provider dans EmoTracker
------------------------------------------------------------------
function nwaConnectorSetup()
        if AutoTracker:GetConnectionState(NWACONNECTOR_PROVIDERNAME) ~= 0 then
                return -- déjà enregistré
        end
        AutoTracker:RegisterProvider(NWACONNECTOR_PROVIDERNAME, NWAConnector, false)
        print(string.format("[NWA] Provider '%s' enregistré (Bizhawk-nwa-tool, ports %d-%d)",
                NWACONNECTOR_PROVIDERNAME, NWAConnector.ports[1], NWAConnector.ports[#NWAConnector.ports]))
end

function nwaConnectorConnect()
        nwaConnectorSetup()
        if AutoTracker:IsConnectorAvailable(NWACONNECTOR_PROVIDERNAME) then
                print("[NWA] Connexion déjà active")
                return
        end
        if NWAConnector:_tryPorts() and NWAConnector:_handshake() then
                NWAConnector.connectedNotified = true
                print(string.format("[NWA] Connecté à BizHawk-nwa-tool (127.0.0.1:%d)", NWAConnector.port))
                InvalidateReadCaches()
        else
                NWAConnector:disconnect("manuelle")
                print("[NWA] BizHawk-nwa-tool introuvable. Options :")
                print("[NWA]   A) BizHawk réel : Tools -> External tools -> NWA Tool (port 49135)")
                print("[NWA]   B) Simulation   : python3 tools/nwa_bizhawk_simulator.py")
        end
end

function nwaConnectorDisconnect()
        NWAConnector:disconnect("manuelle")
end

-- Callback EmoTracker : le provider devient disponible/indisponible
function nwaConnectorStateChanged(name, state)
        if name ~= NWACONNECTOR_PROVIDERNAME then return end
        if state == 3 then -- CONNECTED
                NWAConnector.segment = NWASegment.new(NWAConnector)
                InvalidateReadCaches()
                print("[NWA] Segment mémoire prêt (GBA EXECUTEMEMORY accessible)")
        elseif state == 2 then -- DISCONNECTED
                NWAConnector.segment = nil
                InvalidateReadCaches()
        end
end

------------------------------------------------------------------
-- Outils de test : écriture dans la RAM simulée (bCORE_WRITE)
------------------------------------------------------------------
function nwaConnectorWrite(address, bytes)
        local c = NWAConnector
        if not c.socket then
                print("[NWA] Écriture impossible : pas de connexion")
                return false
        end
        local size = #bytes
        local cmd = string.format("bCORE_WRITE %s;0x%x;%d", NWA_DOMAIN, address, size)
        if not c:_sendCommand(cmd) then return false end
        local block = "\0" .. string.pack(">I4", size) .. bytes
        local n = c.socket:send(block:len())
        if n ~= block:len() then return false end
        local status = c:_readReply()
        return status == "OK"
end

-- Fabrique des valeurs de test dans la zone autotracking (0x2AC0..0x2EB3)
-- pour vérifier visuellement les boutons Bool/Int de l'interface de test.
function nwaConnectorSeedTestPattern()
        local ok = nwaConnectorWrite(0x2AC0, string.rep("\xF3\xF2", 16))
        print("[NWA] Seed motifs murs 0xF3/0xF2 : " .. tostring(ok))
        local rising = {}
        for i = 0, 255 do rising[i + 1] = string.char(i) end
        ok = nwaConnectorWrite(0x2D00, table.concat(rising))
        print("[NWA] Seed rampe 0..255 en 0x2D00 : " .. tostring(ok))
end
