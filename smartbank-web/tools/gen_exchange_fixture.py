"""Generates api/fixtures/exchange.json (mock data for Packages/Exchange) and the two mock-mode DBF templates in
api/fixtures/dbf. The real templates EXCH122.dbf / $MB12212.dbf live in the Delphi client folder and are not in the
repository: the field list below is taken from the FieldByName calls in UntExchangeImpl.pas, the widths are ASSUMED."""
import json, os, sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "api"))
from app.dbf_template import make_template
out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(__file__), "..", "api", "fixtures")
avalute = [{"VALUTE": 0, "VALU_NAME": "Manat", "VAL_NAME": "AZN"}, {"VALUTE": 840, "VALU_NAME": "ABŞ dolları", "VAL_NAME": "USD"},
           {"VALUTE": 978, "VALU_NAME": "Avro", "VAL_NAME": "EUR"}, {"VALUTE": 643, "VALU_NAME": "Rusiya rublu", "VAL_NAME": "RUB"}]
account = [{"ID": 21, "ACC_NO": "AZ31SMRT10130000000000840101", "VAL_ACC": 840, "BAL_CN1": 1013},
           {"ID": 22, "ACC_NO": "AZ32SMRT10030000000000840102", "VAL_ACC": 840, "BAL_CN1": 1003},
           {"ID": 23, "ACC_NO": "AZ33SMRT10130000000000978101", "VAL_ACC": 978, "BAL_CN1": 1013},
           {"ID": 24, "ACC_NO": "AZ34SMRT10130000000000643101", "VAL_ACC": 643, "BAL_CN1": 1013},
           {"ID": 25, "ACC_NO": "AZ35SMRT10130000000000000101", "VAL_ACC": 0, "BAL_CN1": 1013},
           {"ID": 26, "ACC_NO": "AZ36SMRT30010000000000840101", "VAL_ACC": 840, "BAL_CN1": 3001}]
exchanges = [{"ID": 1, "NAME": "Mərkəz VDM", "EXNUM": 1}, {"ID": 2, "NAME": "Gəncə VDM", "EXNUM": 2},
             {"ID": 3, "NAME": "Sumqayıt VDM", "EXNUM": 3}]
excaccount = [{"EXCHANGEID": 1, "ACCOUNTID": 21}, {"EXCHANGEID": 1, "ACCOUNTID": 23}, {"EXCHANGEID": 1, "ACCOUNTID": 25},
              {"EXCHANGEID": 2, "ACCOUNTID": 22}, {"EXCHANGEID": 2, "ACCOUNTID": 24}]
exchange = []
for day, k in (("2026-10-08", 0.0), ("2026-10-09", 0.001), ("2026-10-12", 0.002)):
    for cur, nm, ic, br, sr, ba, sa, bc, sc in ((840, "USD", "840", 1.6950, 1.7050, 18500.0, 12750.0, 41, 28),
                                                (978, "EUR", "978", 1.8350, 1.8650, 6200.0, 4100.0, 17, 11),
                                                (643, "RUB", "643", 0.0198, 0.0215, 152000.0, 98000.0, 9, 6)):
        b, s = round(br + k, 4), round(sr + k, 4)
        exchange.append({"DAT": day, "CURRENCY": cur, "CURRENCYNAME": nm, "INTERCODE": ic, "BUYRATE": b, "BUYAMMOUNT": ba,
                         "BUYEQUIVALENT": round(ba * b, 2), "MINBUYRATE": round(b - 0.005, 4), "MAXBUYRATE": round(b + 0.004, 4),
                         "BUYCOUNT": bc, "SELLRATE": s, "SELLAMMOUNT": sa, "SELLEQUIVALENT": round(sa * s, 2),
                         "MINSELLRATE": round(s - 0.004, 4), "MAXSELLRATE": round(s + 0.005, 4), "SELLCOUNT": sc})
convert_assignments = [{"ID": 1, "FULLPATH": "İdxal əməliyyatları üzrə ödənişlər", "SHORTNAME": "IDX"},
                       {"ID": 2, "FULLPATH": "Kreditlərin qaytarılması", "SHORTNAME": "KRD"},
                       {"ID": 3, "FULLPATH": "Digər məqsədlər", "SHORTNAME": "DIG"}]
