unit repairdatamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataMod = class(TDataModule)
    p_correct: TOraclePackage;
    DsTransaction: TDataSource;
    Transactions: TOracleDataSet;
    DsBankDay: TDataSource;
    BankDay: TOracleDataSet;
    DSDebitRate: TDataSource;
    DebitRate: TOracleDataSet;
    CreditRate: TOracleDataSet;
    DSCreditRate: TDataSource;
    tFilial_D: TOracleDataSet;
    dsFilial_D: TDataSource;
    dsUser: TDataSource;
    Users: TOracleDataSet;
    dsDCurrency: TDataSource;
    DCurrency: TOracleDataSet;
    dsCCurrency: TDataSource;
    CCurrency: TOracleDataSet;
    dsDebitAcc: TDataSource;
    DebitAccount: TOracleDataSet;
    dsCreditAcc: TDataSource;
    CreditAccount: TOracleDataSet;
    dsDescription: TDataSource;
    DescriptionDATA: TOracleDataSet;
    dsInBalanceSymbols: TDataSource;
    InBalanceSymbolsData: TOracleDataSet;
    dsOutBalanceChar: TDataSource;
    OutBalanceCharData: TOracleDataSet;
    procedure TransactionsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation
 uses sboapidatamoduleimpl, RepairMainFormImpl;
{$R *.DFM}

procedure TDataMod.TransactionsAfterScroll(DataSet: TDataSet);
begin
with RepairMainForm do
begin
 LTrDate.Caption:=Transactions.FieldByName('DAT').asstring;
 LD_Currency.Caption:=Transactions.FieldByName('D$').asstring;
 LC_Currency.Caption:=Transactions.FieldByName('C$').asstring;

 LRate_D.Caption:= P_Correct.CallFloatFunction('GetRate', [
  'CurrencyID', StrToInt(LD_Currency.Caption),
  'ArchiveDate', FormatDateTime('d-mmmm-yy',StrToDate(LTrDate.Caption))
]);

 LRate_C.Caption:= P_Correct.CallFloatFunction('GetRate', [
  'CurrencyID', StrToInt(LC_Currency.Caption),
  'ArchiveDate', FormatDateTime('d-mmmm-yy',StrToDate(LTrDate.Caption))
]);
 LTrDate.Caption:=Transactions.FieldByName('DAT').asstring;
 LTrRate_D.Caption:=Transactions.FieldByName('Rate_d').asstring;
 LTrRate_C.Caption:=Transactions.FieldByName('Rate_c').asstring;
end;
end;

end.
