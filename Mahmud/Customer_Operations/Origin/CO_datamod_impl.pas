unit CO_datamod_impl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData,DBTables;
 type
  TOperationMode = (omInsert, omEdit, omCommission);


type
    TTransaction = record
      TransactionID     : Integer;
      TransactionDate   : TDateTime;
      TransactionNo     : String;
      DebitID           : Longint;
      CreditID          : Longint;
      DebitAmount       : Currency;
      CreditAmount      : Currency;
      LAmount           : Currency;
      DebitRate         : Currency;
      CreditRate        : Currency;
      CashSymbol        : Word;
      ConvertationSymbol: Word;
      OperationCode     : Variant;
      Flags             : Word;
      TransactionName   : String;
    end;

const
     cs_generateid = 'GenerateID';
     cs_add_transaction = 'transaction_add';
     cs_del_transaction = 'transaction_delete';
     cs_commit_transaction = 'transaction_commit';
     cs_reject_transaction = 'transaction_reject';
     cs_commission_execute = 'SetTransactions';
     cs_commit_delayed_transactions = 'transactions_delayed_commit';
type
  TCO_DataMod = class(TDataModule)
    Accdata: TDataSource;
    comisdata: TDataSource;
    Commission: TOracleDataSet;
    Custdata: TDataSource;
    Account: TOracleDataSet;
    Provarch: TOracleDataSet;
    Provdata: TDataSource;
    archost: TOracleDataSet;
    avalute: TOracleDataSet;
    CommissionID: TFloatField;
    CommissionNAME: TStringField;
    CommissionDEBT: TFloatField;
    CommissionDEBITACCOUNT: TStringField;
    CommissionDEBITCURRENCY: TStringField;
    CommissionDEBITCURRENCYID: TFloatField;
    CommissionDEBITVALUTE: TStringField;
    CommissionDEBITVALUTENAME: TStringField;
    CommissionCREDIT: TFloatField;
    CommissionCREDITACCOUNT: TStringField;
    CommissionCREDITCURRENCY: TStringField;
    CommissionCREDITVALUTENAME: TStringField;
    CommissionCREDITCURRENCYID: TFloatField;
    CommissionCREDITNAME: TStringField;
    CommissionADDITIONALDEBT: TFloatField;
    CommissionADEBITACCOUNT: TStringField;
    CommissionADEBITCURRENCY: TStringField;
    CommissionADDDEBITCURRENCYID: TFloatField;
    CommissionADDITIONALCREDIT: TFloatField;
    CommissionACREDITACCOUNT: TStringField;
    CommissionACREDITCURRENCY: TStringField;
    CommissionADDCREDITCURRENCYID: TFloatField;
    CommissionASSIGNMENT: TStringField;
    CommissionCOMMISIONASSIGNMENT: TStringField;
    CommissionUSERID: TFloatField;
    ODSLogo: TOracleDataSet;
    ODSMainState: TOracleDataSet;
    SB_STATEMENT: TOraclePackage;
    RatesDataSet: TOracleDataSet;
    RatesDataSetVAL_KOD: TIntegerField;
    RatesDataSetDAT: TDateTimeField;
    RatesDataSetOSTAT: TFloatField;
    RatesDataSetBegin: TOracleDataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    ODSNotAccId: TOracleDataSet;
    ODSFilial: TOracleDataSet;
    DSFilial: TDataSource;
    ODSUsers: TOracleDataSet;
    DSUsers: TDataSource;
    DSMainState: TDataSource;
    DSExtractTrans: TDataSource;
    ODSCurrency: TOracleDataSet;
    DSCurrency: TDataSource;
    ODSCardState: TOracleDataSet;
    Sysdat: TOracleDataSet;
    Sysdata: TDataSource;
    ODSExtractTrans: TOracleDataSet;
    DebetTransactionsData: TOracleDataSet;
    DebetTransactionsDataID: TFloatField;
    DebetTransactionsDataDEBITACCID: TFloatField;
    DebetTransactionsDataOPERATIONDATE: TDateTimeField;
    DebetTransactionsDataDEBITAMOUNT: TFloatField;
    DebetTransactionsDataCREDITAMOUNT: TFloatField;
    DebetTransactionsDataLAMOUNT: TFloatField;
    DebetTransactionsDataCREDITACCNO: TStringField;
    DebetTransactionsDataDESTINATION: TStringField;
    DebetTransactionsDataRowNumber: TIntegerField;
    DebetTransactionsDataDebitAccNo: TStringField;
    CreditTransactionsData: TOracleDataSet;
    CreditTransactionsDataID: TFloatField;
    IntegerField2: TIntegerField;
    CreditTransactionsDataCREDITACCID: TFloatField;
    CreditTransactionsDataOPERATIONDATE: TDateTimeField;
    CreditTransactionsDataDEBITAMOUNT: TFloatField;
    CreditTransactionsDataCREDITAMOUNT: TFloatField;
    CreditTransactionsDataLAMOUNT: TFloatField;
    CreditTransactionsDataDEBITACCNO: TStringField;
    CreditTransactionsDataDESTINATION: TStringField;
    CreditTransactionsDataCreditAccNo: TStringField;
    DebetTransactions: TDataSource;
    CreditTransactions: TDataSource;
    temprate: TOracleDataSet;
    Transaction: TOracleDataSet;
    Transdata: TDataSource;
    OPackage: TOraclePackage;
    DebetTransactionsDataD_VALUTE: TStringField;
    CreditTransactionsDataC_VALUTE: TStringField;
    Bankinfo: TOracleDataSet;
    Bankinfodata: TDataSource;
    ProvarchDAT: TDateTimeField;
    ProvarchDEBIT: TStringField;
    ProvarchCREDIT: TStringField;
    ProvarchAMMOUNT: TFloatField;
    ProvarchLAMMOUNT: TFloatField;
    ProvarchAMMOUNT_C: TFloatField;
    ProvarchNAME: TStringField;
    memorial_date: TOracleDataSet;
    memorial_date_data: TDataSource;
    ACC: TOracleDataSet;
    ACC_Data: TDataSource;
    avalutedata: TDataSource;
    ACC_: TOracleDataSet;
    ACC_data_: TDataSource;
    Trdestination: TOracleDataSet;
    Trdestinationdata: TDataSource;
    ConvertationSymbols: TOracleDataSet;
    ConvertationSymbolsData: TDataSource;
    CashSymbols: TOracleDataSet;
    CashSymbolsData: TDataSource;
    CO_Out: TOracleDataSet;
    CO_Out_data: TDataSource;
    CO_In: TOracleDataSet;
    CO_InID: TFloatField;
    CO_InNAME: TStringField;
    CO_InDEBT: TFloatField;
    CO_InDEBITACCOUNT: TStringField;
    CO_InDEBITCURRENCY: TStringField;
    CO_InCREDIT: TFloatField;
    CO_InCREDITACCOUNT: TStringField;
    CO_InCREDITCURRENCY: TStringField;
    CO_InADDITIONALDEBT: TFloatField;
    CO_InADDITIONALCREDIT: TFloatField;
    CO_InADEBT: TStringField;
    CO_InACREDIT: TStringField;
    CO_InASSIGNMENT: TStringField;
    CO_InCOMMISIONASSIGNMENT: TStringField;
    CO_InADEBITCURRENCY: TStringField;
    CO_InACREDITCURRENCY: TStringField;
    CO_InUSERID: TFloatField;
    CO_In_data: TDataSource;
    OSCT: TOraclePackage;
    TransactionsData: TDataSource;
    commission_trans_km: TOracleDataSet;
    commission_trans_data: TDataSource;
    Transactions: TOracleDataSet;
    prov: TOracleDataSet;
    prov_data: TDataSource;
    OperationTypesData: TDataSource;
    OperationTypes: TOracleDataSet;
    DebetTransactionsDataCREDITNAME: TStringField;
    CreditTransactionsDataDEBTNAME: TStringField;
    ODSValuteName: TOracleDataSet;
    ODSValuteNameVALUTE: TIntegerField;
    ODSValuteNameVALU_NAME: TStringField;
    ODSValuteNameVALU_BALA: TStringField;
    OPCash: TOraclePackage;
    ODSTransactionsViewer: TOracleDataSet;
    DataSrcViewer: TDataSource;
    ODSTransactionsViewerDAT: TDateTimeField;
    ODSTransactionsViewerID: TFloatField;
    ODSTransactionsViewerDEBIT: TStringField;
    ODSTransactionsViewerDEBTID: TFloatField;
    ODSTransactionsViewerDEBETFILIAL: TIntegerField;
    ODSTransactionsViewerDNAME: TStringField;
    ODSTransactionsViewerKREDITID: TFloatField;
    ODSTransactionsViewerDCURRENCY: TFloatField;
    ODSTransactionsViewerDEBTCURNAME: TStringField;
    ODSTransactionsViewerKREDIT: TStringField;
    ODSTransactionsViewerKLI_ID: TFloatField;
    ODSTransactionsViewerCREDITFILIAL: TIntegerField;
    ODSTransactionsViewerKNAME: TStringField;
    ODSTransactionsViewerDEBTCOME: TFloatField;
    ODSTransactionsViewerCREDITCOME: TFloatField;
    ODSTransactionsViewerKCURRENCY: TIntegerField;
    ODSTransactionsViewerCREDITCURNAME: TStringField;
    ODSTransactionsViewerDAMMOUNT: TFloatField;
    ODSTransactionsViewerKAMMOUNT: TFloatField;
    ODSTransactionsViewerLAMMOUNT: TFloatField;
    ODSTransactionsViewerBSYMBOL: TIntegerField;
    ODSTransactionsViewerNO_PROV: TStringField;
    ODSTransactionsViewerOPERATORID: TFloatField;
    ODSTransactionsViewerASSIGNMENT: TStringField;
    BrowseCashInfo: TOracleDataSet;
    SysdatTEK_DAT: TDateTimeField;
    SBTransaction: TOraclePackage;
    ACCID: TFloatField;
    ACCKLI_ID: TFloatField;
    ACCOP_ID: TFloatField;
    ACCACC_NO: TStringField;
    ACCVAL_ACC: TIntegerField;
    ACCNAME: TStringField;
    ACCOPEN_DAT: TDateTimeField;
    ACCCLOSE_DAT: TDateTimeField;
    ACCBAL_CN1: TFloatField;
    ACCBAL_CN2: TFloatField;
    ACCBAL_CN3: TFloatField;
    ACCBAL_CN4: TFloatField;
    ACCFILIAL: TIntegerField;
    ACCSIM_OTCET: TFloatField;
    ACCTIPACC: TStringField;
    ACCLIMIT: TFloatField;
    ACCOLD_ACC_NO: TStringField;
    ACCPAIR_ACC: TFloatField;
    ACCINSIDER: TStringField;
    ACCSID: TFloatField;
    ACC_ID: TFloatField;
    ACC_KLI_ID: TFloatField;
    ACC_OP_ID: TFloatField;
    ACC_ACC_NO: TStringField;
    ACC_VAL_ACC: TIntegerField;
    ACC_NAME: TStringField;
    ACC_OPEN_DAT: TDateTimeField;
    ACC_CLOSE_DAT: TDateTimeField;
    ACC_BAL_CN1: TFloatField;
    ACC_BAL_CN2: TFloatField;
    ACC_BAL_CN3: TFloatField;
    ACC_BAL_CN4: TFloatField;
    ACC_FILIAL: TIntegerField;
    ACC_SIM_OTCET: TFloatField;
    ACC_TIPACC: TStringField;
    ACC_LIMIT: TFloatField;
    ACC_OLD_ACC_NO: TStringField;
    ACC_PAIR_ACC: TFloatField;
    ACC_INSIDER: TStringField;
    ACC_SID: TFloatField;
    Buyer: TOracleDataSet;
    AccFlags: TOracleDataSet;
    AccFlagsSYMBOL: TStringField;
    AccFlagsNAME: TStringField;
    AccFlagsData: TDataSource;
    SBUTIL: TOraclePackage;
    FlagAccount: TOracleDataSet;
    FlagAccountdata: TDataSource;
    FlagAccountID: TFloatField;
    FlagAccountKLI_ID: TFloatField;
    FlagAccountOP_ID: TFloatField;
    FlagAccountACC_NO: TStringField;
    FlagAccountVAL_ACC: TIntegerField;
    FlagAccountNAME: TStringField;
    FlagAccountOPEN_DAT: TDateTimeField;
    FlagAccountCLOSE_DAT: TDateTimeField;
    FlagAccountSTATUS: TFloatField;
    FlagAccountBAL_CN1: TFloatField;
    FlagAccountBAL_CN2: TFloatField;
    FlagAccountBAL_CN3: TFloatField;
    FlagAccountBAL_CN4: TFloatField;
    FlagAccountFILIAL: TIntegerField;
    FlagAccountSIM_OTCET: TFloatField;
    FlagAccountTIPACC: TStringField;
    FlagAccountLIMIT: TFloatField;
    FlagAccountOLD_ACC_NO: TStringField;
    FlagAccountPAIR_ACC: TFloatField;
    FlagAccountINSIDER: TStringField;
    AccSettings: TOracleDataSet;
    AccSettingsACCNUMBER: TStringField;
    AccSettingsVAL_CODE: TStringField;
    AccSettingsVAL_NAME: TStringField;
    AccSettingsBAL_CN1: TStringField;
    AccSettingsBAL_NAME: TStringField;
    AccSettingsCUST_ID: TStringField;
    AccSettingsCUST_NAME: TStringField;
    AccSettingsOPEN_DATE: TStringField;
    AccSettingsTW_ACC_NUMBER: TStringField;
    AccSettingsACC_SYMBOL: TStringField;
    AccSettingsLIMIT: TStringField;
    AccSettingsBRANCH_ID: TStringField;
    AccSettingsBRANCH_NAME: TStringField;
    AccSettingsACC_NAME: TStringField;
    AccSettingsSYMBOL: TStringField;
    AccSettingsOSTAT: TStringField;
    AccSettingsPOK_OSTAT: TStringField;
    AccSettingsdata: TDataSource;
    ODSFilialID: TFloatField;
    ODSFilialNAME: TStringField;
    TransactionsID: TFloatField;
    TransactionsTRANSACTIONDATE: TDateTimeField;
    TransactionsDEBITID: TFloatField;
    TransactionsDEBITACCNO: TStringField;
    TransactionsDEBITNAME: TStringField;
    TransactionsNO_PROV: TStringField;
    TransactionsDEBITCURRENCYID: TFloatField;
    TransactionsDEBITCURRENCYSNAME: TStringField;
    TransactionsCREDITID: TFloatField;
    TransactionsCREDITACCNO: TStringField;
    TransactionsCREDITNAME: TStringField;
    TransactionsCREDITCURRENCYID: TIntegerField;
    TransactionsCREDITCURRENCYSNAME: TStringField;
    TransactionsDEBITAMOUNT: TFloatField;
    TransactionsCREDITAMOUNT: TFloatField;
    TransactionsLAMOUNT: TFloatField;
    TransactionsDEBITRATE: TFloatField;
    TransactionsCREDITRATE: TFloatField;
    TransactionsDEBITBANK: TFloatField;
    TransactionsCREDITBANK: TFloatField;
    TransactionsPACKAGENUMBER: TIntegerField;
    TransactionsCYPHERCODE: TIntegerField;
    TransactionsOPERATIONCODE: TIntegerField;
    TransactionsINBALANCECHAR: TIntegerField;
    TransactionsOUTBALANCECHAR: TIntegerField;
    TransactionsFILIALID: TIntegerField;
    TransactionsDEBITBALANCE: TFloatField;
    TransactionsNAME: TStringField;
    TransactionsSTATUS: TFloatField;
    TransactionsREJECT_REASON: TStringField;
    Customers: TOracleDataSet;
    RelationData: TOracleDataSet;
    RelationDataID: TFloatField;
    RelationDataNAME: TStringField;
    Relation: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DebetTransactionsDataCalcFields(DataSet: TDataSet);
    procedure CreditTransactionsDataCalcFields(DataSet: TDataSet);
    procedure CustomersApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure Customers_ApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
    { Public declarations }
    OperationMode: TOperationMode;
