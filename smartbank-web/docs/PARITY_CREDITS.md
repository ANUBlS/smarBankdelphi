# Parity: Packages/SB_Credit → Credits module (`/m/creditsmgr`)

Source: `Packages/SB_Credit` (Sm_creditsmgr, CM_Conclusion, CM_Schedule, CM_Filter, CM_coefficient, CM_DECA).
Ignored per instruction: `Copy of SB_Credit`, `SB_credit_AQro`.
Oracle SQL is verbatim in `api/app/cr_sql.py` (58 constants, each with `unit.dfm:line`); package calls (`CM_CREDIT`,
`CM_ADMINISTRATION`, `CM_SCHEDULE`, `CM_AK_reports`, `SBOP`, `SB_ACA`) keep their Delphi names and parameters.
Handler logic: `api/app/credits.py` (router) and `api/app/cr_logic.py` (pure Delphi/Oracle semantics, Decimal).
Tests: `api/tests/test_credits.py` (37 tests). E2E: `e2e/credits_screens.py`. Screenshots: `docs/screenshots/50…55-credits-*.png`.

## Ported
| Delphi | Web | Notes |
|---|---|---|
| Main list `CR_ACTIVE` (CMMainUnitImpl.dfm:8), `order by :OrderField`, VisibleFieldsData layout, status icon column | grid, click-to-sort | order field whitelisted (Delphi string-substituted it) |
| CM_Filter `BuildFilterString` / ConcatFilter, “today payments” | filter bar (currency, branch, state, today) + full filter API | filter string returned verbatim for audit |
| Conclusion card New / Edit / Look / Post, `pluginaccess`, `getadmaddition('POST')` | card modal | Edit of status 1 needs POST right (Edit :566-576) |
| `CheckFields` order, PIN rules via `checkPerson`, key filters for PIN/BOORID | `cr_logic.check_fields` | message for PIN kept as rule `<>7` (Delphi text says “at least 7”) |
| `SaveCredit` → `Contract_Add` / `Contract_Edit` (73 params, same order) | `SAVE_MAP` / `contract_params` | `insuranceid` 222 on insert, 0 on edit, as in Delphi |
| Cascades (estate type→activity→category), currency/borrower-filtered account lists, auto accounts | `/cascade`, `/accounts`, `/auto-accounts` | |
| Approve / reject (`get_post`, status rules, PLANPOST) | Approve… | |
| CM_Schedule: annuity / equal generation (`InsertAnnutySchedule`/`InsertEqualSchedule`), grace (dovr) check, delete rows, save=commit, close=rollback | schedule modal | `CommitOnPost=False` kept: generation is uncommitted until Save |
| CM_coefficient interest/main reports + Excel (formulas `=SUM`, ratio formulas) | Reports → Show / Export Excel | per-credit ORA errors are collected, not fatal, as in Delphi loop |
| CM_DECA XML (header, tag settings, groups, UnusableGrops, closed export) | Reports → DECA export | credit number is a bind variable (Delphi concatenated `Edit1.Text`) |

## Not yet ported
- Card tabs for owners/guarantors and secondary/off-balance account pickers are carried in the record but not shown as dedicated fields (values round-trip unchanged).
- Other SB_Credit plugins (payments, prolongation, write-off, printing of contracts/QuickReports).
- DECA “open credits” mode variants other than the closed-credit export path were ported only as far as `deca_closed_export`.

## Unverified (needs a real DB)
- `p_dovr` exists in the Delphi call but not in repo `SQL_credit/cm_schedule.sql` → deployed package may differ.
- Bodies of `checkPerson`, `get_status`, `get_post`, `getadmaddition` (not in repo; mock follows usage).
- `bankyeardays` (mock 360); `NLS_DATE_LANGUAGE` for `dd-MMM-yyyy` literals in DECA.
- DECA bank id/name come from an INI in Delphi (BankInfoImpl.pas); here request fields.
- `PLEDGEID_P` → `PLEDGEID` column mapping; two credit modules exist (`Packages/CreditManager` vs `SB_Credit`), both kept in modules.json.
