"""Verbatim SQL of Packages/LastRates (TOldRatesFormX), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# LastRates/OldRatesFormImpl.dfm:400 ODSCourses (TOracleDataSet)
SQL_OR_ODSCOURSES = 'Select \n    O.val_kod,\n    O.ostat,\n    O.dat,\n    A.val_name \nFrom \n   Operkurs O,\n   Avalute A\nWhere O.val_kod=A.valute and o.dat between :beg_dat and :end_dat\nOrder by :Title_Order'

# LastRates/OldRatesFormImpl.dfm:451 ODSFiltr (TOracleDataSet)
SQL_OR_ODSFILTR = 'Select\n    O.val_kod,\n    O.ostat,\n    O.dat,\n    A.val_name \nFrom \n   Operkurs O,\n   Avalute A\nWhere O.val_kod=A.valute and O.dat=:VDate\nOrder by O.ostat\n '

# LastRates/OldRatesFormImpl.dfm:477 ODSValute (TOracleDataSet)
SQL_OR_ODSVALUTE = 'Select \n     *\nFrom\n   Avalute '
