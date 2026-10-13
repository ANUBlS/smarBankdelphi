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

from .config import settings
from .db import DBError

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
SQL_PASSWORD_EXPIRY = ("select to_date(to_char(a.expiry_date,'dd.mon.yyyy'))-to_date(to_char(sysdate,'dd.mon.yyyy')) as ex from dba_users a where "
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
    """Port of TpfmOraSBLogOn OK handler (Packages/SBCommon50/UnitSBOraLogOn.pas:299-400)
    + Sb_Initialize (Packages/sboapi50/SBOInitPkg.pas:47-67).

    Returns (conn, info). Raises DBError (ORA text shown to user, like ShowMessage(E.Message) :318)."""
    dsn = settings.dsn()
    conn = backend.connect(username, wrap_password(password), dsn,
                           newpassword=wrap_password(new_password) if new_password else None)
    info: dict = {"warnings": []}
    try:
        # UnitSBOraLogOn.pas:349-350  OracleDataSet1.Open; OracleDataSet4.Open;
        objinf = conn.query(SQL_USER_OBJINF)
        try:
            exp = conn.query(SQL_PASSWORD_EXPIRY)
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
        # SBOInitPkg.pas:64  ASBData.SessionID := Sb_GetSessionID();  -> SBLogin.pas:15 / SBSrvIntf.pas:213
        info["session_id"] = conn.call_func("SBLOGIN", "GetSessionID", [], int)
        # SBLogin.pas:21 / SBSrvIntf.pas:229   sPN_GetLoginUserID = 'UserID'
        try:
            info["user_id"] = conn.call_func("SBLOGIN", "UserID", [], int)
        except DBError:
            info["user_id"] = None
    except Exception:
        conn.close()
        raise
    return conn, info


# Programs/SmartBank/sbMainForm_Unit.dfm:1168  ODS_get_app_header
SQL_APP_HEADER = "select get_app_header from dual"


def system_info(conn) -> dict:
    """Header data. sbMainForm_Unit.pas:481-483 Caption := ProductName + ' [Date: dd-mmm-yyyy]' using Sb_GetSystemDate
    (SBCore.pas:56 SBOperationDay.CallDateFunction('get_date') ; SBOperationDay.PackageName='SBOP')."""
    op_date = conn.call_func("SBOP", "get_date", [], datetime.datetime)
    sysdat = conn.query(SQL_SYSDAT)
    branch = conn.query(SQL_BRANCH)
    # sbMainForm_Unit.pas:997-998  uName := ODS_get_app_header.FieldByName('get_app_header').AsString
    try:
        header = conn.query(SQL_APP_HEADER)[0]["GET_APP_HEADER"]
    except DBError:
        header = None
    return {
        "product_name": settings.product_name,
        "app_header": header,
        "operation_date": op_date.date().isoformat() if op_date else None,
        "tek_dat": sysdat[0]["TEK_DAT"].date().isoformat() if sysdat and sysdat[0]["TEK_DAT"] else None,
        "pred_dat": sysdat[0]["PRED_DAT"].date().isoformat() if sysdat and sysdat[0]["PRED_DAT"] else None,
        "branch": branch[0]["KOD_FIL"] if branch else None,
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
    """TTreeViewIni.ReadNodes (Packages/SBCommon50/TreeViewIni.pas:189-205), section names per BuildSectionName
    (:159-168): '<IniSection>\\Sections\\Item0\\Item3'. Access per node as in TPluginTreeView.Change
    (PluginTreeView.pas:111-128): in-place plugin node without right -> cannot be opened."""
    if ws.tree_cache is not None:
        return ws.tree_cache
    plugins = load_plugins(ws)
    rights: dict[str, bool] = {}

    def read(section: str, path: list[int]) -> list[dict]:
        nodes = []
        for i in range(int(ini_read(ws, section, "Count", "0") or 0)):
            s = f"{section}\\Item{i}"
            node = {"path": ".".join(map(str, path + [i])), "caption": ini_read(ws, s, "Caption", "<no data>"),
                    "icon": ini_read(ws, s, "Icon", ""), "caption_key": ini_read(ws, s, "CaptionKey", "") or None, "clsid": None, "params": "", "allowed": True}
            idx, params = _parse_action(ini_read(ws, s, "Action", ""))
            if idx is not None and 0 <= idx < len(plugins):
                p = plugins[idx]
                node.update(plugin_index=idx, clsid=p["clsid"], params=params)
                if p["method"] == "axinplace" and p["clsid"]:
                    if p["clsid"] not in rights:
                        rights[p["clsid"]] = check_module_right(ws, p["clsid"])
                    node["allowed"] = rights[p["clsid"]]
            node["children"] = read(s, path + [i])
            nodes.append(node)
        return nodes

    tree = read(f"{settings.tree_ini_section}\\Sections", [])
    ws.tree_cache = tree
    return tree


def visible_tree(tree: list[dict]) -> list[dict]:
    """Optional HIDE_DENIED_NODES: drop denied leaves and folders left empty."""
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
