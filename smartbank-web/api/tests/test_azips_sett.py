"""AZIPS part 4c - insett.pas (TIn_sett) / MTsett.pas (TAzpSettings). Expected values from the Delphi source by hand."""
import pytest

from app import azips_sett as S, azips_in as I
from app.db import mock as mock_db
from app.db import mock_azips


def conn():
    mock_db.reset(); mock_azips.reset()
    return mock_db.MockConnection("ADMIN")


def calls(k):
    return [c[1] for c in mock_azips._load().get("in_calls", []) if c[0] == k]


def test_open_both_forms():
    c = conn()
    d = S.open_form(c, "in")
    assert set(d["grids"]) == {"mt103", "mt205", "bproc", "names"} and d["grids"]["names"]
    o = S.open_form(c, "out")
    assert o["grids"]["names"] == [] and o["mt205_items"][0] == "Subhesabın Mohkəmləndirməsi"


def test_mb_comm_azn_and_foreign():
    c = conn()
    r = S.mb_comm(c, 101, 944, "AZN")
    assert [x["ID"] for x in r["mbacc"]] == [7001] and [x["ID"] for x in r["comm_acc"]] == [7002]
    r = S.mb_comm(c, 101, 840, "USD")
    assert [x["ID"] for x in r["mbacc"]] == [7003] and [x["ID"] for x in r["comm_acc"]] == [7004]


def test_bal_accounts_strtoint():
    c = conn()
    assert [x["ID"] for x in S.bal_accounts(c, "main", 944, "1052")] == [7001]
    with pytest.raises(I.DelphiConvertError):
        S.bal_accounts(c, "alter", 944, "64x")


def test_save_args_no_commit():
    c = conn()
    assert S.save(c, "in", "mt103", {"acc_b": 7001, "acc_c": 7002, "fil": 101, "val": 944})["message"] == S.ADDED
    assert calls("SW_MAIN.AZPSETTINGS_IN") == [[7001, 7002, 101, 944]]
    S.save(c, "out", "mt205", {"purpose_text": "Vəsaitin yerləşdirilməsi", "acc_a": 1, "acc_b": 2, "val": 944, "fil": 101,
                               "bankcode": "505000", "bank_name": "PASHA BANK"})
    assert calls("SW_MAIN.AZP205") == [[3, 1, 2, 944, 101, "505000", "PASHA BANK"]]
    r = S.save(c, "in", "bproc", {"bproc_id": 31, "bproc_name": "AZIPS daxil olan", "curr": "AZN", "mt": "MT103",
                                  "purpose_text": "Filial"})
    assert r["message"] == S.BP_ADDED and calls("SW_MAIN.BPROC_IN") == [[31, "AZIPS daxil olan", "AZN", "MT103", 1]]
    S.save(c, "in", "names", {"mt": "MT900", "acc_a": 5, "acc_b": 6, "val": 944, "edit5": "x", "edit4": "y"})
    assert calls("SW_MAIN.AZP900") == [["MT900", 5, 6, 944, "x", "y", 5]]
    assert S.save(c, "out", "names", {}) is None


def test_delete_commits_and_out_bproc_uses_in_proc():
    c = conn()
    assert S.delete(c, "out", "bproc", 1) == {"message": "Secilmis biznes proses silindi."}
    assert calls("SW_MAIN.BPROC_IN_DEL") == [[1]]
    assert S.delete(c, "in", "mt103", 999) is None
