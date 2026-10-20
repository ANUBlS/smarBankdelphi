"""Sample incoming card files for the file-operation forms (cards_fileops), laid out at the columns the Delphi parsers copy()."""


def put(buf, pos, val):
    while len(buf) < pos - 1 + len(val):
        buf.append(" ")
    for i, ch in enumerate(val):
        buf[pos - 1 + i] = ch


def line(*cols, width=0):
    b = [" "] * width
    for pos, val in cols:
        put(b, pos, val)
    return "".join(b)


def dxxx_rec(merchant, terminal, mname, amount, fee, date, auth, trtype):
    return line((1, merchant), (28, terminal), (50, mname), (73, amount.rjust(14)), (87, fee.rjust(14)), (102, date), (111, auth), (118, trtype))


def dxxx():
    """UnitDxxx.pas ToolButton2Click :82 / isertbtnClick :217 layout."""
    total = line((44, "Total"), width=60)
    L = ["*** Acquiring ***",
         line((1, "Financial institution"), (25, "TURANBANK"), (55, "507699")),
         line((1, "Currency"), (26, "AZN")), "", "Merchant Name   Terminal", "-" * 60, "",
         dxxx_rec("000777", "T0100", "BAKU MALL", "12.50", "0.10", "19.10.26", "AB12CD", "Purchase"),
         "",
         dxxx_rec("000778", "T0101", "GANJA SHOP", "7.00", "0.07", "19.10.26", "EF34", "Refund"),
         total,
         "*** Issuing ***",
         line((1, "Financial institution"), (25, "TURANBANK"), (55, "507699")),
         line((1, "Currency"), (26, "USD")), "", "RBS Number", "-" * 60,
         dxxx_rec("000900", "ATM7", "ATM NIZAMI", "100.00", "1.00", "18.10.26", "QQ", "Cash"),
         total]
    return ("\r\n".join(L) + "\r\n").encode("cp1254")


def sms():
    """sms.pas ToolButton2Click :469: lines longer than 100 (trimmed) that are not '---' / 'Terminal' headers."""
    rec = lambda tn, card, term, auth, amt, d, cur, post, sett: line((1, tn), (25, card), (47, term), (57, auth), (63, amt.rjust(15)), (78, d),  # noqa: E731
                                                                   (91, cur), (96, post), (105, sett.rjust(15)))
    L = ["Terminal name           Card number", "-" * 120,
         rec("BAKU MALL ATM", "4270010000000009", "T0100", "AB12CD", "25.00", "18-OCT-26", "944", "19-OCT-26", "25.00"),
         rec("GANJA POS", "4270010000000010", "P0200", "EF34", "7.50", "18-OCT-26", "840", "", "12.75"),     # no post date: skipped
         rec("SUMGAIT POS", "4270010000000011", "P0300", "GH56", "3.10", "17-OCT-26", "978", "19-OCT-26", "5.80")]
    return ("\r\n".join(L) + "\r\n").encode("cp1254")


def intretail():
    """Unitintfile.pas ToolButton2Click :522 layout."""
    rec = lambda m, card, d, auth, a1, a2, fee, cl, term: line((1, m), (24, card), (41, d), (50, auth), (57, a1.rjust(14)), (71, a2.rjust(14)),  # noqa: E731
                                                             (85, fee.rjust(11)), (96, cl.rjust(14)), (116, term))
    L = [line((1, "Channel"), (25, "POS"), (63, "840")), line((1, "Transaction type"), (25, "Purchase"), (63, "944")),
         line((1, "Outward status"), (25, "Accepted")), "", "Merchant               Card", "-" * 130,
         rec("AMAZON", "4270010000000009", "18.10.26", "AA11", "10.00", "17.00", "0.20", "17.00", "TRM00001"),
         rec("EBAY", "4270010000000010", "18.10.26", "BB22", "4.00", "6.80", "0.10", "6.80", "TRM00002"),
         "-" * 130]
    return ("\r\n".join(L) + "\r\n").encode("cp1254")


def dfile():
    """UnitDfile.pas isertbtnClick :365: line 1 = header (currency at 54), then 700-column records, the last line is not read."""
    rec = lambda bank, loro, amt, d, cont, date, time: line((1, "RD"), (115, bank), (187, loro), (267, amt.rjust(15)), (282, d), (500, cont),  # noqa: E731
                                                            (532, date), (540, time), (700, "X"))
    L = [line((1, "FH"), (54, "944"), width=60), rec("KAPITAL BANK", "AZ12LORO0001", "150000", "D", "CNT-1", "20261019", "101500"),
         rec("PASHA BANK", "AZ34LORO0002", "2500", "C", "CNT-2", "20261019", "111500"), "FT"]
    return ("\r\n".join(L) + "\r\n").encode("cp1254")
