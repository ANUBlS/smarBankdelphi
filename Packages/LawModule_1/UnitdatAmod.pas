unit UnitdatAmod;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDataModule_LAW = class(TDataModule)
    MainSclst: TOracleDataSet;
    datsrc_mainlst: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule_LAW: TDataModule_LAW;



implementation


uses sboapiDataModuleImpl, SBTranslateProc  ;

{$R *.dfm}

end.