exconvert = [
    {"DAT": "2026-10-09", "VAL_ACC": 840, "CURRENCYID_C": 0, "AMMOUNT": 25000.0, "AMMOUNT_C": 42500.0, "LAMMOUNT": 42500.0,
     "RATE_D": 1.7, "RATE_C": 1.0, "DACC_NO": "AZ36SMRT30010000000000840101", "KACC_NO": "AZ20SMRT30010000000000000101", "KASSA_Z": 3},
    {"DAT": "2026-10-12", "VAL_ACC": 0, "CURRENCYID_C": 840, "AMMOUNT": 85250.0, "AMMOUNT_C": 50000.0, "LAMMOUNT": 85250.0,
     "RATE_D": 1.0, "RATE_C": 1.705, "DACC_NO": "AZ20SMRT30010000000000000101", "KACC_NO": "AZ36SMRT30010000000000840101", "KASSA_Z": 1},
    {"DAT": "2026-10-12", "VAL_ACC": 978, "CURRENCYID_C": 0, "AMMOUNT": 10000.0, "AMMOUNT_C": 18400.0, "LAMMOUNT": 18400.0,
     "RATE_D": 1.84, "RATE_C": 1.0, "DACC_NO": "AZ33SMRT10130000000000978101", "KACC_NO": "AZ20SMRT30010000000000000101", "KASSA_Z": 2}]
operkurs = [{"DAT": d, "VAL_KOD": v, "OSTAT": o} for d in ("2026-10-09", "2026-10-12") for v, o in ((840, 1.7), (978, 1.8456))]
convertation = [
    {"DAT": "2026-10-09", "CID": 3, "STATUS": "SELL", "FULLPATH": "Digər məqsədlər", "DEBITCURRENCY": 840, "DEBITCURRENCYNAME": "USD",
     "DEBITRATE": 1.7, "DEBITAMOUNT": 25000.0, "CREDITCURRENCY": 0, "CREDITCURRENCYYNAME": "AZN", "CREDITRATE": 1.0, "CREDITAMOUNT": 42500.0},
    {"DAT": "2026-10-12", "CID": 1, "STATUS": "BUY", "FULLPATH": "İdxal əməliyyatları üzrə ödənişlər", "DEBITCURRENCY": 0,
     "DEBITCURRENCYNAME": "AZN", "DEBITRATE": 1.0, "DEBITAMOUNT": 85250.0, "CREDITCURRENCY": 840, "CREDITCURRENCYYNAME": "USD",
     "CREDITRATE": 1.705, "CREDITAMOUNT": 50000.0},
    {"DAT": "2026-10-12", "CID": 1, "STATUS": "BUY", "FULLPATH": "İdxal əməliyyatları üzrə ödənişlər", "DEBITCURRENCY": 0,
     "DEBITCURRENCYNAME": "AZN", "DEBITRATE": 1.0, "DEBITAMOUNT": 17060.0, "CREDITCURRENCY": 840, "CREDITCURRENCYYNAME": "USD",
     "CREDITRATE": 1.706, "CREDITAMOUNT": 10000.0},
    {"DAT": "2026-10-12", "CID": 2, "STATUS": "SELL", "FULLPATH": "Kreditlərin qaytarılması", "DEBITCURRENCY": 978,
     "DEBITCURRENCYNAME": "EUR", "DEBITRATE": 1.84, "DEBITAMOUNT": 10000.0, "CREDITCURRENCY": 0, "CREDITCURRENCYYNAME": "AZN",
     "CREDITRATE": 1.0, "CREDITAMOUNT": 18400.0}]
D = {"avalute": avalute, "account": account, "exchanges": exchanges, "excaccount": excaccount, "exchange": exchange,
     "convert_assignments": convert_assignments, "exconvert": exconvert, "operkurs": operkurs, "convertation": convertation,
     "setexchange": [{"NAT_BALANCE": "1001", "FOR_BALANCE": "1011"}], "bankinfo": [{"VAL_MOV": "122"}]}
json.dump(D, open(os.path.join(out, "exchange.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
os.makedirs(os.path.join(out, "dbf"), exist_ok=True)
open(os.path.join(out, "dbf", "EXCH122.dbf"), "wb").write(make_template(
    [("WHEN", "D", 8, 0), ("BANK_CODE", "C", 10, 0), ("VALUTE", "C", 3, 0), ("RATE1", "N", 12, 4), ("TOTAL1", "N", 15, 0),
     ("MANAT1", "N", 17, 2), ("RATE2", "N", 12, 4), ("TOTAL2", "N", 15, 0), ("MANAT2", "N", 17, 2)]))
open(os.path.join(out, "dbf", "$MB12212.dbf"), "wb").write(make_template(
    [("TIP", "N", 1, 0), ("OPERATOR", "C", 10, 0), ("BANK_CODE", "C", 10, 0), ("INS1", "C", 10, 0), ("INS2", "C", 3, 0),
     ("ALQ_SAT", "N", 1, 0), ("MABLAG", "N", 17, 2), ("TARIX", "D", 8, 0), ("KURS", "N", 12, 4)]))
open(os.path.join(out, "dbf", "README.md"), "w").write(
    "Mock-mode test templates for the Exchange DBF exports. The field names come from UntExchangeImpl.pas; the field\n"
    "types and widths are ASSUMED. In Oracle mode put the bank's real EXCH122.dbf and $MB12212.dbf (from the SmartBank\n"
    "client folder) into DBF_TEMPLATE_DIR (default api/templates).\n")
print("ok")
