unit TransactionPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ImgList, ExtCtrls, CurrencyEdit, DBCtrls, Mask,
  DBViewComboBox, Db, SearchEdit, ActnList;

type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);

type
  TTransactionEditForm = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    PanelCredit: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    GroupBox2: TGroupBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    CurrencyEditDebit: TCurrencyEdit;
    CurrencyEditCredit: TCurrencyEdit;
    CurrencyEditLammount: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    CashSymbolDBEdit: TDBEdit;
    ConvertationSymbolIDBEdit: TDBEdit;
    Panel16: TPanel;
    TrDestNoEdit: TEdit;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    DebitCurrencyIDEdit: TDBEdit;
    DebitCurrencyRate: TDBEdit;
    CreditCurrencyIDEdit: TDBEdit;
    CreditCurrencyRate: TDBEdit;
    DebitCurrencyLookUp: TDBLookupComboBox;
    CreditCurrencyLookUp: TDBLookupComboBox;
    CreditAccNoLookUp: TDBLookupComboBox;
    DebitAccNoLookUp: TDBLookupComboBox;
    DebtAccSearchEdit: TSearchEdit;
    CreditAccSearchEdit: TSearchEdit;
    DebitAccNameCB: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    TransDate: TDateTimePicker;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    PanelCreditRest: TPanel;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    OperationTypeLookUp: TDBLookupComboBox;
    DBEditOperationNo: TDBEdit;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionCancel: TAction;
    ActionExit: TAction;
    DBEdit4: TDBEdit;
    ComboBox1: TComboBox;
    DBEditDestination: TDBEdit;
    Panel3: TPanel;
    ReportIDDBEdit: TDBEdit;
    ReportIDLookUp: TDBLookupComboBox;
    Panel7: TPanel;
    CountrIDDBEdit: TDBEdit;
    CountrIDLookUp: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    procedure DebitAccNoLookUpDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CreditAccNoLookUpDropDown(Sender: TObject);
    procedure DebitCurrencyLookUpCloseUp(Sender: TObject);
    procedure CreditCurrencyLookUpCloseUp(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CashSymbolDBEditEnter(Sender: TObject);
    procedure DebtAccSearchEditEnter(Sender: TObject);
    procedure CreditAccSearchEditEnter(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure CurrencyEditDebitChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DebitCurrencyIDEditExit(Sender: TObject);
    procedure CreditCurrencyIDEditExit(Sender: TObject);

    procedure Button3Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionInsertUpdate(Sender: TObject);
    procedure TrDestNoEditChange(Sender: TObject);
    procedure TransDateChange(Sender: TObject);
    procedure CashSymbolDBEditExit(Sender: TObject);
    procedure DBEditDestinationChange(Sender: TObject);
    procedure ConvertationSymbolIDBEditExit(Sender: TObject);
    procedure DebitCurrencyRateChange(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private

  public
    TransactionSide: TTransactionSide;

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

    procedure SIK(var message: TMessage); message WM_KILLFOCUS;
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;

  end;

var
  TransactionEditForm: TTransactionEditForm;

implementation

uses TransactionDataModuleUnit, TransactionManagerImpl, sboapidatamoduleimpl,
  TransactionDestinationImpl, BProcTrans;

{$R *.DFM}

procedure TTransactionEditForm.SIK(var message: TMessage);
begin
// ShowMessage('SIK');
 inherited;

end;

procedure TTransactionEditForm.SetCurrencyFilter(AccountDataSet, CurrencyDataSet: TDataSet);
var
   AccountID: integer;
begin
 AccountID :=AccountDataSet.FieldByName('ID').AsInteger;
 AccountDataSet.Filtered :=False;
 AccountDataSet.Filter :='val_acc='+CurrencyDataSet.FieldByName('ID').AsString;
 AccountDataSet.Filtered :=True;
 AccountDataSet.Locate('ID',AccountID,[]);
end;

procedure TTransactionEditForm.OperationCancel;
begin
 with TransactionDataModule, Transactions do
  if State in [dsInsert, dsEdit] then
  begin
   Cancel;
   RefreshRecord; //-->Сменить на что нибудь нормальное!!!
  end;
end;

procedure TTransactionEditForm.SetAmmounts(TransactionSide: TTransactionSide);
var
   DebetRate, CreditRate, DebitAmmount,CreditAmmount,LAmmount: Currency;
begin
 with TransactionDataModule do
 begin
  DebetRate :=DebitCurrencyData.FieldByName('Rate').AsCurrency;
  CreditRate :=CreditCurrencyData.FieldByName('Rate').AsCurrency;
 end;
 case TransactionSide of
  tsDebet:
         begin
          LAmmount:=RoundNew(CurrencyEditDebit.Value * DebetRate, 10000);
          CreditAmmount:=RoundNew(LAmmount / CreditRate, 10000);
          CurrencyEditLammount.Value :=RoundNew(LAmmount, 100);
          CurrencyEditCredit.Value :=RoundNew(CreditAmmount , 100);

          //CurrencyEditLammount.Value :=RoundNew(CurrencyEditDebit.Value * DebetRate, 100);
          //CurrencyEditCredit.Value :=RoundNew(CurrencyEditLammount.Value / CreditRate, 100);
         end;
  tsCredit:
         begin
          LAmmount:= RoundNew(CurrencyEditCredit.Value * CreditRate, 10000);
          DebitAmmount:=RoundNew(LAmmount / DebetRate, 10000);
          CurrencyEditLammount.Value :=RoundNew(LAmmount, 100);
          CurrencyEditDebit.Value :=RoundNew(DebitAmmount, 100);

         // CurrencyEditLammount.Value :=RoundNew(CurrencyEditCredit.Value * CreditRate, 100);
         // CurrencyEditDebit.Value :=RoundNew(CurrencyEditLammount.Value / DebetRate, 100);
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

procedure TTransactionEditForm.SetCashSymbol;
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

procedure TTransactionEditForm.CMDialogKey(var Msg: TWMKey);
begin
// if not (ActiveControl is TButton) then
 // if Msg.Charcode = 13 then
  // Msg.Charcode := 9;
  inherited;
end;

procedure TTransactionEditForm.Init;  // Modified by TNariman at 1.Jul.2004
                                      // UnModified version shown below at 274
begin
 with TransactionManagerForm, TransactionDataModule, Transactions do
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
function TTransactionEditForm.RoundNew(X: Double; Precision: Integer ): Double;
var
  ScaledFractPart, Temp : Double;
begin
  ScaledFractPart := Frac(X)*Precision;
  Temp := Frac(ScaledFractPart);
  ScaledFractPart := Int(ScaledFractPart);
  //if Temp >= 0.5 then ScaledFractPart := ScaledFractPart + 1; ***Closed by Hesen R.***
  //if Temp <= -0.5 then ScaledFractPart := ScaledFractPart - 1; ***Closed by Hesen R.***
  if Round(Temp*100) >= 50 then ScaledFractPart := ScaledFractPart + 1; //***Written by Hesen R.***
  if Round(Temp*100) <= -50 then ScaledFractPart := ScaledFractPart - 1; //***Written by Hesen R.***
  RoundNew := Int(X) + ScaledFractPart/Precision;
end;

procedure TTransactionEditForm.ClearAmmounts;
begin
 CurrencyEditDebit.Value :=0.0;
 CurrencyEditCredit.Value :=0.0;
 CurrencyEditLammount.Value :=0.0;   
 TransactionDataModule.TransactionsREPORTID.Value := 0;
 TransactionDataModule.TransactionsCOUNTRID.Value := 0;
end;

procedure TTransactionEditForm.ResetAccountFilter(AccountDataSet: TDataSet);
begin
 with AccountDataSet do
 if Filter <> '' then
 begin
  Filtered :=False;
  Filter :='';
  Filtered :=True;
 end;
end;

procedure TTransactionEditForm.SaveTransaction;
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
     SBCommit();
    end;
end;

procedure TTransactionEditForm.ResetTransaction;
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

procedure TTransactionEditForm.Scroll;
begin
 if TransactionManagerForm.OperationMode = omEdit then
 with TransactionDataModule do
 begin
  DebitAccData.Next;
  DebitAccData.Prior;
  CreditAccData.Next;
  CreditAccData.Prior;   //  Don't laugh PADLA :)
 end;
end;


function CheckCurrency(Value: Variant): boolean;
begin
 with TransactionDataModule, Currency do
  Result :=Locate('valute', Value, []);
end;

procedure TTransactionEditForm.DebitAccNoLookUpDropDown(Sender: TObject);
begin
 with TransactionDataModule do
  SetCurrencyFilter(DebitAccData, DebitCurrencyData);
end;


procedure TTransactionEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
try //if Modifed then  // Modified by TNariman at 21.Jun.2004. Offical tanks to Mamed m. for FC(compare).
 with TransactionDataModule do
 begin
  ResetAccountFilter(DebitAccData);
  ResetAccountFilter(CreditAccData);
  ResetAccountFilter(CashSymbols);
 end;
 OperationCancel;
except
  on E: Exception do ShowMessage(E.Message);
end;
end;

procedure TTransactionEditForm.FormShow(Sender: TObject);
begin
 Init;
 Scroll;
 Modifed :=False;
end;

procedure TTransactionEditForm.CreditAccNoLookUpDropDown(Sender: TObject);
begin
 with TransactionDataModule do
  SetCurrencyFilter(CreditAccData, CreditCurrencyData);
end;

procedure TTransactionEditForm.DebitCurrencyLookUpCloseUp(Sender: TObject);
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

procedure TTransactionEditForm.CreditCurrencyLookUpCloseUp(
  Sender: TObject);
begin
begin
 with CreditAccSearchEdit, TransactionDataModule do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+CreditCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;
  TDBLookupComboBox(Sender).DataSource.DataSet.FieldByName('CREDITRATE').AsCurrency :=TDBLookupComboBox(Sender).ListSource.DataSet.FieldByName('RATE').AsCurrency;
 end;
end;
end;

procedure TTransactionEditForm.DebtAccSearchEditChange(Sender: TObject);
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

procedure TTransactionEditForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Ord(Key) = VK_RETURN then
  with Sender as TControl do
   SelectNext(ActiveControl, True, True);
end;

procedure TTransactionEditForm.CashSymbolDBEditEnter(Sender: TObject);
begin
 SetCashSymbol;
end;

procedure TTransactionEditForm.DebtAccSearchEditEnter(Sender: TObject);
begin
 with TransactionDataModule do
 begin
  SetCurrencyFilter(DebitAccData, DebitCurrencyData);
  if TEdit(Sender).Text = EmptyStr then
   Transactions.FieldByName('DebitID').Clear;
 end;
end;

procedure TTransactionEditForm.CreditAccSearchEditEnter(Sender: TObject);
begin
 with TransactionDataModule do
 begin
  SetCurrencyFilter(CreditAccData, CreditCurrencyData);
  if TEdit(Sender).Text = EmptyStr then
   Transactions.FieldByName('CreditID').Clear;
 end;
end;

procedure TTransactionEditForm.CreditAccSearchEditChange(Sender: TObject);
begin
 with TSearchEdit(Sender), TransactionDataModule, Transactions do
 begin
 if Text = EmptyStr then
 begin
  TransactionDataModule.Transactions.FieldByName('CreditID').Clear;
  TransactionDataModule.Transactions.FieldByName('InBalanceChar').Clear;
 end;
  Modifed :=True;
  {$B-}
  PanelCreditRest.Visible :=not(Trim(Text) = EmptyStr) and (not FieldByName('CreditID').IsNull);
  {$B+}
 end;
end;

procedure TTransactionEditForm.CurrencyEditDebitChange(Sender: TObject);
begin
 CutEditText(Sender);
 if TCurrencyEdit(Sender).Text =EmptyStr then TCurrencyEdit(Sender).Value :=0;
 case TCurrencyEdit(Sender).Tag of
  1: TransactionSide :=tsDebet;
  2: TransactionSide :=tsCredit;
  3: TransactionSide :=tsUnknown;
 end;
  SetAmmounts(TransactionSide);
  Modifed :=True;
end;

procedure TTransactionEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F3 then
 with TransactionDestinationForm, TransactionDataModule do
 begin
  ShowModal;
  if ModalResult = mrOk then
  begin
   Transactions.FieldByName('Name').AsString :=Value;
   TrDestNoEdit.Text :=TrDest. FieldByName('ID').AsString;
  end;
 end
 else
  if Key = VK_ESCAPE then
   Close;
end;

procedure TTransactionEditForm.FormCreate(Sender: TObject);
begin
 with TransactionDataModule, Sysdat, TransDate do
 begin
  if not DebitAccData.Active then DebitAccData.Open;
  if not CreditAccData.Active then CreditAccData.Open;
  if ReportDesc.Active then ReportDesc.Close;
  ReportDesc.Open;
  if Country.Active then Country.Close;
  Country.Open;
  DateTime :=FieldByName('tek_dat').AsDateTime;

  if TransactionsCOUNTRID.AsString='' then begin
    CountrIDDBEdit.Text := '0';
    CountrIDLookUp.KeyValue := 0;
  end;

  if TransactionsREPORTID.AsString='' then begin
    ReportIDDBEdit.Text := '0';
    ReportIDLookUp.KeyValue := 0;    
  end;

 end;
end;

procedure TTransactionEditForm.DebitCurrencyIDEditExit(Sender: TObject);
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

procedure TTransactionEditForm.CreditCurrencyIDEditExit(Sender: TObject);
begin
 with TDBEdit(Sender), TransactionDataModule, Transactions do
  if not CheckCurrency(Text) then
   begin
    CreditAccSearchEdit.Text :=EmptyStr;
    FieldByName('CreditRate').Clear;
    Color :=clRed;
    SetFocus;
   end
  else
   Color :=clWindow;
end;

procedure TTransactionEditForm.Button3Click(Sender: TObject);
begin
 OperationCancel;
 TransactionDataModule.Transactions.Insert;
end;

procedure TTransactionEditForm.ActionCancelExecute(Sender: TObject);
begin
 ResetTransaction;
end;

procedure TTransactionEditForm.ActionExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TTransactionEditForm.ActionInsertExecute(Sender: TObject);
begin
 SaveTransaction;
 ResetTransaction;
end;



procedure TTransactionEditForm.ActionInsertUpdate(Sender: TObject);
begin
 with (Sender as TAction), TransactionDataModule.Transactions do
  Enabled :=
      Modifed 
      and (not FieldByName('DebitID').IsNull)
      and (not FieldByName('CreditID').IsNull)
      and (CurrencyEditLammount.Value<>0.0);
end;

procedure TTransactionEditForm.TrDestNoEditChange(Sender: TObject);
begin
 with TEdit(Sender), TransactionDestinationForm.TrDest, TransactionDataModule do
  if Text <> EmptyStr then
   if Locate('ID', Text, []) then
    Transactions.FieldByName('Name').AsString :=FieldByName('Name').AsString;
end;

procedure TTransactionEditForm.TransDateChange(Sender: TObject);
begin
 Modifed :=True;
end;

procedure TTransactionEditForm.CashSymbolDBEditExit(Sender: TObject);
var
   CashSymbol: Word;
begin
 with TDBEdit(Sender), TransactionDataModule do
 begin
  if Text = EmptyStr then Exit;
  CashSymbol :=Transactions.FieldByName('InBalanceChar').AsInteger;
  if not CashSymbols.Locate('Symbol', CashSymbol, []) then
   begin
    Modifed :=False;
    Color :=clRed;
    SetFocus;
   end
  else
   begin
    Color :=clWhite;
    Modifed :=True;
   end;
 end;
end;

procedure TTransactionEditForm.DBEditDestinationChange(Sender: TObject);
begin
 Modifed :=True;
end;

procedure TTransactionEditForm.ConvertationSymbolIDBEditExit(
  Sender: TObject);
var
   ConvertationSymbol: Word;
begin
 with TDBEdit(Sender), TransactionDataModule do
 begin
  if Text = EmptyStr then Exit;
  ConvertationSymbol :=Transactions.FieldByName('OutBalanceChar').AsInteger;
  if not ConvertationSymbols.Locate('ID', ConvertationSymbol, []) then
   begin
    Modifed :=False;
    Color :=clRed;
    SetFocus;
   end
  else
   begin
    Color :=clWhite;
    Modifed :=True;
   end;
 end;         
end;

procedure TTransactionEditForm.DebitCurrencyRateChange(Sender: TObject);
begin
 Modifed :=True;
end;

procedure TTransactionEditForm.LoadComboData(Sender: TComboBox);
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


procedure TTransactionEditForm.ComboBox1DropDown(Sender: TObject);// Modified by Elnur,Orxan at 08.02.2005
begin
  LoadComboData(TComboBox(Sender));
end;

procedure TTransactionEditForm.ComboBox1Click(Sender: TObject);
begin
 with TransactionDataModule do
  Transactions.FieldByName('Name').AsString :=(Sender as TComboBox).Text;
end;

procedure TTransactionEditForm.Button1Click(Sender: TObject);
begin
  with TransactionDataModule, PACKBPROC do begin
    callprocedure('execbprocess',[
      BProcDataID.AsVariant,
      DebitAccNoLookUp.KeyValue,
      CreditAccNoLookUp.KeyValue,
      CurrencyEditDebit.Value,
      CurrencyEditCredit.Value,
      CurrencyEditLammount.Value,
      CashSymbolLookUp.KeyValue,
      ConvertationSymbolLookUp.KeyValue,
      DBEditDestination.text,
      ReportIDDBEdit.Text,
      CountrIDDBEdit.Text]);
    BPTransData.Close;
    BPTransData.Open;
    if frmBTrans.ShowModal = IDOK then begin
      try
      callprocedure('commitprocs',[]);
      finally
      Session.commit;
      end
    end
    else
      Session.commit;
  end;
  TransactionManagerForm.GridTransactions.DataSource.DataSet.Refresh;
end;

end.

//ShowMessage('DebitAccData: ' + TransactionDataModule.DebitAccData.Filter + '/ CreditAccData: '+TransactionDataModule.CreditAccData.Filter)

//------------------------------------------------- COMMENTS -----------------------------------------

// 249
// 318
// 338
// 711
