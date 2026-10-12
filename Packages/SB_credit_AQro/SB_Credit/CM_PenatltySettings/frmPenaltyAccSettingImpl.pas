unit frmPenaltyAccSettingImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ToolWin, ComCtrls, ExtCtrls, ImgList, Grids,
  DBGridEh, ActnList;

type
  TfrmPenaltyAccSetting = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ImageList1: TImageList;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ActionList1: TActionList;
    ActnAdd: TAction;
    ActnEdit: TAction;
    ActnDelete: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnAddExecute(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ActnEditExecute(Sender: TObject);
    procedure ActnDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPenaltyAccSetting: TfrmPenaltyAccSetting;

  procedure InitPlugin(S:String);export;

implementation

{$R *.DFM}
uses CommonDecls,DMPenaltySettImpl,
  FrmAddEditPenSettImpl;

procedure InitPlugin(S:String);export;
begin
   frmPenaltyAccSetting.ShowModal
end;

exports
    InitPlugin;

procedure TfrmPenaltyAccSetting.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmPenaltyAccSetting.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) = VK_ESCAPE Then close
end;

procedure TfrmPenaltyAccSetting.FormCreate(Sender: TObject);
begin
   DMPenaltySett := TDMPenaltySett.Create(Self);
   FrmAddEditPenSett := TFrmAddEditPenSett.Create(Self)
end;

procedure TfrmPenaltyAccSetting.FormDestroy(Sender: TObject);
begin
   DMPenaltySett.Free;
   FrmAddEditPenSett.Free
end;

procedure TfrmPenaltyAccSetting.ActnAddExecute(Sender: TObject);
begin
   with DMPenaltySett,PenaltySettings do
        Insert;
        FrmAddEditPenSett.ShowModal;

end;

procedure TfrmPenaltyAccSetting.ToolButton7Click(Sender: TObject);
begin
 close
end;

procedure TfrmPenaltyAccSetting.ActnEditExecute(Sender: TObject);
begin
   with DMPenaltySett,PenaltySettings do
        Edit;
        FrmAddEditPenSett.ShowModal;

end;

procedure TfrmPenaltyAccSetting.ActnDeleteExecute(Sender: TObject);
begin
   with DMPenaltySett,cm_setup do
        CallProcedure('del_penaltySett',[DMPenaltySett.PenaltySettings.FieldByName('ID').ASInteger]);
       DMPenaltySett.PenaltySettings.Refresh; 
end;

initialization
   frmPenaltyAccSetting := TfrmPenaltyAccSetting.Create(CommonApplication)

end.
