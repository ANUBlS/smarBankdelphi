"""SmartBank shell business logic, ported 1:1 from the Delphi host application.

Every SQL / PL/SQL text below is copied verbatim from the Delphi source; the comment above each one cites
<unit>:<line> (paths relative to the original repo smarBankdelphi/).
"""
from __future__ import annotations
import datetime
import hashlib
import hmac
import re
import secrets
import time

from .config import settings
from .db import DBError, Out

# ---------------------------------------------------------------------------------------------------------
# Password wrapping
# Packages/SBCommon50/UnitSBOraLogOn.pas:314 and :397   LogonPassword := 'KLs'+edPassword.Text+'#1$';
# Programs/SmartBank/PasswordChange_unit.pas:71, :87     'KLs'+...+'#1$'
# Programs/SmartBank/PasswordChange_unit.pas:60          trim('KLs'+passwd+'#1$')
# ---------------------------------------------------------------------------------------------------------
def wrap_password(p: str) -> str:
    return "KLs" + p + "#1$"


ORA_EXPIRED = 28001  # UnitSBOraLogOn.pas:300  expire := 'ORA-28001'

# Packages/SBCommon50/UnitSBOraLogOn.dfm  OracleDataSet1
SQL_USER_OBJINF = ("select * from sba_objinf where id = (select classid from sba_objinf where type='U' and obj=user)")
# Packages/SBCommon50/UnitSBOraLogOn.dfm  OracleDataSet4
SQL_PASSWORD_EXPIRY = ("select to_date(to_char(a.expiry_date,'dd.mon.yyyy'))-to_date(to_char(sysdate,'dd.mon.yyyy')) as ex from dba_users a where \n"
                       "                     user_id=UID")
# Packages/sboapi50/sboapiDataModuleImpl.dfm:150  DSBankDate
SQL_SYSDAT = "select TEK_DAT , PRED_DAT \n  from SYSDAT"
# Packages/sboapi50/sboapiDataModuleImpl.dfm:169  Branch
SQL_BRANCH = "select\n   KOD_FIL\nfrom BANKINFO"
# Programs/SmartBank/CompanySelection.dfm:72 (company_list) == sbMainForm_Unit.dfm:1107
SQL_COMPANIES = "select * from companies order by company_name"
# Programs/SmartBank/CompanySelection.dfm:48  complist_id
SQL_COMPANY_ID = ("select id , SYS_CONTEXT ('CLIENTCONTEXT', 'user_company')  companyid from companies where \n"
                  "company_name=:compname")
# Programs/SmartBank/CompanySelection.dfm:30  SetCompany
PLSQL_SET_COMPANY = "declare\nbegin\n\n DBMS_SESSION.SET_CONTEXT('CLIENTCONTEXT','user_company',:COMP_id);\nend;"


class LoginResult(dict):
    pass


