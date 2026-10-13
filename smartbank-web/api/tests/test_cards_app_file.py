"""Cards ▸ Application 'FAYL YARAT' (applicationpas.pas Button2Click :1416 / Button5Click :1393 -> cr_file2 :346 / cr_file1 :516),
run verbatim by pascal.py. Expected layouts traced from the .pas (padding loops: 'for j:=length(s) to N' pads to N+1)."""
import base64
import datetime as dt

from fastapi.testclient import TestClient

from app.main import app
from app.db import mock as mock_db
from app.db import mock_cards as MC
from app import cards_app_file as F

client = TestClient(app)
B = "/api/cards/applications"
DOY = "%03d" % dt.date.today().timetuple().tm_yday            # when2Str(whenday)
DDMMYY = dt.date.today().strftime("%d%m%y")
TODAY = dt.date.today().strftime("%Y%m%d")


def login():
    mock_db.reset(); MC.reset(); F._CREATED.clear()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200


def P(path, body=None, code=200):
    r = client.post(B + path, json=body or {})
    assert r.status_code == code, r.text
    return r.json()


def lines(f):
    data = base64.b64decode(f["b64"])
    assert data.endswith(b"\r\n")
    return data.decode("cp1254").split("\r\n")[:-1]


def add_app(**kw):
    today = dt.datetime.combine(dt.date.today(), dt.time()).isoformat()
    r = dict(CARDHOLDER="ALIYEVA NIGAR", FNAME="Nigar", LNAME="Aliyeva", PASSPORT="AZE C7654321", BIRTHDAY="03.07.1990",
             HOMEPHONE="4405566", WORKPHONE="", COUNTRY="AZE", CITY="BAKU", ADDRESS="Baku, Yasamal", RESIDENT="RESIDENT",
             CURRENCY="AZN", CARDTYPE="VISA CLASSIC", CARDSTATUS="CARD OK", CREDIT_LIM="0", DATEOPEN=today,
             EXPIRY="2029-10-31T00:00:00", EMBOSSNAME="NIGAR ALIYEVA", COMPANY="TuranBank", LANG_CODE="AZE", FILIAL=101,
             OP_ID=2, TRANDATE=today, DAT=today, URG=1, STATUS=1, RBSNUMBER="38110019440000000002",
             MULTI_ACC="38110019440000000002", REFERENCE="700201", SECURITY="MOTHER")
    r.update(kw)
    MC._db().execute(f"insert into card_client_app ({', '.join(r)}) values ({', '.join('?' * len(r))})", list(r.values()))


def test_confirm_step_checks_right_first():
    login(); P("/open")
    assert P("/file", {"grid": "urgent", "ids": [9202]}) == {"confirm": "Fayl yaratmaq istəyirsiniz?"}
    P("/file", {"grid": "bad", "ids": []}, 400)


def test_urgent_credit_limit_file_and_next_number():
    login(); P("/open")
    r = P("/file", {"grid": "urgent", "ids": [9202, 9201], "confirmed": True})
    assert r["error"] is None and r["messages"] == ["Fayl yaradıldı!"]
    # cr_file2 only (9201 is STATUS 2: cr_file1's control loop finds nothing and exits before creating a file)
    assert [f["delphi_path"] for f in r["files"]] == [f"C:\\AZCARD\\OUT\\{DDMMYY}\\a507699901.{DOY}"]
    h, rd, ft = lines(r["files"][0])
    assert h.startswith("FH000001APPLICAT  11 507699  " + TODAY) and h[43:59] == "0901507699  RCDN"
    assert h.endswith(" " * 1396 + "*") and len(h) == 1456
    assert rd[:50] == "RD000002" + "1".ljust(10) + "0300" + " " * 20 + TODAY
    assert rd[50:788] == " " * 738 and rd[788:820] == "38110019440000000002".ljust(32) and rd[820:865] == " " * 45
    assert rd[865:868] == "944" and rd[868:883] == "000000000030000" and rd[883:] == " " * 568 + "*"
    assert ft == "FT000003000001" + " " * 1437 + "*"
    assert ["card_main", "donecredit", [9202]] in r["calls"]
    assert [(x["id"], x["status"]) for x in r["view"]["urgent"]] == [(9201, 2), (9202, 2)]   # Refresh (no ORDER BY line now)
    add_app(ID=9301, MESSTYPE=5, CREDIT_LIM="150.5")
    P("/refresh", {"date": dt.date.today().isoformat()})
    r = P("/file", {"grid": "urgent", "ids": [9301], "confirmed": True})
    assert r["files"][0]["name"] == f"a507699902.{DOY}"                     # FileExists(..901) -> the next number
    rd = lines(r["files"][0])[1]
    assert rd[868:883] == "00000000150,500"   # FloatToStr(150.5) + '00', ',' separator


