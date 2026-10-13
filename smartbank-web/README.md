# SmartBank Web – Milestone 1 (pilot: login, splash, main menu tree)

This is the web replacement for the Delphi XE host application `Programs/SmartBank/SmartBank.dpr`.
**The Oracle schema, packages and procedures are not changed.** The API calls them exactly the way the
Delphi code does, and every SQL/PL/SQL text in `api/app/sb.py` cites its Delphi source `unit:line`.

```
browser ── web (Node 20 + Express, :3000) ── /api ──> api (FastAPI + python-oracledb thin, :8000) ──> Oracle
```

## Run in mock mode (no Oracle needed)

Docker:
```bash
cp .env.example .env          # DB_MODE=mock is the default
docker compose up --build
# open http://localhost:8080
```
Without Docker:
```bash
python3 -m venv .venv && .venv/bin/pip install -r api/requirements.txt pytest httpx
(cd api && DB_MODE=mock ../.venv/bin/uvicorn app.main:app --port 8000) &
(cd web && npm install && API_URL=http://127.0.0.1:8000 node server.js)
# open http://localhost:3000
```
Mock users (api/fixtures/users.json). The password shown is what you type.

| user | password | shows |
|---|---|---|
| ADMIN | Admin#2026 | administrator: every module allowed, Login history page |
| TELLER | Teller#2026 | limited rights (some nodes locked), "password expires in 3 days" warning |
| EXPIRED | Expired#2026 | ORA-28001 flow: asks for a new password |
| FINGER | Finger#2026 | user flagged for fingerprint login (refused, see below) |
| LOCKED | Locked#2026 | ORA-28000 account locked in the database |

## Run against the real Oracle database

In `.env` set `DB_MODE=oracle` and `ORACLE_HOST`, `ORACLE_PORT`, `ORACLE_SERVICE` (or `ORACLE_DSN`), then run `docker compose up -d --build`.
- python-oracledb runs in **thin mode**, so no Instant Client is needed. Thin mode needs Oracle DB 12.1 or later. For 11.2, thick mode would have to be enabled (not included).
- The `.env` file holds no database user name or password. Each user logs on with their own Oracle account, the same as in the Delphi app. As in the Delphi logon dialog, the password is sent to Oracle wrapped as `'KLs' + password + '#1$'` (`Packages/SBCommon50/UnitSBOraLogOn.pas:314,397`).
- Each signed-in user gets **their own Oracle session**, held in the API process. That is why the API runs with a single worker. `USER`, `SYS_CONTEXT('CLIENTCONTEXT','user_company')` and package state therefore behave exactly as in the desktop app.
- The DB must be reachable from the Docker host. If the host name only resolves on your network, use `extra_hosts` in `docker-compose.yml`.
- Put HTTPS (nginx, Traefik or similar) in front of the web container and set `COOKIE_SECURE=true`.

## What the pilot does (Delphi → web)

| Delphi | Web | Oracle calls (unchanged) |
|---|---|---|
| TOracleLogon dialog, 3 attempts (`SBOInitPkg.pas:40`) | Login page (username + password only, one DB from .env). After 3 failed attempts the login is refused for `LOGIN_LOCK_SECONDS` | Oracle logon; `SBLOGIN.GetSessionID`, `SBLOGIN.UserID` |
| ORA-28001 → password dialog (`UnitSBOraLogOn.pas:324`) | New-password fields on the login page | logon with new password |
| Expiry warning `ex<5` (`UnitSBOraLogOn.pas:360`) | Warning toast | `dba_users` expiry query (verbatim) |
| Splash | Splash screen with progress bar | `SBOP.get_date`, `SYSDAT`, `BANKINFO`, `get_app_header` |
| Main TreeView (`TPluginTreeView`, DB INI) | Collapsible, searchable sidebar | `SBCONFIG.OpenFile('SmartBankIni')`, `SBCONFIG.ReadValue` for `Tree\Sections\…` and `PluginManager\Packages` |
| AccCheck (`sbMainForm_Unit.pas:1029`) | Locked nodes. Checked again on the server at every open | `sb_aca.checkmodright(CLSID)` |
| CompanySelection form | Company picker (user menu) | `companies` queries + `DBMS_SESSION.SET_CONTEXT` block |
| PasswordChange form | Change-password dialog (same 3 rules and messages) | `SB_ADM.verify_password('KLs'+p+'#1$')`, `SBLOGIN.ChangeUserPsw` |
| Plugin OCX (ActiveX in place) | Route from `web/modules.json`. Modules not yet ported show a "Not migrated yet" page | – |

