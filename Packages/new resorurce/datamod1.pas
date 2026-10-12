unit datamod1;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle;

type
  TDataMod = class(TDataModule)
    addgroup: TOracleDataSet;
    Groupdata: TDataSource;
    AddName: TOracleDataSet;
    groupv: TOracleDataSet;
    DataSource1: TDataSource;
    mainresoursce: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation

{$R *.dfm}


uses  sboapiDataModuleImpl;
end.
