unit Printforms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TPrintform = class(TForm)
    prt: TRichEdit;
    Panel1: TPanel;
    Button1: TButton;
    ButtonPrint: TButton;
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

{$R *.dfm}

procedure TPrintform.Button1Click(Sender: TObject);
begin
close;
end;

procedure TPrintform.ButtonPrintClick(Sender: TObject);
begin
prt.Print('X.O.H.K.S');
end;

end.
