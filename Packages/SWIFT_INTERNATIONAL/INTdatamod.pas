unit INTdatamod;

interface

uses
  SysUtils, Classes,sboapiDataModuleImpl,SBTranslateProc, DB, OracleData;

type
  TDATAMODUL = class(TDataModule)
    dt103: TOracleDataSet;
    ds103: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DATAMODUL: TDATAMODUL;

implementation

{$R *.dfm}

procedure TDATAMODUL.DataModuleCreate(Sender: TObject);
begin
dt103.Open;
end;

end.