def test_new_and_sub_card_cr_file1():
    login()
    add_app(ID=9302, MESSTYPE=1)
    add_app(ID=9303, MESSTYPE=2, MAINCARD="4169730000002222", EXPIRY="2029-10-31T00:00:00", FILIAL=102)
    P("/open")
    r = P("/file", {"grid": "urgent", "ids": [9302, 9303], "confirmed": True})
    assert r["error"] is None and len(r["files"]) == 1                      # no MessType 5 among them: cr_file2 exits
    f = r["files"][0]
    assert f["name"] == f"a507699901.{DOY}"
    h, new, sub, ft = lines(f)
    assert h.endswith("0901507699  CCDN" + " " * 1396 + "*")
    assert new[:50] == "RD000002" + "1".ljust(10) + "1103" + " " * 20 + TODAY
    assert new[50:82] == "AZE C7654321".ljust(32) and new[82:88] == "PR    " and new[88:120] == "Nigar".ljust(32)
    assert new[120:152] == "Aliyeva".ljust(32) and new[152:280] == " " * 128 and new[280:312] == "Nigar Aliyeva".ljust(32)
    assert new[312:339] == "MOTHER".ljust(20) + " " * 7 and new[339:342] == "AZE" and new[342:374] == "700201".ljust(32)
    # branch code (cardbr) 7 + filialkod 6, then address 48, birthday YYYYMMDD
    i = 374 + 48 + 3 + 15 + 10 + 10 + 10
    assert new[i:i + 7] == "0001   " and new[i + 7:i + 13] == "00101 " and new[i + 13:i + 61] == "Baku, Yasamal".ljust(48)
    assert "19900703" in new and new.endswith("*") and "507699101" in new and "TURANBANK" in new
    assert sub[:50] == "RD000003" + "2".ljust(10) + "1203" + " " * 20 + TODAY and "4169730000002222" in sub and "00102 " in sub
    assert ft == "FT000004000002" + " " * 1437 + "*"
    assert ["card_main", "donenewcard", [9302, f"07699901.{DOY}"]] in r["calls"]     # copy(filename, length-11, 12)
    assert ["card_main", "donesupcard", [9303]] in r["calls"]


def test_simple_grid_name_and_status_change():
    login(); P("/open")
    r = P("/file", {"grid": "simple", "ids": [9204, 9203], "confirmed": True})
    assert [f["name"] for f in r["files"]] == [f"a507699_01.{DOY}"]
    h, rd, ft = lines(r["files"][0])
    assert "0001507699  CCDN" in h and rd[764:788] == "4169730000002222".ljust(24) 
    assert rd[1058:] == " " * 391 + "*"         # CARDSTATUS 'BLOCKED' is none of the six names: all = '' (the line is 2 shorter)
    assert ["card_main", "donestatuschange", [9204]] in r["calls"] and len(lines(r["files"][0])) == 3   # 9203 STATUS 3: no row


def test_bad_birthday_stops_like_delphi():
    login()
    add_app(ID=9304, MESSTYPE=1, BIRTHDAY="")
    P("/open")
    r = P("/file", {"grid": "urgent", "ids": [9304], "confirmed": True})
    assert r["error"] == "'' is not a valid date" and r["messages"] == []
    assert len(lines(r["files"][0])) == 1                     # header only: the exception leaves the file without footer
    assert not any(c[1] == "donenewcard" for c in r["calls"])
