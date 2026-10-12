unit cap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, QuickRpt, QRCtrls, ExtCtrls, qrp1, OleCtrls, SHDocVw;

type
  TPrintform = class(TForm)
    prt: TRichEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonPrint: TButton;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonPrintClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Printform: TPrintform;

implementation

uses SWIFT_MAINImpl1;

{$R *.DFM}

procedure TPrintform.Button1Click(Sender: TObject);
begin
   Printform.Close;
end;

procedure TPrintform.ButtonPrintClick(Sender: TObject);
var vaIn, vaOut: OleVariant;
begin
//prt.Print('A.Z.I.P.S');
if copy(prt.Text,1,1)='<' then
   WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER,    vaIn, vaOut)
   else
   prt.Print('A.Z.I.P.S');
end;

procedure TPrintform.FormActivate(Sender: TObject);

//     ShowMessage(a);
//prt.Text:=a;

var
  Doc: Variant;
begin
  if NOT Assigned(webBrowser1.Document) then
    webBrowser1.Navigate('about:blank');


if copy(prt.Text,1,1)='<' then
    begin
    prt.Visible:=false;
  Doc := webBrowser1.Document;
  Doc.Clear;
  Doc.Write(prt.Text);
  Doc.Close;
  end else
  begin
     webBrowser1.Visible:=false;
     prt.Visible:=true;

  end;

end;

procedure TPrintform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Printform.Close;
end;

end.
