unit NewDepositsDMWRGroupsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TNewDepositsDMWRGroups = class(TDataModule)
    DMtypes: TOracleDataSet;
    DMtypesDataSrc: TDataSource;
    DmWrTemplates: TOracleDataSet;
    DmWrTemplatesDataSrc: TDataSource;
    DmWrGroups: TOracleDataSet;
    DmWrGroupsDataSrc: TDataSource;
    DmWrGroupsID: TFloatField;
    DmWrGroupsDTYPEID: TFloatField;
    DmWrGroupsTEMPID: TFloatField;
    dm_rpdepository: TOraclePackage;
    DmWrGroupsTempName: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsDMWRGroups: TNewDepositsDMWRGroups;

implementation

{$R *.dfm}
    uses sboapiDatamoduleImpl;

procedure TNewDepositsDMWRGroups.DataModuleCreate(Sender: TObject);
begin
   DMtypes.Open
end;

procedure TNewDepositsDMWRGroups.DataModuleDestroy(Sender: TObject);
begin
   DMtypes.CloseAll
end;

end.
