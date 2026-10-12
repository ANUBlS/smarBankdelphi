unit FrmAddAccpayment_lossImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, DBCtrls;

type
  TFrmAddAccpayment_loss = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    DBLookupComboBox1: TDBLookupComboBox;
    XFLabel1: TXFLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddAccpayment_loss: TFrmAddAccpayment_loss;

implementation

uses InsDataModule;

{$R *.dfm}

procedure TFrmAddAccpayment_loss.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close;

end;

procedure TFrmAddAccpayment_loss.XFButton1Click(Sender: TObject);
begin
InsDataMod.DSAccountPayment.Close;
close
end;

procedure TFrmAddAccpayment_loss.XFButton2Click(Sender: TObject);
begin
if DBLookupComboBox1.KeyValue<>0 then
begin
InsDataMod.dsacc_pay_los.Close;
InsDataMod.dsacc_pay_los.open;
InsDataMod.dsacc_pay_los.Insert;
InsDataMod.dsacc_pay_los.FieldByName('ACC_ID').AsInteger:=DBLookupComboBox1.KeyValue;
InsDataMod.dsacc_pay_los.post;
InsDataMod.DSPay_loss_acc.Close;
InsDataMod.DSPay_loss_acc.open;

end;

end;
end.
