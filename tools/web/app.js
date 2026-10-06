// Interface web de test autotracking — EmoTracker / Bizhawk-nwa-tool
// Boutons generes depuis tools/flags.json (export du Google Sheet via
// parse_flags_csv.py) : un bouton par flag (adresse 0x200XXXX + masque 0xXX).
// Chaque bouton change de type Bool <-> Int. Plus aucun bouton lua.
"use strict";

const $ = (s) => document.querySelector(s);
let state = null;          // dernier /api/state reçu
let sheetRows = {};          // cle "hex:flag" -> {el, cb}
let cards = {};            // id -> {el, refs}
let lastLogLen = 0;
let gridIds = "";          // signature des ids du grid (reconstruction si besoin)

async function api(path, body) {
  const opt = body === undefined ? {} : {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  };
  const r = await fetch(path, opt);
  const j = await r.json();
  if (!r.ok || j.error) throw new Error(j.error || ("HTTP " + r.status));
  return j;
}

function isActive(b) {
  return b.type === "Bool" ? !!b.on : (b.count | 0) !== 0;
}

function makeCard(b) {
  const el = document.createElement("div");
  el.className = "card";
  el.dataset.id = b.id;
  el.innerHTML = `
    <div class="top">
      <span class="hex"></span>
      <span class="kind ${b.kind === "flag" ? "flag" : ""}">${b.kind === "flag" ? "flag" : "addr"}</span>
      <button class="typebtn" title="Changer le type Bool / Int"></button>
    </div>
    <div class="val"><span class="cur"></span><span class="ram"></span></div>
    <div class="actions">
      <button data-a="main"></button>
      <button data-a="dec" class="dec" title="-1">−</button>
      <button data-a="inc" class="inc" title="+1">+</button>
    </div>
    <div class="ctx" title="${(b.context || "").replace(/"/g, "&quot;")}"></div>`;
  const refs = {
    hex: el.querySelector(".hex"),
    type: el.querySelector(".typebtn"),
    cur: el.querySelector(".cur"),
    ram: el.querySelector(".ram"),
    main: el.querySelector('[data-a="main"]'),
    dec: el.querySelector(".dec"),
    inc: el.querySelector(".inc"),
    ctx: el.querySelector(".ctx"),
  };
  refs.type.onclick = () => act(b.id, { action: "type" });
  refs.main.onclick = () => {
    const bb = state && state.buttons.find((x) => x.id === b.id);
    act(b.id, { action: bb && bb.type === "Int" ? "inc" : "toggle" });
  };
  refs.dec.onclick = () => act(b.id, { action: "dec" });
  refs.inc.onclick = () => act(b.id, { action: "inc" });
  // bouton flag (flags.json) : adresse reelle + bit affiche, contexte = nom
  if (b.kind === "flag" && b.addr_hex) {
    refs.hex.textContent = b.addr_hex + " · " + b.hex;   // ex. 0x2002A80 · 0x01
    refs.ctx.textContent = b.context || "";
  } else {
    refs.ctx.textContent = b.context || "";
  }
  return { el, refs };
}

async function act(id, body) {
  try {
    await api("/api/action", Object.assign({ id }, body));
    refreshSoon();
  } catch (e) { addLocalLog("⚠ " + e.message); }
}

function updateCard(b) {
  let c = cards[b.id];
  if (!c) { c = cards[b.id] = makeCard(b); $("#grid").appendChild(c.el); }
  // hex : bouton flag -> "0x2002A80 · 0x01" (adresse + bit), sinon l'hex seul
  c.refs.hex.textContent = (b.kind === "flag" && b.addr_hex)
    ? b.addr_hex + " · " + b.hex : b.hex;
  c.refs.type.textContent = b.type;
  c.refs.type.classList.toggle("int", b.type === "Int");
  if (b.type === "Bool") {
    // envoi brut a EmoTracker : 1 / 0 (pas ON/OFF)
    c.refs.cur.textContent = b.on ? "1" : "0";
    c.refs.main.textContent = b.on ? "0" : "1";
    c.refs.main.title = b.on ? "Envoyer 0 à EmoTracker (bit cassé dans la RAM)"
                             : "Envoyer 1 à EmoTracker (bit posé dans la RAM)";
    c.refs.dec.style.display = c.refs.inc.style.display = "none";
  } else {
    c.refs.cur.textContent = "valeur = " + b.count;
    c.refs.main.textContent = "+1";
    c.refs.dec.style.display = c.refs.inc.style.display = "";
  }
  c.refs.ram.textContent = ("ram" in b) ? "RAM: 0x" + b.ram.toString(16).padStart(2, "0").toUpperCase() : "";
  // synchro avec la RAM reelle (ecrite par le sheet / BizHawk / watch NWA) :
  // un flag ON dans la RAM allume la carte meme sans clic web
  const ramOn = ("ram_on" in b) ? b.ram_on : null;
  c.el.classList.toggle("active", isActive(b) || ramOn === true);
  if (ramOn === true && !isActive(b)) c.el.classList.add("ramset");
  else c.el.classList.remove("ramset");
  c.el.style.display = visible(b) ? "" : "none";
}

