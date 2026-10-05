# Interface web de test — Autotracking EmoTracker / Bizhawk-nwa-tool

Interface **web** pour tester l'autotracking du pack TMC (`emo/scripts/autotracking/autotracking.lua`)
sans avoir besoin d'un jeu ou d'une vraie console.

## Lancer

```bash
python3 tools/nwa_bizhawk_simulator.py            # options : [port NWA] [port web]
#  -> serveur NWA simulé (protocole de https://github.com/Skarsnik/Bizhawk-nwa-tool) sur 127.0.0.1:49135
#  -> interface web                              sur http://127.0.0.1:8090/
```

Ouvrir **http://127.0.0.1:8090/** dans un navigateur.

## Ce que fait l'interface

- **Extraction automatique** : au démarrage, le serveur parse `autotracking.lua` et crée
  **un bouton par adresse `0xXXXXXXX`** (226 adresses RAM GBA) et **par flag `0xXX`**
  (34 masques/valeurs), avec la ligne de code source en contexte.
- **Boutons Bool / Int** : chaque bouton peut changer de type via son badge `Bool`/`Int` :
  - `Bool` → Activer / Désactiver (toggle true/false) ;
  - `Int` → +1 / −1 (compteur 0..255 avec wrap).
- Les clics sur les boutons *adresse* écrivent aussi dans la **RAM simulée** : un client
  EmoTracker/LuaConnector connecté au port NWA (49135) voit exactement ces valeurs via
  `CORE_READ` — c'est le pont web ↔ autotracker.
- **Connecter NWA** : le web devient lui-même client NWA (comme le fera EmoTracker) et un
  *memory watch* lit la RAM toutes les 0,5 s ; les boutons se mettent à jour selon la
  logique réelle (Bool = octet ≠ 0, Int = valeur de l'octet). Fonctionne contre le
  simulateur local **ou** contre BizHawk avec le plugin Bizhawk-nwa-tool (mettre le bon port).
- **Seed RAM** : écrit des motifs de test (0x01/0xF3…) dans la zone 0x2AC0–0x2EB3.
- **Carte mémoire** : heatmap cliquable de la zone RAM suivie, synchronisée avec les boutons.
- Filtres (recherche hex/déc, adresses vs flags, type Bool/Int, actifs seuls) + journal.

## API (pour scripter des tests)

| Route            | Corps                                                        |
|------------------|--------------------------------------------------------------|
| `GET  /api/state`| état complet (boutons, RAM, connexion, log)                  |
| `POST /api/action` | `{"id":"addr-2002ae4","action":"toggle\|inc\|dec\|set\|type","value":?}` |
| `POST /api/connect` / `api/disconnect` | `{"port":49135}`                    |
| `POST /api/seed` / `api/reset` | —                                       |

## Avec EmoTracker en vrai

1. Lancer BizHawk + plugin **Bizhawk-nwa-tool** (port 49135) *ou* ce simulateur.
2. Dans EmoTracker, charger le pack `emo/` : le connecteur `nwa_connector.lua` parle le
   même protocole NWA et expose la RAM à `autotracking.lua`.
3. Ouvrir l'interface web : chaque clic modifie la RAM → l'autotracker réagit en direct.

Fichiers : `tools/web/index.html`, `tools/web/app.js` (front), `tools/nwa_bizhawk_simulator.py`
(serveur NWA simulé + API web), données statiques : `tools/web/autotracking_data.json`.
