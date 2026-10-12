unit transact_datamod_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TTransact_datamod = class(TDataModule)
    Sysdat: TOracleDataSet;
    TransactionsData: TDataSource;
    DataSysdat: TDataSource;
    DebitCurrency: TDataSource;
    DebitCurrencyData: TOracleDataSet;
    DebitCurrencyDataID: TIntegerField;
    DebitCurrencyDataSNAME: TStringField;
    DebitCurrencyDataNAME: TStringField;
    DebitCurrencyDataRATE: TFloatField;
    CreditCurrency: TDataSource;
    CreditCurrencyData: TOracleDataSet;
    CreditCurrencyDataID: TIntegerField;
    CreditCurrencyDataSNAME: TStringField;
    CreditCurrencyDataNAME: TStringField;
    CreditCurrencyDataRATE: TFloatField;
    DebitAccs: TDataSource;
    DebitAccData: TOracleDataSet;
    DebitAccDataID: TFloatField;
    DebitAccDataACC_NO: TStringField;
    DebitAccDataVAL_ACC: TIntegerField;
    DebitAccDataNAME: TStringField;
    DebitAccDataISCACHEACCOUNT: TFloatField;
    DebitAccDataBALANCE: TCurrencyField;
    DebitAccDataLBALANCE: TCurrencyField;
    CreditAccData: TOracleDataSet;
    CreditAccDataID: TFloatField;
    CreditAccDataACC_NO: TStringField;
    CreditAccDataVAL_ACC: TIntegerField;
    CreditAccDataNAME: TStringField;
    CreditAccDataISCACHEACCOUNT: TFloatField;
    CreditAccDataBALANCE: TCurrencyField;
    CreditAccDataLBALANCE: TCurrencyField;
    CreditAccs: TDataSource;
    ConvertationSymbols: TOracleDataSet;
    ConvertationSymbolsData: TDataSource;
    CashSymbols: TOracleDataSet;
    CashSymbolsData: TDataSource;
    Currency: TOracleDataSet;
    OperationTypes: TOracleDataSet;
    OperationTypesData: TDataSource;
    Transactions: TOracleDataSet;
    TransactionsID: TFloatField;
    TransactionsOPERATORID: TFloatField;
    TransactionsOPERATIONNO: TStringField;
    TransactionsTRANSACTIONDATE: TDateTimeField;
    TransactionsDEBITID: TFloatField;
    TransactionsDEBITACCNO: TStringField;
    TransactionsDEBITCURRENCYID: TFloatField;
    TransactionsDEBITCURRENCYSNAME: TStringField;
    TransactionsCREDITID: TFloatField;
    TransactionsCREDITACCNO: TStringField;
    TransactionsCREDITCURRENCYID: TFloatField;
    TransactionsCREDITCURRENCYSNAME: TStringField;
    TransactionsDEBITAMOUNT: TFloatField;
    TransactionsCREDITAMOUNT: TFloatField;
    TransactionsLAMOUNT: TFloatField;
    TransactionsDEBITRATE: TFloatField;
    TransactionsCREDITRATE: TFloatField;
    TransactionsDEBITBANK: TFloatField;
    TransactionsCREDITBANK: TFloatField;
    TransactionsPACKAGENUMBER: TFloatField;
    TransactionsCYPHERCODE: TFloatField;
    TransactionsOPERATIONCODE: TFloatField;
    TransactionsINBALANCECHAR: TFloatField;
    TransactionsOUTBALANCECHAR: TFloatField;
    TransactionsFILIALID: TFloatField;
    TransactionsDEBITBALANCE: TFloatField;
    TransactionsNAME: TStringField;
    TransactionsFLAGS: TFloatField;
    TransactionsSTATUS: TFloatField;
    TransactionsREJECT_REASON: TStringField;
    TransactionsDEBITBRANCH: TFloatField;
    TransactionsCREDITBRANCH: TFloatField;
    DebitBranch: TOracleDataSet;
    DebitBranchData: TDataSource;
    CreditBranch: TOracleDataSet;
    CreditBranchData: TDataSource;
    UsersData: TDataSource;
    Users: TOracleDataSet;
    Operations: TOracleQuery;
    Valute: TOracleQuery;
    SBTransaction: TOraclePackage;
    Commission: TOracleDataSet;
    CommissionID: TFloatField;
    CommissionNAME: TStringField;
    CommissionDEBT: TFloatField;
    CommissionDEBITACCOUNT: TStringField;
    CommissionDEBITCURRENCY: TStringField;
    CommissionDEBITCURRENCYID: TFloatField;
    CommissionCREDIT: TFloatField;
    CommissionCREDITACCOUNT: TStringField;
    CommissionCREDITCURRENCY: TStringField;
    CommissionCREDITCURRENCYID: TFloatField;
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
    CommissionData: TDataSource;
    SBComplexTrans: TOraclePackage;
    Destinations: TOracleDataSet;
    DestinationsData: TDataSource;
    DebitAccRestData: TOracleDataSet;
    CreditAccRestData: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Transact_datamod: TTransact_datamod;

implementation
  uses sboapiDataModuleImpl;
{$R *.DFM}

end.
