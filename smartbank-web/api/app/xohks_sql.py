"""Verbatim SQL of Packages/LVPCSSManager_Turan (Data_Unit.dfm SQL.Strings). Each dataset is kept as its TStrings line list
(LINES_<name>) because Delphi edits lines by index (XS_INCOMINGSUM SQL[6]); text() joins them with CRLF like TStrings.Text.
otSubst variables (Variables.Data type 1) are noted per dataset with their design-time default. Generated from the .dfm, do not hand-edit."""

# Data_Unit.dfm:647-714 XS_CONFIG
LINES_XS_CONFIG = ['select', '    *', 'from', '    XS_CONFIG', ' ']
# Data_Unit.dfm:880-900 DataSetFilial
LINES_DATASETFILIAL = ['select * from Filial where id =:filialID']
# Data_Unit.dfm:323-486 XS_BATCHS
LINES_XS_BATCHS = ['select', '  x.*, x.rowid, ', '  a.acc_no,', ' a.name,', '  v.val_name, ', '  f.name filial_name', 'from', '  XS_BATCHS x ,', '  account a, ', '  avalute v,', '  filial_t f', 'where', '  x.acc_id = a.id and', '  v.valute=a.val_acc and', '  x.filial=f.id and', '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)', '', '', '', '', '', '', '', '', '', ' order by :Title', '', '', '', ' ', '', ' ', ' ', ' ']
# Data_Unit.dfm:1631-1661 XS_BatchsSum
LINES_XS_BATCHSSUM = ['select', '  sum(x.amount) sumamount', 'from', '  XS_BATCHS x ,', '  account a, ', '  avalute v,', '  filial_t f', 'where', '  x.acc_id = a.id and', '  v.valute=a.val_acc and', '  x.filial=f.id and', '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)', ' ']
# Data_Unit.dfm:506-629 XS_BENEFICIARY
LINES_XS_BENEFICIARY = ['select', '    x.*, x.rowid, ', '    v.val_name,', '    b.name as BankName', 'from', '    XS_BENEFICIARY X,', '    avalute v,', '    BankM b', 'where', '   (x.batchID=:id)and', '   (x.val_cod=v.valute)', '  and (x.rec_bank_id=b.id)']
# Data_Unit.dfm:790-868 XS_IncomingView
LINES_XS_INCOMINGVIEW = ['select * from xs_incomingview x', '', 'order by :title', '', '', '', '', '', '', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
# Data_Unit.dfm:1712-1731 XS_IncomingViewSum
LINES_XS_INCOMINGVIEWSUM = ['select sum(amount)sumamount from xs_incomingview x', '', 'order by :title']
# Data_Unit.dfm:1763-1777 summodifikator
LINES_SUMMODIFIKATOR = ['select nvl(sum(amount),0) as cem from xs_batchs_today where amount<>0 ', 'and status=1']
# Data_Unit.dfm:1778-1792 sumverifikator
LINES_SUMVERIFIKATOR = ['select nvl(sum(amount),0) as cem from xs_batchs_today where amount<>0 and', ' status=4']
# Data_Unit.dfm:1793-1807 sumavtorizator
LINES_SUMAVTORIZATOR = ['select nvl(sum(amount),0) as cem  from xs_batchs_today where amount<>0', ' and status=6']
# Data_Unit.dfm:1487-1503 ODS_CODE
LINES_ODS_CODE = ['select CODE from xs_transtype_code where NAMEID in(1,5)', 'group by CODE ', 'order by code']
# Data_Unit.dfm:984-1131 XS_BatchsArchive
LINES_XS_BATCHSARCHIVE = ['select', '  x.*, x.rowid,', '  a.acc_no,', '  a.name,', '  v.val_name,', '  f.name filial_name', 'from', '  XS_BATCHS_Archive x ,', '  account a, ', '  avalute v,', '  filial_t f', 'where', '  x.acc_id = a.id and', '  v.valute=a.val_acc and', '  f.id=x.filial and', '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)', ' order by :Title', '']
# Data_Unit.dfm:1672-1701 XS_BatchsArchiveSum
LINES_XS_BATCHSARCHIVESUM = ['select', '  sum(amount)sumamount', 'from', '  XS_BATCHS_Archive x ,', '  account a, ', '  avalute v,', '  filial_t f', 'where', '  x.acc_id = a.id and', '  v.valute=a.val_acc and', '  f.id=x.filial and', '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)']
# Data_Unit.dfm:1142-1263 XS_BeneficiaryArchive
LINES_XS_BENEFICIARYARCHIVE = ['select', '    x.rowid,', '    x.*,', '    v.val_name,', '    b.name as BankName', 'from', '    XS_BENEFICIARY_Archive X,', '    avalute v,', '    BankM b', 'where', '   (x.batchID=:id)and', '   (x.val_cod=v.valute)', '  and (x.rec_bank_id=b.id)']
# Data_Unit.dfm:734-789 XS_INCOMING
LINES_XS_INCOMING = ['select', '   *', 'from', '   XS_INCOMINGVIEWALL x', 'where  (x.trans_date>=:BeginDate and x.trans_date<=:EndDate)', '', '']
# Data_Unit.dfm:1732-1756 XS_INCOMINGSUM
LINES_XS_INCOMINGSUM = ['select', '   sum(amount) sumamount', 'from', '   XS_INCOMINGVIEWALL x', 'where  (x.trans_date>=:BeginDate and x.trans_date<=:EndDate)', '', '']
# Data_Unit.dfm:1549-1567 Data_Admin_in
LINES_DATA_ADMIN_IN = ["select -1 as filial_id, 'Bütün filiallar' as filial_name from Dual", 'Union All', 'select filial_id,filial_name from xs_admin_in ', 'where USER_ID=uid']
# Data_Unit.dfm:1573-1586 Data_Code
LINES_DATA_CODE = ['select -1 as code from Dual', 'Union All', 'select CODE from xs_transtype_code where NAMEID in(1,5)', 'group by CODE  ', 'order by code']


def text(lines, **repl):
    """TStrings.Text after SQL[i] := value assignments (repl keys are i<index>)."""
    L = list(lines)
    for k, v in repl.items():
        L[int(k[1:])] = v
    return "\r\n".join(L) + "\r\n"


PKG_SBOP = "SBOP"            # Data_Unit.dfm:874-879 GetSysDate TOraclePackage PackageName (GET_DATE); :1757 SBOP

# otSubst defaults (Variables.Data): XS_BATCHS :TITLE = x.ID; XS_IncomingView / XS_IncomingViewSum / XS_BatchsArchive :TITLE = x.id
TITLE_BATCHS_DEFAULT = "x.ID"
TITLE_DEFAULT = "x.id"
