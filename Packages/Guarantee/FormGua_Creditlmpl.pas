unit FormGua_Creditlmpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList,  StdCtrls, CheckLst, Evanescence, CMDBSearchEdit,
  Buttons, ExtCtrls, ComCtrls, ToolWin;

type
  TFormGua_Credit = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    CMSearchEdit1: TCMSearchEdit;
    AddOtherPAPERNO: TEvanescence;
    ImageList1: TImageList;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGua_Credit: TFormGua_Credit;

implementation
  uses  DataMGuarantee;
{$R *.DFM}

procedure TFormGua_Credit.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False
end;

procedure TFormGua_Credit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

 with DataMGuarante,DataSGuacredit do
 begin
  close;
  SQL[10]:='';
 // ShowMessage(a+''''+s+'''');
  open ;
 //refresh;
 // AddOtherPAPERNO.RefreshList;
  end
end;

procedure TFormGua_Credit.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key) = VK_ESCAPE then close
end;

end.
