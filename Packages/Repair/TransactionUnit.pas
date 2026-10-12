unit TransactionUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, SearchEdit, ComCtrls, SearchCombo, Db, OracleData,
  CurrencyEdit, ActnList, HintBox, DBViewComboBox, Mask, DBCtrls,
  FieldSearchEdit;

type
  TfrmTransaction = class(TForm)
    Label2: TLabel;
    Panel1: TPanel;
    DescriptionPanel: TPanel;
    TrNameEdit: TEdit;
    TrNameB: TButton;
    TrNameCB: TDBLookupComboBox;
    TrDatePanel: TPanel;
    TransactionDateEdit: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    OutBalanceCharCB: TDBLookupComboBox;
    OutBalanceCharEdit: TFieldSearchEdit;
    InBalanceCharEdit: TFieldSearchEdit;
    InBalanceCharCB: TDBLookupComboBox;
    DebitCurrencyIDEdit: TFieldSearchEdit;
    DebitCurrencyCB: TDBLookupComboBox;
    DebitRateEdit: TEdit;
    CreditCurrencyIDEdit: TFieldSearchEdit;
    CreditCurrencyCB: TDBLookupComboBox;
    CreditRateEdit: TEdit;
    DebitAccNoSearchEdit: TFieldSearchEdit;
    DebitAccNoCB: TSearchCombo;
    CreditAccNoSearchEdit: TFieldSearchEdit;
    CreditAccNoCB: TSearchCombo;
    DebitAccNameCB: TSearchCombo;
    CreditAccNameCB: TSearchCombo;
    AccRest: TPanel;
    Label1: TLabel;
    DebitAccBalanceLabel: TLabel;
    Label3: TLabel;
    DebitLBalanceLabel: TLabel;
    Label4: TLabel;
    CreditAccBalanceLabel: TLabel;
    Label6: TLabel;
    CreditLBalanceLabel: TLabel;
    DebetAmmountPanel: TPanel;
    CreditAmmountPanel: TPanel;
    DebetLAmmountPanel: TPanel;
    DebetPanel: TPanel;
    CreditPanel: TPanel;
    DebitHeader: TPanel;
    Label7: TLabel;
    HeaderPanel: TLabel;
    Label9: TLabel;
    CredittHeader: TPanel;
    Label16: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    ButtonPanel: TPanel;
    SaveButton: TButton;
    Button3: TButton;
    ErrorHintBox: THintBox;
    DebitAmountEdit: TCurrencyEdit;
    LAmountEdit: TCurrencyEdit;
    CreditAmountEdit: TCurrencyEdit;
    procedure DebitAccNoCBChange(Sender: TObject);
    procedure DebitAccNameCBChange(Sender: TObject);
    procedure DebitAccNoSearchEditExit(Sender: TObject);
    procedure CreditAccNoCBChange(Sender: TObject);
    procedure CreditAccNameCBChange(Sender: TObject);
    procedure CreditAccNoSearchEditExit(Sender: TObject);
    procedure DebitCurrencyIDEditExit(Sender: TObject);
    procedure CreditCurrencyIDEditExit(Sender: TObject);
    procedure OutBalanceCharEditExit(Sender: TObject);
    procedure OutBalanceCharCBExit(Sender: TObject);
    procedure TrNameCBExit(Sender: TObject);
    procedure TrNameBClick(Sender: TObject);
    procedure TrNameCBClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DebitAmountEditChange(Sender: TObject);
    procedure CreditAmountEditChange(Sender: TObject);
    procedure LAmountEditChange(Sender: TObject);
    procedure LAmountEditExit(Sender: TObject);
    procedure CutEditText(Sender: TObject);
    procedure SetNull(Mode : Char);
    procedure DebitCurrencyCBClick(Sender: TObject);
    procedure CreditCurrencyCBClick(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransaction: TfrmTransaction;

implementation
 uses RepairMainFormImpl, sboapidatamoduleimpl, repairdatamodule,SBCore{temporary};
{$R *.DFM}

procedure TfrmTransaction.DebitAccNoCBChange(Sender: TObject);
begin
 DebitAccNameCB.itemindex:=DebitAccNoCB.itemindex;
 DebitAccNoSearchEdit.Text:=DebitAccNoCB.Text;
end;

procedure TfrmTransaction.CreditAccNoCBChange(Sender: TObject);
begin
 CreditAccNameCB.itemindex:=CreditAccNoCB.itemindex;
 CreditAccNoSearchEdit.Text:=CreditAccNoCB.Text;
end;

procedure TfrmTransaction.DebitAccNameCBChange(Sender: TObject);
begin
 DebitAccNoCB.itemindex:=DebitAccNameCB.itemindex;
 DebitAccNoSearchEdit.Text:=DebitAccNoCB.Text;

end;

procedure TfrmTransaction.DebitAccNoSearchEditExit(Sender: TObject);
begin
 DebitAccNoCB.DefaultStringUse:=False;
 DebitAccNoCB.itemindex:=DebitAccNoSearchEdit.DataSource.DataSet.RecNo-1;
 DebitAccNameCB.DefaultStringUse:=False;
 DebitAccNameCB.itemindex:=DebitAccNoCB.itemindex;
end;



procedure TfrmTransaction.CreditAccNameCBChange(Sender: TObject);
begin
 CreditAccNoCB.itemindex:=CreditAccNameCB.itemindex;
 CreditAccNoSearchEdit.Text:=CreditAccNoCB.Text;
end;

procedure TfrmTransaction.CreditAccNoSearchEditExit(Sender: TObject);
begin
 CreditAccNoCB.DefaultStringUse:=False;
 CreditAccNoCB.itemindex:=CreditAccNoSearchEdit.DataSource.DataSet.RecNo-1;
 CreditAccNameCB.DefaultStringUse:=False;
 CreditAccNameCB.itemindex:=CreditAccNoCB.itemindex;
end;

procedure TfrmTransaction.DebitCurrencyIDEditExit(Sender: TObject);
begin
if DebitCurrencyIDEdit.Text='' then
 DebitCurrencyIDEdit.Text:=DebitCurrencyCB.KeyValue
else
 DebitCurrencyCB.KeyValue:=StrToInt(DebitCurrencyIDEdit.Text);
 SetNull('D');
end;


procedure TfrmTransaction.CreditCurrencyIDEditExit(Sender: TObject);
begin
if CreditCurrencyIDEdit.Text='' then
 CreditCurrencyIDEdit.Text:=CreditCurrencyCB.KeyValue
else
 CreditCurrencyCB.KeyValue:=StrToInt(CreditCurrencyIDEdit.Text);
 SetNull('C');
end;

procedure TfrmTransaction.OutBalanceCharEditExit(Sender: TObject);
begin
 OutBalanceCharCB.KeyValue:=StrToInt(OutBalanceCharEdit.Text);
end;

procedure TfrmTransaction.OutBalanceCharCBExit(Sender: TObject);
begin
 OutBalanceCharEdit.Text:=OutBalanceCharCB.KeyValue;

end;

procedure TfrmTransaction.TrNameCBExit(Sender: TObject);
begin
  TrNameCB.OnClick(TrNameCB);
end;

procedure TfrmTransaction.TrNameBClick(Sender: TObject);
begin
 TrNameCB.Visible:= true;
 TrNameCB.SetFocus;
 TrNameCB.DropDown;
end;

procedure TfrmTransaction.TrNameCBClick(Sender: TObject);
begin
 trNameEdit.Text:=TrNameCB.Text;
 TrNameCB.Visible:=false;
end;

procedure TfrmTransaction.SaveButtonClick(Sender: TObject);
Var
    Result,CorMode,Flag, RecordNumber: Integer;
    TrDate:string;
    TrId  :variant;
begin
with DataMod do
begin

TrDate:=FormatDateTime('dd-mmm-yy',TransactionDateEdit.Date);
if TrMode='N' then
begin
 flag:=1;
 TrId:=Null;
end
 else
begin
 flag:=2;
 TrId:=Transactions.fieldbyname('id').AsInteger;
end;


if RepairMainForm.ChRate.Checked=false
then CorMode:=2
else
 if RepairMainForm.ChProfit.Checked
 then CorMode:=0
 else CorMode:=1;

 Result:=p_correct.CallIntegerFunction('Main', [
   'Flag', flag
  ,'CorMode', CorMode
  ,'TransactionID'   , TrId
  ,'TransactionDate' , TrDate
  ,'DebitID'         , DebitAccount.fieldbyname('AccountId').asInteger
  ,'CreditID'        , CreditAccount.fieldbyname('AccountId').asInteger
  ,'DebitAmount'     , DebitAmountEdit.value
  ,'CreditAmount'    , CreditAmountEdit.value
  ,'LAmount'         , LAmountEdit.value
  ,'DebitRate'       , StrToFloat(DebitRateEdit.text)
  ,'CreditRate'      , StrToFloat(CreditRateEdit.text)
  ,'TrName'          , TrNameEdit.text
//  ,'InBalanceChar'   , StrToInt(InBalanceCharEdit.text),
//  ,'OutBalanceChar'  , StrToInt(OutBalanceCharEdit.text)
//  ,'OperationType'   , ,
//  ,'ParentID'	    , ,
//  ,'TempID'

 ]);
end;
If Result=0 then ;

RecordNumber:=DataMod.Transactions.RecNo;
RepairMainform.ButtonRefresh.Click;
DataMod.Transactions.RecNo:=RecordNumber;
frmTransaction.Close;
end;



procedure TfrmTransaction.DebitAmountEditChange(Sender: TObject);
var
DebitRate, CreditRate :Currency;
begin
CutEditText(Sender);
DebitRate:=StrToFloat(DebitRateEdit.text);
CreditRate:=StrToFloat(CreditRateEdit.text);
  with Sender as TCurrencyEdit do
  begin
    DebitAmountEdit.Value := Value;
    LAmountEdit.Value := DebitAmountEdit.Value*DebitRate;
    if (not CreditAmountEdit.Focused) and (CreditRate <> 0.0) then
      CreditAmountEdit.Value := Sb_RoundCurrency(LAmountEdit.Value / CreditRate, CurrencyDecimals);
  end;
end;

procedure TfrmTransaction.CreditAmountEditChange(Sender: TObject);
var
DebitRate, CreditRate :Currency;
begin
CutEditText(Sender);
DebitRate:=StrToFloat(DebitRateEdit.text);
CreditRate:=StrToFloat(CreditRateEdit.text);
  with Sender as TCurrencyEdit do
  begin
    CreditAmountEdit.Value := Value;
    LAmountEdit.Value := CreditAmountEdit.Value*CreditRate;

    if (not DebitAmountEdit.Focused) and (DebitRate <> 0.0) then
      DebitAmountEdit.Value := SB_RoundCurrency(LAmountEdit.Value / DebitRate, CurrencyDecimals);
  end;
end;

procedure TfrmTransaction.LAmountEditChange(Sender: TObject);
var
  DebitRate , TempDebitRate : Currency;
  CreditRate , TempCreditRate: Currency;
begin
  CutEditText(Sender);
  with Sender as TCurrencyEdit do
  begin
//    with TransactionsDataModule.TransactionsData do
//    begin
   DebitRate:=StrToFloat(DebitRateEdit.text);
   CreditRate:=StrToFloat(CreditRateEdit.text);

//      if (FieldByName('DebitRate').IsNull) or (FieldByName('DebitRate').AsFloat = 0.0) then
//      TempDebitRate := TransactionsDataModule.DebitCurrencyData.FieldByName('Rate').AsCurrency
//      else
   TempDebitRate := DebitRate;

//      if (FieldByName('CreditRate').IsNull) or (FieldByName('CreditRate').AsFloat = 0.0) then
//      TempCreditRate := TransactionsDataModule.CreditCurrencyData.FieldByName('Rate').AsCurrency
//      else
   TempCreditRate := CreditRate;
//    if (TempDebitRate <> 0.0) and (TempCreditRate <> 0.0) then
//    begin

      if not LAmountEdit.Focused then LAmountEdit.Value := Value;
//      if not CreditLAmountEdit.Focused then CreditLAmountEdit.Value := Value;

//      inc(FCascadeRefreshDisabledCount);
//      with TransactionsDataModule do
//      try
        if
        //(DebitCurrencyData.FieldByName('ID').AsInteger = 0) and
        (not DebitAmountEdit.Focused) then
          DebitAmountEdit.Value := SB_RoundCurrency(LAmountEdit.Value / TempDebitRate, CurrencyDecimals);
        if
       // (CreditCurrencyData.FieldByName('ID').AsInteger = 0) and
        (not CreditAmountEdit.Focused) then
          CreditAmountEdit.Value := SB_RoundCurrency(LAmountEdit.Value / TempCreditRate, CurrencyDecimals);
//      finally
//        dec(FCascadeRefreshDisabledCount);
//      end;
//    end;
  end;

end;

procedure TfrmTransaction.LAmountEditExit(Sender: TObject);
begin
  with (Sender as TCurrencyEdit) do
  if (Value <= 0.0) or (Trim(Text)='') then
  begin
    ShowMessage('ּÿבכÿü "0.00" האם ב‏יצך מכלאכûהûנ.');
    SetFocus;
  end;

end;


procedure TfrmTransaction.CutEditText(Sender: TObject);
var
 X,Sel: Integer;
begin
with TCurrencyEdit(Sender) do
 begin
 if DecimalSeparator=ThousandSeparator then Exit;
  if Pos(DecimalSeparator,Text)=0 then Exit;
  Sel:=SelStart;
  X:=Length(Text)-Pos(DecimalSeparator,Text)-CurrencyDecimals;
  if (X>0) then
   begin
    Text:=Copy(Text,0,(Length(Text)-X));
    SelStart:=Sel;
   end;
 end;
end;

procedure TfrmTransaction.DebitCurrencyCBClick(Sender: TObject);
begin
 DataMod.DebitAccount.Filter:='CurrencyId='+IntToStr(DebitCurrencyCB.KeyValue);
 DataMod.DebitAccount.Filtered:=true;
 DebitCurrencyIDEdit.Text:=DebitCurrencyCB.KeyValue;
 SetNull('D');
end;

procedure TfrmTransaction.CreditCurrencyCBClick(Sender: TObject);
begin
 DataMod.CreditAccount.Filter:='CurrencyId='+IntToStr(CreditCurrencyCB.KeyValue);
 DataMod.CreditAccount.Filtered:=true;
 CreditCurrencyIDEdit.Text:=CreditCurrencyCB.KeyValue;
 SetNull('C');
end;


procedure TfrmTransaction.SetNull(Mode:Char);
begin
if mode='N' then
begin
 DebitCurrencyIDEdit.Text:='0';
 CreditCurrencyIDEdit.Text:='0';
 DebitCurrencyCB.KeyValue:=0;
 CreditCurrencyCB.KeyValue:=0;
 InBalanceCharEdit.Text:='';
 OutBalanceCharEdit.Text:='';
 TrNameEdit.Text:='';
 DataMod.DebitAccount.Filter:='CurrencyId=0';
 DataMod.DebitAccount.Filtered:=true;
 DataMod.CreditAccount.Filter:='CurrencyId=0';
 DataMod.CreditAccount.Filtered:=true;
end;

DebitRateEdit.Text:=DataMod.P_Correct.CallFloatFunction('GetRate', [
  'CurrencyID', StrToInt(DebitCurrencyIDEdit.Text),
  'ArchiveDate', FormatDateTime('d-mmmm-yy',TransactionDateEdit.Date)
]);

CreditRateEdit.Text:=DataMod.P_Correct.CallFloatFunction('GetRate', [
  'CurrencyID', StrToInt(CreditCurrencyIDEdit.Text),
  'ArchiveDate', FormatDateTime('d-mmmm-yy',TransactionDateEdit.Date)
]);
DebitAmountEdit.Text:='';
CreditAmountEdit.Text:='';
LAmountEdit.Text:='';

if (mode='D') or (mode='N') then
begin
 DebitAccNoSearchEdit.Text:='';
 DebitAccNoCB.DefaultStringUse:=true;
 DebitAccNameCB.DefaultStringUse:=true;
end;
if (mode='C') or (mode='N') then
Begin
 CreditAccNoSearchEdit.Text:='';
 CreditAccNoCB.DefaultStringUse:=true;
 CreditAccNameCB.DefaultStringUse:=true;
end;

end;


end.
