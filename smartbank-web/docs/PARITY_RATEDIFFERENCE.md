# Parity: Rate difference (RateDifference / TRateDifferenceForm, Packages/RateDifference)

**Status: ported** (2026-10-20). The module does nothing in Delphi beyond showing an empty grid; the web does the same.

| | |
|---|---|
| Source | `Packages/RateDifference` (`RateDifferenceFormImpl1.pas/.dfm`, 336 lines). No duplicate folders. |
| CLSID | `{5B149365-5DC6-11D6-AB01-00C0262B568B}` CLASS_RateDifferenceForm (RateDifference_TLB.pas:46) |
| Web | API `api/app/ratedifference.py`; SQL `api/app/rd_sql.py` (kept for reference); UI `web/public/modules/ratedifference.js`, route `/m/ratedifference` |
| Tree / modules.json | mock tree Transactions → "Rate difference" (`#38`); `migrated: true` |
| Tests | `api/tests/test_rates.py::test_ratedifference_never_opened`, rights test; screenshot 353 |

| Delphi | Web | Ref |
|---|---|---|
| ToolBar1 with DBNavigator1. Its DataSource is not set, so every button is disabled. | navigator with 10 disabled buttons | dfm:16-33 |
| DBGrid1 → DataSource1 → OracleDataSet1 (`select t.*, ad.acc_no as DebitAccNo, ac.Acc_No as CreditAccNo from temptranz t, account ad, account ac …`), no persistent columns | empty grid | dfm:34-71 |
| OracleDataSet1 has no `Active = True` and the unit has no OnCreate or other handlers (the .pas is only the ActiveX wrapper), so the dataset is **never opened** | `GET /api/ratedifference/init` checks the module right and returns `{active: false}`. No SQL is run. | pas:72-336 |

## Unverified

1. Whether a production build of this OCX opened the dataset in some other way (for example, a different .dfm with Active = True). The repo copy never opens it.
