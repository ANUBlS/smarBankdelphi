unit TransactionsDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle, TransactionsMainFormImpl;

type
  TAccountSide = (asUnknown, asDebit, asCredit);
  TTransactionsDataModule = class(TDataModule)
    Transactions: TDataSource;
    DebitCurrency: TDataSource;
    DebitCurrencyData: TOracleDataSet;
    CreditCurrency: TDataSource;
    CreditCurrencyData: TOracleDataSet;
    DebitAccs: TDataSource;
    DebitAccData: TOracleDataSet;
    CreditAccs: TDataSource;
    CreditAccData: TOracleDataSet;
    BankM: TDataSource;
    BankMData: TOracleDataSet;
    DebitCurrencyDataID: TIntegerField;
    DebitCurrencyDataSNAME: TStringField;
    DebitCurrencyDataNAME: TStringField;
    DebitCurrencyDataRATE: TFloatField;
    CreditCurrencyDataID: TIntegerField;
    CreditCurrencyDataSNAME: TStringField;
    CreditCurrencyDataNAME: TStringField;
    CreditCurrencyDataRATE: TFloatField;
    TransactionsData: TOracleDataSet;
    CurrencyField1: TCurrencyField;
    SBReport: TOraclePackage;
    InBalanceSymbolsData: TOracleDataSet;
    InBalanceSymbols: TDataSource;
    OutbalanceSymbolsData: TOracleDataSet;
    OutbalanceSymbols: TDataSource;
    TransactionsDataID: TFloatField;
    TransactionsDataDEBITID: TFloatField;
    TransactionsDataDEBITACCNO: TStringField;
    TransactionsDataDEBITCURRENCYID: TFloatField;
    TransactionsDataDEBITCURRENCYSNAME: TStringField;
    TransactionsDataCREDITID: TFloatField;
    TransactionsDataCREDITACCNO: TStringField;
    TransactionsDataCREDITCURRENCYSNAME: TStringField;
    TransactionsDataDEBITAMOUNT: TFloatField;
    TransactionsDataCREDITAMOUNT: TFloatField;
    TransactionsDataLAMOUNT: TFloatField;
    TransactionsDataDEBITRATE: TFloatField;
    TransactionsDataCREDITRATE: TFloatField;
    TransactionsDataDEBITBANK: TFloatField;
    TransactionsDataCREDITBANK: TFloatField;
    TransactionsDataNAME: TStringField;
    TransactionsDataTransactionDate: TDateTimeField;
    CreditAccountDataBALANCE: TFloatField;
    CreditAccountDataLBALANCE: TFloatField;
    DebitAccountDataBALANCE: TFloatField;
    DebitAccountDataLBALANCE: TFloatField;
    DebitAccountData: TOracleDataSet;
    CreditAccountData: TOracleDataSet;
    DebitAccountDataISCACHEACCOUNT: TFloatField;
    CreditAccountDataISCACHEACCOUNT: TFloatField;
    ODSCommisionTrans: TOracleDataSet;
    DSCommisionTrans: TDataSource;
    ODSCommisionTransID: TFloatField;
    ODSCommisionTransNAME: TStringField;
    ODSCommisionTransDEBT: TFloatField;
    ODSCommisionTransDEBITACCOUNT: TStringField;
    ODSCommisionTransDEBITCURRENCY: TStringField;
    ODSCommisionTransCREDIT: TFloatField;
    ODSCommisionTransCREDITACCOUNT: TStringField;
    ODSCommisionTransCREDITCURRENCY: TStringField;
    ODSCommisionTransADDITIONALDEBT: TFloatField;
    ODSCommisionTransADDITIONALCREDIT: TFloatField;
    ODSCommisionTransADEBT: TStringField;
    ODSCommisionTransACREDIT: TStringField;
    ODSCommisionTransASSIGNMENT: TStringField;
    ODSCommisionTransCOMMISIONASSIGNMENT: TStringField;
    OPComplexTrans: TOraclePackage;
    FilialsData: TOracleDataSet;
    FilialsDataID: TFloatField;
    FilialsDataNAME: TStringField;
    Filials: TDataSource;
    FilialsCData: TOracleDataSet;
    FilialsC: TDataSource;
    UsData: TOracleDataSet;
    UsDataID: TFloatField;
    UsDataNAME: TStringField;
    Us: TDataSource;
    OraclePackage: TOraclePackage;
    TransactionsDataCYPHERCODE: TIntegerField;
    TransactionsDataOPERATIONCODE: TIntegerField;
    TransactionsDataINBALANCECHAR: TIntegerField;
    TransactionsDataOUTBALANCECHAR: TIntegerField;
    TransactionsDataFILIALID: TIntegerField;
    TransactionsDataDEBITBALANCE: TFloatField;
    TransactionsDataSTATUS: TFloatField;
    TransactionsDataREJECT_REASON: TStringField;
    TransactionsDataPACKAGENUMBER: TIntegerField;
    TransactionsDataCREDITCURRENCYID: TIntegerField;
    procedure TransactionsDataApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure DebitCurrencyDataAfterScroll(DataSet: TDataSet);
    procedure CreditCurrencyDataAfterScroll(DataSet: TDataSet);
    procedure TransactionsDataDEBITCURRENCYIDChange(Sender: TField);
    procedure TransactionsDataCREDITCURRENCYIDChange(Sender: TField);
    procedure TransactionsDataChange(Sender: TObject; Field: TField);
    procedure DebitAccDataAfterScroll(DataSet: TDataSet);
    procedure CreditAccDataAfterScroll(DataSet: TDataSet);
    procedure TransactionsDataBeforeEdit(DataSet: TDataSet);
    procedure TransactionsDataAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FTransactionsDelayedByDefault: Boolean;
    FMainForm: TTransactionsMainForm;
    FLastCacheAccountSide: TAccountSide;
  public
    { Public declarations }
    property TransactionsDelayedByDefault: Boolean read FTransactionsDelayedByDefault write FTransactionsDelayedByDefault;
    property MainForm: TTransactionsMainForm read FMainForm write FMainForm;
    property LastCacheAccountSide: TAccountSide read FLastCacheAccountSide write FLastCacheAccountSide;
    procedure PrepareCacheSymbols;
    procedure SetCommisionTransaction(applied :boolean;operationID :integer;DebitID,CreditID :longint;
       DebitAmmount ,CreditAmmount :currency);

  end;