procedure SetCommission(CommissionID, DebitID, CreditID: Longint; DebitAmmount, CreditAmmount: Currency; TransDate: TDateTime);
  end;

var
  CO_DataMod: TCO_DataMod;


implementation

uses SBCore, SBCustomer,CO_Memorial,sboapiDataModuleImpl, InFormUnit,
  CO_In_Unit;
{$R *.DFM}

procedure TCO_DataMod.DataModuleCreate(Sender: TObject);
begin
   RatesDataSet.Open;
   RatesDataSetBegin.Open;
end;

procedure TCO_DataMod.DataModuleDestroy(Sender: TObject);
begin
 RatesDataSet.Close;
  RatesDataSetBegin.Close;
  Co_Datamod:= nil;
end;

procedure TCO_DataMod.SetCommission(CommissionID, DebitID, CreditID: Longint; DebitAmmount, CreditAmmount: Currency; TransDate: TDateTime);

  function IsCommission: Boolean;
  begin
   with CO_IN_form do
    Result :=OperationMode = omCommission;
  end;

begin
 if IsCommission then
  with OSCT do
   CallProcedure(
             cs_commission_execute,[
             'CommisionID', CommissionID,
             'DebitID', DebitID,
             'CreditID', CreditID,
             'DebitAmmount', DebitAmmount,
             'CreditAmmount', CreditAmmount,
             'TransDate', TransDate]);
