unit Correct_Tr_Py_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ActnList, NLSLocalizer, ImgList, ComCtrls, ToolWin, Grids,
  DBGridEh, StdCtrls;

type
  TCTPMainForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    NLSLocalizer1: TNLSLocalizer;
    ActionList1: TActionList;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    GroupBox2: TGroupBox;
    DBGridEh2: TDBGridEh;
    ActnTrAdd: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CTPMainForm: TCTPMainForm;

implementation

{$R *.DFM}

uses Correct_Tr_Py_Impl;

procedure TCTPMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If ord(Key) = VK_ESCAPE then Close;  
end;

procedure TCTPMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

end.
