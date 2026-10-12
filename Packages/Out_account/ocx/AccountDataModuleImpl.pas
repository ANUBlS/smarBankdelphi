unit AccountDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;
  
type
    TAccount = record
      ID:          Longint;
      CustomerID:  Longint;
      AccNo:       String;
      OperatorID:  Longint;
      CurrencyID:  Integer;
      Name:        String;
      OpenDate:    TDateTime;
      Limit:       Currency;
      CloseDate:   TDateTime; 
      Balance1:    Longint;
      Balance2:    Longint;
      Balance3:    Longint;
      Balance4:    Longint;
      FilialID:    Integer;
      Simotcet:    Integer;
      Tipacc:      String;
      OldAccNo:    String;
      PairAccID:   Integer;
      Insider:     String;
      tempid:integer;
    end;

const
     cs_add_account = 'add_account';
     cs_upd_account = 'upd_account';
     cs_close_account = 'close_account';
     cs_generateID = 'GenerateID';
     cs_flagexsist = 'FlagExsist';

type
  Tout_accdatamodule = class(TDataModule)
    Branches: TOracleDataSet;
    BranchesData: TDataSource;
    Users: TOracleDataSet;
    UsersData: TDataSource;
    Currency: TOracleDataSet;
    CurrencyData: TDataSource;
    AccFlags: TOracleDataSet;
    AccFlagsData: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccData: TDataSource;
    Account: TOracleDataSet;
    AccountData: TDataSource;
    Tenostat: TOracleDataSet;
    DataTenostat: TDataSource;
    Lazyrest: TOracleDataSet;
    DataLazyrest: TDataSource;
    OUT_SBOP: TOraclePackage;
    ReportSymbol: TOracleDataSet;
    ReportSymbolData: TDataSource;
    CustomersData: TDataSource;
    PairAccount: TOracleDataSet;
    PairAccountData: TDataSource;
    Sysdat: TOracleDataSet;
    OUT_SBUTIL: TOraclePackage;
    SB_ACA: TOraclePackage;
    BranchesID: TFloatField;
    BranchesNAME: TWideStringField;
    UsersID: TFloatField;
    UsersNAME: TWideStringField;
    CurrencyVALU_NAME: TWideStringField;
    AccFlagsSYMBOL: TWideStringField;
    AccFlagsNAME: TWideStringField;
    SysdatTEK_DAT: TDateTimeField;
    LazyrestACC_ID: TFloatField;
    LazyrestOSTAT: TFloatField;
    LazyrestPOK_OSTAT: TFloatField;
    TenostatACC_ID: TFloatField;
    TenostatOSTAT: TFloatField;
    TenostatPOK_OSTAT: TFloatField;
    ReportSymbolID: TFloatField;
    ReportSymbolNAME: TWideStringField;
    ReportSymbolKOD: TFloatField;
    PairAccountID: TFloatField;
    PairAccountACC_NO: TWideStringField;
    PairAccountSTATUS: TFloatField;
    BalAccBAL_CN: TWideStringField;
    BalAccBALNAME: TWideStringField;
    AccountID: TFloatField;
    AccountKLI_ID: TFloatField;
    AccountOP_ID: TFloatField;
    AccountACC_NO: TWideStringField;
    AccountVAL_ACC: TIntegerField;
    AccountNAME: TWideStringField;
    AccountOPEN_DAT: TDateTimeField;
    AccountCLOSE_DAT: TDateTimeField;
    AccountBAL_CN1: TFloatField;
    AccountBAL_CN2: TFloatField;
    AccountBAL_CN3: TFloatField;
    AccountBAL_CN4: TFloatField;
    AccountFILIAL: TIntegerField;
    AccountSIM_OTCET: TFloatField;
    AccountTIPACC: TWideStringField;
    AccountLIMIT: TFloatField;
    AccountOLD_ACC_NO: TWideStringField;
    AccountPAIR_ACC: TFloatField;
    AccountINSIDER: TWideStringField;
    CurrencyVALUTE: TIntegerField;
    AccountSTATU1: TFloatField;
    BalAccnew: TOracleDataSet;
    BalAccnewData: TDataSource;
    BalAccnewBAL_CN: TWideStringField;
    BalAccnewBALNAME: TWideStringField;
    Customers: TOracleDataSet;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    AccountTEMPID: TFloatField;
    AccountEXPERT: TWideStringField;
    procedure AccountApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure PairAccountBeforeOpen(DataSet: TDataSet);
    procedure Customers_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AddAccount(Account: TAccount): Longint;
    procedure UpdateAccount(Account: TAccount);
    procedure CloseAccount(AccountID: Longint);
    function FlagExsist(AccID : Integer;Ch : Char):Boolean;
   // procedure Debug(DataSet: TOracleDataSet);
    procedure Refresh_(DataSetName: String);

    function GenerateID: Longint;
  end;