def logon(backend, username: str, password: str, new_password: str | None = None):
    """The Oracle logons of the Delphi start-up, in Delphi order (docs/oracle-parity.md, section Login):

    1. TfmOraSBLogOn.btOkClick (Packages/SBCommon50/UnitSBOraLogOn.pas:286-400) on the form's own OracleSession1:
       LogOn ('KLs'+password+'#1$', :314-315); ORA-28001 -> TfmPassChange + SetPassword + LogOn (:317-329);
       OracleDataSet1.Open; OracleDataSet4.Open (:349-350); OracleSession1.Connected := False (:390).
    2. TSBOracleLogOn.CheckForExpire (Packages/SBCommon50/SBOracleLogOn.pas): SBSession LogOn; LogOff (test logon).
    3. Sb_Initialize (Packages/sboapi50/SBOInitPkg.pas:47-67): SBSession.LogOn (sboapiDataModuleImpl.pas LogOn),
       DOA IsolationLevel = ilReadCommitted, then SessionID := Sb_GetSessionID() (SBLogin.pas / SBSrvIntf.pas:213).

    Returns (conn, info) where conn is session 3 (the per-user web session). Raises DBError."""
    dsn = settings.dsn()
    wrapped = wrap_password(password)
    # ORA-28001: the web asks for the new password up front and changes it during the logon (oracledb newpassword
    # = OCIPasswordChange, what DOA SetPassword does). Delphi SetPassword(fmPassChange.edNewPass.Text) sends the
    # UNWRAPPED new password and then logs on with the wrapped one (:397); the web wraps it (documented difference).
    new_wrapped = wrap_password(new_password) if new_password else None
    info: dict = {"warnings": []}
    # 1. login form session (OracleSession1)
    form = backend.connect(username, wrapped, dsn, newpassword=new_wrapped)
    try:
        # UnitSBOraLogOn.pas:349-350  OracleDataSet1.Open; OracleDataSet4.Open;
        objinf = form.query(SQL_USER_OBJINF)
        try:
            exp = form.query(SQL_PASSWORD_EXPIRY)
        except DBError:
            exp = []  # dba_users needs SELECT grant; Delphi would raise here. Logged as warning instead.
            info["warnings"].append({"key": "login.warn_expiry_unavailable"})
        # UnitSBOraLogOn.pas:360-363  if (ex<5) and (ex<>'') then ShowMessage('Şifrənizin bitməsinə N gün qalıb...')
        ex = exp[0].get("EX") if exp else None
        if ex is not None and int(ex) < 5:
            info["warnings"].append({"key": "login.warn_password_expires", "days": int(ex)})
        # UnitSBOraLogOn.pas:370-371  if finger3=1 then q:=0 (fingerprint scan) else q:=1
        finger3 = (objinf[0].get("FINGER3") if objinf else 0) or 0
        if int(finger3) == 1:
            raise DBError("FINGERPRINT_REQUIRED", -1)
    finally:
        # UnitSBOraLogOn.pas:390  OracleSession1.Connected:=False;
        form.close()
    pw = new_wrapped or wrapped
    # 2. SBOracleLogOn.pas CheckForExpire:  FSession.LogOn; FSession.LogOff;
    backend.connect(username, pw, dsn).close()
    # 3. SBOInitPkg.pas Sb_Initialize -> sboapiDataModule.LogOn -> SBSession.LogOn
    conn = backend.connect(username, pw, dsn)
    try:
        # sboapiDataModuleImpl.dfm SBSession.IsolationLevel = ilReadCommitted (applied by DOA after LogOn)
        conn.execute(SQL_ISOLATION)
        # SBOInitPkg.pas:64  ASBData.SessionID := Sb_GetSessionID();  -> SBLogin.pas / SBSrvIntf.pas:213
        info["session_id"] = conn.call_func("SBLOGIN", "GetSessionID", [], int)
    except Exception:
        conn.close()
        raise
    return conn, info


# DOA TOracleSession.IsolationLevel = ilReadCommitted (sboapiDataModuleImpl.dfm SBSession)
SQL_ISOLATION = "alter session set isolation_level = read committed"
# SBOutput.pas:29-41 -> DOA TOracleSession.DBMS_Output (Enable / Put_Line / Get_Line)
PLSQL_OUTPUT_ENABLE = "begin dbms_output.enable(:buffer_size); end;"
OUTPUT_BUFFER_SIZE = 20000
PLSQL_OUTPUT_PUT_LINE = "begin dbms_output.put_line(:line); end;"
PLSQL_OUTPUT_GET_LINE = "begin dbms_output.get_line(:line, :status); end;"
# sbMainForm_Unit.pas:453
LOG_BANNER = "SmartBank 4.0, Copyright 1996-2016, Smart Systems Technology, Ltd."
# SBAlert.pas -> DOA TOracleSession.DBMS_Alert (Register / WaitAny)
PLSQL_ALERT_REGISTER = "begin dbms_alert.register(:name); end;"
PLSQL_ALERT_WAITANY = "begin dbms_alert.waitany(:name, :message, :status, :timeout); end;"
ALERT_TIMEOUT = 0          # AlertThread.pas  FTimeout := 0
LOG_POLL_SECONDS = 60      # sbMainForm_Unit.dfm LogTimer.Interval = 60000


def alert_names(session_id) -> list[str]:
    # sbMainForm_Unit.pas:465-468
    return ("MessageBroadcast,MsgToUser_%d,SessionShutdown,Shutdown_%d" % (session_id or 0, session_id or 0)).split(",")


