"""AZIPS part 4a - row actions (SWIFT_MAINImpl1.pas out_deleteExecute :4515, geriExecute :4458, commitingExecute :6688 +
yoxp.pas Form12, DeleteExecute :4377, Geriqaytar1Click :435, mliyyatGnnsndlringondrm1Click :6778). Expected values from the
Delphi source by hand."""
from app import azips_actions as A, azips_sql as Q
from app.db import mock as mock_db
from app.db import mock_azips


def conn():
    mock_db.reset(); mock_azips.reset()
    return mock_db.MockConnection("ADMIN")


def ids(c, lines):
    return [r["ID"] for r in c.query(Q.text(lines))]


def calls():
    return mock_azips._load().get("in_calls", [])


def test_out_delete_loop_answers():
    c = conn(); out = ids(c, Q.LINES_SW_OUT)
    assert len(out) >= 2
    r = A.out_delete(c, False, out[:2], None, ["no", "yes"])
    assert r["done"] == [out[1]] and [k for k, _ in calls()] == ["SW_MAIN.SW_OUT_DELETE"]
    assert r["memo2"] in (A.AZN_OUT_DELETED.format(1), A.AZN_OUT_ALL_DELETED)


def test_out_delete_cancel_and_all():
    c = conn(); out = ids(c, Q.LINES_SW_OUT)
    assert A.out_delete(c, False, out, None, ["cancel"])["done"] == []
    r = A.out_delete(c, False, out, None, ["all"])          # mbYesToAll confirmed: no further questions
    assert r["done"] == out and r["memo2"] == A.AZN_OUT_ALL_DELETED


def test_current_row_when_nothing_selected_and_foreign_ids_ignored():
    c = conn(); out = ids(c, Q.LINES_SW_OUT)
    r = A.out_delete(c, False, [999999], out[0], ["yes"])
    assert r["done"] == [out[0]]


def test_back_empty_and_ok():
    c = conn(); o2 = ids(c, Q.LINES_SW_OUT_2)
    assert o2
    r = A.out_back(c, False, [o2[0]], None, ["yes"])
    assert r["done"] == [o2[0]] and calls()[-1] == ["SW_MAIN.SW_OUT_BACK", [o2[0]]]


def test_commit_form12_ok_and_wrong():
    c = conn(); rows = c.query(Q.text(Q.LINES_SW_OUT_2)); x = rows[0]
    from app.azips import float_to_str
    good = {"amount": float_to_str(float(x["MF32A_AMOUNT"])), "curr": x["MF32A_CURR"]}
    r = A.out_commit(c, False, [x["ID"]], None, ["yes"], [good])
    assert r["done"] == [x["ID"]] and not r["exited"]
    c = conn(); x = c.query(Q.text(Q.LINES_SW_OUT_2))[0]
    r = A.out_commit(c, False, [x["ID"]], None, ["yes"], [{"amount": "1", "curr": "XXX"}])
    assert r["exited"] and r["message"] == A.FORM12_BAD and r["done"] == []
    row = next(z for z in mock_azips._load()["sw_out_new"] if z["ID"] == x["ID"])
    assert row["STATUS"] == 7 and row["INFO"] == A.FORM12_BAD
    c = conn(); x = c.query(Q.text(Q.LINES_SW_OUT_2))[0]
    assert A.out_commit(c, False, [x["ID"]], None, ["yes"], [{"close": True}])["exited"]


def test_in_delete_and_currencies():
    c = conn(); i = ids(c, Q.LINES_SW_IN)
    r = A.in_delete(c, list(Q.LINES_SW_IN), [i[0]], None, ["yes"])
    assert r["done"] == [i[0]] and i[0] not in ids(c, Q.LINES_SW_IN)
    assert A.commit_currencies(c)
