unit frmAddMoneyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, CMCurrencyEdit, ComCtrls,
  NLSLocalizer, ActnList, DBGridEh, CurrencyEdit,Variants;

type
  TfrmAddMoney = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    ActionList1: TActionList;
    ActnTransaction: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    CMCurrencyEdit1: TCMCurrencyEdit;
    Label6: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label4: TLabel;
    MoneySumEdit: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    StaticText3: TStaticText;
    Panel13: TPanel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    StaticText1: TStaticText;
    Panel14: TPanel;
    StaticText2: TStaticText;
    AccountListCB: TDBLookupComboboxEh;
    AccnameListCB: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    OperationDatePckr: TDBDateTimeEditEh;
    Panel15: TPanel;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    CheckBoxTransaction: TCheckBox;
    PercentEdit: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ActnTransactionExecute(Sender: TObject);
    procedure ActnTransactionUpdate(Sender: TObject);
    procedure AccountListCBChange(Sender: TObject);
    procedure AccnameListCBChange(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure DBLookupComboboxEh3Change(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure DBLookupComboboxEh4Change(Sender: TObject);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    
  end;

var
  frmAddMoney: TfrmAddMoney;

implementation

{$R *.DFM}
uses CommonDeclsImpl,DMApplyMoneyImpl,TemporaryTransactionsFormImpl;

procedure TfrmAddMoney.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TfrmAddMoney.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TfrmAddMoney.ActnTransactionExecute(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Depozit yatrımı ...';

var ClientAccID :Integer;
    PurchaseAccID:integer;
    CalcPerAccID:integer;
    Total : Real;
    PurchaseTotal:Real;
    CalcTotal:Real;
    Percent :Real;
    CommitDepositMoney  : Boolean;
    CBoxTrans : Boolean;

begin
  if CheckBoxTransaction.Checked then
  begin
    if AccountListCB.Text='' then
    begin
      ShowMessage('Öhdəlik hesabı sazlanmayıb!....');
      exit;
    end
    else
     ClientAccID :=AccountListCB.ListSource.DataSet.FieldByName('ID').AsInteger;

    if DBLookupComboboxEh1.Text='' then
    begin
      ShowMessage('Alış hesabı sazlanmayıb!....');
      exit;
    end
    else
     PurchaseAccID:=DBLookupComboboxEh1.ListSource.DataSet.FieldByName('id').AsInteger;

    if DBLookupComboboxEh3.Text='' then
    begin
      ShowMessage('Hesablanmış faiz hesabı sazlanmayıb!....');
      exit;
    end
    else
    CalcPerAccID:=DBLookupComboboxEh3.ListSource.DataSet.FieldByName('id').AsInteger;
  end;

   Total := MoneySumEdit.Value;
   Percent :=StrToFloat(PercentEdit.Text);
   PurchaseTotal:=CurrencyEdit2.Value;
   CalcTotal:=CMCurrencyEdit1.Value;

   if OperationDatePckr.Value<Get_BankDate
   then
      begin
        ShowMessage('Əməliyyat tarixi sistem tarixdən kiçik ola bilməz'); {neft fondu}
        exit;
      end;

   if DBDateTimeEditEh1.Value<Get_BankDate
    then
      begin
        ShowMessage('Faizin hesablama tarixi sistem tarixdən kiçik ola bilməz'); {neft fondu}
        exit;
      end;



   if CheckBoxTransaction.Checked then  CBoxTrans:=True
                                  else  CBoxTrans:=false;


   with DMApplyMoney,sbcm_tranches do
        CallProcedure('depositmoney',[
                      'P_ClientAccID',ClientAccID,
                      'P_PurchaseAccID',PurchaseAccID,
                      'P_CalcPerAccID'  ,CalcPerAccID,
                      'contractid',Get_SelectedContID,
                      'hdate',OperationDatePckr.Value,{Get_BankDate,}
                      'pdate',DBDateTimeEditEh1.Value,   {percentdate}
                      'total',Total,
                      'PurchaseTotal', PurchaseTotal,
                      'CalcTotal',CalcTotal,
                      'PERCENT',Percent,
                      'usetransaction',CBoxTrans]);

  IF CheckBoxTransaction.Checked Then
  begin
  try

    CommitDepositMoney := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;
    
    DMApplyMoney.sbcm_tranches.CallProcedure('CommitDepositMoney',['DoCommit',
       CommitDepositMoney
    ]);

    if CommitDepositMoney then
    Self.ModalResult := mrOk;
    Self.Update;
  except

   
    DMApplyMoney.sbcm_tranches.CallProcedure('CommitDepositMoney',['DoCommit',
        False
    ]);

    raise;
  end;
  end
  else
    frmAddMoney.Close;
    DMApplyMoney.TranchesDatSrc.DataSet.Refresh;
  end;
                      


procedure TfrmAddMoney.FormShow(Sender: TObject);
begin
   //ShowMessage(IntToStr(Get_SelectedContID));
   with DMApplyMoney,DepositInfo do begin
   Refresh;
   PercentEdit.Text := FloatToStr(FieldByName('interest').AsFloat);
     AccountListCB.KeyValue:=-1;
   //DBLookupComboboxEh1.KeyValue:=-1;
   //DBLookupComboboxEh3.KeyValue:=-1;
   end;
   OperationDatePckr.Value := Get_BankDate;
   MoneySumEdit.Value := 0;
   CMCurrencyEdit1.Value:=0;
   CurrencyEdit2.Value:=0;
   DBDateTimeEditEh1.Text:='';

end;


procedure TfrmAddMoney.PercentEditKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'9': ;
    #8: ;
    '.', ',':
      if Pos(DecimalSeparator, Text) = 0 then
        Key := DecimalSeparator
      else
        Key := #0;
    else
      key := #0;
  end;
end;

procedure TfrmAddMoney.ActnTransactionUpdate(Sender: TObject);
begin
   with (Sender as TAction) do
         Enabled := MoneySumEdit.Value > 0
end;

procedure TfrmAddMoney.DBLookupComboboxEh1Change(Sender: TObject);
begin
  DBLookupComboboxEh2.KeyValue:=DBLookupComboboxEh1.KeyValue;
end;

procedure TfrmAddMoney.DBLookupComboboxEh2Change(Sender: TObject);
begin
  DBLookupComboboxEh1.KeyValue:=DBLookupComboboxEh2.KeyValue;
end;

procedure TfrmAddMoney.DBLookupComboboxEh3Change(Sender: TObject);
begin
  DBLookupComboboxEh4.KeyValue:=DBLookupComboboxEh3.KeyValue;
end;

procedure TfrmAddMoney.DBLookupComboboxEh4Change(Sender: TObject);
begin
  DBLookupComboboxEh3.KeyValue:=DBLookupComboboxEh4.KeyValue;
end;

procedure TfrmAddMoney.AccountListCBChange(Sender: TObject);
begin
    AccnameListCB.KeyValue := AccountListCB.KeyValue;
end;

procedure TfrmAddMoney.AccnameListCBChange(Sender: TObject);
begin
  AccountListCB.KeyValue :=AccnameListCB.KeyValue;
end;

end.