### Web-only additions
- **Inactivity sign-out.** After `SESSION_IDLE_MINUTES` (default 45) with no activity, the server closes the Oracle session. The browser warns about 60 s before and then returns to the login page.
- **Last login / last sign-out** is shown in the header and as a toast. The bank DB does not record login times, so this is stored **app-side** in SQLite (`/data` volume). The Delphi call `SBLOGIN.get_lastlogintime` is not used.
- **Login history** (admins only, using the same `SB_ACA.isadm` rule the DB uses). Shows sign-ins, sign-outs, auto sign-outs, failed attempts with the ORA text, app locks and DB locks. Filter by user, date and status, and export to CSV.
- **App-side lockout.** After `LOGIN_MAX_FAILED` (default 5) consecutive failures, the username is refused **before** any Oracle logon. A successful login resets the counter.
- **Unlock** (admin page) clears the app lock **and** runs `ALTER USER "<name>" ACCOUNT UNLOCK` in the **admin's own Oracle session**. No DBA credentials are stored. The name is checked against `ALL_USERS` and quoted. If Oracle refuses (for example ORA-01031), the ORA text is shown and nothing is unlocked. Every attempt is logged in Admin actions.
- **Oracle profile note.** The bank profile `FAILED_LOGIN_ATTEMPTS=5` can lock the **database** account on its own (ORA-28000), independently of the app counter. The web shows "account locked in the database, contact the DBA" and records `db_locked` in the history.

## Languages (i18n): edit without code changes
- Every UI text is in `web/locales/<code>.json`. `en.json` is the default and the fallback for any missing key.
- **To edit:** change the values in the JSON file and reload the page. The locales folder is mounted into the container, so no rebuild is needed.
- **To add a language:** copy `en.json` to `xx.json` (for example `tr.json`), set `"_meta.language_name"` and translate the values. It then appears in the language switcher automatically.
- Placeholders such as `{days}`, `{user}` and `{seconds}` must be kept. Keys must not be renamed.
- `DEFAULT_LANG` in `.env` sets the default language. The `az.json` and `ru.json` files are starter translations; please review them.

## Tests
```bash
cd api && ../.venv/bin/python -m pytest -q             # API tests (mock mode)
.venv/bin/pip install playwright && .venv/bin/python e2e/screenshots.py http://localhost:3000   # E2E + screenshots
```
The screenshots are in `docs/screenshots/`.

## Adding a migrated module
1. Add an API router that uses `Depends(require_module('{CLSID}'))`, so access is enforced on the server.
2. Register a page in `web/public/modules/<name>.js` as `SB.pages['/m/<slug>'] = (el, ctx) => …`.
3. Set `"migrated": true` for the module's CLSID in `web/modules.json`.

## Migrated modules
- **Accounts** (`Packages/Accounts`, CLSID `{53E4AB09-4BA7-11D6-B271-00C0262B568B}`): list with filters, ordering and paging, new/edit account, close account, account documents (debit/credit), balance history, CSV export. API in `api/app/accounts.py`, UI in `web/public/modules/accounts.js`. Parity checklist: `docs/PARITY_ACCOUNTS.md`.

- **Off-balance Accounts** (`Packages/Out_account/ocx`, CLSID `{0E7C0852-BA22-45DC-8A22-368D2FF5F4C2}`): list, filter panel, search panel, title sort, new/edit (auto account number, symbols), close, documents for a period, rests & turnovers. API `api/app/out_account.py`, UI `web/public/modules/out_account.js`. Parity: `docs/PARITY_OUT_ACCOUNT.md`.

- **Off-balance Chart of Accounts** (`Packages/Out_balancerefeditx/Ocx`, CLSID `{8E39E7D2-FC9F-4EB8-8645-9F04944FBD92}`): plan 1–4 picker, grid, navigator, edit panel, BAL_CN search. API `api/app/out_balrefedit.py`, UI `web/public/modules/out_balrefedit.js`. Parity: `docs/PARITY_OUT_SETTINGS.md`.
- **Off-balance Account Types** (`Packages/Out_Tuningacctypes`, CLSID `{4FD88BAF-D08A-474A-AADA-335E883BBB85}`): editable OUT_ACCOUNT_FLAGS grid. API `api/app/out_tuningacctypes.py`, UI `web/public/modules/out_tuningacctypes.js`. Parity: `docs/PARITY_OUT_SETTINGS.md`.

## Known limits / to verify on the real DB
See `docs/PILOT_NOTES.md`.
