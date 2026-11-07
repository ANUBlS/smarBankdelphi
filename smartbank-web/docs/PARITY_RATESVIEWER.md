# Parity: Rates viewer (RatesViewer / TFrmRates, Packages/RatesViewer)

**Status: ported** (2026-10-20). The Delphi form shows an empty filter panel and an empty grid; the web does the same.

| | |
|---|---|
| Source | `Packages/RatesViewer` (`UntRatesImpl.pas/.dfm`, 343 lines). No duplicate folders (CLSID only in this folder). |
| CLSID | `{8E26DE5D-E665-4803-9C18-4658B3D59CFF}` CLASS_FrmRates (RatesViewer_TLB.pas:46) |
| Web | API `api/app/ratesviewer.py`; UI `web/public/modules/ratesviewer.js`, route `/m/ratesviewer` |
| Tree / modules.json | mock tree Transactions → "Rates viewer" (`#40`); `migrated: true` |
| Tests | `api/tests/test_memorialorder.py::test_ratesviewer_never_opened`, rights test; E2E `e2e/mo_screens.py`; screenshots 358–359 |

| Delphi | Web | Ref |
|---|---|---|
| Panel1 (alClient): FilterPanel (TGroupBox 'Filter Paneli', alLeft, 185 px, no controls) + DBGrid1 (alClient) | same layout | dfm:17-44 |
| DBGrid1 has no DataSource; DataSrcRates → RatesDataSet has **no SQL**, no Session, Active = False | empty grid; `GET /api/ratesviewer/init` checks the module right and returns `{active: false}`. No SQL is run. | dfm:45-83 |
| No OnCreate and no dataset code (the .pas is the ActiveX wrapper) | nothing else happens | pas:82-324 |
| ActiveFormKeyDown: Ctrl+F toggles FilterPanel.Visible | Ctrl+F on the page toggles the filter panel (the browser's find is suppressed on this page) | pas:326-331 |

Commit timing: no SQL, nothing to commit.

## Unverified

1. Whether a production build of this OCX had a different .dfm with SQL in RatesDataSet. The repo copy never opens anything.
