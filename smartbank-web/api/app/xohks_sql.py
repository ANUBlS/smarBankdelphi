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

# ---------------------------------------------------------------- step 2 (OUT add / edit / delete, templates)
# Data_Unit.dfm:1597-1630 DataAccountIban (Delphi rewrites SQL[11]: PrepareTrans LVPCSSImpl.pas:1213 'AND (a.id=:custid)',
# Transaction_Unit.pas EditidKeyPress :148 'AND (a.kli_id=:custid)')
LINES_DATAACCOUNTIBAN = ['  SELECT   a.id,', '           a.kli_id,',
                         "           substr(a.acc_no,0,8)||'  '||substr(a.acc_no,9,length(a.acc_no)) acc_no,",
                         "           UPPER(SUBSTR(REPLACE (REPLACE (a.name, '''', ''), '\"', ''),0,35)) name,",
                         '           a.val_acc,', '           a.filial,', '           c.inn', '    FROM   account a, customers c',
                         '   WHERE       (a.kli_id = c.id)', '           AND (a.close_dat IS NULL)', '           AND (a.val_acc=0)',
                         '           AND (a.kli_id=:custid)', 'ORDER BY   a.acc_no']
IBAN_LINE11_ID = 'AND (a.id=:custid)'          # LVPCSSImpl.pas:1213
IBAN_LINE11_KLI = 'AND (a.kli_id=:custid)'     # Transaction_Unit.pas:148
# PrepareTrans LVPCSSImpl.pas:1178 DataBankInfo.SQL.Add
LINES_BANKINFO = ['Select * from BankInfo']
# PrepareTrans :1181 AddtoCOMBO(... DataBankM, ...) / ShowDetals :1288 (no order by)
LINES_BANKM_COMBO = ['Select * from BankM order by name']
LINES_BANKM_DETALS = ['Select * from BankM']
# PrepareTrans :1183 / :1185 AddtoCOMBO(... DataValute, ...) ; ShowDetals :1290
LINES_VALUTE_COMBO = ['Select valute,val_name,valu_name from Avalute order by valute']
LINES_VALUTE_DETALS = ['Select * from Avalute']
# Transaction_Unit.pas:11 CheckField - Delphi concatenates the account text; here it is a bind (same result)
LINES_DATACHECK_ACC = ['Select * from account where acc_no = :acc']
# LVPCSSImpl.pas:1147 ViewBankInfo - Delphi: kod_fil='''+IntToStr(AFilialID)+''' ; bind here (integer)
LINES_FILIALINFO = ['Select * from filialinfo where kod_fil=:kod']
# Data_Unit.dfm:1264-1281 ODS_shablon
LINES_ODS_SHABLON = ['SELECT mebleg, odenish_kod, bankin_kodu, hesab_no, adi, kodu, voen,',
                     '       od_tey1, od_tey2, od_tey3, od_tey4, elave_mel1, elave_mel2,',
                     '       elave_mel3, shablonun_adi, bankin_adi, odenish', '  FROM xs_beneficiary_shablon', 'order by odenish']
# Get_to_shablon_unit.pas GridReadyBatchsTitleClick: '... order by '+Column.FieldName (only grid field names reach it)
LINES_ODS_SHABLON_SORT = ['SELECT mebleg, odenish_kod, bankin_kodu, hesab_no, adi, kodu, voen, ',
                          ' od_tey1, od_tey2, od_tey3, od_tey4, elave_mel1, elave_mel2, ',
                          ' elave_mel3, shablonun_adi, bankin_adi, odenish ', ' FROM xs_beneficiary_shablon order by :Field ']
SHABLON_FIELDS = ['MEBLEG', 'ODENISH_KOD', 'BANKIN_KODU', 'HESAB_NO', 'ADI', 'KODU', 'VOEN', 'OD_TEY1', 'OD_TEY2', 'OD_TEY3',
                  'OD_TEY4', 'ELAVE_MEL1', 'ELAVE_MEL2', 'ELAVE_MEL3', 'SHABLONUN_ADI', 'BANKIN_ADI', 'ODENISH']
# Data_Unit.dfm:1303 / 1315 / 1331 (MT102 T lookups)
LINES_ODS_INSTITUTION = ['SELECT a.rowid,a.*', '  FROM xs_institution a', 'order by a.description']
LINES_ODS_BUDGETLEVEL = ['SELECT b.rowid,b.*', '  FROM xs_budgetlevel b', 'order by b.description']
LINES_ODS_DESTINATION = ['SELECT c.rowid,c.*', '  FROM xs_destination c', 'order by c.description']
