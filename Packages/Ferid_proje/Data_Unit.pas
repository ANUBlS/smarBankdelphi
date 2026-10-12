unit Data_Unit;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDataModule1 = class(TDataModule)
    OracleDataSet1: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation
 uses sboapiDataModuleImpl;
{$R *.dfm}

end.