end;


procedure TCO_DataMod.DebetTransactionsDataCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('DebitAccNo').AsString :=CO_Datamod.Account.FieldByName('accno').AsString;

end;

procedure TCO_DataMod.CreditTransactionsDataCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('CreditAccNo').AsString :=CO_Datamod.Account.FieldByName('accno').AsString;

end;


procedure TCO_DataMod.CustomersApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
  CustomerInfo: TCustomer;
begin
  with Sender, CustomerInfo do
  begin
    Name := FieldByName('NAME').AsString;
    ShortName := FieldByName('Short_Name').AsString;
    OpenDate := FieldByName('OPEN_DAT').AsDateTime;
    CloseDate := FieldByName('CLOSE_DAT').AsDateTime;
    RelationID := FieldByName('PRINAD_KOD').AsInteger;
    GroupID := FieldByName('GROUP_KLIE').AsInteger;
    EstateType := FieldByName('VID_SOB').AsInteger;
    OrganizationType := FieldByName('ORG_SOB').AsInteger;
    ActionArea := FieldByName('SFERA_DEY').AsInteger;
    BranchID := FieldByName('OTRASL').AsInteger;
    TaxAreaID := FieldByName('NALOG_KOD').AsInteger;
    IsResident := FieldByName('NEREZIDENT').AsInteger = 0;
    TaxIDString := FieldByName('INN').AsString;
    BankIDString := FieldByName('BIK').AsString;
    OKPRO := FieldByName('KOD_OKPRO').AsString;
    //GovOfficer := FieldByName('OTV_LICO').AsString;
    TaxDepartmentRegDate := FieldByName('DAT_NAL').AsDateTime;
    CapitalRegDate := FieldByName('DAT_USTAV').AsDateTime;
  end;

  Applied := True;

  case Action of
  'I':
    Sb_AddCustomer(CustomerInfo);
  'U':
    Sb_EditCustomer(
      Sender.FieldByName('ID').AsInteger,
      CustomerInfo);
  else
    Applied := False;
  end;