var
  out_accdatamodule: Tout_accdatamodule;

implementation



uses
    sboapiDataModuleImpl;
      {$R *.DFM}
      
    function Tout_accdatamodule.AddAccount(Account: TAccount): Longint;
begin
 with OUT_SBOP, Account do
  Result :=CallIntegerFunction(cs_add_account, [
              'customerid', CustomerID,
              'op_id', OperatorID,
              'accno', AccNo,
              'currencyid', CurrencyID,
              'name', Name,
              'open_dat', OpenDate,
              'balcn', Balance1,
              'limit', Limit,
              'close_dat', CloseDate,
              'bal_cn2', Balance2,
              'bal_cn3', Balance3,
              'bal_cn4', Balance4,
              'filial', FilialID,
              'sim_otcet', Simotcet,
              'typeacc', Tipacc,
              'old_acc_no', OldAccNo,
              'pair_acc', PairAccID,
              'insider', Insider ,
              'v_tempid' ,tempid
           ]);
end;

procedure Tout_accdatamodule.UpdateAccount(Account: TAccount);
begin
 with OUT_SBOP, Account do
  CallProcedure(cs_upd_account, [
              'v_id', ID,
              'v_customerid', CustomerID,
              'v_op_id', OperatorID,
              'v_accno', AccNo,
              'v_currencyid', CurrencyID,
              'v_name', Name,
              'v_open_dat', OpenDate,
              'v_balcn', Balance1,
              'v_limit', Limit,
              'v_close_dat', CloseDate,
              'v_bal_cn2', Balance2,
              'v_bal_cn3', Balance3,
              'v_bal_cn4', Balance4,
              'v_filial', FilialID,
              'v_sim_otcet', Simotcet,
              'v_typeacc', Tipacc,
              'v_old_acc_no', OldAccNo,
              'v_pair_acc', PairAccID,
              'v_insider', Insider  ,
              'v_tempid',tempid
           ]);
end;

procedure Tout_accdatamodule.CloseAccount(AccountID: Longint);
begin
 with OUT_SBOP, Account do
  CallProcedure(cs_close_account, [
              'accid', AccountID,
              'doclose', 1
           ]);
end;

function Tout_accdatamodule.GenerateID: Longint;
begin
 with OUT_SBOP do
  Result :=CallIntegerFunction(cs_generateID, []);
end;

function Tout_accdatamodule.FlagExsist(AccID : Integer;Ch : Char):Boolean;
begin
   with OUT_SBUTIL do
    Result :=
     CallBooleanFunction(cs_flagexsist,[
       'AccID', AccID ,
       'FlagChar', ch
     ]);
