unit datamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  Tout_DataModule = class(TDataModule)
    ForTable: TOracleDataSet;
    DataSource1: TDataSource;
    ForMoney: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    Group: TOracleDataSet;
    BanksName: TOracleDataSet;
    ODSTransactionView: TOracleDataSet;
    Branch: TOracleDataSet;
    BranchData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  out_DataModule: Tout_DataModule;

implementation

{$R *.DFM}

end.
