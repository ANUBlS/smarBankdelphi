# Pilot – open points to verify against the real Oracle DB

1. **SBLOGIN function names.** `GetSessionID` and `UserID` come from the constants in `Packages/sboapi50/SBSrvIntf.pas:213,229`; the package name `SBLOGIN` comes from `sboapiDataModuleImpl.dfm:128`. Their source is not in the repo .sql files.
2. **SBCONFIG.** `OpenFile` and `ReadValue(section, ident, default)` are taken from `Packages/sbovcl50/DBIniFile.pas`. In the real package, `ReadValue` probably depends on the `OpenFile` state of the same session; the API keeps one session per user, so this works either way.
3. **Fingerprint login.** Users with `sba_objinf.finger3 = 1` must scan a fingerprint in Delphi (BioSDK scanner, `UnitSBOraLogOn.pas:370+`). This is not possible in a browser without a device bridge, so the web refuses these users with a clear message. Decision needed.
4. **ORA-28001 (expired password).** Delphi calls `SetPassword(new)` and then logs on again. The web uses the oracledb `newpassword` option with the wrapped password `'KLs'+new+'#1$'`. Please check that this matches what `SetPassword` stores.
5. **dba_users expiry query** needs SELECT on `DBA_USERS`, which the Delphi app also needs. If it is missing, the web only logs a warning instead of failing.
6. **DBMS_ALERT messages** (`AlertThread`: MessageBroadcast, MsgToUser_<sid>, Shutdown_<sid>) and the `sbmsg_*` queue are **not** in the pilot yet (planned: SSE).
7. **SL_CONTROL translation** of form captions is replaced by `web/locales`. Menu captions come unchanged from SmartBankIni.
8. **Tree node icons** (`Icon` key) are read but not drawn.
9. **Denied nodes** are shown locked, as in Delphi (visible but cannot be opened). Set `HIDE_DENIED_NODES=true` to hide them.
10. **Health in oracle mode.** The API has no credentials of its own, so `/health` only pings an existing user session.
11. **modules.json** was generated from the 261 `CLASS_*` GUIDs found in the repo's `*_TLB.pas`. Some modules exist in several copies with different CLSIDs; the CLSIDs actually registered in your SmartBankIni decide which one is used.
