"""Builds api/fixtures/currencyposition.json and api/fixtures/dbf/Balansb.dbf (mock data for Packages/CurrencyPosition).

ASSUMED data: the currency codes follow the Delphi code, which hard-codes VAL_KOD/Currency = 1 for USD
(CurrencyPositionImpl.pas:807 SetVariable('Currency',1), SB_CURRENCYPOSITION.DataChecking 'Where Currency=1').
cp_source stands in for the Account/Archost/BAL_SPRn aggregation of Get_CurrencyPosition (one row per
date/plan/currency/balance account; POK_* = the manat equivalents that go into the 'AZM' rows)."""
import json, os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "api"))
from app import dbf_template as DBF

root = os.path.join(os.path.dirname(__file__), "..", "api", "fixtures")
dates = ["2026-10-08", "2026-10-09", "2026-10-12"]
rates = {1: [1.7, 1.7, 1.7], 2: [1.9821, 1.9765, 1.9803], 3: [0.0207, 0.0209, 0.0208]}
avalute = [
    {"VALUTE": 0, "VALU_NAME": "Manat", "VAL_NAME": "AZM", "OFFICAL": "AZM", "USING": 0, "LIMIT": 0},
    {"VALUTE": 1, "VALU_NAME": "ABŞ dolları", "VAL_NAME": "USD", "OFFICAL": "USD", "USING": 1, "LIMIT": 10},
    {"VALUTE": 2, "VALU_NAME": "Avro", "VAL_NAME": "EUR", "OFFICAL": "EUR", "USING": 1, "LIMIT": 10},
    {"VALUTE": 3, "VALU_NAME": "Rusiya rublu", "VAL_NAME": "RUR", "OFFICAL": "RUR", "USING": 0, "LIMIT": 5},
]
operkurs = [{"DAT": d, "VAL_KOD": v, "OSTAT": rates[v][i]} for v in rates for i, d in enumerate(dates)]
operkurs += [{"DAT": d, "VAL_KOD": 0, "OSTAT": 1} for d in dates]
src = []
base = {  # currency: [(balance, incoming, active, passive)]
    0: [(1001, 3, 850000.0, 0.0), (3001, 2, 0.0, 1250000.0), (1301, 1, 620000.0, 0.0)],
    1: [(1011, 3, 410000.0, 0.0), (3011, 2, 0.0, 385000.0), (1311, 1, 52000.0, 0.0), (3311, 3, 0.0, 61000.0)],
    2: [(1011, 3, 120000.0, 0.0), (3011, 2, 0.0, 98500.0)],
    3: [(1011, 3, 2400000.0, 0.0), (3011, 2, 0.0, 2550000.0)],
}
for i, d in enumerate(dates):
    for cur, lst in base.items():
        for bal, inc, a, p in lst:
            k = 1 + 0.01 * i
            a, p = round(a * k, 2), round(p * k, 2)
            r = 1 if cur == 0 else rates[cur][i]
            src.append({"DAT": d, "PLAN": 1, "CURRENCY": cur, "BALANCE": bal, "INCOMING": inc, "ACTIVE": a, "PASSIVE": p,
                        "POK_ACTIVE": round(a * r, 2), "POK_PASSIVE": round(p * r, 2)})
    src.append({"DAT": d, "PLAN": 1, "CURRENCY": 2, "BALANCE": 9999, "INCOMING": 1, "ACTIVE": 0.0, "PASSIVE": 0.0,
                "POK_ACTIVE": 0.0, "POK_PASSIVE": 0.0})   # removed by 'Delete ... Where Active=0 And Passive=0'
D = {
    "avalute": avalute, "operkurs": operkurs, "cp_source": src,
    "bankinfo": [{"BANK": "SmartBank ASC", "SVM": 25000.0, "TEL": "(012) 498-00-00", "CAPITAL": 52000000.0,
                  "VAL_MOV": "122", "SVM_CURRENCYID": 1}],
    "capital": [{"DAT": "2026-10-08", "CAPITAL": 51830000.25}, {"DAT": "2026-10-09", "CAPITAL": 51904500.5},
                {"DAT": "2026-10-12", "CAPITAL": 52010000.0}],
    "sysdat": [{"TEK_DAT": "2026-10-12"}],
}
json.dump(D, open(os.path.join(root, "currencyposition.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
# Balansb.dbf - field list of the commented-out CreateTable (CurrencyPositionImpl.pas:774-784); BCD -> N(20,2) ASSUMED
tpl = DBF.make_template([("BANK_CODE", "C", 3, 0), ("TARIX", "D", 8, 0), ("VALUTE", "C", 3, 0), ("BALANS", "C", 5, 0),
                         ("ACTIVES", "N", 20, 2), ("PASSIVES", "N", 20, 2), ("POUL", "N", 20, 4)])
open(os.path.join(root, "dbf", "Balansb.dbf"), "wb").write(tpl)
print("ok", len(src))
