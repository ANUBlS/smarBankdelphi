unit cap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, QuickRpt, QRCtrls, ExtCtrls, qrp1;

type
  TPrintform = class(TForm)
    prt: TRichEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonPrint: TButton;
    Button1: TButton;
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
begin
prt.Print('A.Z.I.P.S');
end;

procedure TPrintform.FormActivate(Sender: TObject);
begin
//     ShowMessage(a);
//prt.Text:=a;

end;

procedure TPrintform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Printform.Close;
end;

end.
