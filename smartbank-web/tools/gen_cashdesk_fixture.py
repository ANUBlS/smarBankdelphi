"""Generates api/fixtures/cashdesk.json (mock data for Packages/CashDeskLast + Packages/CashSymbols)."""
import json, sys
out = sys.argv[1]
avalute = [{"VALUTE": 0, "VALU_NAME": "Manat", "VAL_NAME": "AZN", "VALU_BALA": "qəpik"},
           {"VALUTE": 840, "VALU_NAME": "ABŞ dolları", "VAL_NAME": "USD", "VALU_BALA": "sent"},
           {"VALUTE": 978, "VALU_NAME": "Avro", "VAL_NAME": "EUR", "VALU_BALA": "sent"}]
filial = [{"ID": 101, "NAME": "Mərkəz filialı"}, {"ID": 102, "NAME": "Gəncə filialı"}]
kassa_b = [{"SYMBOL": "10", "NAME": "Hüquqi şəxslərin hesablarına daxilolmalar", "MEDIOCRITY": 0},
           {"SYMBOL": "11", "NAME": "Fiziki şəxslərin əmanətlərinə daxilolmalar", "MEDIOCRITY": 0},
           {"SYMBOL": "16", "NAME": "Valyuta mübadiləsi üzrə daxilolmalar", "MEDIOCRITY": 0},
           {"SYMBOL": "40", "NAME": "Əmək haqqının ödənilməsi", "MEDIOCRITY": 1},
           {"SYMBOL": "42", "NAME": "Əmanətlərin verilməsi", "MEDIOCRITY": 1},
           {"SYMBOL": "53", "NAME": "Valyuta mübadiləsi üzrə ödənişlər", "MEDIOCRITY": 1}]
users = [{"ID": 1, "NAME": "ADMIN"}, {"ID": 2, "NAME": "TELLER"}, {"ID": 6, "NAME": "ACCOUNTANT"}]
# bal_cn: 1001/10010 national cash, 1011/10020 foreign cash (CashDeskImpl.pas:1300-1304)
bal = [{"BAL_CN": "1001", "CASHINCOMING": 1, "CUST_TYPE": None}, {"BAL_CN": "1011", "CASHINCOMING": 1, "CUST_TYPE": None},
       {"BAL_CN": "3001", "CASHINCOMING": 0, "CUST_TYPE": 0}, {"BAL_CN": "4211", "CASHINCOMING": 0, "CUST_TYPE": 1},
       {"BAL_CN": "4212", "CASHINCOMING": 0, "CUST_TYPE": 1}, {"BAL_CN": "6001", "CASHINCOMING": 0, "CUST_TYPE": 0}]
bal2 = [{"BAL_CN": "10010", "CASHINCOMING": 1, "CUST_TYPE": None}, {"BAL_CN": "10020", "CASHINCOMING": 1, "CUST_TYPE": None},
        {"BAL_CN": "30010", "CASHINCOMING": 0, "CUST_TYPE": 0}, {"BAL_CN": "42110", "CASHINCOMING": 0, "CUST_TYPE": 1},
        {"BAL_CN": "42120", "CASHINCOMING": 0, "CUST_TYPE": 1}, {"BAL_CN": "60010", "CASHINCOMING": 0, "CUST_TYPE": 0}]
def acc(i, no, name, val, b1, fil, kli, ostat):
    m = {"1001": "10010", "1011": "10020", "3001": "30010", "4211": "42110", "4212": "42120", "6001": "60010"}
    return {"ID": i, "ACC_NO": no, "NAME": name, "VAL_ACC": val, "BAL_CN1": b1, "BAL_CN2": m[b1], "BAL_CN3": b1, "BAL_CN4": b1,
            "FILIAL": fil, "KLI_ID": kli, "OSTAT": ostat}
account = [acc(1, "AZ10SMRT10010000000000000101", "Kassa AZN (Mərkəz)", 0, "1001", 101, 0, -125400.0),
           acc(2, "AZ11SMRT10110000000000840101", "Kassa USD (Mərkəz)", 840, "1011", 101, 0, -48250.0),
           acc(3, "AZ12SMRT10110000000000978101", "Kassa EUR (Mərkəz)", 978, "1011", 101, 0, -12100.0),
           acc(4, "AZ13SMRT10010000000000000102", "Kassa AZN (Gəncə)", 0, "1001", 102, 0, -36800.0),
           acc(10, "AZ20SMRT30010000000000000101", "Azər-Tikinti MMC cari hesab", 0, "3001", 101, 501, 84200.5),
           acc(11, "AZ21SMRT42110000000000000101", "Məmmədov Rəşad Əli oğlu – əmanət", 0, "4211", 101, 502, 15000.0),
           acc(12, "AZ22SMRT42120000000000840101", "Həsənova Leyla Vaqif qızı – əmanət USD", 840, "4212", 101, 503, 7300.0),
           acc(13, "AZ23SMRT30010000000000000102", "Gəncə Aqro ASC cari hesab", 0, "3001", 102, 504, 22650.0),
           acc(14, "AZ24SMRT60010000000000000101", "Əmək haqqı tranzit hesabı", 0, "6001", 101, 0, 0.0),
           acc(15, "AZ25SMRT42120000000000978101", "Quliyev Elvin Tofiq oğlu – əmanət EUR", 978, "4212", 101, 505, 2400.0)]
