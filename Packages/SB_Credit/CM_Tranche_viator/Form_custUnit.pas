unit Form_custUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TForm_cust = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cust: TForm_cust;

implementation
     uses TranceDataModuleImpl;
{$R *.dfm}

procedure TForm_cust.Button1Click(Sender: TObject);
begin
Form_cust.Close;
end;

end.
