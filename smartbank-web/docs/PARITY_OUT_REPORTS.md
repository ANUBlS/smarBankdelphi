# Parity – Off-balance account/report group

Group 1 of the off-balance queue: `Packages/Out_control_tape` (done), `Out_account`, `Out_Statement`, `Out_turn_over_for_period` (pending).

## Out_control_tape (TFrmControlTape, {C0327750-D672-4942-90C6-4D56121957A7})
Web: tree "Off-balance → Off-balance Control Tape" (Action `#21`), route `/m/out-control-tape`, API `/api/out-control-tape`.
Design-time SQL: `api/app/out_ct_sql.py` (generated from untdatamod.dfm). Run-time SQL: `api/app/out_control_tape.py`, string-for-string copies of the
concatenations in ControlTapeImpl.pas (line cited per function).

| Delphi | Web | Notes |
|---|---|---|
| ActiveFormCreate :386 `Out_SB_Balance.GetBankDay` | `/init` date | |
| Full :402-425 ForMoney → 'Bütün valyutalar' + Valu_Name, Rate[] | `/init` currencies; `currency` = ItemIndex | |
| Branch dataset (-1 'Bütün filiallar' ∪ filial) | branch select | |
| Button3 'Yeniləmək' :435-473 ForTable (Out_provarch, group by bal_cn1/bal_cn2) | `/refresh` | |
| BuildFilter :352-365 | `build_filter` | Toggle on + empty text → `a.bal_cn1 in (-1)` even on plan 2 (Delphi quirk, kept). Text now validated as integer list (Delphi pasted it raw) |
| Button1 'Çap' :476-536 Group → QR1 | `/print` (grouped by balance account, totals) | Reads `out_provdoc` when date = GetBankDay, else `out_provarch` |
| Button2 'Məcmu' :540-555 = Button3 + BanksName → QR2 | `/summary` | Amount column printed white unless a currency is picked → hidden in web |
| Button4 'Hesabat' :557-683 ODSTransactionView → QTransactionView | `/report` | Ignores branch and balance filters, always Out_Provarch (as Delphi) |
| QuickReport previews | grid + PDF/XLSX (`/{kind}.pdf|xlsx`) | layouts approximated |

Tests: `api/tests/test_out_control_tape.py` (3). Screenshots: 76-out-control-tape.png, 77-out-control-tape-print.png, 78-out-control-tape-report.png.
Unverified (no DB): `Out_SB_Balance.GetBankDay` existence/return type, `Out_sb_complex_transactions.getcurrencyname`, QR1/QR2 exact layouts.
