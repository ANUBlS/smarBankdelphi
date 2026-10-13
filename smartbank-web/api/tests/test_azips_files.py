"""AZIPS part 3 - CreateFileClick / PACS0008Execute file generation (verbatim Delphi source run by app/pascal.py).

Golden files: test_mt298_hand_traced compares with text typed by hand from SWIFT_MAINImpl1.pas:760-913 (not produced by the
interpreter). The other message types are compared with committed golden files (tests/golden/azips/*.xml, produced once
from the fixtures with the clock fixed at 2026-10-12 10:15:30 and reviewed against the source) plus hand-traced checks of
the tricky spots (CRLF, trailing blanks, copy(..,0,8), ANSI code page, accumulating recinfo in MT102)."""
import base64
import datetime as dt
import os

import pytest
from fastapi.testclient import TestClient

from app import azips, azips_files as F, azips_sql as Q, pascal as P
from app.db import mock as mock_db
from app.db import mock_azips
from app.main import app

client = TestClient(app)
NOW = dt.datetime(2026, 10, 12, 10, 15, 30)
GOLD = os.path.join(os.path.dirname(__file__), "golden", "azips")


def conn():
    mock_db.reset()
    mock_azips.reset()
    return mock_db.MockConnection("ADMIN")


def run(ids, cur=None, c=None):
    c = c or conn()
    b = azips._b(azips.branch_restricted(c))
    o3 = c.query(Q.text(Q.LINES_SW_OUT3, **b))
    o2 = c.query(Q.text(Q.LINES_SW_OUT_2, **b))
    return F.create_files(c, o3, o2, ids, cur or ids[-1], None, now=NOW)


def data(r, i=0):
    return base64.b64decode(r["files"][i]["b64"])


MT298_200 = [
    '<?xml version="1.0" encoding="UTF-8"?> ', '<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> ', '<Body> ',
    '<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">', '<Fr>', '<FIId>', '<FinInstnId> ',
    '<BICFI>SMRTAZ22</BICFI>  ', '</FinInstnId>    ', '</FIId>  ', '</Fr>', '<To> ', '<FIId> ', '<FinInstnId> ',
    '<BICFI>CBARAZ2X</BICFI> ', '</FinInstnId> ', '</FIId>', '</To> ', '<BizMsgIdr>OUT2610120009</BizMsgIdr>   ',
    '<MsgDefIdr>camt.056.001.10</MsgDefIdr> ', '<BizSvc>cba.rtsx.01</BizSvc>     ', '<CreDt>2026-10-12T10:15:30+04:00</CreDt> ',
    '</AppHdr>   ', '<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.056.001.10">', '<FIToFIPmtCxlReq>', '<Assgnmt>',
    '<Id>OUT2610120009</Id> ', '<Assgnr> ', '<Agt>', '<FinInstnId>', '<BICFI>SMRTAZ22</BICFI>', ' </FinInstnId>', '</Agt>',
    '</Assgnr>', '<Assgne>', '<Agt>', '<FinInstnId>', '<BICFI>CBARAZ2X</BICFI> ', '</FinInstnId>', '</Agt>', '</Assgne> ',
    '<CreDtTm>2026-10-12T10:15:30+04:00+</CreDtTm> ', '</Assgnmt> ', '<Undrlyg>', '<TxInf>', '<OrgnlGrpInf>',
    '<OrgnlMsgId>OUT2610110042</OrgnlMsgId>', '<OrgnlMsgNmId>NOTPROVIDED</OrgnlMsgNmId> ', '</OrgnlGrpInf> ',
    '<OrgnlIntrBkSttlmDt>2026-10-12</OrgnlIntrBkSttlmDt> ', '<Assgnr>  ', '<FinInstnId>  ', '<BICFI>SMRTAZ22</BICFI> ',
    '</FinInstnId>', '</Assgnr>  ', '</TxInf>  ', '</Undrlyg>  ', '</FIToFIPmtCxlReq> ', '</Document> ', '</Body> ', '</DataPDU>  ']


def test_mt298_hand_traced():
    r = run([9109])
    assert r["error"] is None and [f["name"] for f in r["files"]] == ["pacs09109.xml"]
    assert r["files"][0]["delphi_path"] == "C:\\Swift\\out\\pacs09109.xml"       # dir := path_out+'\'; dir+'pacs'+00000id+'.xml' (:765-773)
    # every line ends with #13#10, then Writeln adds one more CRLF (:2010)
    assert data(r) == ("".join(x + "\r\n" for x in MT298_200) + "\r\n").encode("cp1254")
    assert r["calls"] == [["SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT10"]], ["sw_main", "updout", [9109]],
                          ["sw_main", "sw_out_CreateFile", [9109, "Fayl yaradılıb!", 1]]]
    assert r["plugins"] == [] and r["committed"]                                   # MT298: no Azipsnew; SBSession.Commit :2069