var
  TransactionsDataModule: TTransactionsDataModule;

implementation

{$R *.DFM}

uses SBTransaction, SBSrvIntf, TransactionPropertiesForm_Unit, SBMessage;

procedure TTransactionsDataModule.TransactionsDataApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
  Transaction: TTransaction;
  Flags: TAddTransactionFlags;

  procedure BuildTransaction;
  begin
    SB_InitializeTransaction(Transaction);
    with Sender, Transaction do
    begin
      TransactionDate := FieldByName('TransactionDate').AsDateTime;
      hDebit := FieldByName('DebitID').AsInteger;
      hCredit := FieldByName('CreditID').AsInteger;
      DebitAmount := FieldByName('DebitAmount').AsCurrency;
      CreditAmount := FieldByName('CreditAmount').AsCurrency;
      LAmount := FieldByName('LAmount').AsCurrency;
      DebitRate := FieldByName('DebitRate').AsCurrency;
      CreditRate := FieldByName('CreditRate').AsCurrency;
      DebitBankID := FieldByName('DebitBank').AsInteger;
      CreditBankID := FieldByName('CreditBank').AsInteger;
      FilialID := FieldByName('FilialID').AsInteger;
      PackageNumber := FieldByName('PackageNumber').AsInteger;
      InbalanceChar := FieldByName('InbalanceChar').AsInteger;
      OutBalanceChar := FieldByName('OutbalanceChar').AsInteger;
      CypherCode := FieldByName('CypherCode').AsInteger;
      OperationCode := FieldByName('OperationCode').AsInteger;
      TrName := FieldByName('Name').AsString;
      with FieldByName('ID') do
        if IsNull then
          TransactionID := -1
        else
          TransactionID := AsInteger;
      ParentID := -1;
    end;
    if not TransactionsDelayedByDefault then
      Flags := Flags + [tfCommitImmediate];
  end;

begin
  Flags := [];
  case Action of
  'I':
    begin
      BuildTransaction;
      Sb_AddTransaction(Transaction, Flags);
      SetCommisionTransaction(MainForm.isCommisionTransaction,ODSCommisionTrans.FieldByName('ID').AsInteger,
      Transaction.hDebit,Transaction.hCredit,Transaction.DebitAmount,Transaction.CreditAmount);
      Applied := True;
    end;
  'U':
    begin
      BuildTransaction;
      SB_DeleteTransaction(Sender.FieldByName('ID').AsInteger, []);
      SB_AddTransaction(Transaction, []);
      Applied := True;
    end;
  'L','R','C':
    Applied := True;
  else
    Applied := False;
  end;