end;
procedure Tout_accdatamodule.AccountApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
   AccountInfo: TAccount;

   procedure BuildAccount;
   begin
    with Sender, AccountInfo do
    begin
      ID :=FieldByName('ID').AsInteger;
      CustomerID :=FieldByName('kli_ID').AsInteger;
      AccNo :=FieldByName('acc_no').AsString;
      OperatorID :=FieldByName('op_id').AsInteger;
      CurrencyID :=FieldByName('val_acc').AsInteger;
      Name :=FieldByName('name').AsString;
      OpenDate :=FieldByName('open_dat').AsDateTime;
      Limit :=FieldByName('limit').AsCurrency;
      CloseDate :=FieldByName('close_dat').AsDateTime;
      Balance1 :=FieldByName('bal_cn1').AsInteger;
      Balance2 :=FieldByName('bal_cn2').AsInteger;
      Balance3 :=FieldByName('bal_cn3').AsInteger;
      Balance4 :=FieldByName('bal_cn4').AsInteger;
      FilialID :=FieldByName('filial').AsInteger;
      Simotcet :=FieldByName('sim_otcet').AsInteger;
      Tipacc :=FieldByName('tipacc').AsString;
      OldAccNo :=FieldByName('old_acc_no').AsString;
      PairAccID :=FieldByName('pair_acc').AsInteger;
      Insider :=FieldByName('insider').AsString;
      tempid:=FieldByName('tempid').AsInteger;
    end;
   end;

begin
  case Action of
   'I':
     begin
      //Sender.FieldByName('ID').AsInteger :=GenerateID;
      BuildAccount;
      AddAccount(AccountInfo);
      Applied := True;
     end;
   'U':
     begin
      BuildAccount;
      UpdateAccount(AccountInfo);
      Applied := True;
     end;

   'L','R','C':
      Applied := True;
   else
    Applied := False;

  end;
end;

procedure Tout_accdatamodule.PairAccountBeforeOpen(DataSet: TDataSet);
begin
with DataSet do
 begin
  Filtered :=False;
  Filter :='Status = 1';
  Filtered :=True;
 end;
end;
 {
procedure Tout_accdatamodule.Debug(DataSet: TOracleDataSet);
const
   Value = 'FieldName = %s / FieldValue = "%s" / FieldSize = %d';
var
   Index, IndexCount: Word;
   List: TStringList;
   FieldName: String;
begin
 List :=TStringList.Create;
 with DataSet do
 try
   IndexCount :=FieldCount;
   for Index :=0 to IndexCount -1 do
   begin
    FieldName :=Copy(Fields[Index].Name, Length(Name) +1, Length(Fields[Index].Name) - Length(Name));
    List.Add(Format(Value, [
             FieldName,
             FieldByName(FieldName).AsString,
             Fields[Index].Size]
             ));

   end;
   List.SaveToFile('C:\temp.txt');
 finally
  List.Free;
 end;

end;  }
procedure Tout_accdatamodule.Customers_AfterScroll(DataSet: TDataSet);
begin
 if Account.State in [dsInsert, dsEdit] then
  Account.FieldByName('Name').AsString :=DataSet.FieldByName('Name').AsString;

end;
procedure Tout_accdatamodule.Refresh_(DataSetName: String);
const
   c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
   i: Word;
begin

 with out_accdatamodule do
begin
Account.Close;
Customers.Close;
Users.Close;
Branches.Close;
Currency.Close;
AccFlags.Close;
BalAcc.Close;
BalAccnew.Close;
Tenostat.Close;
Lazyrest.Close;
ReportSymbol.Close;
PairAccount.Close;
Sysdat.Close;

Account.Open;
Customers.Open;
Users.Open;
Branches.Open;
Currency.Open;
AccFlags.Open;
BalAcc.Open;
BalAccnew.Open;
Tenostat.Open;
Lazyrest.Open;
ReportSymbol.Open;
PairAccount.Open;
Sysdat.Open;
end;

 {for i :=0 to ComponentCount- 1 do
  if (Components[i] is TOracleDataSet) and (Components[i].Name <> DataSetName) then
  //begin //
  try
   (Components[i] as TOracleDataSet).Close;
   (Components[i] as TOracleDataSet).Open;
  except
   raise Exception.Create(Format(c_err_message, [(Components[i] as TOracleDataSet).Name]));

  end;  }
end;

end.
