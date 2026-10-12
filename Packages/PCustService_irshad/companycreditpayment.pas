unit companycreditpayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle;

type
  TPaymentcompany = class(TForm)
    clientname: TEdit;
    Button1: TButton;
    mainrest: TEdit;
    penaltyam: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Paymentcompany: TPaymentcompany;

implementation

uses UnitDataModPCustService;

{$R *.dfm}

procedure TPaymentcompany.Button1Click(Sender: TObject);
begin
if penaltyam.Text <>'' then
DataModPCustService.companycredit.CallProcedure('sendcomapnypayment',[strtoint(Edit1.Text),strtoint(edit5.Text),1])
else
   DataModPCustService.companycredit.CallProcedure('sendcomapnypayment',[strtoint(Edit1.Text),strtoint(edit5.Text),0]);
end;

procedure TPaymentcompany.Edit5Change(Sender: TObject);
var a,b :integer;
begin
   a:=strtoint(penaltyam.Text);
   b:=strtoint(edit5.Text);
   b:=b+a;
edit2.Text:=inttostr(b) ;
end;

end.