end;

procedure TTransactionsDataModule.DebitCurrencyDataAfterScroll(
  DataSet: TDataSet);
begin
  if not DataSet.ControlsDisabled then
    TransactionsDataDEBITRATE.Value := DebitCurrencyDataRate.Value;
  if TransactionsData.State = dsInsert then
  begin
    Transactions.DataSet.FieldByName('DebitID').Clear;
    if Assigned(TransactionPropertiesForm) then
      with TransactionPropertiesForm do
      begin
        DebitAmountEdit.Value := 0;
        CreditAmountEdit.Value := 0;
        DebitLAmountEdit.Value := 0;
        CreditLAmountEdit.Value := 0;
        DebitAccNoSearchEdit.Text := '';
      end;
    Transactions.DataSet.FieldByName('DebitCurrencyID').Value := DataSet.FieldByName('ID').Value;
    Transactions.DataSet.FieldByName('DEBITRATE').Value := DataSet.FieldByName('Rate').Value;
  end;
end;

procedure TTransactionsDataModule.CreditCurrencyDataAfterScroll(
  DataSet: TDataSet);
begin
  if not DataSet.ControlsDisabled then
    TransactionsDataCREDITRATE.Value := CreditCurrencyDataRate.Value;
  if TransactionsData.State = dsInsert then
  begin
    Transactions.DataSet.FieldByName('CreditID').Clear;
    if Assigned(TransactionPropertiesForm) then
      with TransactionPropertiesForm do
      begin
        DebitAmountEdit.Value := 0;
        CreditAmountEdit.Value := 0;
        DebitLAmountEdit.Value := 0;
        CreditLAmountEdit.Value := 0;
        CreditAccNoSearchEdit.Text := '';
      end;
    Transactions.DataSet.FieldByName('CreditCurrencyID').Value := DataSet.FieldByName('ID').Value;
    Transactions.DataSet.FieldByName('CREDITRATE').Value := DataSet.FieldByName('Rate').Value;
  end;
end;

procedure TTransactionsDataModule.TransactionsDataDEBITCURRENCYIDChange(
  Sender: TField);
begin
  if not DebitCurrencyData.ControlsDisabled then
  begin
    DebitCurrencyData.DisableControls;
    try
      DebitCurrencyData.Locate('ID', Sender.Value, []);
    finally
      DebitCurrencyData.EnableControls;
    end;
  end;
  Transactions.DataSet.FieldByName('DebitID').Clear;
  if Assigned(TransactionPropertiesForm) then
    TransactionPropertiesForm.DebitAccNoSearchEdit.Text := '';
end;

procedure TTransactionsDataModule.TransactionsDataCREDITCURRENCYIDChange(
  Sender: TField);
begin
  if not CreditCurrencyData.ControlsDisabled then
  begin
    CreditCurrencyData.DisableControls;
    try
      CreditCurrencyData.Locate('ID', Sender.Value, []);
    finally
      CreditCurrencyData.EnableControls;
    end;
  end;
  Transactions.DataSet.FieldByName('CreditID').Clear;
  if Assigned(TransactionPropertiesForm) then
    TransactionPropertiesForm.CreditAccNoSearchEdit.Text := '';
end;

procedure TTransactionsDataModule.TransactionsDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(TransactionPropertiesForm) then
//    if (Sender as TDataSource).DataSet.ControlsDisabled then
      TransactionPropertiesForm.Modified := True;
end;

procedure TTransactionsDataModule.DebitAccDataAfterScroll(
  DataSet: TDataSet);
var
  S: String;
begin
  if Assigned(TransactionPropertiesForm) then
    with TransactionPropertiesForm do
      if not RefreshDisabled then
      begin

        S := DataSet.FieldByName('ACC_NO').AsString;
        if DebitAccNoSearchEdit.Tag = 0 then
          SetSelectedText(DebitAccNoSearchEdit, S)
        else
          DebitAccNoSearchEdit.Tag := 0;

        if not DebitAccNoSearchEdit.Focused then
          DebitAccNoSearchEdit.Text := S;
        with TransactionsDataModule.TransactionsData do
        begin
          FieldByName('DebitID').AsInteger := DataSet.FieldByName('ID').AsInteger;
          FieldByName('DebitAccNo').AsString := S;
        end;
        if Visible then
          PrepareCacheSymbols;
      end;
end;

procedure TTransactionsDataModule.CreditAccDataAfterScroll(
  DataSet: TDataSet);