def main_form_init(ws):
    """TsbMainForm.FormCreate/FormShow/FormActivate Oracle calls after Sb_Initialize, in Delphi order
    (Programs/SmartBank/sbMainForm_Unit.pas:424-483, :989-1004, :710-712). Run once per web session at login."""
    c = ws.conn
    build_tree(ws)                                                    # :424 TV.Open (SBCONFIG)
    c.plsql(PLSQL_OUTPUT_ENABLE, {"buffer_size": OUTPUT_BUFFER_SIZE})  # :451 Sb_LogEnable
    c.plsql(PLSQL_OUTPUT_PUT_LINE, {"line": LOG_BANNER})              # :453 Sb_LogPutLine
    try:                                                              # :465 InitAlertThread -> AlertThread.WaitAny
        for name in alert_names(ws.session_id):                       #      Sb_AlertRegister per name
            c.plsql(PLSQL_ALERT_REGISTER, {"name": name})
        ws.alerts_active = True
    except DBError:
        ws.alerts_active = False  # runs in TAlertThread in Delphi: a failure there does not stop the main form
    info = ws.main_info
    info["operation_date"] = c.call_func("SBOP", "get_date", [], datetime.datetime)  # :477 Sb_GetSystemDate
    # :483 SBTranslateProc.TranslateAllCompForms(Self, OrPack_SL): not ported (web has its own locales)
    try:                                                              # :997-998 FormShow ODS_get_app_header
        rows = c.query(SQL_APP_HEADER)
        info["app_header"] = rows[0]["GET_APP_HEADER"] if rows else None
    except DBError:
        info["app_header"] = None
    # :1002 and :1004  Sblogin.CallDateFunction('get_lastlogintime', []) (twice). The web shows its own
    # app-side login times (audit.py), the value is only kept as db_last_login_time.
    c.call_func("SBLOGIN", "get_lastlogintime", [], datetime.datetime)
    info["db_last_login_time"] = c.call_func("SBLOGIN", "get_lastlogintime", [], datetime.datetime)
    c.query(SQL_COMPANIES)                                            # :710-712 FormActivate company_list.Active
    ws.last_log_drain = time.time()


def poll_session(ws) -> dict:
    """Background polls of the main form, run on the client's session poll:
    AlertThread.WaitAny (every 2 s in Delphi, AlertThread.pas) and LogTimerTimer (every 60 s, sbMainForm_Unit.pas:823-839)."""
    out = {"alerts": [], "log": []}
    c = ws.conn
    names = {n.upper() for n in alert_names(ws.session_id)}
    while ws.alerts_active and len(out["alerts"]) < 20:
        try:
            r = c.plsql_out(PLSQL_ALERT_WAITANY, {"name": Out(str), "message": Out(str), "status": Out(int),
                                                  "timeout": ALERT_TIMEOUT})
        except DBError:
            ws.alerts_active = False
            break
        if r.get("status") != 0:                                      # SBAlert.pas DecodeAlertStatus: 0 = raised
            break
        name = (r.get("name") or "").upper()
        if name not in names:
            continue
        a = {"name": name, "message": r.get("message") or ""}
        if name in ("SESSIONSHUTDOWN", f"SHUTDOWN_{ws.session_id}"):   # :931-946 InitiateShutdown
            kv = dict(x.split("=", 1) for x in _comma_text(a["message"]) if "=" in x)
            a.update(shutdown=True, timeout=kv.get("timeout"), message=kv.get("message", ""))
            ws.alerts_active = False                                  # FMessageAlertThread.Terminate
        out["alerts"].append(a)
    if time.time() - ws.last_log_drain >= LOG_POLL_SECONDS:
        ws.last_log_drain = time.time()
        while len(out["log"]) < 1000:                                 # while Sb_LogGetLine(Line) do ...
            try:
                r = c.plsql_out(PLSQL_OUTPUT_GET_LINE, {"line": Out(str), "status": Out(int)})
            except DBError:                                           # SBOutput.pas:23-26 EOracleError -> False
                break
            if r.get("status") != 0:
                break
            out["log"].append(r.get("line") or "")
    return out


def _comma_text(s: str) -> list[str]:
    """TStrings.CommaText split (quoted items allowed)."""
    import csv
    return next(csv.reader([s], skipinitialspace=True), [])