end;

procedure TCO_DataMod.Customers_ApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
  CustomerInfo: TCustomer;
begin   
  with Sender, CustomerInfo do
  begin
    Name := FieldByName('NAME').AsString;
    ShortName := FieldByName('Short_Name').AsString;
    OpenDate := FieldByName('OPEN_DAT').AsDateTime;
    CloseDate := FieldByName('CLOSE_DAT').AsDateTime;
    RelationID := FieldByName('PRINAD_KOD').AsInteger;
    GroupID := FieldByName('GROUP_KLIE').AsInteger;
    EstateType := FieldByName('VID_SOB').AsInteger;
    OrganizationType := FieldByName('ORG_SOB').AsInteger;
    ActionArea := FieldByName('SFERA_DEY').AsInteger;
    BranchID := FieldByName('OTRASL').AsInteger;
    TaxAreaID := FieldByName('NALOG_KOD').AsInteger;
    IsResident := FieldByName('NEREZIDENT').AsInteger = 0;
    TaxIDString := FieldByName('INN').AsString;
    BankIDString := FieldByName('BIK').AsString;
    OKPRO := FieldByName('KOD_OKPRO').AsString;
    //GovOfficer := FieldByName('OTV_LICO').AsString;
    TaxDepartmentRegDate := FieldByName('DAT_NAL').AsDateTime;
    CapitalRegDate := FieldByName('DAT_USTAV').AsDateTime;
  end;

  Applied := True;

  case Action of
  'I':
    Sb_AddCustomer(CustomerInfo);
  'U':
    Sb_EditCustomer(
      Sender.FieldByName('ID').AsInteger,
      CustomerInfo);
  else
    Applied := False;
  end;

end;

procedure Cleanup;
begin
  CO_DataMod.Free;
end;

initialization
finalization
  Cleanup;
end.
