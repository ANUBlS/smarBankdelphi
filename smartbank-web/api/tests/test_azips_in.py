"""AZIPS part 4b-2 - comitClick :3906 -> AddINTransNewExecute :7118 (UFX branch, ufxcredit :6931), Checkacc.pas,
Tranzit_account.pas. Expected values from the Delphi source by hand. UFX always via the mock client (no network)."""
import datetime as dt

import pytest

from app import azips_in as I, azips_sql as Q, ufx
from app.db import mock as mock_db
from app.db import mock_azips

NOW = dt.datetime(2026, 10, 13, 11, 22, 33, 456000)


def conn():
    mock_db.reset(); mock_azips.reset(); ufx.MockUfx.calls.clear()
    return mock_db.MockConnection("ADMIN")


def calls(key=None):
    cs = mock_azips._load().get("in_calls", [])
    return [c for c in cs if key is None or c[0] == key]


def commit(c, cur, sel=(), answer="yes"):
    p = {}
    r = I.comit_start(c, Q.LINES_SW_IN, cur, list(sel), p)
    if "ask" not in r:
        return r, None
    return r, I.comit_answer(c, answer, p, ufx.MockUfx(), NOW)


def test_plain_post_no_card():
    c = conn()
    r, f = commit(c, 5006)
    assert r["ask"] == "1 sayda əməliyyatlar günün sənədlərinə əlavə edilsin ?"
    assert calls("SW_MAIN.CHECK_ACCOUNT")[0][1] == [5006, "AZ41SMRT00000000000000001944"]
    a = calls("SW_MAIN.ADD_IN_TRANSACTIONS2")
    assert a == [["SW_MAIN.ADD_IN_TRANSACTIONS2", [5006, "AIIBAZ2X", "AZ41SMRT00000000000000001944", 1200.0, "Emek haqqi",
                                                   "SMART MMC", "1400057421"]]]
    assert f["messages"] == [] and f["posted"] == [5006] and ufx.MockUfx.calls == []


def test_cancel_posts_nothing():
    c = conn()
    r, f = commit(c, 5006, answer="cancel")
    assert f["done"] and calls("SW_MAIN.ADD_IN_TRANSACTIONS2") == []


def test_status_not_2_only_check():
    c = conn()
    r, f = commit(c, 5001)                                  # status 0 after check_account -> nothing else
    assert f is None and not r["done"] and len(calls("SW_MAIN.CHECK_ACCOUNT")) == 1


def test_selection_filter_operator_precedence():
    c = conn()
    # selected: 5001 (MT103 status 0 -> out), 5002 (MT102 status 1 -> in: 'or MT102' ignores status), 5006 (MT103 st 2 -> in)
    r, _ = commit(c, 5006, sel=[5006, 5001, 5002], answer="cancel")
    assert r["count"] == 2


def test_ufx_card_with_credit_first_time():
    """5005: card account, credit 77001 with interest debt 120.25 -> 500 - 120.25 = 379.75 sent to UFX."""
    c = conn()
    r, f = commit(c, 5005)
    assert ufx.MockUfx.calls == [["4169730000000001", "VISA", "2026-10-13 11:22:33", "AZIPS 5005", "944", "379.75"]]
    ur = calls("CARDUFX.UFXRESPONSE")[0][1]
    assert ur[:4] == [5005, 2, "Successfully processed", 379.75] and ur[4].endswith("#Successfully processed")
    assert f["messages"] == [I.MSG_OK] and f["posted"] == [5005]
    row = mock_azips._load()["card_ufx_check"][0]
    assert row["ACC_ID"] == 9101 and row["AMOUNT"] == 120.25 and row["REST_AMOUNT"] == 379.75 and row["ID"] == 77001
    assert I.decrypt(row["CODE"], 11).endswith(I.HEX_TAIL)


def test_ufx_error_exits_loop():
    c = conn()
    r, f = commit(c, 5007)                                   # card ...0002 -> 'Insufficient funds', no credit (ncount 0)
    assert f["messages"] == [I.MSG_FAIL + "Insufficient funds"] and f["posted"] == []
    assert ufx.MockUfx.calls[0][5] == "80"


def test_ufx_disabled_posts_directly():
    c = conn()
    mock_azips._load()["sw_settings"]["ENABLEDUFX"] = 0
    r, f = commit(c, 5005)
    assert ufx.MockUfx.calls == [] and f["posted"] == [5005]


