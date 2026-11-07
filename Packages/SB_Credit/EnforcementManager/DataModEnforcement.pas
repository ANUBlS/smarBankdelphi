unit DataModEnforcement;

interface

uses
  SysUtils, Classes, DB, OracleData,sboapiDataModuleImpl;

type
  TDataModuleEnforcement = class(TDataModule)
    ODSEnforcement: TOracleDataSet;
    DSEnforcement: TDataSource;
    DSGroups: TDataSource;
    ODSGroups: TOracleDataSet;
    ODSAdminGroups: TOracleDataSet;
    DSAdminGroups: TDataSource;
    ODSAdminIn: TOracleDataSet;
    DSAdminIn: TDataSource;
    DSEnforcementAdmin: TDataSource;
    ODSEnforcementAdmin: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
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
  ODSGroups.Open;
  ODSAdminGroups.Open;
  ODSAdminIn.Open;
end;

procedure TDataModuleEnforcement.DataModuleDestroy(Sender: TObject);
begin
  ODSEnforcement.CloseAll;
  ODSGroups.CloseAll;
  ODSAdminGroups.CloseAll;
  ODSAdminIn.CloseAll;
end;

end.
