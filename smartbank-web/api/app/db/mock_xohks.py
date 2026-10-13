"""Mock for Packages/LVPCSSManager_Turan (XÖHKS). The verbatim Data_Unit.dfm SQL is recognised (otSubst ':title' and the
XS_INCOMINGSUM SQL[6] line may vary) and executed as-is in an in-memory SQLite database built from fixtures/xohks.json, so the
mock checks the real joins / where / order by of the Delphi text. Dialect shims only: Oracle nvl -> SQLite function, the
'uid' pseudo-column -> the mock user's id, 'Dual' is a one-row table, dates are stored as 'YYYY-MM-DD HH:MM:SS' text.
The XS_* tables / views are not in the repo (XS_CONTROL body and DDL missing): columns come from the persistent TFields."""
from __future__ import annotations
import datetime as dt
import json
import os
import re
import sqlite3

from .. import xohks_sql as Q

_DB = None
_PATS = None
DATE_COLS = {"TRANSDATE", "VAL_DATE", "SDATE", "TRANS_DATE", "CREATE_DATE"}


def _osubstr(s, p, n):
    if s is None:
        return None
    s = str(s)
    p = 1 if p == 0 else (len(s) + p + 1 if p < 0 else p)
    r = s[p - 1:] if n is None else s[p - 1:p - 1 + n]
    return r or None


def reset():
    global _DB
    _DB = None


def _db():
    global _DB
    if _DB is None:
        from ..config import settings
        D = json.load(open(os.path.join(settings.mock_fixtures, "xohks.json"), encoding="utf-8"))
        c = sqlite3.connect(":memory:", check_same_thread=False)
        c.create_function("nvl", 2, lambda a, b: b if a is None else a)
        c.create_function("substr", 3, _osubstr)   # Oracle SUBSTR: position 0 is treated as 1
        c.create_function("substr", 2, lambda s, p: _osubstr(s, p, None))
        c.execute("create table dual (dummy text)")
        c.execute("insert into dual values ('X')")
        for t, rows in D.items():
            if t.startswith("_"):
                continue
            if t == "XS_BENEFICIARY":                    # columns written by the XS_CONTROL emulation
                rows = [dict({"FORMAT": None}, **r) for r in rows]
            cols = list(dict.fromkeys(k for r in rows for k in r))
            c.execute(f"create table {t} ({', '.join(cols)})")
            for r in rows:
                c.execute(f"insert into {t} ({', '.join(r)}) values ({', '.join('?' * len(r))})", list(r.values()))
        # step 3b: PrepareFile views (DDL not in the repo). Emulated: authorised batches (status msAvtorizator = 6) are 'ready'
        # (send = 0) or 'sending' (send = 1); columns = the PrepareFile_Unit.dfm TFields.
        sel = ("select x.id, x.f_id, x.opercode, x.acc_id, x.client_name, x.client_code, x.trans_ref, x.amount, x.val_acc, "
               "x.transdate, x.send, x.status, x.filial, x.transaction_id, x.client_inn, x.userid, x.format, a.acc_no, v.val_name "
               "from xs_batchs x, account a, avalute v where x.acc_id = a.id and v.valute = a.val_acc and x.status = 6 and x.send = ")
        c.execute("create view xs_ReadyBatchs as " + sel + "0")
        c.execute("create view xs_SendingBatchs as " + sel + "1")
        c.commit()
        _DB = c
    return _DB


def _pats():
    global _PATS
    if _PATS is None:
        _PATS = []
        for n in dir(Q):
            if n.startswith("LINES_"):
                L = list(getattr(Q, n))
                if n == "LINES_XS_INCOMINGSUM":
                    L[6] = "\x00"
                if n == "LINES_DATAACCOUNTIBAN":
                    L[11] = "\x00"
                t = re.escape(Q.text(L)).replace("\x00", ".*")
                t = re.sub(r":(title|Title|Field)\b", ".*", t)
                _PATS.append(re.compile(t + r"\Z", re.S))
    return _PATS


