unit FrmPaymentAddImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XFSCtrls, CurrencyEdit, CMCurrencyEdit, DBCtrlsEh, ExtCtrls,
  Mask, DBCtrls, ActnList;

type
  TFrmPaymentAdd = class(TForm)
    XFPanel1: TXFPanel;
    XFGroupBox3: TXFGroupBox;
    DBEdit3: TDBEdit;
    XFPanel2: TXFPanel;
    StaticText1: TStaticText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    StaticText5: TStaticText;
    DBEditEh1: TDBEditEh;
    Panel7: TPanel;
    StaticText6: TStaticText;
    DBEditEh2: TDBEditEh;
    Panel8: TPanel;
    StaticText7: TStaticText;
    EdMainDebit: TCMCurrencyEdit;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    StaticText2: TStaticText;
    DBEditEh3: TDBEditEh;
    Panel5: TPanel;
    StaticText3: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    Panel6: TPanel;
    StaticText4: TStaticText;
    EdIntDebit: TCMCurrencyEdit;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    ActionList1: TActionList;
    ActionTr: TAction;
    procedure ActionTrUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure EdMainDebitChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPaymentAdd: TFrmPaymentAdd;

implementation

uses DataModPartialPaymentImpl,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TFrmPaymentAdd.ActionTrUpdate(Sender: TObject);
begin
  with (Sender as TAction) do
         Enabled := EdMainDebit.Value > 0;
end;

procedure TFrmPaymentAdd.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmPaymentAdd.FormShow(Sender: TObject);
begin
  EdMainDebit.Value:=0;
  CurrencyEdit1.Value:=0;
  EdIntDebit.Value:=0;
end;

procedure TFrmPaymentAdd.XFButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPaymentAdd.EdMainDebitChange(Sender: TObject);
var
   VID:integer;
   amount    :real;
   Vdate     :Tdatetime;
   Peramount :real;
   Intamount :real;


begin
  If EdMainDebit.Text=''then
  begin
  ShowMessage('aa');
    CurrencyEdit1.Value:=0;
     EdIntDebit.Value  :=0;
  end;
  with DataModPartialPayment do
  begin
    VID:=PaymentsID.AsInteger;
    Vdate:=trunc(StrToDateTime(DBEdit3.Text));
    Amount:=EdMainDebit.Value;
    Peramount:=0;
    Intamount:=0;
    sbcm_payment.CallProcedure('SetPaymentPecentAmount',
                                  [
                                  'VID',VID,
                                  'Vdate',Vdate,
                                  'Amount',Amount,
                                  'Peramount',Peramount,
                                  'Intamount',Intamount 
                                  ]);

   CurrencyEdit1.Value:=sbcm_payment.GetParameter(3);
   EdIntDebit.Value   :=sbcm_payment.GetParameter(4);

  end;
end;
end.
