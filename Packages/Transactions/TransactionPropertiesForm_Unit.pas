unit TransactionPropertiesForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls, CurrencyEdit, Mask, Db, DBTables,
  Grids, DBGrids, ActnList, OracleData, DBViewComboBox, SBTransaction,
  HintBox;

type
  TTransactionMode = (tmEdit, tmNew);
  TTransactionPropertiesForm = class(TForm)
    AccountGB: TGroupBox;
    HeaderControl1: THeaderControl;
    HeaderControl2: THeaderControl;
    AmmountGB: TGroupBox;
    DebetTrAmmountPanel: TPanel;
    DebetAmmountPanel: TPanel;
    DebitAmountEdit: TCurrencyEdit;
    DebetLAmmountPanel: TPanel;
    DebitLAmountEdit: TCurrencyEdit;
    CreditTrAmmountPanel: TPanel;
    CreditAmmountPanel: TPanel;
    CreditAmountEdit: TCurrencyEdit;
    CreditLAmmountPanel: TPanel;
    CreditLAmountEdit: TCurrencyEdit;
    OtherGB: TGroupBox;
    Label14: TLabel;
    CompositeNumberEdit: TDBEdit;
    CompositeCB: TDBLookupComboBox;
    DBEdit29: TDBEdit;
    DBEdit22: TDBEdit;
    Label20: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    TrNoEdit: TEdit;
    Label17: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    InbalanceCharCB: TDBLookupComboBox;
    OutBalanceCharCB: TDBLookupComboBox;
    CypherGB: TGroupBox;
    OperationNameCB: TDBLookupComboBox;
    PackageNumberEdit: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    InBalanceCharEdit: TDBEdit;
    DBEdit11: TDBEdit;
    TrNameEdit: TDBEdit;
    ActionList1: TActionList;
    CommitAction: TAction;
    CancelAction: TAction;
    CloseAction: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DebitAccBalanceLabel: TLabel;
    Label3: TLabel;
    DebitLBalanceLabel: TLabel;
    DebetAccNamePanel: TPanel;
    DebitAccNameCB: TDBLookupComboBox;
    DebetAccNoPanel: TPanel;
    DebitAccNoSearchEdit: TEdit;
    DebitAccNoCB: TDBLookupComboBox;
    DebetCurrencyPanel: TPanel;
    DebitCurrencyIDEdit: TDBEdit;
    DBEdit5: TDBEdit;
    DebitCurrencyCB: TDBViewComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    CreditAccBalanceLabel: TLabel;
    Label6: TLabel;
    CreditLBalanceLabel: TLabel;
    CreditAccNamePanel: TPanel;
    CreditAccNameCB: TDBLookupComboBox;
    CreditAccNoPanel: TPanel;
    CreditAccNoSearchEdit: TEdit;
    CreditAccNoCB: TDBLookupComboBox;
    CreditCurrencyPanel: TPanel;
    CreditCurrencyIDEdit: TDBEdit;
    DBEdit6: TDBEdit;
    CreditCurrencyCB: TDBViewComboBox;
    Panel6: TPanel;
    DebetBankPanel: TPanel;
    Panel10: TPanel;
    DBEdit1: TDBEdit;
    Panel11: TPanel;
    DBLookupComboBox5: TDBLookupComboBox;
    CreditBankPanel: TPanel;
    Panel15: TPanel;
    DBEdit2: TDBEdit;
    Panel16: TPanel;
    DBLookupComboBox6: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    TransactionDateEdit: TDateTimePicker;
    ErrorHintBox: THintBox;
    procedure DebetCurrencyTableAfterScroll(DataSet: TDataSet);
    procedure DebitCurrencyNameCBChange(Sender: TObject);
    procedure CreditCurrencyTableAfterScroll(DataSet: TDataSet);
    procedure CreditCurrencyNameCBChange(Sender: TObject);
    procedure DebitCurrencyIDEditChange(Sender: TObject);
    procedure CreditCurrencyIDEditChange(Sender: TObject);
    procedure CreditAccQueryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DebitAccNoSearchEditChange(Sender: TObject);
    procedure CreditAccNoSearchEditChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrNoEditChange(Sender: TObject);
    procedure OnKeyPressed(Sender: TObject; var Key: Char);
    procedure DebitAccNoSearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DebitAccNoSearchEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CommitActionExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure CommitActionUpdate(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure SetDebitAmmount(Sender: TObject);
    procedure SetCreditAmmount(Sender: TObject);
    procedure SetLAmmount(Sender: TObject);
    procedure CreditAccNoSearchEditExit(Sender: TObject);
    procedure TransactionDateEditChange(Sender: TObject);
    procedure TrNameEditChange(Sender: TObject);
    procedure InBalanceCharEditExit(Sender: TObject);
    procedure CutEditText(Sender: TObject);
    procedure CreditLAmountEditExit(Sender: TObject);
    procedure CreditCurrencyCBChange(Sender: TObject);
    procedure DebitCurrencyCBChange(Sender: TObject);
  private
    { Private declarations }
    FDebitAmmount: Currency;
    FCreditAmmount: Currency;
    FLAmmount: Currency;
    FAccRefreshEnabled: Boolean;
    FCascadeRefreshDisabledCount: Integer;
  //  FMode: TTransactionMode;
    FTransactionID: Integer;
    FIsChanged: Boolean;
    FModified: Boolean;
    FInternalClosing: Boolean;
    FRefreshDisabled: Boolean;
    FSavedState: TTransaction;
    FDebitORate: Currency;
    FCreditORate: Currency;
    FTransactionDate: TDateTime;
   // FReadOnly: Boolean;
    procedure SetTransactionDate(Value: TDateTime);
    procedure SetModified(Value: Boolean);
  public
    { Public declarations }
      FMode: TTransactionMode;
       FReadOnly: Boolean;
    function New: Boolean;
    function View(ID: Integer; ReadOnly: Boolean): Boolean;
    procedure Reset;
    procedure SaveTransaction;
    procedure SaveState;
    procedure RestoreState;
    procedure SetSelectedText(Edit: TEdit; const S: String);
    property IsChanged: Boolean read FIsChanged;
    property Modified: Boolean read FModified write SetModified;
    property RefreshDisabled: Boolean read FRefreshDisabled write FRefreshDisabled;
    property DebitORate: Currency read FDebitORate write FDebitORate;
    property CreditORate: Currency read FCreditORate write FCreditORate;
    property TransactionDate: TDateTime read FTransactionDate write SetTransactionDate;
    function CheckBalanceChar: Boolean;
    function RoundNew(X: Double; Precision: Integer ): Double;
  end;

var
  TransactionPropertiesForm: TTransactionPropertiesForm;

{
  Set to -1 to clear DebitCurrencyNameCB & CreditCurrencyNameCB
}
const
  DefaultCurrency = 0;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl, TrDescrForm_Unit, TransactionsDataModuleImpl, SBCore{temporary};


function TTransactionPropertiesForm.RoundNew(X: Double; Precision: Integer ): Double;
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


function TTransactionPropertiesForm.View(ID: Integer; ReadOnly: Boolean): Boolean;
begin
  FMode := tmEdit;
  FTransactionID := ID;

  Caption := Format('Editing transaction #%d', [FTransactionID]);

  with TransactionsDataModule, TransactionsData do
  begin
    Edit;
    DebitAmountEdit.Value := FieldByName('DebitAmount').AsCurrency;
    CreditAmountEdit.Value := FieldByName('CreditAmount').AsCurrency;
    DebitLAmountEdit.Value := FieldByName('LAmount').AsCurrency;
    CreditLAmountEdit.Value := DebitLAmountEdit.Value;
    TransactionDateEdit.DateTime := FieldByName('TransactionDate').AsDateTime;
  end;

  with TransactionsDataModule do
  begin
    LastCacheAccountSide := asUnknown;
    PrepareCacheSymbols;
  end;

  Modified := False;
  FReadOnly := ReadOnly;

{  DebitCurrencyIDEdit.Enabled := False;
  DebitCurrencyCB.Enabled := False;
  DebitAccNoSearchEdit.Enabled := False;
  DebitAccNoCB.Enabled := False;
  DebitAccNameCB.Enabled := False;

  CreditCurrencyIDEdit.Enabled := False;
  CreditCurrencyCB.Enabled := False;
  CreditAccNoSearchEdit.Enabled := False;
  CreditAccNoCB.Enabled := False;
  CreditAccNameCB.Enabled := False;
 }
  if not Active then
 // begin
  ShowModal;

 { DebitCurrencyIDEdit.Enabled := True;
  DebitCurrencyCB.Enabled := True;
  DebitAccNoSearchEdit.Enabled := True;
  DebitAccNoCB.Enabled := True;
  DebitAccNameCB.Enabled := True;

  CreditCurrencyIDEdit.Enabled := True;
  CreditCurrencyCB.Enabled := True;
  CreditAccNoSearchEdit.Enabled := True;
  CreditAccNoCB.Enabled := True;
  CreditAccNameCB.Enabled := True;
  end;} //di--ABLO
  Result := FIsChanged;
end;

function TTransactionPropertiesForm.New: Boolean;
begin
  FMode := tmNew;
  Caption := 'Adding new transaction';
  Reset;
  FReadOnly := False;
  ShowModal;
  Result := FIsChanged;
end;

procedure TTransactionPropertiesForm.DebetCurrencyTableAfterScroll(
  DataSet: TDataSet);
begin
  DebitAccNoSearchEdit.Text := '';
  DebitAmountEdit.Value := 0.0;
  CreditAmountEdit.Value := 0.0;
  DebitLAmountEdit.Value := 0.0;
  CreditLAmountEdit.Value := 0.0;

  TransactionsDataModule.TransactionsData.FieldByName('DebitAccID').Clear;
end;

procedure TTransactionPropertiesForm.DebitCurrencyNameCBChange(
  Sender: TObject);
begin
  with (Sender as TComboBox), TransactionsDataModule.DebitCurrencyData do
    RecNo := ItemIndex+1;
end;

procedure TTransactionPropertiesForm.CreditCurrencyTableAfterScroll(
  DataSet: TDataSet);
begin
  CreditAccNoSearchEdit.Text := '';
  DebitAmountEdit.Value := 0.0;
  CreditAmountEdit.Value := 0.0;
  DebitLAmountEdit.Value := 0.0;
  CreditLAmountEdit.Value := 0.0;

  TransactionsDataModule.TransactionsDataCREDITID.Clear;
end;

procedure TTransactionPropertiesForm.CreditCurrencyNameCBChange(
  Sender: TObject);
begin
//  CreditCurrencyData.RecNo := (Sender as TComboBox).ItemIndex+1;
end;

procedure TTransactionPropertiesForm.DebitCurrencyIDEditChange(
  Sender: TObject);
begin
  with (Sender as TEdit) do
    if Focused then
      if TransactionsDataModule.DebitCurrencyData.Locate('ID', Text, []) then
        Color := clWhite
      else
      begin
        Color := clRed;
        Beep;
      end;
end;

procedure TTransactionPropertiesForm.CreditCurrencyIDEditChange(
  Sender: TObject);
begin
{  with (Sender as TEdit) do
    if Focused then
      if CreditCurrencyData.Locate('ID', (Sender as TEdit).Text, []) then
        Color := clWhite
      else
      begin
        Color := clRed;
        Beep;
      end;}
end;

procedure TTransactionPropertiesForm.CreditAccQueryAfterScroll(
  DataSet: TDataSet);
begin
  if CreditAccNoSearchEdit.Tag = 0 then
    SetSelectedText(CreditAccNoSearchEdit, DataSet.FieldByName('ACC_NO').AsString)
  else
    CreditAccNoSearchEdit.Tag := 0;
  if not CreditAccNoSearchEdit.Focused then
    CreditAccNoSearchEdit.Text := DataSet.FieldByName('ACC_NO').AsString;
end;

procedure TTransactionPropertiesForm.SetDebitAmmount(Sender: TObject);
var
  DebitRate: Currency;
  CreditRate: Currency;
  FDebitLammount: Currency;
begin
  CutEditText(Sender);
  with Sender as TCurrencyEdit do
  begin
    FDebitAmmount := Value;
    DebitAmountEdit.Value := Value;

    with TransactionsDataModule.DebitCurrencyData do
      DebitRate := FieldByName('Rate').AsCurrency;
    with TransactionsDataModule.CreditCurrencyData do
      CreditRate := FieldByName('Rate').AsCurrency;

//    DebitLAmountEdit.Value := Sb_RoundCurrency(DebitAmountEdit.Value*DebitRate,CurrencyDecimals);

    FDebitLammount:= RoundNew(DebitAmountEdit.Value*DebitRate,10000);

    DebitLAmountEdit.Value := RoundNew(FDebitLammount,100);
    CreditLAmountEdit.Value :=DebitLAmountEdit.Value;

    if (not CreditAmountEdit.Focused) and (CreditRate <> 0.0) and (FCascadeRefreshDisabledCount = 0) then
      //CreditAmountEdit.Value := Sb_RoundCurrency(DebitLAmountEdit.Value / CreditRate, CurrencyDecimals);
    CreditAmountEdit.Value := RoundNew(FDebitLammount / CreditRate, 100);

  end;
  Modified := True;
end;

procedure TTransactionPropertiesForm.SetCreditAmmount(Sender: TObject);
var
  DebitRate: Currency;
  CreditRate: Currency;
  FCreditLAmmount : Currency;
begin
  CutEditText(Sender);
  with Sender as TCurrencyEdit do
  begin
    FCreditAmmount := Value;
    CreditAmountEdit.Value := Value;

    with TransactionsDataModule.DebitCurrencyData do
      DebitRate := FieldByName('Rate').AsCurrency;
    with TransactionsDataModule.CreditCurrencyData do
      CreditRate := FieldByName('Rate').AsCurrency;

    // CreditLAmountEdit.Value := SB_RoundCurrency(CreditAmountEdit.Value*CreditRate, CurrencyDecimals);
    FCreditLAmmount := RoundNew(CreditAmountEdit.Value*CreditRate, 10000);
    CreditLAmountEdit.Value := RoundNew(FCreditLAmmount, 100);
    DebitLAmountEdit.Value := CreditLAmountEdit.Value;

    if (not DebitAmountEdit.Focused) and (DebitRate <> 0.0) and (FCascadeRefreshDisabledCount = 0) then
      //DebitAmountEdit.Value := SB_RoundCurrency(CreditLAmountEdit.Value / DebitRate, CurrencyDecimals);
      DebitAmountEdit.Value := RoundNew(FCreditLAmmount / DebitRate, 100);
  end;
  Modified := True;
end;

procedure TTransactionPropertiesForm.SetLAmmount(Sender: TObject);
var
  DebitRate , TempDebitRate : Currency;
  CreditRate , TempCreditRate: Currency;
begin
  CutEditText(Sender);
  with Sender as TCurrencyEdit do
  begin
    with TransactionsDataModule.TransactionsData do
    begin
      DebitRate := FieldByName('DebitRate').AsCurrency;
      CreditRate := FieldByName('CreditRate').AsCurrency;
      
      if (FieldByName('DebitRate').IsNull) or (FieldByName('DebitRate').AsFloat = 0.0) then
      TempDebitRate := TransactionsDataModule.DebitCurrencyData.FieldByName('Rate').AsCurrency
      else
      TempDebitRate := DebitRate;

      if (FieldByName('CreditRate').IsNull) or (FieldByName('CreditRate').AsFloat = 0.0) then
      TempCreditRate := TransactionsDataModule.CreditCurrencyData.FieldByName('Rate').AsCurrency
      else
      TempCreditRate := CreditRate;
    end;

    if (TempDebitRate <> 0.0) and (TempCreditRate <> 0.0) then
    begin
      FLAmmount := Value;

      if not DebitLAmountEdit.Focused then
        DebitLAmountEdit.Value := Value;
      if not CreditLAmountEdit.Focused then
        CreditLAmountEdit.Value := Value;

      inc(FCascadeRefreshDisabledCount);
      with TransactionsDataModule do
      try
        if (DebitCurrencyData.FieldByName('ID').AsInteger = 0) and (not DebitAmountEdit.Focused) then
         // DebitAmountEdit.Value := SB_RoundCurrency(DebitLAmountEdit.Value / TempDebitRate, CurrencyDecimals);
          DebitAmountEdit.Value := RoundNew(DebitLAmountEdit.Value / TempDebitRate, 100);

        if (CreditCurrencyData.FieldByName('ID').AsInteger = 0) and (not CreditAmountEdit.Focused) then
          //CreditAmountEdit.Value := SB_RoundCurrency(CreditLAmountEdit.Value / TempCreditRate, CurrencyDecimals);
          CreditAmountEdit.Value := RoundNew(CreditLAmountEdit.Value / TempCreditRate, 100);
      finally
        dec(FCascadeRefreshDisabledCount);
      end;
    end;
  end;
  Modified := True;
end;

procedure TTransactionPropertiesForm.SaveTransaction;
ResourceString
  sConvertationNotEnteredMsg = 'ƒигг€т: конвертасиййа т€йинаты дахил олунмайыб. –едакт€ни давам етм€й€ разысынызмы?'#13#10'''»мтина'' дцйм€сини басандан сонра €малиййат эцнцн с€р€дл€рин€ €лав€ олунажаг.';
var
  DebitCurrencyRate: Currency;
  CreditCurrencyRate: Currency;

  function CheckTransaction: Boolean;
  begin
    Result := False;
    if not CheckBalanceChar then
      ErrorHintBox.ShowMessage(' асса символуну дцзэцн дахил един')
    else
    if TrNameEdit.Text = '' then
      ErrorHintBox.ShowMessage('ямаллиййатынын т€ййинаты дахил един')
    else
    with TransactionsDataModule, TransactionsData do
    begin

{      with DebitCurrencyData do
      begin
        DisableControls;
        try
          Locate('ID', TransactionsData.FieldByName('DebitCurrencyID').AsInteger, []);
        finally
          EnableControls;
        end;
      end;}

{      with CreditCurrencyData do
      begin
        DisableControls;
        try
          Locate('ID', TransactionsData.FieldByName('CreditCurrencyID').AsInteger, []);
        finally
          EnableControls;
        end;
      end;}

      with DebitAccountData do
      begin
        DisableControls;
        try
          Locate('ID', TransactionsData.FieldByName('DebitID').AsInteger, []);
        finally
          EnableControls;
        end;
      end;

      with CreditAccountData do
      begin
        DisableControls;
        try
          Locate('ID', TransactionsData.FieldByName('CreditID').AsInteger, []);
        finally
          EnableControls;
        end;
      end;

      DebitCurrencyRate := DebitCurrencyData.FieldByName('Rate').AsCurrency;
      CreditCurrencyRate := CreditCurrencyData.FieldByName('Rate').AsCurrency;

      if not (
        (FieldByName('DebitCurrencyID').AsInteger <> FieldByName('CreditCurrencyID').AsInteger)
{        and (
          (FieldByName('DEBITRATE').AsCurrency <> DebitCurrencyRate)
          or (FieldByName('CREDITRATE').AsCurrency <> CreditCurrencyRate)
        )}
        and (not (DebitAccountData.FieldByName('IsCacheAccount').AsInteger in [1,2]))
        and (not (CreditAccountData.FieldByName('IsCacheAccount').AsInteger in [1,2]))
        and (FieldByName('OUTBALANCECHAR').AsInteger = 0)
      )
      then
        Result := True
      else
        if MessageDlg(sConvertationNotEnteredMsg, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
          Abort
        else
          Result := True;
        //ErrorHintBox.ShowMessage(' онвертасийа т€йинатыны дахил един');
    end;
  end;

begin
  if CheckTransaction then
  begin
    FIsChanged := True;
    with TransactionsDataModule.TransactionsData do
    begin
      TransactionDate := TransactionDateEdit.DateTime;
      if State in [dsEdit, dsInsert] then
      begin
        FieldByName('DebitAmount').AsCurrency := DebitAmountEdit.Value;
        FieldByName('CreditAmount').AsCurrency := CreditAmountEdit.Value;
        FieldByName('LAmount').AsCurrency := DebitLAmountEdit.Value;
        FieldByName('TransactionDate').AsDateTime := TransactionDate;
        Post;
      end;
  {    if UpdatesPending then
      begin
        try
          ApplyUpdates([aaInsert, aaUpdate]);
          CommitUpdates;
          // Global transaction commit}
          Sb_Commit;
  {      except
          // Cancel pending updates
          CancelUpdates;
          // Rollback pending transaction
          Sb_Rollback;
          // Restore
          Refresh
          raise;
        end;
      end;}
    end;
    if FMode = tmEdit then
    begin
      FInternalClosing := True;
      Close;
    end
    else
      Reset;
  end;
end;

procedure TTransactionPropertiesForm.SaveState;
begin
  with TransactionsDataModule.Transactions.DataSet, FSavedState do
  begin
    hDebit := FieldByName('DebitID').AsInteger;
    hCredit := FieldByName('CreditID').AsInteger;
    DebitAmount := DebitAmountEdit.Value;
    CreditAmount := CreditAmountEdit.Value;
    LAmount := DebitLAmountEdit.Value;
    DebitRate := FieldByName('DebitRate').AsCurrency;
    CreditRate := FieldByName('CreditRate').AsCurrency;
    TrName := FieldByName('NAME').AsString;
  end;
end;

procedure TTransactionPropertiesForm.RestoreState;
begin
  with TransactionsDataModule.Transactions.DataSet, FSavedState do
  begin
//    FieldByName('DebitCurrencyID').AsInteger := 0;
//    FieldByName('CreditCurrencyID').AsInteger := 0;
    FieldByName('DebitID').AsInteger := hDebit;
    FieldByName('CreditID').AsInteger := hCredit;
    DebitAmountEdit.Value := DebitAmount;
    CreditAmountEdit.Value := CreditAmount;
    DebitLAmountEdit.Value := LAmount;
    CreditLAmountEdit.Value := LAmount;
    FieldByName('DebitRate').AsCurrency := DebitRate;
    FieldByName('CreditRate').AsCurrency := CreditRate;
    FieldByName('NAME').AsString := TrName;
  end;
end;

procedure TTransactionPropertiesForm.FormCreate(Sender: TObject);
begin
  FAccRefreshEnabled := True;
  FCascadeRefreshDisabledCount := 0;
  FIsChanged := False;
end;

procedure TTransactionPropertiesForm.DebitAccNoSearchEditChange(
  Sender: TObject);
begin
  with Sender as TEdit do
  begin
    if Focused then
      if Text = '' then
        TransactionsDataModule.TransactionsDataDEBITID.Clear
      else
      begin
        with TransactionsDataModule do
          if DebitAccData.Locate('ACC_NO', Text, [loPartialKey, loCaseInsensitive]) then
          begin
            Color := clWhite;
            DebitAccBalanceLabel.Caption := CurrToStrF(DebitAccData.FieldByName('Balance').AsCurrency, ffCurrency, 2);
            DebitLBalanceLabel.Caption := CurrToStrF(DebitAccData.FieldByName('LBalance').AsCurrency, ffCurrency, 2);
          end
          else
          begin
            Color := clRed;
            Beep;
          end;
      end;

    if Text = '' then
    begin
      DebitAccBalanceLabel.Caption := '';
      DebitLBalanceLabel.Caption := '';
    end
    else
      with TransactionsDataModule do
      begin
        DebitAccBalanceLabel.Caption := CurrToStrF(DebitAccData.FieldByName('Balance').AsCurrency, ffCurrency, 2);
        DebitLBalanceLabel.Caption := CurrToStrF(DebitAccData.FieldByName('LBalance').AsCurrency, ffCurrency, 2);
      end;

  end;
end;

procedure TTransactionPropertiesForm.CreditAccNoSearchEditChange(
  Sender: TObject);
var
  HasFound: Boolean;
begin
  with Sender as TEdit do
  begin
    if Text <> '' then
      with TransactionsDataModule do
        HasFound := CreditAccData.Locate('ACC_NO', Text, [loPartialKey, loCaseInsensitive])
    else
      HasFound := True;

    if Focused then
      if Text = '' then
        TransactionsDataModule.TransactionsDataCreditID.Clear
      else
        if HasFound then
          Color := clWhite
        else
        begin
          Color := clRed;
          Beep;
        end;

    if Text = '' then
    begin
      CreditAccBalanceLabel.Caption := '';
      CreditLBalanceLabel.Caption := '';
    end
    else
      with TransactionsDataModule do
        if HasFound then
        begin
          CreditAccBalanceLabel.Caption := CurrToStrF(CreditAccData.FieldByName('Balance').AsCurrency, ffCurrency, 2);
          CreditLBalanceLabel.Caption := CurrToStrF(CreditAccData.FieldByName('LBalance').AsCurrency, ffCurrency, 2);
        end;
  end;
end;

procedure TTransactionPropertiesForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    TrDescrForm.ShowModal;
    if TrDescrForm.Commited then
    begin
      TransactionsDataModule.TransactionsData.FieldByName('Name').AsString
        := TrDescrForm.Value;
      TrNoEdit.Text := TrDescrForm.DescrTable.FieldByName('ID').AsString;
    end;
  end
  else
  if Key = VK_ESCAPE then
    Close;
end;

procedure TTransactionPropertiesForm.TrNoEditChange(Sender: TObject);
begin
  with TrDescrForm.DescrTable, Sender as TEdit do
    if Text <> '' then
      if Locate('ID', Text, []) then
        TransactionsDataModule.TransactionsData.FieldByName('Name').AsString :=
          FieldByName('NAME').AsString;
end;

procedure TTransactionPropertiesForm.OnKeyPressed(
  Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    with Sender as TControl do
      SelectNext(ActiveControl, True, True);
end;

procedure TTransactionPropertiesForm.Reset;
begin
  with TransactionsDataModule, TransactionsData do
  begin
    if State in [dsInsert, dsEdit] then
      Cancel;
    CancelUpdates;
  end;

  if FMode = tmEdit then
    View(FTransactionID, FReadOnly)
  else
  begin
    DebitAmountEdit.Value := 0.0;
    DebitLAmountEdit.Value := 0.0;
    CreditAmountEdit.Value := 0.0;
    CreditLAmountEdit.Value := 0.0;

    RefreshDisabled := True;
    try
      with TransactionsDataModule, TransactionsData do
      begin
        with DebitAccData do
          Refresh;
        with CreditAccData do
          Refresh;
        {Cancel;
        CancelUpdates;}
        Insert;
        FieldByName('DebitCurrencyID').AsInteger := 0;
        FieldByName('CreditCurrencyID').AsInteger := 0;
        DebitCurrencyCB.ItemIndex := 0;
        CreditCurrencyCB.ItemIndex := 0;
        FieldByName('DebitID').Clear;
        FieldByName('CreditID').Clear;
      end;

      DebitAccNoSearchEdit.Text := '';
      CreditAccNoSearchEdit.Text := '';

      with TransactionsDataModule do
      begin
        LastCacheAccountSide := asUnknown;
        PrepareCacheSymbols;
      end;

    finally
      RefreshDisabled := False;
    end;
    Modified := False;
  end;
end;

procedure TTransactionPropertiesForm.SetSelectedText(Edit: TEdit; const S: String);
var
  LastLen       : Integer;
begin
  with Edit do
  begin
    LastLen := Length(Text);
    Text := S;
    if Focused then
    begin
      SelStart := LastLen;
      SelLength := Length(S)-LastLen;
    end;
    Color := clWhite;
  end;
end;

procedure TTransactionPropertiesForm.DebitAccNoSearchEditKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  with Sender as TComponent do
  if (Key = VK_DELETE) or (Key = VK_BACK) then
    Tag := 1
  else
    Tag := 0;
end;

procedure TTransactionPropertiesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
resourcestring
  sModifiedExitMsg = 'ƒокумент йаддашда сахлансынмы?';
begin
  if not FInternalClosing and Modified then
    case MessageDlg(sModifiedExitMsg, mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
    mrYes:
      SaveTransaction;
    mrCancel:
      CanClose := False;
    end;
end;

procedure TTransactionPropertiesForm.DebitAccNoSearchEditExit(
  Sender: TObject);
begin
  with Sender as TEdit, TransactionsDataModule.TransactionsData do
    if Text <> '' then
      Text := FieldByName('DebitAccNo').AsString;
end;

procedure TTransactionPropertiesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TransactionsDataModule.TransactionsData do
    Cancel;
end;

procedure TTransactionPropertiesForm.CommitActionExecute(Sender: TObject);
begin
  SaveState;
  try
    SaveTransaction;
  except
    RestoreState;
    raise;
  end;
end;

procedure TTransactionPropertiesForm.Button2Click(Sender: TObject);
begin
  if FMode = tmEdit then
    View(FTransactionID, FReadOnly)
  else
    Reset;
end;

procedure TTransactionPropertiesForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TTransactionPropertiesForm.CommitActionUpdate(Sender: TObject);
begin
  with Sender as TAction, TransactionsDataModule.TransactionsData do
    Enabled :=
      (not FReadOnly)
      and Self.Modified
      and (not FieldByName('DebitID').IsNull)
      and (not FieldByName('CreditID').IsNull)
      and (DebitLAmountEdit.Value <> 0);

end;

procedure TTransactionPropertiesForm.SetModified(Value: Boolean);
begin
  if FReadOnly then
    Value := False;
  FModified := Value;
  UpdateActions;
end;

procedure TTransactionPropertiesForm.SetTransactionDate(Value: TDateTime);
begin
  FTransactionDate := Value;
  TransactionDateEdit.DateTime := Int(Value);
end;

procedure TTransactionPropertiesForm.CancelActionExecute(Sender: TObject);
begin
  Reset;
end;

procedure TTransactionPropertiesForm.CreditAccNoSearchEditExit(
  Sender: TObject);
begin
  with Sender as TEdit, TransactionsDataModule.TransactionsData do
    if Text <> '' then
      Text := FieldByName('CreditAccNo').AsString;
end;

procedure TTransactionPropertiesForm.TransactionDateEditChange(
  Sender: TObject);
begin
  TransactionDate := (Sender as TDateTimePicker).DateTime;
  Modified := True;
end;

procedure TTransactionPropertiesForm.TrNameEditChange(Sender: TObject);
begin
  Modified := True;
end;

procedure TTransactionPropertiesForm.InBalanceCharEditExit(Sender: TObject);
begin
  CheckBalanceChar;
end;

function TTransactionPropertiesForm.CheckBalanceChar: Boolean;
var
  BalanceChar: Integer;
  ColorError: Boolean;
begin
  with TransactionsDataModule, InBalanceSymbolsData do
  begin
    BalanceChar := TransactionsData.FieldByName('InBalanceChar').AsInteger;
    if BalanceChar <> 0 then
    begin
      Result := Locate('SYMBOL', BalanceChar, []);
      ColorError := not Result;
    end
    else
    begin
      PrepareCacheSymbols;
      Result := LastCacheAccountSide = asUnknown;
      ColorError := False;
    end;
    if ColorError then
      InBalanceCharEdit.Color := clRed
    else
      InBalanceCharEdit.Color := clWhite;
  end;
end;
procedure TTransactionPropertiesForm.CutEditText(Sender: TObject);
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
procedure TTransactionPropertiesForm.CreditLAmountEditExit(
  Sender: TObject);
begin
  with (Sender as TCurrencyEdit) do
  if (Value <= 0.0) or (Trim(Text)='') then
  begin
    ShowMessage('ћ€бл€ь "0.00" дан бюйцк олмалыдыр.');
    SetFocus;
  end;
end;

procedure TTransactionPropertiesForm.CreditCurrencyCBChange(
  Sender: TObject);
begin
  if FMode = tmEdit then    // DI__ABLO
  CreditAmountEdit.OnChange(CreditAmountEdit);
end;

procedure TTransactionPropertiesForm.DebitCurrencyCBChange(
  Sender: TObject);
begin
  if FMode = tmEdit then    // DI__ABLO
  DebitAmountEdit.OnChange(DebitAmountEdit);
end;

end.
