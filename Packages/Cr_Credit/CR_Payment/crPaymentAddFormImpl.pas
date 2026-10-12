unit crPaymentAddFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls,
  CMCurrencyEdit, ActnList,oracle, DBGridEh;

type
  TPaymentAddForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboboxEhCustAcc: TDBLookupComboboxEh;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    Panel2: TPanel;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    StaticText2: TStaticText;
    DBEditEh3: TDBEditEh;
    Panel5: TPanel;
    StaticText3: TStaticText;
    DBEditEh4: TDBEditEh;
    Panel6: TPanel;
    StaticText4: TStaticText;
    MainAmtEdit: TCMCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    StaticText1: TStaticText;
    DBEditEh2: TDBEditEh;
    Panel7: TPanel;
    StaticText5: TStaticText;
    DBEditEh5: TDBEditEh;
    Panel8: TPanel;
    StaticText6: TStaticText;
    IntAmtEdit: TCMCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel9: TPanel;
    StaticText7: TStaticText;
    DBEditEh6: TDBEditEh;
    Panel10: TPanel;
    StaticText8: TStaticText;
    DBEditEh7: TDBEditEh;
    Panel11: TPanel;
    StaticText9: TStaticText;
    DueAmtEdit: TCMCurrencyEdit;
    GroupBox4: TGroupBox;
    Panel12: TPanel;
    Panel13: TPanel;
    StaticText11: TStaticText;
    DBEditEh9: TDBEditEh;
    Panel14: TPanel;
    StaticText12: TStaticText;
    PenaltyAmtEdit: TCMCurrencyEdit;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnClose: TAction;
    GroupBox6: TGroupBox;
    Panel15: TPanel;
    StaticText13: TStaticText;
    DBEditEh10: TDBEditEh;
    Panel16: TPanel;
    StaticText14: TStaticText;
    DBEditEh11: TDBEditEh;
    Panel17: TPanel;
    StaticText15: TStaticText;
    DueIntAmtEdit: TCMCurrencyEdit;
    StaticText10: TStaticText;
    DBEditEh8: TDBEditEh;
    Panel20: TPanel;
    Panel19: TPanel;
    StaticText17: TStaticText;
    FullPayAmt: TCMCurrencyEdit;
    Panel18: TPanel;
    StaticText16: TStaticText;
    CBFullPay: TCheckBox;
    ExpdateCount: TCMCurrencyEdit;
    ChBchangePlandat: TCheckBox;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure ActnAcceptUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEhCustAccKeyValueChanged(Sender: TObject);
    procedure CBFullPayClick(Sender: TObject);
  private
      procedure GeneratePlanPayment;
      procedure GenerateFullPayment;
  public
   crdid :integer;
  end;

var
  PaymentAddForm: TPaymentAddForm;

implementation

uses crPaymentDataModuleImpl, crCommonDecls, sbSystem;

{$R *.DFM}


procedure TPaymentAddForm.GeneratePlanPayment;
begin
   with PaymentDataModuleCr,cm_utils do
   begin
      MainAmtEdit.Value := CallFloatFunction('Get_MainPlanPayment',[crdid]);
      IntAmtEdit.Value := CallFloatFunction('Get_IntPlanPayment',[crdid]);
      DueAmtEdit.Value := PaymentDataModuleCr.DueRest.FieldbyName('DUEREST').AsFloat;
      DueIntAmtEdit.Value := PaymentDataModuleCr.DueIntRest.FieldbyName('DUEINTERESTREST').AsFloat;
      PenaltyAmtEdit.Value := CallFloatFunction('Get_creditPenalty',[crdid]);
      FullPayAmt.Value := MainAmtEdit.Value+IntAmtEdit.Value+PenaltyAmtEdit.Value+
      PaymentDataModuleCr.DueRest.FieldbyName('DUEREST').AsFloat+
      PaymentDataModuleCr.DueIntRest.FieldbyName('DUEINTERESTREST').AsFloat;

   with expcrdcnt do
    begin
      if active then Close;
      SetVariable('CrdID',CrdID);
      SetVariable('dat',Get_CurrentDate);
      Open;
    end;

      ExpdateCount.Text := IntToStr(expcrdcnt.FieldByName('EXDATCOUNT').AsInteger);

   end;

end;

procedure TPaymentAddForm.GenerateFullPayment;
var pen :real;
begin
   with PaymentDataModuleCr,cm_utils do
   begin
      MainAmtEdit.Text := FloatToStr(LoanRest.FieldByName('REST').AsFloat);
      IntAmtEdit.Text := FloatToStr(IntRest.FieldByName('INTERESTREST').AsFloat);;
      PenaltyAmtEdit.Text := FloatToStr(CallFloatFunction('Get_creditPenalty',[crdid]));
      pen := round(MainAmtEdit.Value/100) ;
      FullPayAmt.Value := MainAmtEdit.Value+IntAmtEdit.Value+PenaltyAmtEdit.Value+
      {pen+}DueAmtEdit.Value+DueIntAmtEdit.Value;
   end;

end;


procedure TPaymentAddForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TPaymentAddForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close;
end;

