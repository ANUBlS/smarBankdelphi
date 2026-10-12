unit LazyTransactionDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TLazTrDatMod = class(TDataModule)
    TransactionsData: TOracleDataSet;
    Transactions: TOraclePackage;
    TransactionsDatSrc: TDataSource;
    TransactionsDataID: TFloatField;
    TransactionsDataNUMBEROFCREDIT: TStringField;
    TransactionsDataCUSTNAME: TStringField;
    TransactionsDataDEBITACCNO: TStringField;
    TransactionsDataCREDITACCNO: TStringField;
    TransactionsDataDEBITCURRENCY: TStringField;
    TransactionsDataCREDITCURRENCY: TStringField;
    TransactionsDataDEBITAMOUNT: TFloatField;
    TransactionsDataPLANPAY: TFloatField;
    TransactionsDataTRDESCRIPTION: TStringField;
    TransactionsDataSTATUS: TFloatField;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1DESCRIPTION: TStringField;
    OracleDataSet1BANK_KOD: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LazTrDatMod: TLazTrDatMod;



implementation

{$R *.DFM}
uses sboapiDataModuleImpl,sbsystem;



procedure TLazTrDatMod.DataModuleCreate(Sender: TObject);
begin
   with TransactionsData do begin
       SetVariable('TransactionDate',Get_CurrentDate);
       SetVariable('OrderField','numberofcredit');
       Open;
   end;
end;

procedure TLazTrDatMod.DataModuleDestroy(Sender: TObject);
begin
   TransactionsData.Close;
end;

end.
