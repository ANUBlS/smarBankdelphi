unit DataModEnforcement;

interface

uses
  SysUtils, Classes, DB, OracleData,sboapiDataModuleImpl;

type
  TDataModuleEnforcement = class(TDataModule)
    ODSEnforcement: TOracleDataSet;
    DSEnforcement: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleEnforcement: TDataModuleEnforcement;

implementation

{$R *.dfm}

procedure TDataModuleEnforcement.DataModuleCreate(Sender: TObject);
begin
  ODSEnforcement.Open;
end;

end.
