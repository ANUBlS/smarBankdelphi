unit TrafficsFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Mask, Buttons, ActnList,
  Menus, ImgList;

type
  TTrafficsForm = class(TForm)
    TrafficsViewer: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SpeedButton1: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure MouseWheelHandler(var Message: TMessage); override;
  end;

var
  TrafficsForm: TTrafficsForm;

implementation

uses ExpertDataModule, ExportFormUnit,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}
procedure TTrafficsForm.MouseWheelHandler(var Message: TMessage);
begin
 Inherited;
 if TrafficsViewer.Focused then
  with TCMMouseWheel(Message), TrafficsViewer.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
   TrafficsViewer.Repaint;
end;


procedure TTrafficsForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TTrafficsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key =VK_ESCAPE) then Close;
end;

procedure TTrafficsForm.CheckBox1Click(Sender: TObject);
begin
 with TrafficsViewer.Columns[0] do
 begin
  Visible:=TCheckBox(Sender).Checked;
  Width :=40;
 end;

end;

procedure TTrafficsForm.CheckBox2Click(Sender: TObject);
begin
 with TrafficsViewer.Columns[1] do
 begin
  Visible:=TCheckBox(Sender).Checked;
  Width :=55;
 end;
end;

procedure TTrafficsForm.SpeedButton1Click(Sender: TObject);
begin
 if TrafficsViewer.DataSource.DataSet.RecordCount = 0 then
  Exit;
 ExportForm.ShowModal;
end;

end.
