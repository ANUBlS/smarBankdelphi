unit MainForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DockSite, StdCtrls, ToolWin, DtFloatWindow;

type
  TForm1 = class(TForm)
    DockSite1: TDockSite;
    Button1: TButton;
    Button2: TButton;
    DtFloatWindow1: TDtFloatWindow;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  Form: TForm;
begin
  Form := TForm.Create(Self);
  Form.Parent := Self;
  Form.BorderStyle := bsToolWindow;
  Form.FormStyle := fsStayOnTop;
  Form.BorderIcons := [];
  Form.Show;
end;

end.
