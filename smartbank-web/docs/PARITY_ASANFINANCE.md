# Parity: ASAN Finance (ASANFinance / TASANFinanceForm, Packages/ASANFinance)

**Status: ported** (2026-10-20). **On hold:** the five QuickReport prints – 'Çap et' on Fərdi məlumat (PersonalQrFm), İş yeri (EpployeRepFrm), Təqaüd (PesionRepFrm), Təsərrüfat (RepEtkisFrm), VÖEN (VoenForm), including the bank logo (BankInfo.LOGO → temp.jpg).

| | |
|---|---|
| Source | `Packages/ASANFinance`: `ASANFinanceImpl.pas/.dfm`, `AsanDmInpl.pas/.dfm` (TAsanDm), print units `PersonalQrFmImpl`, `EpployeRepImpl`, `PensioonRepImpl`, `EtkisRepİmpl`, `VoenRepImpl` (on hold). No duplicate folders. |
| CLSID | `{DA5847F2-71D4-4757-AB06-8C280C2677A9}` CLASS_ASANFinanceForm |
| Oracle objects | `bankinfo_t`, `asan_info`, `asan_log`, `seq_asan_loq`, `JSON_TABLE` / `json_value` on `asan_log.info`, `asan_transaction.add_cust` (named parameters). `OracleQuery1` (`asan_transaction.cek_asan`) is on the data module but never executed. |
| External service | ASAN Finance REST API `http://prod.asanfinance.gov.az` (header `ApiKey` = `bankinfo_t.fond_reg_no`). Behind `api/app/asan_http.py`: `ASAN_MODE=real` (default when `DB_MODE=oracle`) / `mock`; `ASAN_URL` overrides the base URL, `ASAN_TIMEOUT` (default 3 s = Indy ReadTimeout 3000). |
| Web | API `api/app/asanfinance.py`; SQL `api/app/asan_sql.py` (verbatim); mock `api/app/db/mock_asan.py` + `api/fixtures/asan.json`; UI `web/public/modules/asanfinance.js`, route `/m/asanfinance` |
| Tree / modules.json | mock tree Payments → "ASAN Finance" (`#44`); `migrated: true` |
| Tests | `api/tests/test_asanfinance.py`; E2E `e2e/asanfinance_screens.py`; screenshots 369–371 |

| Delphi | Web | Ref |
|---|---|---|
| Tabs: Məlumat (Balans / Xərclər; 'Ödənişlər' TabVisible = False), Fərdi məlumat (TabIndex := 1 at start), İş yeri məlumatları, Təqaüd və Müavinət, Təsərrüfat (EKTİS), VÖEN İnfo | same tabs and order, 'Fərdi məlumat' active | dfm, ActiveFormCreate |
| DataModuleCreate: BankInfo.Open, ods_link.Open | `GET /init` (logo is only used by prints) | AsanDmInpl.pas |
| CheckAsan: id := seq_asan_loq.NEXTVAL; LogDSest (pin, service, doc = PaspNum) unless 'BalanceExp'; log > 0 and service <> 'Balance' → InsAsanLog insert status 'duplicate' with the cached info (no DOCNUMBER / URL), Memo1 := cached info; else HTTP, Memo1 := answer, insert status 'success' with DOCNUMBER and URL = BASE + url + Fin (not for 'Balance') | same; inserts are DOA default inserts of the assigned fields; CommitOnPost (default True) → commit after each insert | ASANFinanceImpl.pas CheckAsan |
| HTTP error → ShowMessage('Asan Finansa qoşulmada problem var: ' + E.Message); exit – the caller then continues with the old Memo1 and the new id | `conn_error` is shown, then the caller logic runs on the unchanged Memo1 (kept per session) | CheckAsan |
| Button2 'Yüklə' (Fərdi): empty PIN or Serya No → 'Finkodu və ya Serya No daxil edin!'; Personalinfo GET `url + 'PinAndDocNumber?pin=' + PIN + '&docNumber=' + PaspNum`; Status.Code <> 0 → Message; every TEdit with Tag = 20 (incl. PIN) := Response.<Name>; a missing key → 'Pinkod yanlışdır! ' (the edits before it stay filled); Image (base64 jpg) → Image1 | same | Button2Click |
| Button3 (Balans): Balance GET, not logged; Label21 := Response.Balance | same | Button3Click |
| Button4 / 5 (İş yeri / Təqaüd): PaspNum := ''; empty PIN → 'Pinkodu daxil edin!'; Status by id → message + exit; EmployerDataSet + DeActiveEmpDSet / PensionDSet | same | Button4Click, Button5Click |
| Button6 / 10 (Təsərrüfat / VÖEN): PaspNum not cleared (doc = current Serya No); FarmPersonDset + FarmSet / VoenSet | same | Button6Click, Button10Click |
| Button7 (Xərclər): JSON text `{ "StartDate": "yyyy-MM-dd HH:mm:ss", "EndDate": …,"Offset": n,"Limit":n}` → Memo4; POST /api/v1/Info/Expenses; log pin 'post'; Status; XercSet | same text | Button7Click |
| Button8 Excel: ExportDataset(XercSet, 'Xercler') | `POST /expenses_excel` | Button8Click |
| Button9 'Müştəri aç': DocumentNumber empty → 'Öncə Asan Sorğunu edin'; asan_transaction.add_cust(named: p_passnum … p_monthlyprofit), sex 2 if 'Qadın', fam_status 2 if 'Subay', birthday / paspdate StrToDate, passexpire as text; id > 0 → 'Müştəri uğurla açıldı müştəri idsi-' + id; no commit in the form (the next CommitOnPost of asan_log commits it) | same, `call_func(..., named=...)`, no commit | Button9Click |

## Unverified

1. The real ASAN answers: the mock JSON follows the paths the Delphi SQL reads; field names for Personalinfo come from the edit names. Check with a real call on test.
2. `StrToDate` uses the client's ShortDateFormat; the web assumes `dd.mm.yyyy`.
3. `TJSONValue.Value` of `null` / objects is taken as `'null'` / `''`.
4. Indy exception texts differ from the web's (`HTTP/1.1 <code> <reason>` / socket error text).
5. `asan_transaction.add_cust` body is not in the repo; whether it commits itself is unknown.
