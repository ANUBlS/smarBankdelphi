unit DMautoImpl;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDMauto = class(TDataModule)
    procedure ODSMainAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMauto: TDMauto;

implementation

{$R *.dfm}
  //uses sboapiDataModuleImpl;
procedure TDMauto.ODSMainAfterPost(DataSet: TDataSet);
begin
  (DataSet as TOracleDataSet).RefreshRecord;
end;

end.
