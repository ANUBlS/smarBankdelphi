unit TranceDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TTrancheDataModule = class(TDataModule)
    CreditInfo: TOracleDataSet;
    DataSrcCreditInfo: TDataSource;
    TrancheAccounts: TOracleDataSet;
    DataSrcTrancheAccounts: TDataSource;
    CreditInfoID: TFloatField;
    CreditInfoNUMBEROFCREDIT: TWideStringField;
    CreditInfoCREDITLINEAMOUNT: TFloatField;
    CreditInfoCURRENCY: TFloatField;
    CreditInfoBOOROWERID: TFloatField;
    CustAccount: TOracleDataSet;
    CustAccountBOOROWERACCID: TFloatField;
    CreditInfoOBLIGATION: TFloatField;
    CM_TRANCHE: TOraclePackage;
    TranchesData: TOracleDataSet;
    DataSrcTranches: TDataSource;
    TranchesDataID: TFloatField;
    TranchesDataCREDITID: TFloatField;
    TranchesDataTRANCHEDATE: TDateTimeField;
    TranchesDataTRANCHEAMOUNT: TFloatField;
    CreditInfoNAME: TWideStringField;
    CreditInfoVAL_NAME: TWideStringField;
    CreditInfoBRANCHID: TFloatField;
    ods_hesab: TOracleDataSet;
    ods_hesabID: TFloatField;
    ods_hesabACC_NO: TWideStringField;
    dsrc_hesab: TDataSource;
    active: TOracleDataSet;
    ods_cust: TOracleDataSet;
    ods_custPHONE_M: TWideStringField;
    ods_custPASSPIN: TWideStringField;
    dsrc_cust: TDataSource;
    ods_hesabBAL_CN1: TFloatField;
    CreditInfoMEHSULID: TFloatField;
    activeCREDITTYPE: TFloatField;
    activeCURRENCY: TFloatField;
    activeBRANCHID: TFloatField;
    activeMEHSULID: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrancheDataModule: TTrancheDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.
