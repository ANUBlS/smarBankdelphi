"""AZIPS part 3b - 'Konvert' (ToolButton4Click -> konvert3Execute / KonvertexExecute -> cheskaccountExecute), verbatim source
run by app/pascal.py. test_fin_mt103_hand_traced: expected values typed by hand from SWIFT_MAINImpl1.pas:6480-6652."""
import base64
import datetime as dt

from fastapi.testclient import TestClient

from app import azips_import as I, azips_sql as Q
from app.db import mock as mock_db
from app.db import mock_azips
from app.main import app

client = TestClient(app)
NOW = dt.datetime(2026, 10, 13, 11, 0, 0)
FIN = [
    "{1:F01AIIBAZ2XAXXX0000000000}{2:O1031200261013CBARAZ2XAXXX00000000002610131200N}{4:",
    ":20:AZIPS2610130001", ":23B:CRED", ":32A:261013AZN1500,75", ":50K:/AZ21NABZ01350100000000001944", "ALIYEV ALI",
    ":59:/AZ77CBAR00000000000000000001", "MAMMADOV VALI", "1234567890/AZ", "210005 KAPITAL BAN", "AZ37NABZ0000",
    ":70:PAYMENT", "-}{5:{CHK:ABC}}",
]


def conn(**st):
    mock_db.reset(); mock_azips.reset()
    D = mock_azips._load(); D["sw_settings"].update(st)
    return mock_db.MockConnection("ADMIN")


def run(c, name="in1.fin", lines=FIN):
    return I.import_file(c, name, "\r\n".join(lines).encode("cp1254") + b"\r\n", list(Q.LINES_SW_IN), now=NOW)


def test_fin_mt103_hand_traced():
    r = run(conn())
    assert r["error"] is None and r["mask"] == "*.fin" and r["read"] == ["in1.fin"]
    assert r["calls"][0] == ["SB_ACA", "CheckAdvancedObjectAccess", ["SW_KONVERT"]]
    pkg, name, a = r["calls"][1]
    assert (pkg, name) == ("sw_main", "insert_in")
    memo = [""] + FIN[:12] + [""] * (210 - 13)       # Memo3: 210 lines from the .dfm, Lines[z] for z=1..12, '-}{5:' line not stored
    assert a == ["AZ77CBAR00000000000000000001",          # acount  copy(:59: line,6,100)
                 "AZIPS2610130001",                       # referens
                 "1500,75",                               # valu (string, copy(:32A:,15,100))
                 "AIIBAZ2XXXX",                           # bic copy(7,8)+copy(16,3)
                 "AZN",
                 "ALIYEV ALI",                            # describ = line after :50K:
                 "MAMMADOV VALI",                         # describ2 = line after :59:
                 2, 3, "MT103",                           # status, shifr, mt (copy(line1, INN_MT_READLINE=34, 3))
                 "".join(x + "\r\n" for x in memo),       # all = Memo3.Text
                 "1234567890",                            # tax: before '/'
                 "210005", "KAPITAL BA",                  # kod copy(1,6), bank_voin copy(8,10)
                 "AZ37NABZ0000"]                          # kor copy(0,13)
    # cheskaccount: check_account(id, ACOUNT) for every status 2 MT103 row of sw_in, then commit
    chk = [x for x in r["calls"] if x[1] == "check_account"]
    assert chk and chk[-1][2][1] == "AZ77CBAR00000000000000000001" and r["committed"]
    assert r["moved"] == [["C:\\Swift\\in\\in1.fin", "C:\\Swift\\in\\131026\\in1.fin"]]


def test_other_mt_uses_insert_in_other():
    lines = [FIN[0].replace("O103", "O202"), ":20:REF202", "-}{5:"]
    r = run(conn(), lines=lines)
    assert r["calls"][1][1] == "insert_in_other"
    assert r["calls"][1][2][:5] == ["REF202", "AIIBAZ2XXXX", 2, 3, "MT202"]


def test_swf_mode_does_nothing_and_mask():
    r = run(conn(INN_FILETYPE=0), name="a.swf")       # KonvertexExecute body is fully commented out
    assert r["listed"] and r["calls"] == [] and r["error"] is None and not r["committed"]
    r = run(conn(), name="a.txt")                     # not *.fin -> not in the list -> nothing read; konvert3 still runs
    assert not r["listed"] and r["read"] == [] and [c[1] for c in r["calls"]] == ["CheckAdvancedObjectAccess"]
    assert r["committed"]                             # cheskaccount commits even with no file (status-2 MT103 rows rechecked)


def test_api_route():
    mock_db.reset(); mock_azips.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    body = {"name": "x.fin", "b64": base64.b64encode("\r\n".join(FIN).encode()).decode()}
    r = client.post("/api/azips/import", json=body)
    assert r.status_code == 200, r.text
    assert r.json()["calls"][1][1] == "insert_in" and r.json()["error"] is None
    assert any("AZIPS2610130001" in str(x) for x in client.post("/api/azips/list", json={}).json()["sw_in"])
    assert client.post("/api/azips/import", json={"name": "a:b", "b64": "QQ=="}).status_code == 400
    assert client.post("/api/azips/import", json={"name": "a.fin", "b64": "%%%"}).status_code == 400
