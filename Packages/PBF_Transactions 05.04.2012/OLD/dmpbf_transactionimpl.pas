unit dmpbf_transactionimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  Tdmpbf_transaction = class(TDataModule)
    TransactionsData: TDataSource;
    PBFTransactions: TOracleDataSet;
    PBFTransactionsTRANSACTIONDATE: TDateTimeField;
    PBFTransactionsDEBITACCNO: TStringField;
    PBFTransactionsCREDITACCNO: TStringField;
    PBFTransactionsCREDITCURRENCYSNAME: TStringField;
    PBFTransactionsDEBITAMOUNT: TFloatField;
    PBFTransactionsCREDITAMOUNT: TFloatField;
    PBFTransactionsLAMOUNT: TFloatField;
    PBFTransactionsNUM: TFloatField;
    PBFTransactionsDEBITCURRENCYSNAME: TStringField;
    PBFOperationsds: TDataSource;
    PBFOperations: TOracleDataSet;
    PBFOperationsID: TFloatField;
    PBFOperationsNAME: TStringField;
    PBFOperationsHDATE: TDateTimeField;
    PBFOperationsCLIENTACCID: TFloatField;
    PBFOperationsAMOUNT: TFloatField;
    CurrDat: TOracleDataSet;
    CurrDatTEK_DAT: TDateTimeField;
    CurrDatPRED_DAT: TDateTimeField;
    PBFAccs: TOracleDataSet;
    PBFAccsds: TDataSource;
    PBFTransaction: TOraclePackage;
    PBFTransactionsOPNAME: TStringField;
    PBFTransactionsID: TFloatField;
    PBFValutes: TOracleDataSet;
    PBFFilials: TOracleDataSet;
    PBFOptypes: TOracleDataSet;
    pbfusers: TOracleDataSet;
    PBFValutesVALUTE: TIntegerField;
    PBFValutesVALU_NAME: TStringField;
    PBFValutesds: TDataSource;
    PBFFilialsID: TFloatField;
    PBFFilialsNAME: TStringField;
    PBFFilialsds: TDataSource;
    PBFOptypesds: TDataSource;
    PBFOptypesOPERATIONTYPE: TStringField;
    pbfusersID: TFloatField;
    pbfusersNAME: TStringField;
    pbfusersds: TDataSource;
    PBFTransactionsVAL_ACC: TFloatField;
    PBFTransactionsDEBITFILIAL: TIntegerField;
    PBFTransactionsCREDITFILIAL: TIntegerField;
    PBFTransactionsFROMFILTOFIL: TStringField;
    PBFTransactionsUSERNAME: TStringField;
    PBFReportDs: TOracleDataSet;
    PBFTransactionsCLIENTACCID: TFloatField;
    PBFTransactionsNAME: TStringField;
    PBFTransactionsSTATUS: TFloatField;
    PBFTransactionsPAYMENTNO: TStringField;
    PBFReportDsPE_BANK: TStringField;
    PBFReportDsPE_KOD_B: TFloatField;
    PBFReportDsPE_INN: TStringField;
    PBFReportDsPE_KRNO: TFloatField;
    PBFReportDsPE_SWIFT: TStringField;
    PBFReportDsPC_ACCNO: TStringField;
    PBFReportDsVALUTE: TStringField;
    PBFReportDsRE_BANK: TStringField;
    PBFReportDsRE_KOD_B: TFloatField;
    PBFReportDsRE_INN: TStringField;
    PBFReportDsRE_KRNO: TStringField;
    PBFReportDsRE_SWIFT: TStringField;
    PBFReportDsRC_NAME: TStringField;
    PBFReportDsRC_ACCOUNT: TStringField;
    PBFReportDsRC_INN: TStringField;
    PBFReportDsSTAMP: TBlobField;
    PBFReportDsCHIEFSIGN: TBlobField;
    PBFReportDsACCOUTANTSIGN: TBlobField;
    PBFReportDsPAYMENTNO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure PBFOperationsApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
    OperType :String;
  end;

var
  dmpbf_transaction: Tdmpbf_transaction;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure Tdmpbf_transaction.DataModuleCreate(Sender: TObject);
begin
   CurrDat.open;
   PBFAccs.open;
   with PBFTransactions do
   begin
      SetVariable('TransactionDate',CurrDat.FieldByName('TEK_DAT').AsDateTime);
      SetVariable('orderfield','id');
      open;
   end;
end;

procedure Tdmpbf_transaction.DataModuleDestroy(Sender: TObject);
begin
   CurrDat.Close;
   PBFAccs.Close;
   PBFTransactions.Close;
end;

procedure Tdmpbf_transaction.PBFOperationsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
   with PBFTransaction,(Sender as TOracleDataSet) do
   begin
      case Action of
      'I': begin
           if OperType = 'KREDIT' then
            CallProcedure('add_FullOperation',[
            'v_name','KREDIT'
           ,'v_clientaccid',FieldByName('clientaccid').AsInteger
           ,'v_amount' ,FieldByName('amount').AsFloat
           ])
           else
             CallProcedure('add_OtherTypeOp',[
            'OpType',FieldByName('name').AsString
           ,'amount',FieldByName('amount').AsFloat
           ,'name' ,FieldByName('name').AsString]);
           Applied := True;
           end;

      'U': begin
           if OperType = 'KREDIT' then
            CallProcedure('edit_FullOperation',[
            'vID',FieldByName('ID').AsInteger,
            'vname',FieldByName('name').AsString,
            'vclientaccid',FieldByName('clientaccid').AsInteger,
            'vamount',FieldByName('amount').AsFloat])
            else
            CallProcedure('edit_OtherTypeOp',[
            'vOptype',FieldByName('name').AsString,
            'vID',FieldByName('ID').AsInteger,
            'vamount',FieldByName('amount').AsFloat]);
        Applied := True;

        end;

   end;
   end;

end;

end.
