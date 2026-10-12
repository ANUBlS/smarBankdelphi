unit Unit5;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDataModule5 = class(TDataModule)
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule5: TDataModule5;

implementation

uses SboapiDataModuleImpl;
{$R *.dfm}

end.
