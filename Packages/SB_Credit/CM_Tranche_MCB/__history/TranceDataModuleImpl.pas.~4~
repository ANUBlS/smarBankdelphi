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
    CreditInfoNAME: TWideStringField;
    CreditInfoCURRENCY: TFloatField;
    CreditInfoBOOROWERID: TFloatField;
    CustAccount: TOracleDataSet;
    CustAccountBOOROWERACCID: TFloatField;
    CreditInfoVAL_NAME: TWideStringField;
    CreditInfoOBLIGATION: TFloatField;
    CM_TRANCHE: TOraclePackage;
    TranchesData: TOracleDataSet;
    DataSrcTranches: TDataSource;
    TranchesDataID: TFloatField;
    TranchesDataCREDITID: TFloatField;
    TranchesDataTRANCHEDATE: TDateTimeField;
    TranchesDataTRANCHEAMOUNT: TFloatField;
    DataSourc: TDataSource;
    OracleDataSet_: TOracleDataSet;
    active: TOracleDataSet;
    activeCREDITTYPE: TFloatField;
    OracleDataSet: TOracleDataSet;
    TrancheAccountsACCID: TFloatField;
    TrancheAccountsKLI_ID: TFloatField;
    TrancheAccountsACCOUNTNUMBER: TWideStringField;
    TrancheAccountsACCOUNTNAME: TWideStringField;
    OraclePackage1: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
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

procedure TTrancheDataModule.DataModuleCreate(Sender: TObject);
begin
OracleDataSet.Open;
end;

procedure TTrancheDataModule.DataModuleDestroy(Sender: TObject);
begin
OracleDataSet.closeall
end;

end.
