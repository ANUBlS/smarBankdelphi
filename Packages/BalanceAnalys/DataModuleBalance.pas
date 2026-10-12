unit DataModuleBalance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModulBalance = class(TDataModule)
    DataBalance: TDataSource;
    Balance: TOracleDataSet;
    DataAccount: TDataSource;
    Account: TOracleDataSet;
    DataTransaction: TDataSource;
    Transaction: TOracleDataSet;
    DataOperator: TDataSource;
    Operators: TOracleDataSet;
    DataCurrency: TDataSource;
    OperationType: TOracleQuery;
    BalanceBALANCEACCOUNT: TFloatField;
    BalanceFIRSTACTIVE: TFloatField;
    BalanceFIRSTPASSIVE: TFloatField;
    BalanceDTURNOVER: TFloatField;
    BalanceCTURNOVER: TFloatField;
    BalanceLASTACTIVE: TFloatField;
    BalanceLASTPASSIVE: TFloatField;
    PeriodData: TOracleDataSet;
    SysDat: TOracleDataSet;
    Currency: TOracleDataSet;
    AccountACCOUNTID: TFloatField;
    AccountACCNO: TWideStringField;
    AccountCURRENCYID: TIntegerField;
    AccountBRANCHID: TIntegerField;
    AccountBALANCENO: TFloatField;
    AccountBEGINACTIVE: TFloatField;
    AccountBEGINPASSIVE: TFloatField;
    AccountDTURNOVER: TFloatField;
    AccountCTURNOVER: TFloatField;
    AccountENDACTIVE: TFloatField;
    AccountENDPASSIVE: TFloatField;
    TransactionID: TFloatField;
    TransactionOPERATORID: TFloatField;
    TransactionOPERATIONTYPE: TIntegerField;
    TransactionDAT: TDateTimeField;
    TransactionDEBT: TFloatField;
    TransactionDEBTACC: TWideStringField;
    TransactionDVALNAME: TWideStringField;
    TransactionKREDIT: TFloatField;
    TransactionCREDITACC: TWideStringField;
    TransactionCVALNAME: TWideStringField;
    TransactionAMMOUNT: TFloatField;
    TransactionAMMOUNT_C: TFloatField;
    TransactionLAMMOUNT: TFloatField;
    TransactionNAME: TWideStringField;
    AccountNAME: TWideStringField;
    TransactionUSERNAME: TWideStringField;
    DatadebtTransaction: TDataSource;
    debtTransaction: TOracleDataSet;
    DateTimeField1: TDateTimeField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    WideStringField5: TWideStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    IntegerField1: TIntegerField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    WideStringField6: TWideStringField;
    DatacredTransaction: TDataSource;
    credTransaction: TOracleDataSet;
    DateTimeField2: TDateTimeField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    WideStringField11: TWideStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    IntegerField2: TIntegerField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    WideStringField12: TWideStringField;
    Datacredbal_acc: TDataSource;
    credbal_acc: TOracleDataSet;
    credbal_accCEM: TFloatField;
    credbal_accDEBETBALANS: TFloatField;
    credbal_accKREDITBALANS: TFloatField;
    Datacdebtbal_acc: TDataSource;
    debtbal_acc: TOracleDataSet;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    OperatorsID: TFloatField;
    OperatorsNAME: TWideStringField;
    OperatorsCTIME: TDateTimeField;
    CurrencyVALUTE: TIntegerField;
    CurrencyVALU_NAME: TWideStringField;
    SysDatTEK_DAT: TDateTimeField;
    TransactionKREDITBALANS: TFloatField;
    TransactionDEBETBALANS: TFloatField;
    debtTransactionKREDITBALANS: TFloatField;
    debtTransactionDEBETBALANS: TFloatField;
    credTransactionKREDITBALANS: TFloatField;
    credTransactionDEBETBALANS: TFloatField;
    procedure OperationTypeThreadRecord(Sender: TOracleQuery);
    procedure BalanceAfterScroll(DataSet: TDataSet);
    procedure AccountAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulBalance: TDataModulBalance;

implementation

uses sboapiDataModuleImpl, BalanceAnalysImpl;

{$R *.DFM}

procedure TDataModulBalance.OperationTypeThreadRecord(
  Sender: TOracleQuery);
begin
 with FormBalanceAnalys, CBBranches, Items do
  begin
   Add(Sender.Field('name'));
   Checked[Count-1]:=True;
   TStringList(Pointer(CBBranches.Tag)^).Add(Sender.Field('ID'));
  end;
end;

procedure TDataModulBalance.BalanceAfterScroll(DataSet: TDataSet);
var
   BalanceNo: string;
begin
 BalanceNo:=DataSet.FieldByName('BalanceAccount').AsString;
 with Account do
  begin
   Filtered :=False;
   Filter :='BalanceNo = '+BalanceNo;
   Filtered :=True;
  end;
end;

procedure TDataModulBalance.AccountAfterScroll(DataSet: TDataSet);
var
   AccountID: string;
   kreditbal:string;
begin
 with DataSet.FieldByName('AccountID') do
  if IsNull then
  begin
   AccountID :='-1';
  end
  else
   AccountID :=AsString;

  { with debtbal_acc do
    kreditbal:=FieldByName('KREDITBALANS').AsString;    }

 with Transaction do
  begin
   Filtered :=False;
   Filter :='(Debt = ' + AccountID + ') OR (' + 'Kredit = ' + AccountID + ')';
   Filtered :=True;

  end;
 {
   with debtTransaction do
  begin
       Filtered :=False;
   Filter :='(Debt = ' + AccountID + ')';
   Filter :='(Debt = ' + AccountID + 'and c.bal_cn1='+kreditbal+')';
   Filtered :=True;

  end;
  {
  with credTransaction do
  begin
   Filtered :=False;
   Filter :='(Kredit = ' + AccountID + ')';
   Filtered :=True;

  end;          }




end;

end.
