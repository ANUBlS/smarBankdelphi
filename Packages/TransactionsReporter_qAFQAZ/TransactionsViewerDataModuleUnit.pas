unit TransactionsViewerDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TTransDataModule = class(TDataModule)
    BankInfo: TOracleDataSet;
    Transactions: TOracleDataSet;
    TransactionsDAT: TDateTimeField;
    TransactionsDBAL_CN: TFloatField;
    TransactionsDEBITOR: TStringField;
    TransactionsVAL_ACC: TStringField;
    TransactionsDNAME: TStringField;
    TransactionsKBAL_CN: TFloatField;
    TransactionsKREDITOR: TStringField;
    TransactionsCURRENCYID_C: TStringField;
    TransactionsKNAME: TStringField;
    TransactionsAMMOUNT: TFloatField;
    TransactionsAMMOUNT_C: TFloatField;
    TransactionsLAMMOUNT: TFloatField;
    TransactionsNAME: TStringField;
    DataSrcTransactions: TDataSource;
    BankInfoAZ_NAME: TStringField;
    BankInfoLOGO: TBlobField;
    BankInfoINN: TStringField;
    BankInfoSEDR: TStringField;
    BankInfoBUHALTR: TStringField;
    SYSDAT: TOracleDataSet;
    Curr: TOracleDataSet;
    DataCurrency: TDataSource;
    DFilial: TOracleDataSet;
    DataDFilials: TDataSource;
    Users: TOracleDataSet;
    DataUsers: TDataSource;
    TransactionsDCURRENCY: TFloatField;
    TransactionsKCURRENCY: TIntegerField;
    TransactionsOPERATOR: TFloatField;
    TransactionsDEBETFILIAL: TIntegerField;
    TransactionsCREDITFILIAL: TIntegerField;
    OpType: TOracleDataSet;
    DataOpertaionTypes: TDataSource;
    TransactionsOPERATIONTYPE: TFloatField;
    OperationTypes: TOracleQuery;
    Currency: TOracleQuery;
    CFilial: TOracleDataSet;
    DataCFilial: TDataSource;
    TransactionsDEBT: TFloatField;
    TransactionsKREDIT: TFloatField;
    TransactionsUSERNAME: TStringField;
    SumTrans: TOracleDataSet;
    DataSumTrans: TDataSource;
    procedure OperationTypesThreadRecord(Sender: TOracleQuery);
    procedure CurrencyThreadRecord(Sender: TOracleQuery);
    procedure OperationTypesThreadFinished(Sender: TOracleQuery);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransDataModule: TTransDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl, TransactionsViewerImpl;
procedure TTransDataModule.OperationTypesThreadRecord(Sender: TOracleQuery);
begin
 with FrmTransactionsViewer, CBOperationTypes, Items do
  begin
   Add(Sender.Field('name'));
   Checked[Count-1]:=True;
   TStringList(Pointer(CBOperationTypes.Tag)^).Add(Sender.Field('ID'));
  end;
end;

procedure TTransDataModule.CurrencyThreadRecord(Sender: TOracleQuery);
begin
 with FrmTransactionsViewer, CLBCurrency, Items do
  begin
   Add(Sender.Field('valu_name'));
   Checked[Count-1]:=True;
   TStringList(Pointer(CLBCurrency.Tag)^).Add(Sender.Field('valute'));
  end;
end;

procedure TTransDataModule.OperationTypesThreadFinished(
  Sender: TOracleQuery);
begin
 with FrmTransactionsViewer do
  ActionFilterExecute(Sender);
end;

end.
