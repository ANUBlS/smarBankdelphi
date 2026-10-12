# Customers module – parity checklist (Delphi `Packages/Customer_Operations` → web)

CLSID `{D773B8FF-0651-421E-8451-897F8A20F8BE}` (TCO_Main), tree item *Customers → Customer operations*
(`smartbank.ini` `Item5 = axinplace:{D773B8FF…}`), route `/m/customer-operations`.
Code: `api/app/customers.py` (rules + SQL), `api/app/delphi.py` (shared DOA/Delphi helpers),
`web/public/modules/customers.js` (UI), mock `api/app/db/mock_cs.py` + `api/fixtures/cs.json`.
Tests: `api/tests/test_customers.py`, `api/tests/test_delphi.py`, E2E `e2e/customers_screens.py`.

Status: ✅ ported identically · 🟡 ported with a documented difference · ⛔ intentionally not ported · ❓ verify on the real DB

Every SQL string in `customers.py` is checked character-for-character against the DFM (`SQL.Strings`); the only SQL that
is not byte-identical is #8 (concatenated user input → bind variable).

## Main form (customers_operation_impl.pas / CO_datamod_impl)

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 1 | CO_datamod_impl.dfm:215 `Customers` | Legal-entity list: `nvl(cust_type,0)=0 and close_dat is null order by :title` (substitution var, default `ID`) | `SQL_CUSTOMERS` verbatim; `:title` filled only from the grid column whitelist | ✅ |
| 2 | customers_operation_impl.dfm:120-180 grid; :2497 `DBGridCustomersTitleClick` | Columns №, VÖEN, Adı, Açılma tarixi, Daxil edən; title click re-sorts by that column | Same columns; header click → `?sort=COL` | ✅ |
| 3 | DOA incremental fetch | Whole dataset scrollable | Server pages of 100 rows + "load more" (rownum window). Refresh keeps already-loaded count (RefreshExecute :1697 keeps RecNo) | 🟡 |
| 4 | :312-343 `ActionSpeedSearchExecute` | Enter in ID / VÖEN / Name boxes: `SearchRecord(field, text, [srIgnoreCase, srPartialMatch, srFromCurrent, srForward])`; not found → "Axtarış sona çatdı. Əvvəldən başlansın?" → from beginning → "Yazı tapılmayıb!" | `/locate` on the server over the same ordered SQL (`rownum` position after the current row, case-insensitive prefix, `LIKE … ESCAPE`); same two prompts | ✅ ❓ (DOA `srFromCurrent` assumed to start *after* the current row – otherwise repeated Enter could never advance) |
| 5 | :1744-1763 `EditNameKeyPress` | Name search maps `i I İ ı` to `` ` `` and searches `NAME1` (`translate(name,'IiİiIı','``````')`) | `az_i_to_backtick` + `NAME1` | ✅ |
| 6 | :1736-1742 `DateEditKeyUp` | `Customers.Locate('OPEN_DAT', date, [])` from the first row; silent when absent | `/locate-date` | ✅ |
| 7 | :988-1015 `SearchAccKeyPress` | Enter: Account `CID:=null, p_AccNO:=text+'%'`, locate customer by `ACCKLID`, then the account | `/search-account` + client locate | ✅ |
| 8 | :1069-1117 `SearchNameKeyUp` | `Select * from juraccs Where upper(accname) like upper('%<text>%') and rownum=1` (text concatenated) → locate customer | Same predicate with a **bind** (`:p_name`) | 🟡 (injection-safe, same rows) |
| 9 | :1057 / KeyUp handlers | Typing in one account search box clears the other | Same | ✅ |
| 10 | CO_datamod_impl.pas:805-820 `CustomersAfterScroll`, dfm:448 `Account` | Accounts of the current customer `custID=:CID or AccNO like :p_AccNO` (p_AccNO=null) | `SQL_ACCOUNT` verbatim | ✅ |
| 11 | :987-997 `AccountAfterScroll`, dfm:1792 `Transactions` | Transactions of the current account from `transactionsp`, `order by :title` (title click :1130) | Verbatim; status icon 1 delayed / 2 committed / 3 rejected | ✅ |
| 12 | :1724-1734 `N20Click` + SBCustomer.pas:224-231 | Open accounts → "Müştərinin açıq hesabları var"; else confirm "Müştəri qeydiyyatdan çıxarılsın?" → `SBOP.close_customer(v_ID, CURRENTDATE=>SBOP.get_date, RESULT=>0)` | Same checks (UI + server). `RESULT` is bound as an OUT variable | 🟡 ❓ (Delphi passes the literal 0; if RESULT is IN in the real spec, change `Out(int)` to `0`) |
| 13 | :1352-1435 `ActionStepCommitExecute` | Empty → "Heç bir əməliyyat qeyd edilməyib"; current row committed → "Əməliyyat artıq təsdiqlənib!"; confirm; each selected (or current) row with status 1/3 → `SB_TRANSACTION.transaction_commit(TransactionID, CommitTemp=>True)` + commit; errors counted, loop continues; one error → its text, several → cs_CommitInformation | `step_commit()`; BOOLEAN `CommitTemp=>true` passed through an anonymous block (`plsql`) because python-oracledb cannot bind PL/SQL BOOLEAN on 11g | ✅ |
| 14 | :1611-1684 `N18Click` | `SB_ACA.CheckObjectAccess('Transaction','delete')`; per row Yes/No/Cancel/YesToAll ("%d sayda əməliyyat ləğv edilsin?"); `vid_OP.TrDelete=1` → "Bu tip əməliyyatı bu moduldan ləğv etmək olmaz"; `transaction_delete`; errors swallowed only when >1 row selected; commit per row | Same dialog sequence; one request per row; access check repeated per request | ✅ (server re-checks access on every request – stricter) |
| 15 | :1810 `DBGridCustomersDblClick` → N19 (edit) | Double-click opens the card | Same | ✅ |
| 16 | Delphi multi-select on the transactions grid (dgMultiSelect) | Ctrl-click selection | Checkbox column (+ select all) | 🟡 |

## Customer card (UnitCustProps.pas)

| # | Delphi (unit:line) | Behaviour | Web | Status |
|---|---|---|---|---|
| 17 | :161-175 `New` | Open date = `SBOP.get_date`; quality default `Lookup('name','Yüksək','id')` | `card-lookups.system_date`, `default_quality_id` | ✅ |
| 18 | :177-221 `Edit` | Loads the row; quality combo disabled when it already has a value | Same | ✅ |
| 19 | :645-765 `FormCreate` | Required stars from `customer_operations.get_Messaj('customers', <column>)` ≠ 0 (16 columns) | `required_flags()` – same 16 calls (positional) | ✅ |
| 20 | :412-555 `ToolButton4Click` | 16 checks in fixed order, first failure shows its message and stops; only `short_name` is unconditional | `VALIDATION` table + `validate()`; messages verbatim in az, translated in en/ru; unit test asserts the order | ✅ |
| 21 | same | Text checks are `Text = ''` – no Trim (a single space passes) | Same (unit test) | ✅ |
| 22 | :496 / :528 / :538 | `address_type`, `tph_contact_type`, `tph_communication_type` are tested with `KeyValue = ''`; an unselected lookup is Null and `Null = ''` is False → **these three checks never fire in Delphi** | Kept literally (fires only for an empty string, which the UI never sends) | ✅ (quirk preserved – flag to the business if they expected it to work) |
| 23 | :567-575 PEP gate | If name ≠ '' and `pep_chek ≠ -1`: show Pep_change and **exit without saving**. `pep_chek` (customers_operation_impl.pas:270) is a unit global, set to -1 only by the dialog's "bağla" (Pep_changeUnit.pas:71-75) | `status: pep_check`; "bağla" → `POST /pep/close` sets the flag in the web session (= lifetime of the loaded plugin) | ✅ |
| 24 | Pep_changeUnit "Yoxla" | HTTP check is commented out in the source → button does nothing | Button present, no-op | ✅ |
| 25 | :578-594 blacklist | `PG_PCustService.GET_WORLD_YOXLAMA(trim(name), null)` non-empty → red "DIQQƏT! Bu müştəri qara siyahıdadır! Risk şöbəsinə müraciət edin!"; Bəli → "Davam edilir..." and save; Xeyr → "Əməliyyat dayandırıldı." | `status: blacklist` → red confirm → resend with `blacklist_confirmed` (server calls the function again) | ✅ |
| 26 | :597-610 second PEP warning | Reads `Pep_change.Memo1.Lines.Count > 2`; the memo filler is commented out → unreachable | Not ported | ⛔ (dead code) |
| 27 | CO_datamod_impl.pas:822-879 `CustomersApplyRecord` → SBCustomer.pas:177-222 `Sb_AddCustomer` | `SBOP.add_customer` named params (OP_ID 0, NEREZIDENT 0/1, integers via AsInteger so NULL→0, v_-prefixed contact fields) | `add_customer_params()` – identical names; unit test covers NULL→0 | ✅ |
| 28 | SBCustomer.pas:233-277 `Sb_EditCustomer` | `SBOP.upd_customer` with every name `v_`-prefixed + `v_ID` | `upd_customer_params()` | ✅ |
| 29 | SBCustomer.pas `CLOSE_DAT => NullDate` | TDateTime 0.0 | NULL (same decision as Accounts #17) | ❓ |
| 30 | ApplyUpdates commit | Delphi relies on the session commit (CommitUpdates only clears the cache) | Explicit commit after the call | 🟡 ❓ |
| 31 | dfm lookups (PRINAD, QRP_KLIE, VID_SOB cust_type -1/0, ORG_PRAV, SFERADEY, NALOG, OTRASLI, mmx_contact_type, mmx_communication_type, countries ×2, phone codes, CUST_RISK_CATEG, cust_quality) | Combos | `/card-lookups`, all SQL verbatim | ✅ |
| 32 | dfm:3899 `DSCityByConctType`, :4222 `cust_risk_desc` | Cities reload on country change; risk descriptions reload on category change | Same | ✅ |

## Account sub-forms

| # | Delphi | Behaviour | Web | Status |
|---|---|---|---|---|
| 33 | FormAcc_Unit.pas:592-641 | "Yeni hesab": lists (dfm:610/638/773/740, RepSymbol, AccFlags), defaults (customer, name, branch from `acc_Settings`, today from sysdat); Bal_CN2 visible if `PG_PCustService.get_Modle_comp('customer_operations','FormAccount','Bal_CN2')` | `/new-account` | ✅ |
| 34 | :706-724 `CheckParams` | Trimmed required: symbol, balance, customer, branch, currency (+ Bal_CN2 when visible, + acc no on commit) → "Məlumat tam deyil" | `check_params()` (unit test) | ✅ |
| 35 | :677-698 | Generate number: `SBOP.GenerateAccountNumber(BalCn, CurrencyID, CustomerID, BranchID, AnalitKod, NoteCode, BalCN2)` | Same named call | ✅ |
| 36 | :571-590 | `customer_operations.open_Account` positional (acc, valute, bal, cust, date, limit, repsymb, filial, tipacc=FlagMap, accname, custid.Text) – `custid` has no DataSource so the last arg is always '' (NULL) | Same 11 arguments, last NULL | ✅ |
| 37 | CO_AccFlags | FlagMap = first char of each checked item, comma-joined | `flag_map()` | ✅ |
| 38 | P_AccState_Unit.dfm:405 | Balances history, ascending (`--desc` is commented out) | Verbatim | ✅ |
| 39 | P_AccTransaction_Unit.dfm:464/550 + `FillAmounts` | Debit/credit documents for a period (default sysdat.tek_dat both ends), totals | Verbatim SQL incl. `SMART.` schema prefix, Decimal totals | ✅ ❓ (`SMART.` prefix must exist on the target DB, as in Delphi) |

## Not ported

| Delphi | Reason | Status |
|---|---|---|
| N6 receipt, N21 order, N10 statement, N11 memorial, N22/N23 contracts (FastReport) | Printing/report layouts – separate reporting phase | ⛔ |
| N1 order info, Biznes proses, notes plugin (LoadPlugin2), relations, photo/logo, quality *meyar* (ButtonMeyar) | Separate plugins / forms not in scope | ⛔ |
| DBGridAccountsDblClick (frmAccInfo), DBGridTransactionsDblClick (frmTrView) | The unit sources are missing in the repository (only in `__history`) | ⛔ ❓ |
| Edit1Change (concatenated `inn=` query) | Not wired to any component in the DFM (dead code) | ⛔ |
| Hidden menu items (Visible=False in DFM) | Not reachable in Delphi | ⛔ |

## Accounts link
The Delphi `Packages/Accounts` package has no call into Customer_Operations (and vice versa), so no cross-link was added.

## Mock data (DB_MODE=mock)
`cs.json`: 8 customers (one closed, one cust_type 1 – both hidden by the SQL), lookups, `get_Messaj` flags
(name, risk, VÖEN, incorporation country, country, city, address, phone required), blacklist entry
`Black Sanction Ltd`, transactions in all three states, vid_op type 9 with TrDelete=1, a commit-limit error
(ORA-20110 for amounts ≥ 5000 when not admin) to demonstrate the error path. TELLER has the module right and
`Customers` select/insert/update (no delete → close customer shows ORA-20280).
