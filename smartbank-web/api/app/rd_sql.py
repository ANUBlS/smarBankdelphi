"""Verbatim SQL of Packages/RateDifference (TRateDifferenceForm), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# RateDifference/RateDifferenceFormImpl1.dfm:54 OracleDataSet1 (TOracleDataSet)
SQL_RD_ORACLEDATASET1 = 'select\n  t.*,\n  ad.acc_no as DebitAccNo,\n  ac.Acc_No as CreditAccNo\nfrom\n  temptranz t,\n  account ad,\n  account ac\nwhere\n  (ad.ID = t.DebetID)\n  and (ac.ID = t.CreditID)'