def test_ufxcredit_debt_bigger_than_amount_gives_zero():
    c = conn()
    mock_azips._load()["cm_report_job"][0]["DEBTINT"] = 900
    r, f = commit(c, 5005)
    assert f["messages"] == [I.MSG_ZERO] and ufx.MockUfx.calls == [] and f["posted"] == [5005]   # RespText := OK


def test_encrypting_roundtrip_and_second_call_same_day():
    s = I.encrypting(NOW)
    dts = I.datetime_to_str_us(NOW)
    assert dts == "456000*11:22:33- 13.10.2026"
    assert I.decrypt(s, 11) == I.string2hex(dts + "SMARTBANK.EXEXOHKS")
    msgs = []
    c = conn()
    D = mock_azips._load()
    D["card_ufx_check"].append({"ID": 77001, "DAT": NOW.replace(year=dt.date.today().year, month=dt.date.today().month,
                                day=dt.date.today().day).isoformat(), "STATUS": 1, "ACC_ID": 9101, "AMOUNT": 120.25,
                                "REST_AMOUNT": -20.0, "CODE": s})
    assert I.ufxcredit(c, 9101, 100.0, msgs, NOW) == 80.0 and msgs == [I.MSG_YEAH]
    assert D["card_ufx_check"][0]["REST_AMOUNT"] == 80.0
    D["card_ufx_check"][0]["CODE"] = "garbage"
    msgs = []
    assert I.ufxcredit(c, 9101, 100.0, msgs, NOW) == 0.0 and msgs == [I.MSG_KODE]


def test_encrypting_short_microseconds_raises_like_strtoint():
    with pytest.raises(I.DelphiConvertError):
        I.encrypting(dt.datetime(2026, 10, 13, 11, 22, 33, 5000))      # us '5000*' -> copy(dt,8,2) = ':2'


def test_ufx_envelope_and_parse():
    env = ufx.envelope("4169", "VISA", "2026-10-13 11:22:33", "a<b", "944", "1.5").decode()
    assert '<NS1:fundstransfer xmlns:NS1="http://webser/"><rbsnumber>4169</rbsnumber><MsgCode>VISA</MsgCode>' in env
    assert "<Description>a&lt;b</Description>" in env
    ok = b'<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"><S:Body><ns2:fundstransferResponse xmlns:ns2="http://webser/"><return>123#Successfully processed</return></ns2:fundstransferResponse></S:Body></S:Envelope>'
    assert ufx.parse_response(ok) == "123#Successfully processed"
    fault = b'<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"><S:Body><S:Fault><faultcode>S:Server</faultcode><faultstring>boom</faultstring></S:Fault></S:Body></S:Envelope>'
    with pytest.raises(ufx.UfxError, match="boom"):
        ufx.parse_response(fault)


def test_ufx_client_is_mock_in_tests():
    assert isinstance(ufx.client(), ufx.MockUfx)


def test_checkinacc():
    c = conn()
    assert I.checkinacc(c, Q.LINES_SW_IN, 5006, "AZ41SMRT00000000000000001944") == {"name": "SMART MMC", "closed": False}
    assert I.checkinacc(c, Q.LINES_SW_IN, 5006, "NOPE") == {"name": "", "closed": True}
    assert [x[1] for x in calls("SW_MAIN.UPD_NONE")] == [["5006"], ["5006"]]
    assert I.checkinacc(c, Q.LINES_SW_IN, 424242, "X") is None


def test_tranzit():
    c = conn()
    rows = I.tranzit_list(c)
    assert len(rows) == 1
    assert I.tranzit_add(c, "A1", "T1") == {"message": "Tranzit hesab əlavə olundu"}
    assert len(I.tranzit_list(c)) == 2
    assert I.tranzit_delete(c, rows[0]["ROWID"]) and not I.tranzit_delete(c, "bogus")
    assert [r["MAIN_ACC"] for r in I.tranzit_list(c)] == ["A1"]


def test_in_redakte_unit16():
    c = conn()
    assert I.in_redakte(c, Q.LINES_SW_IN, 5006, "AZ00X", "1234567890") == {"done": True}
    assert calls("SW_MAIN.UPDIN")[0][1] == ["AZ00X", "1234567890", "5006"]
    assert I.in_redakte(c, Q.LINES_SW_IN, 1, "a", "b") is None
