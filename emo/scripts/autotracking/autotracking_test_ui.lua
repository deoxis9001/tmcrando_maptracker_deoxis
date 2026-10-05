-- Interface de test pour l'autotracking (EmoTracker / PopTracker)
-- But : lister toutes les adresses memoire (0xXXXXXXX) et tous les flags (0xXX)
-- trouves dans emo/scripts/autotracking/autotracking.lua, et generer des boutons
-- custom qui basculent entre deux types : Bool (toggle) ou Int (incrementation).
--
-- Utilisation :
--   1. Les tables AUTOTRACKING_TEST_ADDRESSES / AUTOTRACKING_TEST_FLAGS sont
--      auto-generees a partir d'autotracking.lua -> voir autotracking_test_data.lua
--   2. Ce fichier cree un bouton par entree. Gauche = action principale,
--      droite = change le type du bouton (Bool <-> Int).
--   3. Connexion emulateur simulee avec Bizhawk-nwa-tool :
--        https://github.com/Skarsnik/Bizhawk-nwa-tool
--        nwa_connector.lua = client NWA (protocole TCP du plugin) ;
--        tools/nwa_bizhawk_simulator.py = serveur simule sans BizHawk.
--      Boutons de controle : CONNECT NWA (droite = deconnecter), SEED RAM
--      (ecrit des motifs de test dans la RAM via bCORE_WRITE).
--   4. Le memory watch applique la vraie logique (octet lu depuis la RAM)
--      seulement quand le connecteur NWA est actif ; sinon boutons manuels.

ScriptHost:LoadScript(ScriptAutotracking.."autotracking_test_data.lua")
ScriptHost:LoadScript(ScriptAutotracking.."nwa_connector.lua")

AUTOTRACKING_TEST_UI = {}          -- liste globale des boutons crees (pour debug/comptage)
TestButton = CustomItem:extend()

------------------------------------------------------------------
-- Bouton de test : peut etre de type "Bool" (toggle 0/1) ou "Int" (compteur)
------------------------------------------------------------------
function TestButton:init(label, code, value, initialType)
        self:createItem(label)
        -- NB: on stocke l'etat dans self.ItemInstance (Set/Get reellement exposes
        -- par EmoTracker/PopTracker), comme le font les ToggleItem du pack.
        self.code = code
        self.value = value                       -- adresse 0xXXXXXXX ou flag 0xXX
        self.type = initialType or "Bool"        -- "Bool" | "Int"
        self.ItemInstance:Set("Active", false)   -- etat Bool
        self.ItemInstance:Set("Count", 0)        -- etat Int
        if PopVersion then
                -- EmoTracker ne gere pas les images texte -> image par defaut
                local path = (self.type == "Bool")
                        and "images/options/main/requirements/figurine10.png"
                        or "images/options/main/requirements/figurine50.png"
                self.ItemInstance.PotentialIcon = ImageReference:FromPackRelativePath(path)
                self.ItemInstance.Icon = ImageReference:FromPackRelativePath(path)
        end
        table.insert(AUTOTRACKING_TEST_UI, self)
end

function TestButton:canProvideCode(code)
        return code == self.code
end

function TestButton:providesCode(code)
        if code == self.code then
                if self.type == "Bool" then
                        return self:getProperty("Active") and 1 or 0
                else
                        return self:getProperty("Count")
                end
        end
        return 0
end

function TestButton:updateIcon()
        if not PopVersion then return end
        local on  = (self.type == "Bool" and self:getProperty("Active"))
                 or (self.type == "Int" and self:getProperty("Count") > 0)
        local path = on
                and "images/options/main/requirements/figurineMax.png"
                or ((self.type == "Bool")
                        and "images/options/main/requirements/figurine10.png"
                        or "images/options/main/requirements/figurine50.png")
        self.ItemInstance.Icon = ImageReference:FromPackRelativePath(path)
end