procedure TPaymentAddForm.ActnAcceptExecute(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Kreditin ödənilməsi ...';
var
  Date : TDateTime;
  CustAccID, PenaltyAccID: Integer;
  MainAmt, IntAmt, DueAmt, DueIntAmt ,PenaltyAmt: Real;
  TrProcess : Boolean;
  CommitTranche : Boolean;
begin
 // CrdID := Get_SelectedCrdID;
  CustAccID := DBLookupComboboxEhCustAcc.ListSource.DataSet.FieldByName('ACCID').AsInteger;
  PenaltyAccID := PaymentDataModuleCr.cm_utils.CallIntegerFunction('Get_CreditPenaltyAccID',[CrdID]);
  TrProcess := True;
  Date := Get_CurrentDate;

  MainAmt := MainAmtEdit.Value;
  IntAmt  := IntAmtEdit.Value;
  DueAmt  := DueAmtEdit.Value;
  DueIntAmt := DueIntAmtEdit.Value;
  PenaltyAmt := PenaltyAmtEdit.Value;

  with PaymentDataModuleCr do
  CM_PAYMENT.CallProcedure('PaymentAdd',[
    'p_CreditID', CrdID,
    'p_Date', Date,
    'p_CustAccID', CustAccID,
    'P_PenaltyAccID',PenaltyAccID,
    'p_MainDebt', MainAmt,
    'p_MainInterest', IntAmt,
    'p_DueDebt', DueAmt,
    'p_DueInterest', DueIntAmt,
    'P_PenaltyRest',PenaltyAmt,
    'p_ProcessTransactions', TrProcess,
    'p_fullpayment',CBFullPay.checked,
    'p_changeplandate',ChBchangePlandat.checked
  ]);


  try

    CommitTranche := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Self.Update;

    with PaymentDataModuleCr do
    CM_PAYMENT.CallProcedure('CommitPayment',[
       'DoCommit' , CommitTranche
    ]);

    if CommitTranche then
    Self.ModalResult := mrOk;

    Self.Update;

  except

    with PaymentDataModuleCr do
    CM_PAYMENT.CallProcedure('CommitPayment',[
       'DoCommit' , False
    ]);

    raise;

  end;

end;

procedure TPaymentAddForm.ActnCloseExecute(Sender: TObject);
begin
  Close
end;

procedure TPaymentAddForm.ActnAcceptUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled :=
                      (MainAmtEdit.Value >= 0)   and
                      (IntAmtEdit.Value >= 0)    and
                      (DueAmtEdit.Value >= 0)    and
                      (DueIntAmtEdit.Value >= 0) and
                      (MainAmtEdit.Value +
                       IntAmtEdit.Value +
                       DueAmtEdit.Value +
                       DueIntAmtEdit.Value > 0)
end;

procedure TPaymentAddForm.FormShow(Sender: TObject);
begin

  with PaymentDataModuleCr do
  begin
    MainAmtEdit.ReadOnly := LoanRest.FieldByName('ACC_NO').IsNull;
    IntAmtEdit.ReadOnly :=  IntRest.FieldByName('ACC_NO').IsNull;
    DueAmtEdit.ReadOnly :=  DueRest.FieldByName('ACC_NO').IsNull;
    DueIntAmtEdit.ReadOnly := DueIntRest.FieldByName('ACC_NO').IsNull;
  end;
  GeneratePlanPayment;
  CBFullPay.Checked := False;
  ChBchangePlandat.Checked := true;
end;

procedure TPaymentAddForm.DBLookupComboboxEhCustAccKeyValueChanged(
  Sender: TObject);
var
  CustomerCanPay : Real;
  Temp : Real;
begin

  MainAmtEdit.Value := 0;
  IntAmtEdit.Value := 0;
  DueAmtEdit.Value := 0;
  DueIntAmtEdit.Value := 0;

  with PaymentDataModuleCr do
  begin

    CustomerCanPay := PaymentAccounts.FieldByName('REST').AsFloat;

    Temp := DueRest.FieldByName('DUEREST').AsFloat;
    if (Temp > 0) and (CustomerCanPay > 0) then
    begin
      if Temp > CustomerCanPay then
        DueAmtEdit.Value := CustomerCanPay
      else
        DueAmtEdit.Value := Temp;

      CustomerCanPay := CustomerCanPay - Temp;
    end;

    Temp := DueIntRest.FieldByName('DUEINTERESTREST').AsFloat;
    if (Temp > 0) and (CustomerCanPay > 0) then
    begin
      if Temp > CustomerCanPay then
        DueIntAmtEdit.Value := CustomerCanPay
      else
        DueIntAmtEdit.Value := Temp;

      CustomerCanPay := CustomerCanPay - Temp;
    end;

    Temp := IntRest.FieldByName('INTERESTREST').AsFloat;
    if (Temp > 0) and (CustomerCanPay > 0) then
    begin
      if Temp > CustomerCanPay then
        IntAmtEdit.Value := CustomerCanPay
      else
        IntAmtEdit.Value := Temp;

      CustomerCanPay := CustomerCanPay - Temp;
    end;

    Temp := LoanRest.FieldByName('REST').AsFloat;
    if (Temp > 0) and (CustomerCanPay > 0) then begin
      if Temp > CustomerCanPay then
        MainAmtEdit.Value := CustomerCanPay
      else
        MainAmtEdit.Value := Temp;
      CustomerCanPay := CustomerCanPay - Temp;
    end;

    Temp := LoanRest.FieldByName('PENALTYREST').AsFloat;
    if (Temp > 0) and (CustomerCanPay > 0) then 
      if Temp > CustomerCanPay then
        PenaltyAmtEdit.Value := CustomerCanPay
      else
        PenaltyAmtEdit.Value := Temp;

  end;
end;

procedure TPaymentAddForm.CBFullPayClick(Sender: TObject);
begin
   if  CBFullPay.Checked then
      GenerateFullPayment else
      GeneratePlanPayment;

end;

end.
