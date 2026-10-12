unit frmAccGroupsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, ExtCtrls, DBCtrls, Db, OracleData,
  NLSLocalizer;

type
  TfrmAccGroups = class(TForm)
    DBGridEh1: TDBGridEh;
    DBNavigator1: TDBNavigator;
    DBGridEh2: TDBGridEh;
    StatusBar1: TStatusBar;
    acc_zones: TOracleDataSet;
    acc_zonesDatSrc: TDataSource;
    acc_zone_info: TOracleDataSet;
    acc_zone_infoDatSrc: TDataSource;
    acc_zone_infoZONEID: TFloatField;
    acc_zone_infoACCGROUP: TFloatField;
    acc_zonesZONEID: TFloatField;
    acc_zonesDESCRIPTION: TWideStringField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccGroups: TfrmAccGroups;

implementation

{$R *.DFM}
uses  sboapiDataModuleImpl;

procedure TfrmAccGroups.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmAccGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmAccGroups.FormCreate(Sender: TObject);
begin
   acc_zones.Open;
   acc_zone_info.Open
end;

procedure TfrmAccGroups.FormDestroy(Sender: TObject);
begin
   acc_zones.CloseAll;
   acc_zone_info.CloseAll
end;

end.
