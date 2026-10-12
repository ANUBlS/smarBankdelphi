unit UntPayments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, CurrencyEdit;

type
  TFrmPayments = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;
    StaticText4: TStaticText;
    DBEdit1: TDBEdit;
    GroupBox7: TGroupBox;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    Panel5: TPanel;
    GroupBox17: TGroupBox;
    StaticText17: TStaticText;
    DBEdit17: TDBEdit;
    GroupBox18: TGroupBox;
    StaticText18: TStaticText;
    DBEdit18: TDBEdit;
    GroupBox19: TGroupBox;
    StaticText19: TStaticText;
    DBEdit19: TDBEdit;
    GroupBox20: TGroupBox;
    StaticText20: TStaticText;
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    DBEdit2: TDBEdit;
    GroupBox3: TGroupBox;
    StaticText3: TStaticText;
    DBEdit4: TDBEdit;
    GroupBox5: TGroupBox;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    GroupBox8: TGroupBox;
    StaticText8: TStaticText;
    Panel4: TPanel;
    GroupBox9: TGroupBox;
    StaticText9: TStaticText;
    DBEdit8: TDBEdit;
    GroupBox10: TGroupBox;
    StaticText10: TStaticText;
    DBEdit9: TDBEdit;
    GroupBox11: TGroupBox;
    StaticText11: TStaticText;
    DBEdit10: TDBEdit;
    GroupBox12: TGroupBox;
    StaticText12: TStaticText;
    Panel6: TPanel;
    GroupBox13: TGroupBox;
    StaticText13: TStaticText;
    DBEdit11: TDBEdit;
    GroupBox14: TGroupBox;
    StaticText14: TStaticText;
    DBEdit12: TDBEdit;
    GroupBox15: TGroupBox;
    StaticText15: TStaticText;
    DBEdit13: TDBEdit;
    GroupBox16: TGroupBox;
    StaticText16: TStaticText;
    GroupBox21: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    CBUseTransaction: TCheckBox;
    FacticalDebtPaymentEdit: TCurrencyEdit;
    FacticalInterestDebtPaymentEdit: TCurrencyEdit;
    OverdueDebtPaymentEdit: TCurrencyEdit;
    OverdueInterestDebtPaymentEdit: TCurrencyEdit;
    Panel7: TPanel;
    BtnApplyPayment: TButton;
    BtnClose: TButton;
    procedure BtnApplyPaymentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmPayments: TFrmPayments;

implementation

uses
     StoredProgramsUnit
    ,sbcmMainDataModule
    ,UntPaymentsDataModule;

{$R *.DFM}

procedure TFrmPayments.BtnApplyPaymentClick(Sender: TObject);
var
   FacticalDebt,OverdueDebt,FacticalInterestDebt,OverdueInterestDebt :Real;
   CanPayment :Boolean;
   UseTransaction : Boolean;
begin

   FacticalDebt := FacticalDebtPaymentEdit.Value;
   OverdueDebt  := OverdueDebtPaymentEdit.Value;
   FacticalInterestDebt := FacticalInterestDebtPaymentEdit.Value;
   OverdueInterestDebt  := OverdueInterestDebtPaymentEdit.Value;

   CanPayment :=(FacticalDebt+OverdueDebt+FacticalInterestDebt+OverdueInterestDebt)<>0;
   UseTransaction := CBUseTransaction.Checked;

   if  CanPayment  then  begin
   with  DataModPayments.PaymentsPackage do

     CallProcedure('AddPayment',[
                    FContractID
                   ,GetBankDate
                   ,FacticalDebt
                   ,OverdueDebt
                   ,FacticalInterestDebt
                   ,OverdueInterestDebt
                   ,UseTransaction
                   ]);

   ModalResult :=mrOk;
   end
   else ShowMessage('Senseless Payment!');

end;

procedure TFrmPayments.FormCreate(Sender: TObject);
begin
   DataModPayments :=TDataModPayments.Create(Self);
   Caption :='Payments for contract ¹ ' + MainDataModule.Contracts.FieldByName('ContractNo').AsString;
   CBUseTransaction.Checked := SBCMGetOption('cmrAutoTransactionPayment') = 'ON'
end;

procedure TFrmPayments.FormShow(Sender: TObject);
var
  ClientAccID : Integer;
  OverdueAccID : Integer;
  InterestAccID : Integer;
  OInterestAccID : Integer;
begin
  with MainDataModule.Contracts do
  begin
    ClientAccID := FieldByName('ClientAccID').AsInteger;
    OverdueAccID := FieldByName('OverdueAccID').AsInteger;
    InterestAccID := FieldByName('InterestAccID').AsInteger;
    OInterestAccID := FieldByName('OverdueInterestAccID').AsInteger;
  end;
  with  DataModPayments do
  begin
    with AccountRests do
     begin
       SetVariable('AccID',ClientAccID);
       SetVariable('HDate',GetBankDate);
       Open;
     end;
    with ClentAccData do
    begin
      SetVariable('ClientAccID',ClientAccID);
      Open;
    end;
    with OverdueAccData do
    begin
      SetVariable('ClientAccID',OverdueAccID);
      Open;
    end;
    with InterestAccData do
    begin
      SetVariable('ClientAccID',InterestAccID);
      Open;
    end;
    with OInterestAccData do
    begin
      SetVariable('ClientAccID',OInterestAccID);
      Open;
    end;
  end;

end;

procedure TFrmPayments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataModPayments.AccountRests.Close;
end;

procedure TFrmPayments.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    BtnClose.Click;
end;

end.