-- Gauche : agit selon le type du bouton
function TestButton:onLeftClick()
        if self.type == "Bool" then
                self:setProperty("Active", not self:getProperty("Active"))
        else
                local c = self:getProperty("Count") + 1
                if c > 255 then c = 0 end   -- un octet fait 0..255
                self:setProperty("Count", c)
        end
        self:updateIcon()
        local count = tonumber(self:getProperty("Count")) or 0
        print(string.format("[AT-TEST] %s (%s) type=%s value=0x%x -> Bool=%s Int=%d",
                self.ItemInstance.Name, self.code, self.type, self.value,
                tostring(self:getProperty("Active")), count))
end

-- Droite : change le type du bouton Bool <-> Int
function TestButton:onRightClick()
        if self.type == "Bool" then
                self.type = "Int"
        else
                self.type = "Bool"
        end
        self:updateIcon()
        print(string.format("[AT-TEST] %s (%s) type change -> %s",
                self.ItemInstance.Name, self.code, self.type))
end

------------------------------------------------------------------
-- Generation de l'interface : un bouton par 0xXXXXXXX et par 0xXX
------------------------------------------------------------------
function createAutotrackingTestUI(defaultType)
        defaultType = defaultType or "Bool"
        for i, addr in ipairs(AUTOTRACKING_TEST_ADDRESSES) do
                TestButton(
                        string.format("ADDR 0x%07X [%d]", addr, i),
                        string.format("at_addr_%07x", addr),
                        addr,
                        defaultType)
        end
        for i, flag in ipairs(AUTOTRACKING_TEST_FLAGS) do
                TestButton(
                        string.format("FLAG 0x%02X [%d]", flag, i),
                        string.format("at_flag_%02x", flag),
                        flag,
                        defaultType)
        end
        print(string.format("[AT-TEST] Interface creee : %d adresses + %d flags = %d boutons",
                #AUTOTRACKING_TEST_ADDRESSES, #AUTOTRACKING_TEST_FLAGS, #AUTOTRACKING_TEST_UI))
end

------------------------------------------------------------------
-- Lecture memoire optionnelle : applique la logique reelle
-- (value & flag) sur chaque bouton ADDR quand une connexion existe.
------------------------------------------------------------------
function autotrackingTestApply(segment)
        if not AutoTracker:IsConnectorAvailable(NWACONNECTOR_PROVIDERNAME) then
                return
        end
        for _, btn in ipairs(AUTOTRACKING_TEST_UI) do
                if btn.code:match("^at_addr_") then
                        local v = segment:ReadUInt8(btn.value)
                        if btn.type == "Bool" then
                                btn:setProperty("Active", v ~= 0)
                        else
                                btn:setProperty("Count", v)
                        end
                        btn:updateIcon()
                end
        end
end

------------------------------------------------------------------
-- Boutons de controle de la connexion NWA (Bizhawk-nwa-tool)
------------------------------------------------------------------
function createAutotrackingTestControls()
        local conn = TestButton("CONNECT NWA (BizHawk)", "at_nwa_connect", 0, "Bool")
        function conn:onLeftClick()
                nwaConnectorConnect()
                self:setProperty("Active", NWAConnector.socket ~= nil)
                self:updateIcon()
        end
        function conn:onRightClick()
                nwaConnectorDisconnect()
                self:setProperty("Active", false)
                self:updateIcon()
        end

        local seed = TestButton("SEED RAM (motifs test)", "at_nwa_seed", 0, "Bool")
        function seed:onLeftClick()
                nwaConnectorSeedTestPattern()
        end
        function seed:onRightClick()
                print("[AT-TEST] Sans connexion NWA active, SEED ne fait rien.")
        end
end

function autotracker_started()
        print("[AT-TEST] Autotracker demarre : creation de l'interface de test")
        createAutotrackingTestUI("Bool")
        createAutotrackingTestControls()
        -- Tentative automatique vers BizHawk-nwa-tool (ou le simulateur Python)
        nwaConnectorSetup()
        nwaConnectorConnect()
        ScriptHost:AddMemoryWatch("TMC AT TEST", 0x2002ac0, 0x400, autotrackingTestApply)
end
