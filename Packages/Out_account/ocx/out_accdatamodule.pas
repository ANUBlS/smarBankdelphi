unit out_accdatamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;
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
    end;

const
     cs_add_account = 'add_account';
     cs_upd_account = 'upd_account';
     cs_close_account = 'close_account';
     cs_generateID = 'GenerateID';
     cs_flagexsist = 'FlagExsist';


type
  TDataModule2 = class(TDataModule)
    Account: TOracleDataSet;
    AccountData: TDataSource;
    customers: TOracleDataSet;
    customersdata: TDataSource;
    users: TOracleDataSet;
    usersdata: TDataSource;
    branches: TOracleDataSet;
    branchesdata: TDataSource;
    currency: TOracleDataSet;
    currencydata: TDataSource;
    AccFlags: TOracleDataSet;
    AccFlagsdata: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccdata: TDataSource;
    tenostat: TOracleDataSet;
    tenostatdata: TDataSource;
    Lazyrest: TOracleDataSet;
    Lazyrestdata: TDataSource;
    PairAccount: TOracleDataSet;
    PairAccountdata: TDataSource;
    sysdat: TOracleDataSet;
    SBUTIL: TOraclePackage;
    OUT_SBOP: TOraclePackage;
    ReportSymbol: TOracleDataSet;
    ReportSymboldata: TDataSource;
    procedure AccountApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure PairAccountBeforeOpen(DataSet: TDataSet);
    procedure customersAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AddAccount(Account: TAccount): Longint;
    procedure UpdateAccount(Account: TAccount);
    procedure CloseAccount(AccountID: Longint);
    function FlagExsist(AccID : Integer;Ch : Char):Boolean;
    procedure Debug(DataSet: TOracleDataSet);
    procedure Refresh_(DataSetName: String);

    function GenerateID: Longint;

  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.DFM}
uses
    sboapiDataModuleImpl;
    function Tdatamodule2.AddAccount(Account: TAccount): Longint;
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
              'insider', Insider
           ]);
end;

procedure Tdatamodule2.UpdateAccount(Account: TAccount);
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
              'v_insider', Insider
           ]);
end;

procedure Tdatamodule2.CloseAccount(AccountID: Longint);
begin
 with OUT_SBOP, Account do
  CallProcedure(cs_close_account, [
              'accid', AccountID,
              'doclose', 1
           ]);
end;

function Tdatamodule2.GenerateID: Longint;
begin
 with OUT_SBOP do
  Result :=CallIntegerFunction(cs_generateID, []);
end;

function Tdatamodule2.FlagExsist(AccID : Integer;Ch : Char):Boolean;
begin
   with SBUTIL do
    Result :=
     CallBooleanFunction(cs_flagexsist,[
       'AccID', AccID ,
       'FlagChar', ch
     ]);
end;

procedure TDataModule2.AccountApplyRecord(Sender: TOracleDataSet;
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


procedure TDataModule2.PairAccountBeforeOpen(DataSet: TDataSet);
begin
 with DataSet do
 begin
  Filtered :=False;
  Filter :='Status = 1';
  Filtered :=True;
 end;
end;

procedure Tdatamodule2.Debug(DataSet: TOracleDataSet);
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

end;


procedure TDataModule2.customersAfterScroll(DataSet: TDataSet);
 begin
 if Account.State in [dsInsert, dsEdit] then
  Account.FieldByName('Name').AsString :=DataSet.FieldByName('Name').AsString;
end;

procedure TDataModule2.Refresh_(DataSetName: String);
const
   c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
   i: Word;
begin
 for i :=0 to ComponentCount- 1 do
  if (Components[i] is TOracleDataSet) and (Components[i].Name <> DataSetName) then
  try
   (Components[i] as TOracleDataSet).Close;
   (Components[i] as TOracleDataSet).Open;
  except
   raise Exception.Create(Format(c_err_message, [(Components[i] as TDataSet).Name]));
  end;
end;


end.