# Programs/SmartBank/sbMainForm_Unit.dfm:1168  ODS_get_app_header
SQL_APP_HEADER = "select get_app_header from dual"


def system_info(ws) -> dict:
    """Header data. SBOP.get_date and get_app_header are read once by main_form_init in Delphi order
    (sbMainForm_Unit.pas:477 Caption ' [Date: dd-mmm-yyyy]', :997-998). SYSDAT/BANKINFO (DSBankDate / Branch,
    sboapiDataModuleImpl.dfm) are web-only header reads, done once per session."""
    if not ws.main_info:
        main_form_init(ws)
    if ws.system_cache is None:
        sysdat = ws.conn.query(SQL_SYSDAT)
        branch = ws.conn.query(SQL_BRANCH)
        ws.system_cache = {
            "tek_dat": sysdat[0]["TEK_DAT"].date().isoformat() if sysdat and sysdat[0]["TEK_DAT"] else None,
            "pred_dat": sysdat[0]["PRED_DAT"].date().isoformat() if sysdat and sysdat[0]["PRED_DAT"] else None,
            "branch": branch[0]["KOD_FIL"] if branch else None,
        }
    op_date, llt = ws.main_info.get("operation_date"), ws.main_info.get("db_last_login_time")
    return {
        "product_name": settings.product_name,
        "app_header": ws.main_info.get("app_header"),
        "operation_date": op_date.date().isoformat() if op_date else None,
        "db_last_login_time": llt.isoformat() if isinstance(llt, datetime.datetime) else None,
        **ws.system_cache,
    }


def companies(conn) -> list[dict]:
    # CompanySelection.pas:45-53 (FormShow) lists company_name
    return [{"id": int(r["ID"]), "name": r["COMPANY_NAME"]} for r in conn.query(SQL_COMPANIES)]


def select_company(conn, company_name: str) -> dict:
    """CompanySelection.pas:58-75 RadioGroupClick: complist_id(:COMPNAME) -> SetCompany(:COMP_ID)."""
    rows = conn.query(SQL_COMPANY_ID, {"compname": company_name})
    if not rows:
        raise DBError("ORA-01403: no data found", 1403)
    cid = int(rows[0]["ID"])
    conn.execute(PLSQL_SET_COMPANY, {"COMP_id": cid})
    return {"id": cid, "name": company_name}


# ---------------------------------------------------------------------------------------------------------
# DB-stored INI (TDBIniFile, Packages/sbovcl50/DBIniFile.pas, package SBCONFIG :178)
# ---------------------------------------------------------------------------------------------------------
def ini_open(ws):
    # DBIniFile.pas:147-151  if FIniFileID = 0 then FIniFileID := CallIntegerFunction('OpenFile', [FileName]);
    if not ws.ini_opened:
        ws.conn.call_func("SBCONFIG", "OpenFile", [settings.system_ini_name], int)
        ws.ini_opened = True


def ini_read(ws, section: str, ident: str, default: str = "") -> str:
    # DBIniFile.pas:58-62  CallStringFunction('ReadValue', [Section, Ident, Default])
    ini_open(ws)
    v = ws.conn.call_func("SBCONFIG", "ReadValue", [section, ident, default], str)
    return default if v is None else v


_PLG = re.compile(r"^\s*(\w+)\s*:\s*([^,]*)\s*(?:,(.*))?$")


def load_plugins(ws) -> list[dict]:
    """TPluginManager load loop, Packages/sbplg50/PluginSrv.pas:881-900.
    Item syntax (AddActiveX2SmartBank.txt): ItemN=axinplace:{CLSID},overlapped"""
    if ws.plugins_cache is None:
        sec = f"{settings.plugin_ini_section}\\Packages"
        n = int(ini_read(ws, sec, "Count", "0") or 0)
        out = []
        for i in range(n):
            spec = ini_read(ws, sec, f"Item{i}", "")
            m = _PLG.match(spec or "")
            method, loc, opts = (m.group(1).lower(), m.group(2).strip(), (m.group(3) or "").strip()) if m else ("", spec, "")
            out.append({"index": i, "method": method, "clsid": loc.upper() if method == "axinplace" else None,
                        "location": loc, "options": opts})
        ws.plugins_cache = out
    return ws.plugins_cache


