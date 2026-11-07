"""Verbatim SQL of Packages/CashSymbols (TCashSymbolX), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# CashSymbols/CashSymbolImpl.dfm:166 ODSCashSymbols (TOracleDataSet)
SQL_CSY_ODSCASHSYMBOLS = 'SELECT \n CashSymbol.RowID\n  , CashSymbol.symbol\n    , CashSymbol.name\n      , CashSymbol.mediocrity\nFROM \n    Kassa_b CashSymbol\nOrder by\n    CashSymbol.Symbol\n    '