@pytest.mark.parametrize("rid,name", [(9101, "mt103"), (9107, "mt205_99"), (9108, "mt999_text"), (9110, "mt102")])
def test_golden(rid, name):
    r = run([rid])
    assert r["error"] is None
    got = data(r)
    p = os.path.join(GOLD, name + ".xml")
    if os.getenv("AZIPS_WRITE_GOLDEN"):
        open(p, "wb").write(got)
    assert got == open(p, "rb").read()
    assert b"\n" not in got.replace(b"\r\n", b"") and got.endswith(b"\r\n")      # CRLF only; Writeln adds the last


def test_mt103_hand_traced_spots():
    t = data(run([9101])).decode("cp1254").split("\r\n")
    assert t[0] == '<?xml version="1.0" encoding="UTF-8"?> ' and t[1] == '<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '
    assert '<BICFI>SMRTAZ22</BICFI> ' in t                                           # copy(SENDERBIC,0,8) :1526
    assert '<IntrBkSttlmAmt Ccy="AZN">1500.25</IntrBkSttlmAmt> ' in t               # StringReplace(',', '.') :1563
    assert '<UETR>4e7b08db-68e1-4af3-ac40-cd06623bac8a</UETR> ' in t                 # constant UETR in Delphi :1554
    assert '<Nm>SMART LLC</Nm> ' in t                                                # Dbtr Nm = mf50_bic :1583
    assert '<InstrInf>/BNF/Tecili</InstrInf>' in t and '<InstrInf>//2 nusxe</InstrInf>' in t
    assert '<Ustrd>Muqavile 12/2026</Ustrd>' in t and '<Ustrd>odenis</Ustrd>' in t
    # Writeln on a TextFile converts to the ANSI code page: Ş/İ exist in cp1254, Ə does not -> '?'
    assert any(x.startswith("<Nm>Ş?Kİ TİCAR?T MMC</Nm>") for x in t)


def test_mt102_recinfo_accumulates():
    """recinfo is never cleared inside the datatemps loop (:1973-1992): the 2nd transaction repeats the 1st one's Ustrd."""
    t = data(run([9110])).decode("cp1254")
    assert t.count("<CdtTrfTxInf> ") == 2
    assert t.count("<Ustrd>Emek haqqi 09/2026</Ustrd>") == 3
    assert "<NbOfTxs>2</NbOfTxs> " in t                                            # max(L01) row :1793/:1800


def test_multi_select_and_rights_and_codes():
    r = run([9101, 9109], cur=9101)
    assert [f["name"] for f in r["files"]] == ["pacs09109.xml", "pacs09101.xml"]      # TBookmarkList order = grid (id desc)
    assert r["confirms"] == ["Fayl #9109 yaradılsın?", "2  sayda köçürməyə fayl yaradılsın ?"]
    r = run([9107])                                                               # 250 000.5 -> SW_OUT15 (:3121)
    assert r["calls"][0] == ["SB_ACA", "CheckAdvancedObjectAccess", ["SW_OUT15"]]
    assert r["plugins"] == [["filereport.bpl", "Azipsnew", "-9107"]]


def test_fileafter_not_6():
    c = conn()
    mock_azips._load()["fileafter"] = 0
    r = run([9101], c=c)
    assert r["files"] == []
    # :2029 passes GRIDOUT2 (Committed grid) current id, not the selected row - kept
    assert r["calls"][-1][:2] == ["sw_main", "sw_out_CreateFile"] and r["calls"][-1][2][1:] == ["Təsdiq olunmamış əməliyyat var!", 0]


def test_list_index_error_keeps_empty_file():
    """Lines[4] of a 3-line mf50_name$adress raises EStringListError after Rewrite: Delphi leaves an empty file."""
    c = conn()
    for x in mock_azips._load()["sw_out_new"]:
        if x["ID"] == 9101:
            x["MF50_NAME$ADRESS"] = "A\r\nB\r\nC"
    r = run([9101], c=c)
    assert r["error"] == "List index out of bounds (3)" and r["files"][0]["size"] == 0 and not r["committed"]


def test_interpreter_basics():
    assert P.d_copy("SMRTAZ22XXX", 0, 8) == "SMRTAZ22" and P.d_copy("abc", 2, 10) == "bc" and P.d_copy("abc", 5, 1) == ""
    assert P.format_datetime("yyyy-mm-dd", dt.datetime(2026, 1, 2)) == "2026-01-02"
    assert P.format_datetime("hh:nn:ss", dt.datetime(2026, 1, 2, 3, 4, 5)) == "03:04:05"
    sl = F.StringList(); sl.p_text = "a\r\nb\nc\r"
    assert sl.lines == ["a", "b", "c"]
    with pytest.raises(P.PascalUnsupported):
        P.parse_procedure("procedure X; begin goto 1; end;", 1)


def test_api_route_and_server_dir(tmp_path, monkeypatch):
    mock_db.reset(); mock_azips.reset()
    assert client.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    monkeypatch.setattr(F, "OUT_DIR", str(tmp_path))
    r = client.post("/api/azips/create-files", json={"selected": [], "current": 9109})
    assert r.status_code == 200, r.text
    j = r.json()
    assert j["files"][0]["name"] == "pacs09109.xml" and (tmp_path / "pacs09109.xml").read_bytes() == base64.b64decode(j["files"][0]["b64"])
    assert client.post("/api/azips/create-files", json={"selected": [], "current": 1}).status_code == 400