def check_module_right(ws, clsid: str) -> bool:
    """sbMainForm_Unit.pas:1029-1032 AccCheck: SBAca.CallBooleanFunction('checkmodright',[GuidToString(ClassID)])
    (SBAca.PackageName = 'sb_aca', sboapiDataModuleImpl.dfm:140)."""
    return ws.conn.call_bool("sb_aca", "checkmodright", [clsid.upper()])


def is_admin(ws) -> bool:
    """Same admin rule the DB uses inside SB_ACA.checkmodright: SB_ACA.isadm(user)
    (spec SQL_/PARTITION.nur/SCRIPTS/sb_aca.sql:18, used at :353)."""
    if ws.is_admin is None:
        ws.is_admin = ws.conn.call_bool("SB_ACA", "isadm", [ws.username])
    return ws.is_admin


def _parse_action(action: str):
    """PluginTreeView.pas:352-367: Action '#<index>[@params]'."""
    if not action.startswith("#"):
        return None, ""
    params = ""
    if "@" in action:
        action, params = action.split("@", 1)
    try:
        return int(action[1:]), params
    except ValueError:
        return None, ""


def build_tree(ws) -> list[dict]:
    """TPluginTreeView.DoOpen (Packages/sbplg50/PluginTreeView.pas:435-456): PluginManager.Open (load_plugins), then
    TTreeViewIni.ReadNodes (Packages/SBCommon50/TreeViewIni.pas:189-205) with section names per BuildSectionName
    (:159-168) '<IniSection>\\Sections\\Item0\\Item3'. Per node, in Delphi order: Caption (:201), Action
    (TPluginTreeView.ReadNode :353), then for plugin nodes RefreshNode -> GetClosedPluginIcon (:221) reads 'Icon'
    of NodeByPlugin(Plugin, ParamsAsString) (first node with that plugin and params), then the children.
    Rights: Delphi calls sb_aca.checkmodright only when a node is opened (TPluginTreeView.Change :111-128,
    OnAccessCheck is assigned after TV.Open, sbMainForm_Unit.pas:463) -> /api/modules/open. The web-only
    pre-check per node runs only with TREE_PRECHECK_RIGHTS or HIDE_DENIED_NODES."""
    if ws.tree_cache is not None:
        return ws.tree_cache
    plugins = load_plugins(ws)
    rights: dict[str, bool] = {}
    first_node: dict[tuple, str] = {}
    precheck = settings.tree_precheck_rights or settings.hide_denied_nodes

    def read(section: str, path: list[int]) -> list[dict]:
        nodes = []
        for i in range(int(ini_read(ws, section, "Count", "0") or 0)):
            s = f"{section}\\Item{i}"
            node = {"path": ".".join(map(str, path + [i])), "caption": ini_read(ws, s, "Caption", "<no data>"),
                    "icon": "", "caption_key": None, "clsid": None, "params": "", "allowed": True}
            idx, params = _parse_action(ini_read(ws, s, "Action", ""))
            if idx is not None and 0 <= idx < len(plugins):
                p = plugins[idx]
                node.update(plugin_index=idx, clsid=p["clsid"], params=params)
                src = first_node.setdefault((idx, params), s)
                node["icon"] = ini_read(ws, src, "Icon", "")
                if precheck and p["method"] == "axinplace" and p["clsid"]:
                    if p["clsid"] not in rights:
                        rights[p["clsid"]] = check_module_right(ws, p["clsid"])
                    node["allowed"] = rights[p["clsid"]]
            if settings.tree_caption_keys:  # web-only locale key, not read by Delphi
                node["caption_key"] = ini_read(ws, s, "CaptionKey", "") or None
            node["children"] = read(s, path + [i])
            nodes.append(node)
        return nodes

    tree = read(f"{settings.tree_ini_section}\\Sections", [])
    ws.tree_cache = tree
    return tree


def _dedup_credits(nodes: list[dict]) -> list[dict]:
    clsids = {n.get("clsid") for n in nodes if n.get("clsid")}
    drop = {"{8F34DD46-F566-4FD1-B534-F16C0ADCE284}", "{41D53F48-4A53-4CD1-98AD-82E1BE97C033}", "{02878282-54DE-44C6-9D21-30CBE95D7331}"} if "{B361BF28-9D86-4D92-A06F-3661B9B2B9CD}" in clsids else set()
    return [{**n, "children": _dedup_credits(n.get("children", []))} for n in nodes if n.get("clsid") not in drop]


