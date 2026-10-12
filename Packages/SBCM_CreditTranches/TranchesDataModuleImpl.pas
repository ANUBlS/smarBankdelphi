unit TranchesDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TTranchesDataModule = class(TDataModule)
    TranchesPackage: TOraclePackage;
    AccountData: TOracleDataSet;
    DataSrcAccountData: TDataSource;
    AccountDataCLIENTACCNO: TStringField;
    AccountDataCLIENTACCNAME: TStringField;
    AccountDataCLIENTCURRENCY: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TranchesDataModule: TTranchesDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

end.