customers = [{"ID": 501, "INN": "1401234561", "NAME": "Azər-Tikinti MMC"}, {"ID": 502, "INN": "5ZK8Q1A", "NAME": "Məmmədov Rəşad Əli oğlu"},
             {"ID": 503, "INN": "7HT2M4B", "NAME": "Həsənova Leyla Vaqif qızı"}, {"ID": 504, "INN": "1700456782", "NAME": "Gəncə Aqro ASC"},
             {"ID": 505, "INN": "3PL9X0C", "NAME": "Quliyev Elvin Tofiq oğlu"}]
def tr(i, dat, d, k, val, valc, a, ac, la, sym, no, op, cop, name):
    return {"ID": i, "DAT": dat, "DEBT": d, "KREDIT": k, "VAL_ACC": val, "CURRENCYID_C": valc, "AMMOUNT": a, "AMMOUNT_C": ac,
            "LAMMOUNT": la, "KASSA_B": sym, "NO_PROV": no, "OP_ID": op, "COMMIT_OPID": cop, "NAME": name, "VID_OP": None}
D, P = "2026-10-12", "2026-10-09"
provarch = [tr(9001, P, 1, 10, 0, 0, 5000.0, 5000.0, 5000.0, "10", "101", 2, 1, "Nağd pulun hesaba mədaxili"),
            tr(9002, P, 14, 1, 0, 0, 3200.0, 3200.0, 3200.0, "40", "102", 2, 1, "Oktyabr ayı üçün əmək haqqı"),
            tr(9101, D, 1, 10, 0, 0, 12500.0, 12500.0, 12500.0, "10", "201", 2, 1, "Satışdan daxil olan nağd vəsait"),
            tr(9102, D, 1, 11, 0, 0, 1500.0, 1500.0, 1500.0, "11", "202", 2, 1, "Əmanətə əlavə vəsait"),
            tr(9103, D, 2, 12, 840, 840, 700.0, 700.0, 1190.0, "11", "203", 2, 6, "Əmanət hesabına USD mədaxil"),
            tr(9104, D, 12, 2, 840, 840, 250.0, 250.0, 425.0, "42", "204", 2, 6, "Əmanətdən USD məxaric"),
            tr(9105, D, 11, 1, 0, 0, 800.25, 800.25, 800.25, "42", "205", 6, 1, "Əmanətin qismən verilməsi"),
            tr(9106, D, 4, 13, 0, 0, 4300.0, 4300.0, 4300.0, "10", "206", 2, 1, "Gəncə Aqro – nağd mədaxil"),
            tr(9107, D, 15, 3, 978, 978, 400.0, 400.0, 744.0, "42", None, 6, 6, "Əmanətdən EUR məxaric"),
            tr(9108, D, 14, 1, 0, 0, 2750.0, 2750.0, 2750.0, None, "208", 2, 1, "Əmək haqqı – nağd ödəniş")]
lazy = [dict(tr(9201, D, 1, 10, 0, 0, 980.0, 980.0, 980.0, "10", "301", 2, None, "Planlaşdırılmış nağd mədaxil"), D1=None),
        dict(tr(9202, D, 12, 2, 840, 840, 120.0, 120.0, 204.0, "42", "302", 2, None, "Planlaşdırılmış USD məxaric"), D1="1")]
cashinfo = [{"ID": 9104, "PERSON_DOC": "Şəxsiyyət vəsiqəsi", "ISSUEDBY": "Həsənova Leyla Vaqif qızı", "SERIA": "AZE",
             "DOCNUMBER": "12345678", "FROMWHEN": "ASAN Xidmət №1, 15.03.2020"},
            {"ID": 9002, "PERSON_DOC": "Şəxsiyyət vəsiqəsi", "ISSUEDBY": "Məmmədov Rəşad Əli oğlu", "SERIA": "AA",
             "DOCNUMBER": "0456789", "FROMWHEN": "Nəsimi RPŞ, 02.06.2015"}]
settings = [{"CASHBALANCENATIONAL": 1001, "CASHBALANCEENGLISH": 1011, "DESCRIPTION_AZ": "SmartBank ASC – Baş ofis",
             "DESCRIPTION_ENG": "SmartBank OJSC – Head office", "SIGNATYRE": "Kassir", "RESPONSIBLE_PERSON": "Əliyeva Nərmin",
             "HANDOVER": "1", "CHIEF": "1", "OPERATOR": "1", "CASHIER": "1", "AMOUNT": "1", "CHIEF_OUT": "1", "OPERATOR_OUT": "1",
             "CASHIER_OUT": "1", "ACCOUNTANT": "0", "CONTROLLER": "0", "CONTROLLER_OUT": "0", "PHOTO": None,
             "OPERATORTITLE": "Əməliyyatçı", "ACCOUNTANTTITLE": "Baş mühasib"}]
json.dump({"avalute": avalute, "filial": filial, "kassa_b": kassa_b, "user$": users, "bal_spr1": bal, "bal_spr2": bal2,
           "bal_spr3": bal, "bal_spr4": bal, "account": account, "customers": customers, "provarch": provarch,
           "lazytransaction": lazy, "cashinfo": cashinfo, "cash_settings": settings,
           "bankinfo": [{"BANK": "SmartBank ASC", "INN": "1300000001", "KOD_B": 501004, "LOGO": None}]},
          open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print("ok", out)
