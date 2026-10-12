unit Add_Invest_paymentimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XFSCtrls, ExtCtrls, DBCtrls, CurrencyEdit;

type
  TAdd_Invest_payment = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Edit6: TEdit;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox8: TGroupBox;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox9: TGroupBox;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox10: TGroupBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox11: TGroupBox;
    Label11: TLabel;
    Edit7: TEdit;
    GroupBox12: TGroupBox;
    Label12: TLabel;
    Edit8: TEdit;
    GroupBox13: TGroupBox;
    Label13: TLabel;
    GroupBox14: TGroupBox;
    Label14: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox15: TGroupBox;
    Label15: TLabel;
    Edit10: TEdit;
    GroupBox16: TGroupBox;
    Label16: TLabel;
    Edit11: TEdit;
    GroupBox17: TGroupBox;
    Label17: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
//    procedure CurrencyEdit2Change(Sender: TObject);
  //  procedure CurrencyEdit1Change(Sender: TObject);
  //  procedure CurrencyEdit3Change(Sender: TObject);
  //  procedure CurrencyEdit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Invest_payment: TAdd_Invest_payment;

implementation

{$R *.dfm}

 uses CommanParametrs,sboapiDataModuleImpl,DmPayment1impl,Frmpayment1impl;

procedure TAdd_Invest_payment.Button1Click(Sender: TObject);
begin
{if (CurrencyEdit1.Value<0) or (CurrencyEdit2.Value<0) or (CurrencyEdit3.Value<0) or (CurrencyEdit4.Value<0) then
begin
  ShowMessage('Məbləğ 0-dan böyük olmalidir!!!!');
  exit;
end;    }

With DmPayment1  do
begin

  {DsInvest.open;
  DsInvest.edit;
  DsInvest.FieldByName('cid').AsInteger:=contactid;
  DsInvest.FieldByName('AMMOUNT').AsInteger:=StrToInt(Edit2.Text);
  DsInvest.FieldByName('ostat').AsInteger:=StrToInt(Edit1.Text);
  DsInvest.FieldByName('dat').AsDateTime:=DateTimePicker1.DateTime;  }
  //ShowMessage(DBLookupComboBox2.KeyValue);
  if  pk_ins_investment.CallBooleanFunction('ins_invest_payment_transaction',[contactid
  ,CurrencyEdit1.Value,DBLookupComboBox1.KeyValue
  ,CurrencyEdit2.Value,DBLookupComboBox2.KeyValue
  ,CurrencyEdit3.Value,DmPayment1.Dscontracts.FieldByName('INCOME_ACC_ID').AsInteger
  ,CurrencyEdit4.Value,DmPayment1.Dscontracts.FieldByName('EXP_ACC_ID').AsInteger])=true then
begin
  ShowMessage('Əməliyyatlar yerinə yetirildi!');
end;
end;
     DmPayment1.DsMain.Close;
     DmPayment1.DsMain.SetVariable('PCID',contactid);
     DmPayment1.DsMain.Open;
     Add_Invest_payment.close;
end;
     {
procedure TAdd_Invest_payment.CurrencyEdit1Change(Sender: TObject);
begin
if CurrencyEdit1.Value>StrToInt(Edit1.Text) then
begin
  ShowMessage('Ödəniləcək məbləğ esas qalıqdan böyük olmamalıdır!!!!');
  exit;
end;

end;

procedure TAdd_Invest_payment.CurrencyEdit2Change(Sender: TObject);
begin
if CurrencyEdit2.Value>StrToInt(Edit6.Text) then
begin
  ShowMessage('Ödəniləcək məbləğ faiz qalıqdan böyük olmamalıdır!!!!');
  exit;
end;

end;

procedure TAdd_Invest_payment.CurrencyEdit3Change(Sender: TObject);
begin
if CurrencyEdit3.Value>StrToInt(Edit8.Text) then
begin
  ShowMessage('Ödəniləcək məbləğ gelir qalıqdan böyük olmamalıdır!!!!');
  exit;
end;
end;

procedure TAdd_Invest_payment.CurrencyEdit4Change(Sender: TObject);
begin
if CurrencyEdit4.Value>StrToInt(Edit11.Text) then
begin
  ShowMessage('Ödəniləcək məbləğ xerc qalıqdan böyük olmamalıdır!!!!');
  exit;
end;
end;
             }
procedure TAdd_Invest_payment.Button2Click(Sender: TObject);
begin
close;
end;

procedure TAdd_Invest_payment.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;
end;

procedure TAdd_Invest_payment.FormShow(Sender: TObject);
begin
DmPayment1.Dscontracts.Close;
DmPayment1.Dscontracts.SetVariable('cid',contactid);
DmPayment1.Dscontracts.Open;

DmPayment1.ds_kassa.Refresh;
DmPayment1.ds_kassa1.Refresh;


DBLookupComboBox1.KeyValue:=null;
DBLookupComboBox2.KeyValue:=null;
Edit2.Text:=DmPayment1.Dscontracts.FieldByName('INCOME_ACC_NO').AsString;
Edit5.Text:=DmPayment1.Dscontracts.FieldByName('EXP_ACC_NO').AsString;
CurrencyEdit1.Value:=0;
CurrencyEdit2.Value:=0;
CurrencyEdit3.Value:=0;
CurrencyEdit4.Value:=0;
Edit3.Text:=DmPayment1.Dscontracts.FieldByName('MAIN_ACC_ID').AsString;
Edit4.Text:=DmPayment1.Dscontracts.FieldByName('per_acc_id').AsString;
Edit7.Text:=DmPayment1.Dscontracts.FieldByName('per_acc_id').AsString;
Edit10.Text:=DmPayment1.Dscontracts.FieldByName('per_acc_id').AsString;

Edit1.Text:=DmPayment1.Dscontracts.FieldByName('ammount').AsString;

Edit6.Text:=DmPayment1.Dscontracts.FieldByName('faiz_qaliq').AsString;
DateTimePicker1.DateTime:=DmPayment1.DsSysdat.FieldByName('tek_dat').AsDateTime;
end;

end.
