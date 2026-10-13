"""Mock for AZIPS part 4b-2 (incoming postings, UFX card credit, account checks). Package bodies (sw_main, cardufx,
accid) are not in the repo: the behaviour below is illustrative only, enough to drive every Delphi branch.
Fixture keys in azips.json: ufx_cards {sw_in id: card data}, cm_accounts, cm_report_job, card_ufx_check, accid, sw_transit_acc."""
from __future__ import annotations
import datetime as dt

from .base import DBError
from .. import azips_sql as Q
from .mock_azips import _load, _rows


def _call(D, key, args):
    D.setdefault("in_calls", []).append([key, list(args)])


class AzipsInMixin:
    def _azi_query(self, sql, b):
        D = _load()
        if sql.startswith(Q.LINES_SW_IN_FORADDIN[0] + "\r\n" + Q.LINES_SW_IN_FORADDIN[1][:60]):
            body = sql.split("\r\n")[1]
            ids = body[body.index("in (") + 4:body.rindex(")")]
            if not ids.strip():
                raise DBError("ORA-00936: missing expression", 936)
            want = [int(x) for x in ids.split(",")]
            return _rows([r for r in D["sw_in"] if r["ID"] in want and r["STATUS"] != 10])
        if sql == Q.sql(Q.LINES_INTESDIQ):
            return _rows([r for r in D["sw_in"] if r["ID"] == b["vid"]])
        if sql == Q.sql(Q.LINES_CARDFINDCREDIT):
            return [{"CRDT": D.get("accid", {}).get(b["card_accid"])}]
        acc = lambda: [r for r in D.get("cm_accounts", []) if r["BOOROWERACCID"] == b["vaccid"]]   # noqa: E731
        today = lambda r: dt.datetime.fromisoformat(r["DAT"]).date() == dt.date.today()          # noqa: E731
        chk = lambda: [r for r in D.get("card_ufx_check", []) if r["ACC_ID"] == b["vaccid"] and today(r)]   # noqa: E731
        if sql == Q.sql(Q.LINES_GET_CR_ACC):
            return [{"NCOUNT": len(acc())}]
        if sql == Q.sql(Q.LINES_GET_CREDITID):
            return [{"VCREDITID": r["CREDITID"]} for r in acc()]
        if sql == Q.sql(Q.LINES_GET_UFX_CHECK):
            return [{"V_CNT": len(chk())}]
        if sql == Q.sql(Q.LINES_GET_DEBTAMOUNT):
            return [{"VDUEINTERESTREST": r["DEBTINT"]} for r in D.get("cm_report_job", []) if r["CREDITID"] == b["vcreditid"]]
        if sql == Q.sql(Q.LINES_UFXCODE):
            return [{"CODE": r["CODE"], "DAT": dt.datetime.fromisoformat(r["DAT"])} for r in chk()]
        if sql == Q.sql(Q.LINES_GET_RESTUFXCHECK):
            return [{"V_RSTAMOUNT": r["REST_AMOUNT"]} for r in chk()]
        if sql == Q.sql(Q.LINES_ACC_CHECK):
            return [dict(r) for r in D.get("account", []) if r.get("ACC_NO") == b["acc"]]
        if sql == Q.sql(Q.LINES_TRANZIT):
            return [dict(r) for r in D.get("sw_transit_acc", [])]
        return NotImplemented

    def _azi_execute(self, sql, b):
        D = _load()
        if sql == Q.sql(Q.LINES_INSUFX):
            D.setdefault("card_ufx_check", []).append({"ID": b["vcreditid"], "DAT": b["datdate"].isoformat(), "STATUS": 1,
                                                       "ACC_ID": b["vaccid"], "AMOUNT": b["vdueinterestrest"],
                                                       "REST_AMOUNT": b["v_rest"], "CODE": b["vcode"]})
            return True
        if sql == Q.sql(Q.LINES_UPDUFX):
            for r in D.get("card_ufx_check", []):
                if r["ACC_ID"] == b["vaccid"] and dt.datetime.fromisoformat(r["DAT"]).date() == dt.date.today():
                    r["REST_AMOUNT"] = b["transamount"]
            return True
        if sql == "delete from SW_TRANSIT_ACC where rowid = :doa__rowid":
            D["sw_transit_acc"] = [r for r in D.get("sw_transit_acc", []) if r["ROWID"] != b["doa__rowid"]]
            return True
        return False

    def _azi_func(self, key, args):
        D = _load()
        cards = D.get("ufx_cards", {})
        if key == "CARDUFX.CARDCHECK":
            return 1 if str(args[0]) in cards else 0
        if key == "CARDUFX.UFXCHECK":
            return 1.0 if args[0] in D.get("ufx_sent", []) else 0.0
        return NotImplemented

    def _azi_proc(self, key, args):
        D = _load()
        if key == "SW_MAIN.ADD_IN_TRANSACTIONS2":
            _call(D, key, args)
            for r in D["sw_in"]:
                if r["ID"] == args[0]:
                    r["STATUS"] = 96
            return {}
        if key == "CARDUFX.UFXRESPONSE":
            _call(D, key, args)
            D.setdefault("ufx_sent", []).append(args[0])
            return {}
        if key == "SW_MAIN.UPDIN":
            _call(D, key, args)
            for r in D["sw_in"]:
                if str(r["ID"]) == args[2]:
                    r["ACOUNT"], r["VOIN2"] = args[0], args[1]
            return {}
        if key in ("SW_MAIN.UPD_NONE", "SW_MAIN.SW_TRANZIT_INSERT"):
            _call(D, key, args)
            if key == "SW_MAIN.SW_TRANZIT_INSERT":
                t = D.setdefault("sw_transit_acc", [])
                n = max([r["ID"] for r in t] + [0]) + 1
                t.append({"ROWID": "AAAtr" + str(n).rjust(13, "A"), "ID": n, "MAIN_ACC": args[0], "TRANZIT_ACC": args[1],
                          "TRANSIT_ACC_NAME": ""})
            return {}
        return NotImplemented

    def _azi_plsql_out(self, sql, b):
        if sql != "begin cardufx.Ufx_send(:p0, :p1, :p2, :p3, :p4, :p5, :p6); end;":
            return NotImplemented
        c = _load().get("ufx_cards", {}).get(str(b["p0"]))
        if c is None:
            raise DBError("ORA-01403: no data found", 1403)
        return {"p2": c["CARDTYPE"], "p3": c["CARDNUMBER"], "p4": c["VALYUTA"], "p5": c["AMOUNT"], "p6": c["DESCRIPT"]}
