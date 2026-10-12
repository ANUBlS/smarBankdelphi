unit CO_transact_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList,Oracledata,Oracle, ComCtrls, CurrencyEdit,DB, Mask, DBCtrls, SearchEdit,
  ExtCtrls;
 
type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);
    TOperationMode = (omInsert, omEdit, omCommission);
type
  TCO_Transact = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Panel4: TPanel;
    DebitAccNameCB: TDBLookupComboBox;
    Panel5: TPanel;
    DebitAccNoLookUp: TDBLookupComboBox;
    DebtAccSearchEdit: TSearchEdit;
    Panel6: TPanel;
    DebitCurrencyIDEdit: TDBEdit;
    DebitCurrencyRate: TDBEdit;
    DebitCurrencyLookUp: TDBLookupComboBox;
    Panel2: TPanel;
    PanelCredit: TPanel;
    PanelCreditRest: TPanel;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Panel8: TPanel;
    DBLookupComboBox3: TDBLookupComboBox;
    Panel9: TPanel;
    CreditAccNoLookUp: TDBLookupComboBox;
    CreditAccSearchEdit: TSearchEdit;
    Panel10: TPanel;
    CreditCurrencyIDEdit: TDBEdit;
    CreditCurrencyRate: TDBEdit;
    CreditCurrencyLookUp: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Panel11: TPanel;
    CurrencyEditDebit: TCurrencyEdit;
    Panel12: TPanel;
    CurrencyEditCredit: TCurrencyEdit;
    Panel13: TPanel;
    CurrencyEditLammount: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolIDBEdit: TDBEdit;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    CashSymbolDBEdit: TDBEdit;
    Panel16: TPanel;
    TrDestNoEdit: TEdit;
    ComboBox1: TComboBox;
    DBEditDestination: TDBEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TransDate: TDateTimePicker;
    OperationTypeLookUp: TDBLookupComboBox;
    DBEditOperationNo: TDBEdit;
    DBEdit4: TDBEdit;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionCancel: TAction;
    ActionExit: TAction;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    procedure DebitCurrencyIDEditExit(Sender: TObject);
    procedure DebitCurrencyLookUpCloseUp(Sender: TObject);
    procedure DebitCurrencyRateChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DebtAccSearchEditEnter(Sender: TObject);
    procedure DebitAccNoLookUpDropDown(Sender: TObject);
    procedure DebitAccNameCBDropDown(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     TransactionSide: TTransactionSide;
     OperationMode: TOperationMode;
    DebitCurrencyID, CreditCurrencyID: Word;
    Modifed: Boolean;
     procedure SetCurrencyFilter(AccountDataSet, CurrencyDataSet: TDataSet);
    function RoundNew(X: Double; Precision: Integer ): Double;
    procedure SetAmmounts(TransactionSide: TTransactionSide);

    procedure ResetAccountFilter(AccountDataSet: TDataSet);
    procedure ResetTransaction;
    procedure SaveTransaction;

    procedure OperationCancel;
    procedure ClearAmmounts;
    procedure SetCashSymbol;
    procedure Scroll;

    procedure Init;

    procedure LoadComboData(Sender: TComboBox);

       procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;

  end;

var
  CO_Transact: TCO_Transact;

implementation

uses sboapidatamoduleimpl,TransactionDataModuleUnit;

{$R *.DFM}

procedure TCO_Transact.SetCurrencyFilter(AccountDataSet, CurrencyDataSet: TDataSet);
var
   AccountID: integer;
begin
 AccountID :=AccountDataSet.FieldByName('ID').AsInteger;
 AccountDataSet.Filtered :=False;
 AccountDataSet.Filter :='val_acc='+CurrencyDataSet.FieldByName('ID').AsString;
 AccountDataSet.Filtered :=True;
 AccountDataSet.Locate('ID',AccountID,[]);
end;

procedure TCO_Transact.OperationCancel;
begin
 with TransactionDataModule, Transactions do
  if State in [dsInsert, dsEdit] then
  begin
   Cancel;
   RefreshRecord; //-->Сменить на что нибудь нормальное!!!
  end;
end;

procedure TCO_Transact.SetAmmounts(TransactionSide: TTransactionSide);
var
   DebetRate, CreditRate: Currency;
begin
 with TransactionDataModule do
 begin
  DebetRate :=DebitCurrencyData.FieldByName('Rate').AsCurrency;
  CreditRate :=CreditCurrencyData.FieldByName('Rate').AsCurrency;
 end;
 case TransactionSide of
  tsDebet:
         begin
          CurrencyEditLammount.Value :=RoundNew(CurrencyEditDebit.Value * DebetRate, 100);
          CurrencyEditCredit.Value :=RoundNew(CurrencyEditLammount.Value / CreditRate, 100);
         end;
  tsCredit:
         begin
          CurrencyEditLammount.Value :=RoundNew(CurrencyEditCredit.Value * CreditRate, 100);
          CurrencyEditDebit.Value :=RoundNew(CurrencyEditLammount.Value / DebetRate, 100);
         end;
  tsUnknown:
        begin
         with TransactionDataModule do
         begin
          if DebitCurrencyData.FieldByName('ID').AsInteger = 0 then
           CurrencyEditDebit.Value :=CurrencyEditLammount.Value;
          if CreditCurrencyData.FieldByName('ID').AsInteger = 0 then
           CurrencyEditCredit.Value :=CurrencyEditLammount.Value;
         end;
        end;
 end;
end;

procedure TCO_Transact.LoadComboData(Sender: TComboBox);
begin
 with TransactionDataModule.Destinations, Sender do
  begin
    if not(Active) then Open
    else
      begin
       Refresh;
      end;
   if Items.Count<>RecordCount then
     begin
       Items.Clear;
       First;
     while not(EOF) do
        begin
         Items.Add(FieldByName('NAME').AsString);
         Next;
        end;
     end;
  end;
end;

procedure TCO_Transact.SetCashSymbol;
begin
 with TransactionDataModule, CashSymbolLookUp do
 begin
  if (DebitAccData.FieldByName('IsCacheAccount').AsInteger = 1) and (DebitAccData.FieldByName('val_acc').AsInteger = 0) then
   ListSource.DataSet.Filter :='Mediocrity = 0'
  else
  if (CreditAccData.FieldByName('IsCacheAccount').AsInteger = 1) and (CreditAccData.FieldByName('val_acc').AsInteger = 0) then
   ListSource.DataSet.Filter :='Mediocrity = 1'
  else
   ListSource.DataSet.Filter :='Mediocrity = -1';
  ListSource.DataSet.Filtered :=False;
  ListSource.DataSet.Filtered :=True;
 end;
end;

procedure TCO_Transact.CMDialogKey(var Msg: TWMKey);
begin
// if not (ActiveControl is TButton) then
 // if Msg.Charcode = 13 then
  // Msg.Charcode := 9;
  inherited;
end;

procedure TCO_Transact.Init;  // Modified by TNariman at 1.Jul.2004
                                      // UnModified version shown below at 274
begin
 with TransactionDataModule, Transactions do
 case OperationMode of
  omInsert:
    begin
     FieldByName('DebitCurrencyID').AsInteger :=0;
     FieldByName('CreditCurrencyID').AsInteger :=0;
     FieldByName('DebitRate').AsFloat :=DebitCurrencyData.FieldByName('Rate').AsFloat;
     FieldByName('CreditRate').AsFloat :=CreditCurrencyData.FieldByName('Rate').AsFloat;
     FieldByName('DebitID').Clear;
     FieldByName('CreditID').Clear;
     PanelDebitRest.Visible :=False;
     PanelCreditRest.Visible :=False;
    end;
  omEdit:
    begin
     TransDate.DateTime :=FieldByName('TransactionDate').AsDateTime;
     DebtAccSearchEdit.Text :=FieldByName('DebitAccNo').AsString;
     CreditAccSearchEdit.Text :=FieldByName('CreditAccNo').AsString;
     CurrencyEditDebit.Value :=FieldByName('DebitAmount').AsCurrency;
     CurrencyEditCredit.Value :=FieldByName('CreditAmount').AsCurrency;
     CurrencyEditLammount.Value :=FieldByName('Lamount').AsCurrency;
    end;
  omCommission:
    begin
     FieldByName('DebitCurrencyID').AsInteger :=Commission.FieldByName('DebitCurrencyID').AsInteger;
     FieldByName('CreditCurrencyID').AsInteger :=Commission.FieldByName('CreditCurrencyID').AsInteger;
     FieldByName('DebitID').AsInteger :=Commission.FieldByName('Debt').AsInteger;
     FieldByName('CreditID').AsInteger :=Commission.FieldByName('Credit').AsInteger;
     DebtAccSearchEdit.Text :=Commission.FieldByName('DebitAccount').AsString;
     CreditAccSearchEdit.Text :=Commission.FieldByName('CreditAccount').AsString;
     FieldByName('Name').AsString :=Commission.FieldByName('Assignment').AsString;
     PanelDebitRest.Visible :=DebtAccSearchEdit.Text <> EmptyStr;
     PanelCreditRest.Visible :=CreditAccSearchEdit.Text <> EmptyStr;
    end;
 end;
end;

{procedure TTransactionEditForm.Init;
begin
 with TransactionManagerForm, TransactionDataModule, Transactions do
 if OperationMode = omInsert then
  begin
   FieldByName('DebitCurrencyID').AsInteger :=0;
   FieldByName('CreditCurrencyID').AsInteger :=0;
   FieldByName('DebitRate').AsFloat :=DebitCurrencyData.FieldByName('Rate').AsFloat;
   FieldByName('CreditRate').AsFloat :=CreditCurrencyData.FieldByName('Rate').AsFloat;
   FieldByName('DebitID').Clear;
   FieldByName('CreditID').Clear;
   PanelDebitRest.Visible :=False;
   PanelCreditRest.Visible :=False;
  end
 else
  begin
   TransDate.DateTime :=FieldByName('TransactionDate').AsDateTime;
   DebtAccSearchEdit.Text :=FieldByName('DebitAccNo').AsString;
   CreditAccSearchEdit.Text :=FieldByName('CreditAccNo').AsString;
   CurrencyEditDebit.Value :=FieldByName('DebitAmount').AsCurrency;
   CurrencyEditCredit.Value :=FieldByName('CreditAmount').AsCurrency;
   CurrencyEditLammount.Value :=FieldByName('Lamount').AsCurrency;
  end;
end;}

procedure CutEditText(Sender: TObject);//Eldarix
var
 X, Sel: Integer;
begin
with TCurrencyEdit(Sender) do
 begin
 if DecimalSeparator=ThousandSeparator then Exit;
  if Pos(DecimalSeparator,Text) = 0 then Exit;
  Sel :=SelStart;
  X :=Length(Text)-Pos(DecimalSeparator,Text)-CurrencyDecimals;
  if (X>0) then
   begin
    Text:=Copy(Text, 0, (Length(Text)-X));
    SelStart :=Sel;
   end;
 end;
end;

//D:\Personal\DELPHI\Delphi Examples\New\20052002.html
function TCO_Transact.RoundNew(X: Double; Precision: Integer ): Double;
var
  ScaledFractPart, Temp : Double;
begin
  ScaledFractPart := Frac(X)*Precision;
  Temp := Frac(ScaledFractPart);
  ScaledFractPart := Int(ScaledFractPart);
  if Temp >= 0.5 then ScaledFractPart := ScaledFractPart + 1;
  if Temp <= -0.5 then ScaledFractPart := ScaledFractPart - 1;
  RoundNew := Int(X) + ScaledFractPart/Precision;
end;

procedure TCO_Transact.ClearAmmounts;
begin
 CurrencyEditDebit.Value :=0.0;
 CurrencyEditCredit.Value :=0.0;
 CurrencyEditLammount.Value :=0.0;
end;

procedure TCO_Transact.ResetAccountFilter(AccountDataSet: TDataSet);
begin
 with AccountDataSet do
 if Filter <> '' then
 begin
  Filtered :=False;
  Filter :='';
  Filtered :=True;
 end;
end;

procedure TCO_Transact.SaveTransaction;
begin
  with TransactionDataModule, Transactions do
   if State in [dsEdit, dsInsert] then
    begin
     FieldByName('TransactionDate').AsDateTime :=Int(TransDate.DateTime);
     FieldByName('DebitAmount').AsCurrency :=CurrencyEditDebit.Value;
     FieldByName('CreditAmount').AsCurrency :=CurrencyEditCredit.Value;
     FieldByName('Lamount').AsCurrency :=CurrencyEditLammount.Value;

     FieldByName('Status').AsInteger :=1;
     FieldByName('DebitAccNo').AsString :=DebtAccSearchEdit.Text;
     FieldByName('CreditAccNo').AsString :=CreditAccSearchEdit.Text;
     FieldByName('DebitCurrencySName').AsString :=DebitCurrencyData.FieldByName('SName').AsString;
     FieldByName('CreditCurrencySName').AsString :=CreditCurrencyData.FieldByName('SName').AsString;
     FieldByName('OperationNo').AsString :=DBEditOperationNo.Text;

     if OperationTypeLookUp.Text = EmptyStr then
      FieldByName('OperationCode').Value :=Null;
     
     Post;
     //SBCommit();
    end;
end;

procedure TCO_Transact.ResetTransaction;
begin
 OperationCancel;
 ClearAmmounts;
 with TransactionDataModule, Transactions do
 begin
  Insert;
  FieldByName('DebitCurrencyID').AsInteger :=DebitCurrencyID;
  FieldByName('CreditCurrencyID').AsInteger :=CreditCurrencyID;
  //FieldByName('DebitID').Clear;
  //FieldByName('CreditID').Clear;       Modified by TNariman at 24.Jun.2004
 end;
end;

procedure TCO_Transact.Scroll;
begin
 if CO_Transact.OperationMode = omEdit then
 with TransactionDataModule do
 begin
  DebitAccData.Next;
  DebitAccData.Prior;
  CreditAccData.Next;
  CreditAccData.Prior;
 end;
end;


function CheckCurrency(Value: Variant): boolean;
begin
 with TransactionDataModule, Currency do
  Result :=Locate('valute', Value, []);
end;
procedure TCO_Transact.DebitCurrencyIDEditExit(Sender: TObject);
begin
 with TDBEdit(Sender), TransactionDataModule, Transactions do
  if not CheckCurrency(Text) then
   begin
    DebtAccSearchEdit.Text :=EmptyStr;
    FieldByName('DebitRate').Clear;
    Color :=clRed;
    SetFocus;
   end
  else
   Color :=clWindow;

end;

procedure TCO_Transact.DebitCurrencyLookUpCloseUp(Sender: TObject);
begin
 with DebtAccSearchEdit, TransactionDataModule do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+DebitCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;
  TDBLookupComboBox(Sender).DataSource.DataSet.FieldByName('DEBITRATE').AsCurrency :=TDBLookupComboBox(Sender).ListSource.DataSet.FieldByName('RATE').AsCurrency;
 end;

end;

procedure TCO_Transact.DebitCurrencyRateChange(Sender: TObject);
begin
 Modifed :=True;

end;

procedure TCO_Transact.DebtAccSearchEditChange(Sender: TObject);
begin
 with TSearchEdit(Sender), TransactionDataModule, Transactions do
 begin
 if Text = EmptyStr then
  begin
   FieldByName('DebitID').Clear;
   FieldByName('InBalanceChar').Clear;
  end;
  Modifed :=True;
  {$B-}
  PanelDebitRest.Visible :=not(Trim(Text) = EmptyStr) and (not FieldByName('DebitID').IsNull);
  {$B+}
 end;

end;

procedure TCO_Transact.DebtAccSearchEditEnter(Sender: TObject);
begin
 with TransactionDataModule do
 begin
  SetCurrencyFilter(DebitAccData, DebitCurrencyData);
  if TEdit(Sender).Text = EmptyStr then
   Transactions.FieldByName('DebitID').Clear;
 end;

end;

procedure TCO_Transact.DebitAccNoLookUpDropDown(Sender: TObject);
begin
 with TransactionDataModule do
  SetCurrencyFilter(DebitAccData, DebitCurrencyData);

end;

procedure TCO_Transact.DebitAccNameCBDropDown(Sender: TObject);
begin
 with TransactionDataModule do
  SetCurrencyFilter(DebitAccData, DebitCurrencyData);

end;

procedure TCO_Transact.FormActivate(Sender: TObject);
begin
//TransactionDataModule.Transactions.open;
//TransactionDataModule.DebitAccData.open;

end;

end.