def visible_tree(tree: list[dict]) -> list[dict]:
    """Optional HIDE_DENIED_NODES: drop denied leaves and folders left empty."""
    tree = _dedup_credits(tree)
    if not settings.hide_denied_nodes:
        return tree
    out = []
    for n in tree:
        kids = visible_tree(n["children"])
        if n["clsid"] and not n["allowed"]:
            continue
        if not n["clsid"] and n["children"] and not kids:
            continue
        out.append({**n, "children": kids})
    return out


def find_node(tree, path: str):
    for n in tree:
        if n["path"] == path:
            return n
        f = find_node(n["children"], path)
        if f:
            return f
    return None


# ---------------------------------------------------------------------------------------------------------
# Password change, Programs/SmartBank/PasswordChange_unit.pas:56-101
# ---------------------------------------------------------------------------------------------------------
class PasswordChangeError(Exception):
    def __init__(self, key):
        super().__init__(key)
        self.key = key


def password_fingerprint(wrapped: str, salt: bytes) -> bytes:
    # The session keeps only a salted hash of SBSession.LogonPassword (never the password itself).
    return hmac.new(salt, wrapped.encode("utf-8"), hashlib.sha256).digest()


def change_password(ws, old: str, new: str, retype: str):
    # :71-77  OldPsw := 'KLs'+OldPswEdit.Text+'#1$'; if OldPsw <> SBSession.LogonPassword -> 'Köhnə şifrə düzgün daxil edilməyib!'
    if not hmac.compare_digest(password_fingerprint(wrap_password(old), ws.pw_salt), ws.pw_hash):
        raise PasswordChangeError("password.err_old_wrong")
    # :78-83  if NewPswEdit.Text <> RetypeNewPswEdit.Text -> 'Yeni şifrə tələblərə uyğun deyil!'
    if new != retype:
        raise PasswordChangeError("password.err_mismatch")
    # :90-91  if not VerifyPassword(New) then raise EPassError.Create('Şifrə mürəkkəb deyil')
    #  VerifyPassword :56-61 -> pcADM (SB_ADM, PasswordChange_unit.dfm:254).CallBooleanFunction('verify_password',[trim('KLs'+passwd+'#1$')])
    if not ws.conn.call_bool("SB_ADM", "verify_password", [wrap_password(new).strip()]):
        raise PasswordChangeError("password.err_not_complex")
    # :94-96  SBLogin.CallProcedure('ChangeUserPsw',[NewPsw, NoCryptedPsw])   NewPsw='KLs'+new+'#1$', NoCryptedPsw=new
    ws.conn.call_proc("SBLOGIN", "ChangeUserPsw", [wrap_password(new), new])
    ws.pw_hash = password_fingerprint(wrap_password(new), ws.pw_salt)


def new_salt() -> bytes:
    return secrets.token_bytes(16)


# ---------------------------------------------------------------------------------------------------------
# Admin: unlock Oracle account (web-only feature, no Delphi equivalent). Runs in the ADMIN'S OWN session,
# so Oracle decides whether the admin may do it (ALTER USER privilege). No stored DBA credentials.
# ---------------------------------------------------------------------------------------------------------
_ORA_USER = re.compile(r"^[A-Za-z][A-Za-z0-9_$#]{0,127}$")
SQL_USER_EXISTS = "select username from all_users where username = :u"


def oracle_unlock_user(conn, username: str) -> str | None:
    """Returns the exact Oracle user name unlocked, or None if no such Oracle user. Raises DBError (ORA text)."""
    name = username.strip().upper()
    if not _ORA_USER.match(name):
        raise ValueError("invalid username")
    rows = conn.query(SQL_USER_EXISTS, {"u": name})
    if not rows:
        return None
    db_name = rows[0]["USERNAME"]
    if not _ORA_USER.match(db_name) or '"' in db_name:  # defence in depth: only the DB's own value, re-validated
        raise ValueError("invalid username")
    conn.execute(f'ALTER USER "{db_name}" ACCOUNT UNLOCK')
    return db_name
