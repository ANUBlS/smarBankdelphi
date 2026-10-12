unit ExtractionDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TExtractionDataModule = class(TDataModule)
    Currency: TOracleDataSet;
    Branch: TOracleDataSet;
    DataCurrency: TDataSource;
    DataBranch: TDataSource;
    Customers: TOracleDataSet;
    DataCustomers: TDataSource;
    Accounts: TOracleDataSet;
    Transactions: TOracleDataSet;
    AccountsACCOUNTID: TFloatField;
    AccountsACCOUNTNUMBER: TStringField;
    AccountsACCOUNTNAME: TStringField;
    AccountsACCOUNTCURRENCY: TIntegerField;
    AccountsOPENDATE: TDateTimeField;
    AccountsBALANCE: TFloatField;
    AccountsBRANCH: TIntegerField;
    AccountsCUSTOMERINN: TFloatField;
    AccountsBEGINREMAINDER: TFloatField;
    AccountsBEGINLREMAINDER: TFloatField;
    AccountsLASTREMAINDER: TFloatField;
    AccountsLASTLREMAINDER: TFloatField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure CustomersAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExtractionDataModule: TExtractionDataModule;

implementation

uses sboapidatamoduleimpl, ExtractionUnit;

{$R *.DFM}

procedure TExtractionDataModule.CustomersAfterScroll(DataSet: TDataSet);
begin
  with ExtractionForm, DataSet do
   EditCustomers.Text :=FieldByName('ID').AsString;
end;

end.
