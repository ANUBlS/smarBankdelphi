unit P_Datamod_Unit;

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
  TP_DataModuleFS = class(TDataModule)
    Accdata: TDataSource;
    comisdata: TDataSource;
    Commission: TOracleDataSet;
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
    Customers: TOracleDataSet;
    Custdata: TDataSource;
    Account: TOracleDataSet;
    Provarch: TOracleDataSet;
    ProvarchDAT: TDateTimeField;
    ProvarchDEBIT: TStringField;
    ProvarchCREDIT: TStringField;
    ProvarchAMMOUNT: TFloatField;
    ProvarchLAMMOUNT: TFloatField;
    ProvarchAMMOUNT_C: TFloatField;
    ProvarchNAME: TStringField;
    Provdata: TDataSource;
    archost: TOracleDataSet;
    avalute: TOracleDataSet;
    ODSLogo: TOracleDataSet;
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
    ODSCurrency: TOracleDataSet;
    DSCurrency: TDataSource;
    ODSCardState: TOracleDataSet;
    Sysdat: TOracleDataSet;
    SysdatTEK_DAT: TDateTimeField;
    Sysdata: TDataSource;
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
    DebetTransactionsDataD_VALUTE: TStringField;
    DebetTransactionsDataCREDITNAME: TStringField;
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
    CreditTransactionsDataC_VALUTE: TStringField;
    CreditTransactionsDataDEBTNAME: TStringField;
    DebetTransactions: TDataSource;
    CreditTransactions: TDataSource;
    temprate: TOracleDataSet;
    Transaction: TOracleDataSet;
    Transdata: TDataSource;
    OPackage: TOraclePackage;
    Bankinfo: TOracleDataSet;
    Bankinfodata: TDataSource;
    memorial_date: TOracleDataSet;
    memorial_date_data: TDataSource;
    ACC: TOracleDataSet;
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
    ACC_Data: TDataSource;
    avalutedata: TDataSource;
    ACC_: TOracleDataSet;
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
    ODSValuteName: TOracleDataSet;
    ODSValuteNameVALUTE: TIntegerField;
    ODSValuteNameVALU_NAME: TStringField;
    ODSValuteNameVALU_BALA: TStringField;
    OPCash: TOraclePackage;
    ODSTransactionsViewer: TOracleDataSet;
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
    DataSrcViewer: TDataSource;
    BrowseCashInfo: TOracleDataSet;
    SB_TRANSACTION: TOraclePackage;
    Buyer: TOracleDataSet;
    Country: TOracleDataSet;
    countrydata: TDataSource;
    cities: TOracleDataSet;
    ctiesdata: TDataSource;
    physical_customers: TOraclePackage;
    ad_citites: TDataSource;
    ad_cities: TOracleDataSet;
    ad_country: TOracleDataSet;
    ad_countrydata: TDataSource;
    P_Customers: TOracleDataSet;
    P_CustomersData: TDataSource;
    pasp: TOracleDataSet;
    ODSMainState: TOracleDataSet;
    DSMainState: TDataSource;
    ODSExtractTrans: TOracleDataSet;
    DSExtractTrans: TDataSource;
    AccSettings: TOracleDataSet;
    AccSettingsdata: TDataSource;
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
    AccFlags: TOracleDataSet;
    AccFlagsSYMBOL: TStringField;
    AccFlagsNAME: TStringField;
    AccFlagsData: TDataSource;
    SBUTIL: TOraclePackage;
    AccFlag: TOracleDataSet;
    AccFlagID: TFloatField;
    AccFlagKLI_ID: TFloatField;
    AccFlagOP_ID: TFloatField;
    AccFlagACC_NO: TStringField;
    AccFlagVAL_ACC: TIntegerField;
    AccFlagNAME: TStringField;
    AccFlagOPEN_DAT: TDateTimeField;
    AccFlagCLOSE_DAT: TDateTimeField;
    AccFlagSTATUS: TFloatField;
    AccFlagBAL_CN1: TFloatField;
    AccFlagBAL_CN2: TFloatField;
    AccFlagBAL_CN3: TFloatField;
    AccFlagBAL_CN4: TFloatField;
    AccFlagFILIAL: TIntegerField;
    AccFlagSIM_OTCET: TFloatField;
    AccFlagTIPACC: TStringField;
    AccFlagLIMIT: TFloatField;
    AccFlagOLD_ACC_NO: TStringField;
    AccFlagPAIR_ACC: TFloatField;
    AccFlagINSIDER: TStringField;
    AccountData: TDataSource;
    ODSCurrencyVALUTE: TIntegerField;
    ODSCurrencyVAL_NAME: TStringField;
    ODSCurrencyVALU_NAME: TStringField;
    ODSCurrencyVALU_SHORT: TStringField;
    ODSCurrencyUSTORG: TFloatField;
    ODSCurrencyUSTPOK: TFloatField;
    ODSCurrencyVALU_GEN: TStringField;
    ODSCurrencyVALU_AZ: TStringField;
    ODSCurrencyUSING: TIntegerField;
    ODSCurrencyVALU_OTHER: TStringField;
    ODSCurrencyVALU_INTER: TStringField;
    ODSCurrencyVALU_BALA: TStringField;
    ODSCurrencyPRISTAVKA: TFloatField;
    ODSCurrencyCOUNTRY: TStringField;
    ODSCurrencyUST_POK1: TFloatField;
    ODSCurrencyOFFICAL: TStringField;
    ODSCurrencyLIMIT: TFloatField;
    ODSCurrencyDEBET: TFloatField;
    ODSCurrencyKREDIT: TFloatField;
    ODSCurrencyF5501P: TFloatField;
    ODSCurrencyF5501V: TFloatField;
    ODSCurrencySDEBET: TFloatField;
    ODSCurrencySCREDIT: TFloatField;
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
    P_CustomersID: TIntegerField;
    P_CustomersCUST_NAME: TStringField;
    P_CustomersPASSPORT: TStringField;
    P_CustomersBIRTHDATE: TDateTimeField;
    P_CustomersBIRTHPLACE: TStringField;
    P_CustomersFAM_STATUS: TIntegerField;
    P_CustomersADRESS: TStringField;
    P_CustomersPHONE: TStringField;
    P_CustomersEMAIL: TStringField;
    P_CustomersOPENDATE: TDateTimeField;
    P_CustomersSEX: TIntegerField;
    P_CustomersUSERID: TFloatField;
    P_CustomersPASSP_NUMBER: TStringField;
    P_CustomersADRS_STATE: TStringField;
    P_CustomersADRS_CITY: TStringField;
    P_CustomersBIRTH_STATE: TStringField;
    P_CustomersPHONE_MOB: TStringField;
    P_CustomersINN: TStringField;
    ReportDesc: TOracleDataSet;
    ReportDescsData: TDataSource;
    Cntries: TOracleDataSet;
    CntriesData: TDataSource;
    TransactionsREPORTID: TFloatField;
    TransactionsCOUNTRID: TFloatField;
    CashSymbolsSYMBOL: TFloatField;
    CashSymbolsNAME: TStringField;
    CashSymbolsMEDIOCRITY: TFloatField;
    RepSymbol: TOracleDataSet;
    RepSymbolID: TFloatField;
    RepSymbolNAME: TStringField;
    RepSymbData: TDataSource;
    procedure DebetTransactionsDataCalcFields(DataSet: TDataSet);
    procedure CreditTransactionsDataCalcFields(DataSet: TDataSet);
    
  private
    { Private declarations }
      public
    { Public declarations }
        OperationMode: TOperationMode;
  procedure SetCommission(CommissionID, DebitID, CreditID: Longint; DebitAmmount, CreditAmmount: Currency; TransDate: TDateTime);


  end;

var
  P_DataModuleFS: TP_DataModuleFS;

implementation
  Uses SBCore, SBCustomer,sboapiDataModuleImpl,P_CO_Memorial_Unit,
  P_CO_In_Form;
{$R *.DFM}

procedure TP_DataModuleFS.SetCommission(CommissionID, DebitID, CreditID: Longint; DebitAmmount, CreditAmmount: Currency; TransDate: TDateTime);

  function IsCommission: Boolean;
  begin
   with P_CO_IN do
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

procedure TP_DataModuleFS.DebetTransactionsDataCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('DebitAccNo').AsString :=P_DataModuleFS.Account.FieldByName('accno').AsString;
end;

procedure TP_DataModuleFS.CreditTransactionsDataCalcFields(
  DataSet: TDataSet);
begin
with DataSet do
  FieldByName('CreditAccNo').AsString :=P_DataModuleFS.Account.FieldByName('accno').AsString;

end;

end.