function visible(b) {
  const q = $("#search").value.trim().toLowerCase();
  if (q) {
    const hx = b.hex.toLowerCase();                 // ex. "0x2002ac0"
    const ah = (b.addr_hex || "").toLowerCase();    // ex. "0x2002a80"
    const bare = hx.slice(2);                       // "2002ac0"
    const dec = String(b.value);                    // forme décimale
    const ctx = (b.context || "").toLowerCase();    // nom du flag (flags.json)
    const qq = q.startsWith("0x") ? q.slice(2) : q; // requête sans préfixe
    if (!hx.includes(q) && !bare.includes(qq) && !dec.includes(q)
        && !ah.includes(q) && !ctx.includes(q)) return false;
  }
  const k = $("#kindFilter").value;
  if (k !== "all" && b.kind !== k) return false;
  const t = $("#typeFilter").value;
  if (t !== "all" && b.type !== t) return false;
  if ($("#stateFilter").value === "active" && !isActive(b)) return false;
  return true;
}

function renderMap() {
  if (!state) return;
  const base = 0x2002ac0, end = 0x2002eb3;
  const byAddr = {};
  for (const b of state.buttons) if (b.kind === "address") byAddr[b.value] = b;
  let html = "";
  for (let a = base; a < end; a++) {
    const b = byAddr[a];
    let cls = "mb";
    let txt = "", title = "0x" + a.toString(16).padStart(7, "0").toUpperCase();
    if (b) {
      cls += " used";
      if (b.type === "Bool" && b.on) cls += " set";
      if (b.type === "Int" && b.count) { cls += " val"; txt = b.count; }
      title += " — clic : ouvrir le bouton";
    }
    html += `<span class="${cls}" title="${title}" data-id="${b ? b.id : ""}">${txt}</span>`;
    if ((a - base) % 20 === 19) html += "<br>";
  }
  const map = $("#map");
  map.innerHTML = html;
  map.querySelectorAll(".mb.used").forEach((m) => {
    m.style.cursor = "pointer";
    m.onclick = () => {
      const c = cards[m.dataset.id];
      if (c) { c.el.scrollIntoView({ behavior: "smooth", block: "center" }); c.el.style.outline = "2px solid var(--acc)"; setTimeout(() => (c.el.style.outline = ""), 1200); }
    };
  });
}

function renderAll() {
  if (!state) return;
  // si la liste des ids a change (flags.json recharge / /api/load_flags),
  // on reconstruit proprement la grille avant de la remplir
  const ids = state.buttons.map((b) => b.id).join(",");
  if (ids !== gridIds) {
    gridIds = ids;
    cards = {};
    sheetRows = {};
    $("#grid").innerHTML = "";
    const sf = $("#sheetFlags"); if (sf) sf.innerHTML = "";
  }
  let nActive = 0;
  for (const b of state.buttons) { updateCard(b); if (isActive(b) || b.ram_on) nActive++; }
  $("#stats").textContent =
    `${state.counts.sheet_flags} flags (source : ${state.sheet_source}) · ${nActive} actifs`;
  const badge = $("#nwaBadge");
  badge.textContent = state.connected ? "NWA : connecté (port " + state.port + ")" : "NWA : déconnecté";
  badge.classList.toggle("on", state.connected);
  $("#simBadge").textContent = "Clients NWA : " + (state.clients.length ? state.clients.join(", ") : "aucun");
  renderMap();
  renderSheet();
  const log = $("#log");
  if (state.log.length !== lastLogLen) {
    lastLogLen = state.log.length;
    log.textContent = state.log.join("\n");
    log.scrollTop = log.scrollHeight;
  }
}

function addLocalLog(msg) {
  const log = $("#log");
  log.textContent += "\n» " + msg;
  log.scrollTop = log.scrollHeight;
}

let pending = false;
function refreshSoon() {
  if (pending) return;
  pending = true;
  requestAnimationFrame(async () => {
    pending = false;
    try { state = await api("/api/state"); renderAll(); }
    catch (e) { addLocalLog("⚠ état : " + e.message); }
  });
}

