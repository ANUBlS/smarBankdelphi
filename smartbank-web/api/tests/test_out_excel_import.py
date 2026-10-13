"""Packages/OutExcelImport (TOutExcelImp) - Excel rows into out_exceltable, excelpkg calls."""
import io
import openpyxl
from fastapi.testclient import TestClient
from app.main import app
from app.db import mock as mock_db, mock_oacc
from app import out_excel_import as M

client = TestClient(app)
B = "/api/out-excel-import"


def login(u="ADMIN", p="Admin#2026"):
    mock_db.reset()
    mock_oacc.reset()
    assert client.post("/api/login", json={"username": u, "password": p}).status_code == 200


def xlsx(rows):
    wb = openpyxl.Workbook(); ws = wb.active
    for r in rows:
        ws.append(r)
    b = io.BytesIO(); wb.save(b); return b.getvalue()


def up(data):
    return client.post(B + "/upload", content=data, headers={"Content-Type": "application/octet-stream"})


def test_sql_and_columns():
    assert M.SQL_LIST == "select rowid,t. * from out_exceltable  t where userid=uid\r\n"
    assert M.SQL_VIDOP == "select * from vid_op\r\n"
    assert len(M.IMPORT_COLS) == 68 and M.GRID_COLS[68] == "USERID" and M.GRID_COLS[-1] == "F75"
    assert M.sql_update("F70") == "update out_exceltable set F70 = :val where rowid = :doa_rowid"
    try:
        M.sql_update("F1=1--")
        assert False
    except ValueError:
        pass


def test_read_workbook_rows_from_2_and_68_cols():
    rows = M.read_workbook(xlsx([["h"] * 70, ["a", "b", 3] + [None] * 66 + ["x69"], ["c", "", 4.5]]))
    assert len(rows) == 2 and rows[0][:3] == ["a", "b", 3] and len(rows[0]) == 68 and rows[1][1] is None


def test_open_deletes_then_upload_send():
    login()
    assert client.get(B + "/init").json()["rows"] == []
    r = up(xlsx([["debit", "credit", "amount", "name"], ["9100094400010001", "9200094400020001", 150, "Excel girov"]])).json()
    assert r["imported"] == 1 and r["rows"][0]["f1"] == "9100094400010001" and r["rows"][0]["rowid"]
    n0 = len(mock_oacc._load()["out_provarch"])
    assert client.post(B + "/send").json()["rows"] == []                # OUTEXCELTRANSACTIONS + Del_outexcel
    assert len(mock_oacc._load()["out_provarch"]) == n0 + 1
    client.post(B + "/delete-payments")                                  # del_outinspayments
    assert len(mock_oacc._load()["out_provarch"]) == n0


def test_edit_delete_row_and_errors():
    login()
    client.get(B + "/init")
    rows = up(xlsx([["h"], ["a"], ["b"]])).json()["rows"]
    r = client.post(B + "/edit", json={"rowid": rows[0]["rowid"], "col": "F2", "value": "zz"}).json()["rows"]
    assert r[0]["f2"] == "zz"
    assert client.post(B + "/edit", json={"rowid": rows[0]["rowid"], "col": "ROWID", "value": "1"}).status_code == 400
    assert len(client.post(B + "/delete-row", json={"rowid": rows[1]["rowid"]}).json()["rows"]) == 1
    assert up(xlsx([["only header"]])).json()["detail"]["key"] == "out_excel_import.err_empty"
    assert up(b"not an excel file").json()["detail"]["key"] == "out_excel_import.err_file"
