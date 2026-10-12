unit cap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TPrintform = class(TForm)
    ButtonPrint: TButton;
    prt: TRichEdit;
    cls: TButton;
    procedure ButtonPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure clsClick(Sender: TObject);
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

procedure TPrintform.ButtonPrintClick(Sender: TObject);
begin

prt.Print('S.W.I.F.T');

end;

procedure TPrintform.FormActivate(Sender: TObject);
begin

prt.Text:=a;

end;

procedure TPrintform.clsClick(Sender: TObject);
begin
Printform.Close;
end;

end.