def _v(v):
    if isinstance(v, (dt.datetime, dt.date)):
        return (v if isinstance(v, dt.datetime) else dt.datetime(v.year, v.month, v.day)).strftime("%Y-%m-%d %H:%M:%S")
    return v


class XohksMixin:
    def _xs_query(self, sql, b):
        if not any(p.match(sql) for p in _pats()):
            return NotImplemented
        s = re.sub(r":(\w+)", lambda m: ":" + m.group(1).lower(), sql)
        s = re.sub(r"\buid\b", ":uid__", s)
        params = {k.lower(): _v(v) for k, v in (b or {}).items()}
        for k in ("acc_id", "batch_id", "kod_fil", "id"):          # Oracle implicit text -> number (step 3b quoted values)
            if isinstance(params.get(k), str) and params[k].lstrip("-").isdigit():
                params[k] = int(params[k])
        if re.search(r"(bankcode|Kod_B)=:b0", s) and isinstance(params.get("b0"), str) and params["b0"].isdigit():
            params["b0"] = int(params["b0"])           # step 4: numeric column vs quoted value (Oracle converts implicitly)
        if ":uid__" in s:
            params["uid__"] = self.user.get("user_id", 0)
        cur = _db().execute(s, params)
        names = [d[0].upper() for d in cur.description]
        out = []
        for r in cur.fetchall():
            o = {}
            for k, v in zip(names, r):
                if k in DATE_COLS and isinstance(v, str):
                    v = dt.datetime.fromisoformat(v)
                o[k] = v
            out.append(o)
        return out

    # ------------------------------------------------------------------ XS_CONTROL / SBOP emulation (step 2)
    # The XS_CONTROL body is not in the repo: the emulation only does what the names and the Delphi callers imply
    # (argument order from LVPCSSImpl / Transaction_Unit / Payment_Det). DML runs in the SQLite transaction, so
    # Commit / Rollback timing of the Delphi code is exercised (MockConnection.commit / rollback -> _xs_commit / _xs_rollback).
    def _xs_seq(self, k):
        D = json.load(open(os.path.join(__import__("app.config", fromlist=["settings"]).settings.mock_fixtures, "xohks.json"),
                           encoding="utf-8"))["_seq"]
        st = self.__dict__.setdefault("_xs_seqs", {})
        st[k] = st.get(k, D[k]) + 1
        return st[k]

    def _xs_usedate(self):
        return self.st["sys"]["tek_dat"][:10] + " 00:00:00"

    def _xs_func(self, key, args):
        c = _db()
        if key == "XS_CONTROL.XS_BATCHS_INSERT":
            opercode, _st, name, code, ref, amount, val, filial = args
            i = int(c.execute("select max(id) from (select id from xs_batchs union select id from xs_batchs_archive "
                              "union select ?)", (self._xs_seq("batch"),)).fetchone()[0]) + 1
            c.execute("insert into xs_batchs (id, opercode, acc_id, client_name, client_code, trans_ref, amount, val_acc, "
                      "transdate, send, status, filial, userid, username, format) values (?,?,NULL,?,?,?,?,?,?,0,0,?,?,?,NULL)",
                      (i, opercode, name, code, ref, amount, int(val), self._xs_usedate(), filial,
                       self.user.get("user_id", 0), self.username))
            return i
        if key == "XS_CONTROL.GETNEWFILEREFERENCE":                      # step 3b (format unknown)
            return "XF" + self.st["sys"]["tek_dat"][2:10].replace("-", "") + "%04d" % self._xs_seq("fref")
        if key == "XS_CONTROL.GETBATCHAMOUNT":                           # sum of the sending batches (emulated)
            return float(c.execute("select nvl(sum(amount),0) from xs_SendingBatchs").fetchone()[0])
        if key == "XS_CONTROL.GETNEWBATCHREFRENCE":
            return "XS" + self.st["sys"]["tek_dat"][2:10].replace("-", "") + "%04d" % self._xs_seq("bref")
        if key == "XS_CONTROL.GETNEWBENEFICIARYREFERENCE":
            return "BN%06d" % self._xs_seq("nref")
        if key == "XS_CONTROL.XS_BATCHS_CHANGESTATUS":
            # step 3: Mt102AcceptExecute :2381 treats 1 as success; else 'Batch-də olan bütün messajların düzgünlüyü
            # təsdiq olunmalıdır !' -> emulated as: status 1 only when every beneficiary of the batch is accepted (status <> 0)
            if int(args[1]) == 1:
                n0 = c.execute("select count(*) from xs_beneficiary where batchid=? and status=0", (args[0],)).fetchone()[0]
                n = c.execute("select count(*) from xs_beneficiary where batchid=?", (args[0],)).fetchone()[0]
                if n == 0 or n0:
                    return 0
                c.execute("update xs_batchs set status=1 where id=?", (args[0],))
                return 1
            c.execute("update xs_batchs set status=? where id=?", (args[1], args[0]))
            return 0
        return NotImplemented

    def _xs_proc(self, key, args):
        c = _db()
        if key == "XS_CONTROL.XS_BATCHS_UPDATE":
            i, opercode, acc_id, name, code, ref, amount, val, filial, inn, fmt = args
            c.execute("update xs_batchs set opercode=?, acc_id=?, client_name=?, client_code=?, trans_ref=?, amount=?, val_acc=?, "
                      "filial=?, client_inn=?, format=? where id=?",
                      (opercode, acc_id, name, code, ref, amount, int(val), filial, inn, fmt, i))
            return {}
        if key in ("XS_CONTROL.XS_BENEFICIARY_INSERT", "XS_CONTROL.XS_BENEFICIARY_UPDATE"):
            i, bank, sub, acc, name, code, inn, remit, tcod, add, val, ref, amount, cnt = args
            if key.endswith("INSERT"):
                bid = int(c.execute("select max(id) from (select id from xs_beneficiary union select ?)",
                                    (self._xs_seq("benef"),)).fetchone()[0]) + 1
                c.execute("insert into xs_beneficiary (id, batchid, rec_bank_id, rec_bank_sub_acc, client_acc_no, client_name, "
                          "client_code, client_inn, remit_inf, trans_cod, add_inf, val_date, val_cod, mess_reference, amount, "
                          "bnfcount, status, userid) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,?)",
                          (bid, i, int(bank), sub, acc, name, code, inn, remit, str(int(tcod)), add, self._xs_usedate(),
                           int(val), ref, amount, cnt, self.user.get("user_id", 0)))
            else:
                c.execute("update xs_beneficiary set rec_bank_id=?, rec_bank_sub_acc=?, client_acc_no=?, client_name=?, "
                          "client_code=?, client_inn=?, remit_inf=?, trans_cod=?, add_inf=?, val_cod=?, mess_reference=?, "
                          "amount=? where id=?", (int(bank), sub, acc, name, code, inn, remit, str(int(tcod)), add, int(val),
                                                  ref, amount, i))
            return {}
        if key == "XS_CONTROL.XS_BATCHAMOUNT_UPDATE":
            c.execute("update xs_batchs set amount=(select nvl(sum(amount),0) from xs_beneficiary where batchid=?) where id=?",
                      (args[0], args[0]))
            return {}
        if key == "XS_CONTROL.XS_FORMAT_UPDATE":
            c.execute("update xs_batchs set format=? where id=?", (args[1], args[0]))
            return {}
        if key == "XS_CONTROL.XS_BENEFICIARY_CHANGESTATUS":
            c.execute("update xs_beneficiary set status=? where id=?", (args[1], args[0]))
            return {}
        if key == "XS_CONTROL.XS_BATCHS_DELETE":
            c.execute("delete from xs_beneficiary where batchid=?", (args[0],))
            c.execute("delete from xs_batchs where id=?", (args[0],))
            return {}
        if key == "XS_CONTROL.XS_BENEFICIARY_DELETE":
            c.execute("delete from xs_beneficiary where id=?", (args[0],))
            return {}
        # ---- step 3 status chain (bodies unknown; status numbers from Data_Unit.pas:276-286 and the Delphi callers)
        u = self.username
        if key.endswith(("VERIFSTATUS", "AVTSTATUS", "XS_BATCHS_ERROR")):
            args = [int(args[0])] + list(args[1:])      # TVerify passes dbedit4.Text (Oracle converts implicitly)
        if key == "XS_CONTROL.UPDATEBATCHREFERENCE":
            c.execute("update xs_batchs set trans_ref=? where id=?", (args[1], args[0]))
            return {}
        if key in ("XS_CONTROL.XS_BATCHS_VERIFSTATUS", "XS_CONTROL.XS_BATCHS_FVERIFSTATUS", "XS_CONTROL.XS_BATCHS_AVTSTATUS"):
            st, col = {"VERIFSTATUS": (4, "vuserid"), "FVERIFSTATUS": (5, "fuserid"), "AVTSTATUS": (6, "auserid")}[key.split("_")[-1]]
            c.execute(f"update xs_batchs set status=?, {col}=?" + (", sdate=?" if st == 4 else "") + " where id=?",
                      (st, u, self._xs_usedate(), args[0]) if st == 4 else (st, u, args[0]))
            return {}
        if key in ("XS_CONTROL.XS_BENEFICIARY_VERIFSTATUS", "XS_CONTROL.XS_BENEFICIARY_FVERIFSTATUS",
                   "XS_CONTROL.XS_BENEFICIARY_AVTSTATUS"):
            st = {"VERIFSTATUS": 4, "FVERIFSTATUS": 5, "AVTSTATUS": 6}[key.split("_")[-1]]
            c.execute("update xs_beneficiary set status=? where batchid=?", (st, args[0]))
            return {}
        if key == "XS_CONTROL.XS_BATCHS_ERROR":          # TVerify amount mismatch; emulated as status 8 (re-verifiable)
            c.execute("update xs_batchs set status=8 where id=?", (args[0],))
            c.execute("update xs_beneficiary set status=8 where batchid=?", (args[0],))
            return {}
        if key == "XS_CONTROL.XS_BATCHS_RETURNCHANGESTATUS":
            c.execute("update xs_batchs set status=? where id=?", (args[1], args[0]))
            return {}
        if key == "XS_CONTROL.XS_BENEFICIARY_RETURNSTATUS":
            c.execute("update xs_beneficiary set status=? where batchid=?", (args[1], args[0]))
            return {}
        if key in ("XS_CONTROL.SETBATCHSTRANSACTION", "XS_CONTROL.SETBATCHSAVTOTRANSACTION", "XS_CONTROL.XS_BATCHS_DELETETRANS",
                   "XS_CONTROL.SENDTOARCHIVE"):
            self.__dict__.setdefault("xs_calls", []).append((key, list(args)))   # body unknown: recorded only
            return {}
        if key == "XS_CONTROL.XS_BATCHS205":
            self.__dict__.setdefault("xs_calls", []).append((key, list(args)))   # body unknown: recorded only
            return {}
        # ---- step 3b PrepareFile (bodies unknown): (id, all) - all = 1 moves every batch
        if key in ("XS_CONTROL.BATCHTOREADYBATCHS", "XS_CONTROL.BATCHTOSENDINGBATCHS"):
            to, frm = (0, 1) if key.endswith("READYBATCHS") else (1, 0)
            if int(args[1]) == 1:
                c.execute("update xs_batchs set send=? where status=6 and send=?", (to, frm))
            else:
                c.execute("update xs_batchs set send=? where id=? and status=6", (to, args[0]))
            return {}
        if key == "XS_CONTROL.XS_SENTINFO_INSERT":
            fmt, snd, rcv, typ, pri, dn, upri, d, ref, bf = args
            c.execute("insert into xs_sentinfo (id, format, sender, receiver, type, priority, del_notif, user_priority, create_date, "
                      "user_reference, batchfile) values (?,?,?,?,?,?,?,?,?,?,?)",
                      (self._xs_seq("sent") + 1, fmt, snd, rcv, typ, pri, dn, upri, _v(d), ref, bf))
            c.execute("update xs_batchs set status=3, send=2 where send=1")      # emulated: file created (msFileCreated)
            return {}
        if key == "XS_CONTROL.XS_BENEFICIARY_SHABLON_INSERT":
            cols = [x.strip() for x in " ".join(Q.LINES_ODS_SHABLON[:3]).replace("SELECT", "").split(",")]
            a = list(args) + [None] * (17 - len(args))                    # add_new_shablon passes 15 values
            c.execute(f"insert into xs_beneficiary_shablon ({', '.join(cols)}) values ({', '.join('?' * 17)})", a)
            return {}
        if key == "XS_CONTROL.XS_BENEFICIARY_SHABLON_DELETE":
            c.execute("delete from xs_beneficiary_shablon where shablonun_adi=?", (args[0],))
            return {}
        # ---- step 4 IN messages (bodies unknown; argument order from LVPCSSImpl.pas ConvertToBase :1806-1833, MessInDelete
        # :2219, MessagesInAccept :2632, ReceiveMessDetals_Unit Button1Click)
        if key == "XS_CONTROL.XS_INCOMING_INSERT":
            cols = ["TRANS_DATE", "REFERENCE", "F_20", "F_21", "VAL_COD", "AMOUNT", "SEN_ACC", "SEN_NAME", "SEN_INN", "SEN_CODE",
                    "SEN_BANK_ID", "SEN_BANK_SUBACC", "SEN_BANK_BIK", "SEN_BANK_CODE", "SEN_BANK_KRNO", "SEN_BANK_INN",
                    "REC_BANK_SUBACC", "REC_BANK_BIK", "REC_CLIENT_ACC", "FILIAL", "REC_CLIENT_NAME", "REC_CLIENT_INN",
                    "REC_CLIENT_CODE", "REC_CLIENT_ACC_ID", "REMIT_INF", "TYPECODE", "ADD_INF"]
            a = [_v(x) for x in args]
            i = int(c.execute("select max(id) from (select id from xs_incoming union select id from xs_incomingview)").fetchone()[0]) + 1
            c.execute(f"insert into xs_incoming (ID, STATUS, {', '.join(cols)}) values (?, 0, {', '.join('?' * len(cols))})", [i] + a)
            r = dict(zip(cols, a))
            vn = c.execute("select val_name from avalute where valute=?", (r["VAL_COD"],)).fetchone()
            c.execute("insert into xs_incomingview (ID, TRANS_DATE, REFERENCE, SEN_ACC, VAL_NAME, REC_CLIENT_ACC, REC_CLIENT_INN, AMOUNT, "
                      "LAMOUNT, FILIAL, TYPECODE, STATUS, DESCRPTIONCORRECT) values (?,?,?,?,?,?,?,?,?,?,?,0,'')",
                      (i, r["TRANS_DATE"], r["REFERENCE"], r["SEN_ACC"], vn[0] if vn else None, r["REC_CLIENT_ACC"],
                       r["REC_CLIENT_INN"], r["AMOUNT"], r["AMOUNT"], r["FILIAL"], r["TYPECODE"]))
            return {}
        if key == "XS_CONTROL.XS_INCOMING_DELETE":
            c.execute("delete from xs_incoming where id=?", (args[0],))
            c.execute("delete from xs_incomingview where id=?", (args[0],))
            return {}
        if key == "XS_CONTROL.SETINCOMINGTRANSACTION":           # emulated: posted -> status 1 (msCommit)
            c.execute("update xs_incomingview set status=1 where id=?", (args[0],))
            c.execute("update xs_incoming set status=1 where id=?", (args[0],))
            return {}
        if key == "XS_CONTROL.XS_INCOMING_UPDATE":
            c.execute("update xs_incomingview set rec_client_acc=? where id=?", (args[2], args[0]))
            c.execute("update xs_incoming set rec_client_acc_id=?, rec_client_acc=? where id=?", (args[1], args[2], args[0]))
            return {}
        if key == "XS_CONTROL.XS_INCOMING_CHANGESTATUS":
            c.execute("update xs_incomingview set status=? where id=?", (args[1], args[0]))
            return {}
        return NotImplemented

    def _xs_commit(self):
        if _DB is not None:
            _DB.commit()

    def _xs_rollback(self):
        if _DB is not None:
            _DB.rollback()
