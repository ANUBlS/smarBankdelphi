import datetime
from decimal import Decimal
from app import delphi


def test_subst_and_like():
    assert delphi.subst("order by :title", "title", "NAME") == "order by NAME"
    assert delphi.subst("x=:titles order by :Title", "title", "ID") == "x=:titles order by ID"
    assert delphi.like_prefix("10%_\\") == "10\\%\\_\\\\%"


def test_az_i_to_backtick():
    assert delphi.az_i_to_backtick("İlkin Inşaat ıi") == "`lk`n `nşaat ``"


def test_round_new_matches_delphi_roundnew():
    # TransactionPropertiesImpl RoundNew(x, 100): frac part scaled, half away from zero on the 3rd digit
    assert delphi.round_new(1.005, 100) == 1.01
    assert delphi.round_new(2.344999, 100) == 2.35   # Delphi quirk: Round(49.99)=50 -> rounds up (preserved)
    assert delphi.round_new(2.34494, 100) == 2.34
    assert delphi.round_new(-1.005, 100) == -1.01
    assert delphi.round_new(170.0, 1000000) == 170.0


def test_currency_and_dates():
    assert delphi.to_currency(1.23456) == Decimal("1.2346")
    assert delphi.to_currency(0.00005) == Decimal("0.0000")      # banker's rounding to 4 dp
    assert delphi.date_only(datetime.datetime(2026, 10, 12, 15, 30)) == datetime.datetime(2026, 10, 12)