$("#btnConnect").onclick = async () => {
  try { await api("/api/connect", { port: +$("#port").value || 49135 }); addLocalLog("Connexion NWA demandée sur le port " + $("#port").value); }
  catch (e) { addLocalLog("⚠ connexion : " + e.message); }
  refreshSoon();
};
$("#btnDisconnect").onclick = async () => {
  try { await api("/api/disconnect", {}); } catch (e) { addLocalLog("⚠ " + e.message); }
  refreshSoon();
};
$("#btnSeed").onclick = async () => {
  try { await api("/api/seed", {}); addLocalLog("Motifs écrits dans la RAM simulée"); } catch (e) { addLocalLog("⚠ " + e.message); }
  refreshSoon();
};
$("#btnReset").onclick = async () => {
  try { await api("/api/reset", {}); } catch (e) { addLocalLog("⚠ " + e.message); }
  refreshSoon();
};
$("#btnSendFlags").onclick = async () => {
  try {
    const r = await api("/api/flags", { on: true });
    addLocalLog(`📤 ${r.sent.length} flags envoyés dans la RAM (${r.sent.join(" ")}) → EmoTracker les lira au prochain watch`);
  } catch (e) { addLocalLog("⚠ " + e.message); }
  refreshSoon();
};

/* ------------------------------------------------------------------ */
/* Panneau FLAGS Google Sheet : addr + bit, ecrits a l'adresse reelle  */
/* ------------------------------------------------------------------ */

function sheetKey(f) { return f.hex + ":" + f.flag; }

function buildSheetEl(f) {
  const el = document.createElement("div");
  el.className = "srow";
  el.innerHTML = `<input type="checkbox" title="Envoie 1 (coché) ou 0 (décoché) à EmoTracker"><span class="shex"></span>` +
                 `<span class="sflag"></span><span class="sbit"></span><span class="sname"></span>`;
  el.querySelector(".shex").textContent = f.hex;
  el.querySelector(".sflag").textContent = f.flag;
  el.querySelector(".sbit").textContent = f.on ? "1" : "0";   // valeur envoyée
  el.querySelector(".sname").textContent = f.context || "";
  const cb = el.querySelector("input");
  cb.onchange = async () => {
    try {
      await api("/api/sheet_flags", { sheet: [{ addr: f.addr, flag: f.flag }], on: cb.checked });
      addLocalLog(`${cb.checked ? "\u2705" : "\u2b1c"} ${f.hex} ${f.flag} (${f.context}) \u2192 envoie ${cb.checked ? "1" : "0"} \u00e0 EmoTracker`);
    } catch (e) { addLocalLog("\u26a0 flag : " + e.message); cb.checked = !cb.checked; }
    refreshSoon();
  };
  return el;
}

function makeSheetRow(f) {
  const el = buildSheetEl(f);
  const cb = el.querySelector("input");
  el._update = (ff) => {
    cb.checked = !!ff.on;
    el.classList.toggle("on", !!ff.on);
    el.querySelector(".sbit").textContent = ff.on ? "1" : "0";
  };
  return { el, cb };
}

function renderSheet() {
  if (!state) return;
  const flags = state.sheet_flags || [];
  $("#sheetCount").textContent = flags.length;
  const q = ($("#sheetSearch").value || "").trim().toLowerCase();
  const box = $("#sheetFlags");
  for (const f of flags) {
    let row = sheetRows[sheetKey(f)];
    if (!row) { row = sheetRows[sheetKey(f)] = makeSheetRow(f); box.appendChild(row.el); }
    row.el._update(f);                       // checkbox + valeur 1/0 envoyée
    const hay = (f.hex + " " + f.flag + " " + (f.context || "")).toLowerCase();
    row.el.style.display = (!q || hay.includes(q)) ? "" : "none";
  }
}

async function sendAllSheet(on) {
  try {
    const r = await api("/api/flags", { on });
    addLocalLog(`\ud83d\udce4 ${r.sent.length} flags du sheet \u2192 envoie ${on ? "1" : "0"} \u00e0 EmoTracker (RAM)`);
  } catch (e) { addLocalLog("\u26a0 " + e.message); }
  refreshSoon();
}
$("#btnSheetAll").onclick = () => sendAllSheet(true);
$("#btnSheetOff").onclick = () => sendAllSheet(false);
$("#sheetSearch").addEventListener("input", renderSheet);
$("#btnClearFlags").onclick = async () => {
  try {
    const r = await api("/api/flags", { on: false });
    addLocalLog(`🧹 ${r.sent.length} flags effacés de la RAM simulée`);
  } catch (e) { addLocalLog("⚠ " + e.message); }
  refreshSoon();
};
["#search", "#kindFilter", "#typeFilter", "#stateFilter"].forEach((s) =>
  $(s).addEventListener("input", () => state && state.buttons.forEach(updateCard)));

setInterval(refreshSoon, 1000);   // polling léger (le watch NWA pousse via le serveur)
refreshSoon();
