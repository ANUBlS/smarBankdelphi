unit ReportDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TMainDataModule = class(TDataModule)
    DataTransactions: TDataSource;
    Transactions: TOracleDataSet;
    TransactionsID: TFloatField;
    TransactionsDAT: TDateTimeField;
    TransactionsDEBT: TFloatField;
    TransactionsKREDIT: TFloatField;
    TransactionsVAL_ACC: TFloatField;
    TransactionsAMMOUNT: TFloatField;
    TransactionsLAMMOUNT: TFloatField;
    TransactionsCURRENCYID_C: TIntegerField;
    TransactionsAMMOUNT_C: TFloatField;
    TransactionsNAME: TWideStringField;
    TransactionsDEBETACCOUNT: TWideStringField;
    TransactionsDCURRENCY: TWideStringField;
    TransactionsCREDITACCOUNT: TWideStringField;
    TransactionsCCURRENCY: TWideStringField;
    OraclePackage: TOraclePackage;
    Currency: TOracleDataSet;
    TransactionsRecordNo: TIntegerField;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TWideStringField;
    Operators: TOracleDataSet;
    TransactionsOP_ID: TFloatField;
    TransactionsVID_OP: TIntegerField;
    TransactionsNO_FILIAL: TIntegerField;
    procedure TransactionsRecordNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TMainDataModule.TransactionsRecordNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text :=IntToStr(Transactions.RecNo);
end;

end.
