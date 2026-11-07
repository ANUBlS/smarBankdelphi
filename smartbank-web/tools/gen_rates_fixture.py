"""Generates api/fixtures/rates.json - demo data for the LastRates (OldRatesProj) and RateDifferenceReport mocks."""
import json, os
OUT = os.path.join(os.path.dirname(__file__), "..", "api", "fixtures", "rates.json")
cur = [(0, "AZN", "Manat"), (840, "USD", "ABŞ dolları"), (978, "EUR", "Avro"), (826, "GBP", "İngilis funt sterlinqi"),
       (643, "RUB", "Rusiya rublu"), (949, "TRY", "Türkiyə lirəsi")]
base = {840: 1.7, 978: 1.8456, 826: 2.2071, 643: 0.0211, 949: 0.0497}
days = ["2026-10-06", "2026-10-07", "2026-10-08", "2026-10-09", "2026-10-12"]
operkurs = []
for i, d in enumerate(days):
    for k, v in base.items():
        operkurs.append({"DAT": d, "VAL_KOD": k, "OSTAT": round(v * (1 + (i - 2) * 0.0013 * (1 if k % 2 else -1)), 4)})
account = [
    {"ID": 501, "ACC_NO": "AZ21SMRT60110000000000000101", "VAL_ACC": 0, "FILIAL": 101, "NAME": "Məzənnə fərqindən gəlir"},
    {"ID": 502, "ACC_NO": "AZ22SMRT70110000000000000101", "VAL_ACC": 0, "FILIAL": 101, "NAME": "Məzənnə fərqindən zərər"},
    {"ID": 503, "ACC_NO": "AZ23SMRT10110000000000840101", "VAL_ACC": 840, "FILIAL": 101, "NAME": "Kassa USD"},
    {"ID": 504, "ACC_NO": "AZ24SMRT10110000000000978101", "VAL_ACC": 978, "FILIAL": 101, "NAME": "Kassa EUR"},
    {"ID": 505, "ACC_NO": "AZ25SMRT10110000000000840102", "VAL_ACC": 840, "FILIAL": 102, "NAME": "Kassa USD (Gəncə)"},
    {"ID": 506, "ACC_NO": "AZ26SMRT60110000000000000102", "VAL_ACC": 0, "FILIAL": 102, "NAME": "Məzənnə fərqindən gəlir (Gəncə)"},
    {"ID": 507, "ACC_NO": "AZ27SMRT10010000000000000101", "VAL_ACC": 0, "FILIAL": 101, "NAME": "Kassa AZN"},
]
# (ID, DAT, DEBT, KREDIT, VAL_ACC, CURRENCYID_C, AMMOUNT, AMMOUNT_C, LAMMOUNT, OP_ID, NAME)
P = [
    (7001, "2026-10-08", 503, 501, 840, 0, 0, 12.35, 12.35, 1, "USD kassa üzrə məzənnə fərqi"),
    (7002, "2026-10-08", 502, 504, 0, 978, 8.1, 0, 8.1, 1, "EUR kassa üzrə məzənnə fərqi"),
    (7003, "2026-10-09", 503, 501, 840, 0, 0, 1530.4, 1530.4, 2, "USD yenidən qiymətləndirmə"),
    (7004, "2026-10-09", 505, 506, 840, 0, 0, 76.92, 76.92, 2, "USD yenidən qiymətləndirmə (Gəncə)"),
    (7005, "2026-10-12", 502, 503, 0, 840, 41.2, 0, 41.2, 1, "USD kassa üzrə məzənnə fərqi"),
    (7006, "2026-10-12", 504, 501, 978, 0, 0, 3.07, 3.07, 9, "EUR yenidən qiymətləndirmə"),
    (7007, "2026-10-12", 507, 503, 0, 840, 1700, 1000, 1700, 1, "Valyuta satışı (məzənnə fərqi deyil)"),
]
cols = ["ID", "DAT", "DEBT", "KREDIT", "VAL_ACC", "CURRENCYID_C", "AMMOUNT", "AMMOUNT_C", "LAMMOUNT", "OP_ID", "NAME"]
provarch = [dict(zip(cols, p), VID_OP=None, NO_FILIAL=None) for p in P]
json.dump({"avalute": [{"VALUTE": v, "VAL_NAME": n, "VALU_NAME": f} for v, n, f in cur], "operkurs": operkurs,
           "account": account, "provarch": provarch}, open(OUT, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print(OUT, len(operkurs), len(provarch))
