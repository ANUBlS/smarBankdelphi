unit AccountDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TAccountDataModule = class(TDataModule)
    SAccs: TDataSource;
    SAccsData: TOracleDataSet;
    Customers: TDataSource;
    CustomersData: TOracleDataSet;
    Currency: TDataSource;
    CurrencyData: TOracleDataSet;
    ReportSymbolData: TOracleDataSet;
    ReportSymbol: TDataSource;
    Accounts: TDataSource;
    AccountsData: TOracleDataSet;
    AccountsDataACCID: TFloatField;
    AccountsDataACCNO: TStringField;
    AccountsDataACCNAME: TStringField;
    AccountsDataOPENDATE: TDateTimeField;
    AccountsDataCLOSEDATE: TDateTimeField;
    AccountsDataCURRENCYID: TIntegerField;
    AccountsDataSACC: TFloatField;
    AccountsDataCUSTOMERID: TFloatField;
    AccountsDataPAIRACC: TFloatField;
    AccountsDataACCLIMIT: TFloatField;
    AccountsDataREPORTSYMBOL: TFloatField;
    AccountsDataFILIALID: TIntegerField;
    AccountsDataINSIDER: TStringField;
    AccountsDataAMOUNT: TFloatField;
    AccountsDataLAMOUNT: TFloatField;
    AccountsDataDEBITTURNOVER: TFloatField;
    AccountsDataCREDITTURNOVER: TFloatField;
    AccountsDataDEBITLTURNOVER: TFloatField;
    AccountsDataCREDITLTURNOVER: TFloatField;
    AccountsDataCURRENCYSNAME: TStringField;
    AccountsDataDAYSTARTAMOUNT: TFloatField;
    AccountsDataDAYSTARTLAMOUNT: TFloatField;
    AccountsDataSID: TFloatField;
    AccountsDataSACC2: TFloatField;
    AccountsDataSACC3: TFloatField;
    AccountsDataSACC4: TFloatField;
    SAccs2: TDataSource;
    SAccsData2: TOracleDataSet;
    SAccs3: TDataSource;
    SAccsData3: TOracleDataSet;
    SAccs4: TDataSource;
    SAccsData4: TOracleDataSet;
    Filials: TDataSource;
    FilialsData: TOracleDataSet;
    AccountsDataDELAYEDAMOUNT: TFloatField;
    AccountsDataDELAYEDLAMOUNT: TFloatField;
    AccFlagsData: TOracleDataSet;
    AccFlags: TDataSource;
    AccountsDataACCFLAGS: TStringField;
    AccountFlagsData: TOracleDataSet;
    DataSrcAccountFlagsData: TDataSource;
    AccountFlagsDataSYMBOL: TStringField;
    AccountFlagsDataNAME: TStringField;
    AccountFlagsDataDESCRIPTION: TStringField;
    AccFlagsDataSYMBOL: TStringField;
    AccFlagsDataNAME: TStringField;
    AccFlagsDataDESCRIPTION: TStringField;
    SB_ACA: TOraclePackage;
    procedure AccountsDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure AccountsDataAfterFetchRecord(Sender: TOracleDataSet;
      FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
  private
    { Private declarations }
    FLastAccountID: Integer;
    FAccountFlags : string;
  public
    { Public declarations }
    property LastAccountID: Integer read FLastAccountID;
    property AccountFlags : string read FAccountFlags write FAccountFlags ;
  end;

var
  AccountDataModule: TAccountDataModule;

procedure Initialize;
procedure Cleanup;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl, SBAccount, SBCore;

procedure TAccountDataModule.AccountsDataApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
  AccountInfo: TAccount;
begin
  with AccountsData, AccountInfo do
  begin
    AccNo := FieldByName('AccNo').AsString;
    Name := FieldByName('AccName').AsString;
    CustomerID := FieldByName('CustomerID').AsInteger;
    CurrencyID := FieldByName('CurrencyID').AsInteger;
    OpenDate := FieldByName('OpenDate').AsDateTime;
    SAccs.Acc1 := FieldByName('SAcc').AsInteger;
    SAccs.Acc2 := FieldByName('SAcc2').AsInteger;
    SAccs.Acc3 := FieldByName('SAcc3').AsInteger;
    SAccs.Acc4 := FieldByName('SAcc4').AsInteger;
    Limit := FieldByName('AccLimit').AsCurrency;
    CloseDate := FieldByName('CloseDate').AsDateTime;
    ReportSymbol := FieldByName('ReportSymbol').AsInteger;
    PairAccID := FieldByName('PairAcc').AsInteger;
    FilialID := FieldByName('FilialID').AsInteger;
    AccFlags := FieldByName('AccFlags').AsString;
//    IsInsider := Integer(FieldByName('Insider').AsBoolean);
  end;
  case Action of
    'I':
      begin
        FLastAccountID := Sb_AddAccount(AccountInfo);
        Applied := True;
      end;
    'U':
      begin
        FLastAccountID := Sender.FieldByName('AccID').AsInteger;
        Sb_EditAccount(FLastAccountID, AccountInfo);
        Applied := True;
      end;
  end;
  if Applied then
    Sb_Commit;
end;

procedure Initialize;
begin
  if not Assigned(AccountDataModule) then
    AccountDataModule := TAccountDataModule.Create(nil);
end;

procedure Cleanup;
begin
  try
    AccountDataModule.Free;
  finally
    AccountDataModule := nil;
  end;
end;

procedure TAccountDataModule.AccountsDataAfterFetchRecord(
  Sender: TOracleDataSet; FilterAccept: Boolean;
  var Action: TAfterFetchRecordAction);
const
  FetchRecLimit = 50;
begin
  with Sender do
  if RecordCount = FetchRecLimit then
  Action := afPause	
end;

initialization
//  Initialize;
finalization
  Cleanup;
end.
