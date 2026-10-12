unit Admin_Setting;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBGridEh, StdCtrls;

type
  TForm_Admin_Setting = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGEh_Admin_Setting: TDBGridEh;
    GroupBox4: TGroupBox;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGEh_Admin_SettingKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Admin_Setting: TForm_Admin_Setting;

implementation
uses Data_Unit,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TForm_Admin_Setting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DataMod.ODS_Admin_Setting.Active:=False;
   DataMod.ODS_Ad_Sett_Fili.Active:=False;
end;

procedure TForm_Admin_Setting.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TForm_Admin_Setting.DBGridEh1DblClick(Sender: TObject);
begin
   DataMod.Ins.CallProcedure('xs_Admin_in_Add',[DataMod.ODS_Admin_Setting.FieldByName('ID').AsInteger
                                               ,DataMod.ODS_Ad_Sett_Fili.FieldByName('ID').AsInteger
                                               ,DataMod.ODS_Admin_Setting.FieldByName('NAME').AsString
                                               ,DataMod.ODS_Ad_Sett_Fili.FieldByName('NAME').AsString]);
   DataMod.ODS_Admin_in.Refresh;
end;

procedure TForm_Admin_Setting.DBGridEh2DblClick(Sender: TObject);
begin
   DataMod.Ins.CallProcedure('xs_Admin_in_Del',[DataMod.ODS_Admin_in.FieldByName('USER_ID').AsInteger
                                               ,DataMod.ODS_Admin_in.FieldByName('FILIAL_ID').AsInteger
                                               ,DataMod.ODS_Admin_in.FieldByName('USER_NAME').AsString
                                               ,DataMod.ODS_Admin_in.FieldByName('FILIAL_NAME').AsString]);
   DataMod.ODS_Admin_in.Refresh;
end;

procedure TForm_Admin_Setting.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then
      DBGridEh1DblClick(Sender);
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TForm_Admin_Setting.DBGridEh2KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TForm_Admin_Setting.DBGEh_Admin_SettingKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TForm_Admin_Setting.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key=46 then
   begin
      DBGridEh2DblClick(Sender);
      key:=0;
   end;
end;

end.
