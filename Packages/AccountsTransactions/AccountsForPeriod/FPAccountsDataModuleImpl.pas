unit FPAccountsDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TFPADataMod = class(TDataModule)
    DataSrcAccounts: TDataSource;
    AccountsData: TOracleDataSet;
    Branches: TOracleDataSet;
    DataSrcBranches: TDataSource;
    BranchesID: TFloatField;
    BranchesNAME: TWideStringField;
    AccountsDataACCNO: TWideStringField;
    AccountsDataACCCURRENCY: TWideStringField;
    AccountsDataACCNAME: TWideStringField;
    AccountsDataOPENDATE: TDateTimeField;
    AccountsDataCLOSEDATE: TDateTimeField;
    AccountsDataBALANCENO: TFloatField;
    SYSDAT: TOracleDataSet;
    SYSDATTEK_DAT: TDateTimeField;
    AccountsDataOPERATORID: TWideStringField;
    SysUsers: TOracleDataSet;
    DataSrcSysUsers: TDataSource;
    AccountsDataADI: TWideStringField;
    AccountsDataDOGUM: TDateTimeField;
    AccountsDataSEXSIYYETID: TWideStringField;
    AccountsDataREZ: TWideStringField;
    AccountsDataPHONE: TWideStringField;
    AccountsDataADRESS: TWideStringField;
    AccountsDataTAXID: TWideStringField;
    AccountsDataENG: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPADataMod: TFPADataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.