var
  S: String;
const
  InProgress: Boolean = False;
begin
  if not InProgress then
  begin
    InProgress := True;
    try
      if Assigned(TransactionPropertiesForm) then
        with TransactionPropertiesForm do
          if not RefreshDisabled then
          begin

            S := DataSet.FieldByName('ACC_NO').AsString;
            if CreditAccNoSearchEdit.Tag = 0 then
              SetSelectedText(CreditAccNoSearchEdit, S)
            else
              CreditAccNoSearchEdit.Tag := 0;

            if not CreditAccNoSearchEdit.Focused then
              CreditAccNoSearchEdit.Text := S;
            with TransactionsDataModule.TransactionsData do
            begin
              FieldByName('CreditID').AsInteger := DataSet.FieldByName('ID').AsInteger;
              FieldByName('CreditAccNo').AsString := S;
            end;
            if Visible then
              PrepareCacheSymbols;
          end;
    finally
      InProgress := False;
    end;
  end;
end;

procedure TTransactionsDataModule.TransactionsDataBeforeEdit(
  DataSet: TDataSet);

  procedure DoLocate(DataSet: TDataSet; const FieldName: String);
  begin
    with DataSet do
    begin
      DisableControls;
      try
        Locate('ID', TransactionsData.FieldByName(FieldName).AsInteger, []);
      finally
        EnableControls;
      end;
    end;
  end;

var
  DebitAccID: Integer;
  CreditAccID: Integer;

begin
  DebitAccID := TransactionsData.FieldByName('DebitID').AsInteger;
  CreditAccID := TransactionsData.FieldByName('CreditID').AsInteger;
  DoLocate(DebitCurrencyData, 'DebitCurrencyID');
  DoLocate(CreditCurrencyData, 'CreditCurrencyID');
  DebitAccData.Locate('ID', DebitAccID, []);
  CreditAccData.Locate('ID', CreditAccID, []);
end;

procedure TTransactionsDataModule.TransactionsDataAfterScroll(
  DataSet: TDataSet);
begin
  if (not DataSet.ControlsDisabled) and (DataSet.State = dsBrowse) then
    MainForm.TransactionScrolled;
end;

procedure TTransactionsDataModule.PrepareCacheSymbols;
var
  WillRefresh: Boolean;
  IntAccountSide: Integer;
begin
  if
    (not TransactionsData.FieldByName('DebitID').IsNull)
    and (DebitAccData.FieldByName('IsCacheAccount').AsInteger = 1)
    and (DebitAccData.FieldByName('VAL_ACC').AsInteger = 0)
  then
  begin
    WillRefresh := FLastCacheAccountSide <> asDebit;
    if WillRefresh then
      FLastCacheAccountSide := asDebit;
  end
  else
  if
    (not TransactionsData.FieldByName('CreditID').IsNull)
    and (CreditAccData.FieldByName('IsCacheAccount').AsInteger = 1)
    and (CreditAccData.FieldByName('VAL_ACC').AsInteger = 0)
  then
  begin
    WillRefresh := FLastCacheAccountSide <> asCredit;
    if WillRefresh then
      FLastCacheAccountSide := asCredit;
  end
  else
  begin
    WillRefresh := InBalanceSymbolsData.RecordCount<>0;
    FLastCacheAccountSide := asUnknown;
  end;

  if WillRefresh then
    with InBalanceSymbolsData do
    begin
      Close;
      if FLastCacheAccountSide = asDebit then
        IntAccountSide := 0
      else
      if FLastCacheAccountSide = asCredit then
        IntAccountSide := 1
      else
        IntAccountSide := -1;
      SetVariable('AccountSide', IntAccountSide);
      Open;
      //TransactionsData.FieldByName('Kassa_B').Clear;
      TransactionPropertiesForm.CheckBalanceChar;
    end;
end;

procedure TTransactionsDataModule.DataModuleCreate(Sender: TObject);
begin
  FLastCacheAccountSide := asUnknown;
end;

procedure TTransactionsDataModule.SetCommisionTransaction(
                                             applied :boolean;
                                             operationID :integer;
                                             DebitID,CreditID :longint;
                                             DebitAmmount ,CreditAmmount :currency
                                                          );

const
  c_Name = 'SetTransactions';
begin
 if  applied then
  begin
   with OPComplexTrans do
     CallProcedure(c_name,[operationID,DebitID,CreditID,DebitAmmount,CreditAmmount]);
     //ShowMessage('1004000000010100');
  end;
end;


end.
