unit frmAccGroupsImpl_new;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, ExtCtrls, DBCtrls, Db, OracleData;

type
  TfrmAccGroups_new = class(TForm)
    acc_zone_info: TOracleDataSet;
    acc_zone_infoZONEID: TFloatField;
    acc_zone_infoACCGROUP: TFloatField;
    acc_zones: TOracleDataSet;
    acc_zonesZONEID: TFloatField;
    acc_zonesDESCRIPTION: TWideStringField;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    acc_zonesDatSrc: TDataSource;
    acc_zone_infoDatSrc: TDataSource;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccGroups_new: TfrmAccGroups_new;

implementation

{$R *.dfm}
  uses  sboapiDataModuleImpl,SBTranslateProc;
procedure TfrmAccGroups_new.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TfrmAccGroups_new.FormCreate(Sender: TObject);
begin
   acc_zones.Open;
   acc_zone_info.Open   ;
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmAccGroups_new.FormDestroy(Sender: TObject);
begin
  acc_zones.CloseAll;
   acc_zone_info.CloseAll
end;

procedure TfrmAccGroups_new.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

end.
