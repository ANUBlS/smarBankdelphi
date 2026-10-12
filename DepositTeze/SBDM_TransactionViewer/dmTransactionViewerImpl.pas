unit dmTransactionViewerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmTransactionViewer = class(TDataModule)
    TransactionData: TOracleDataSet;
    TransactionDatSrc: TDataSource;
    AvaluteDebit: TOracleDataSet;
    AvaluteDebitDatSrc: TDataSource;
    AvaluteDebitVALUTE: TIntegerField;
    AvaluteDebitVALU_NAME: Twidestringfield;
    AvaluteCredit: TOracleDataSet;
    AvaluteCreditDatSrc: TDataSource;
    AccDebit: TOracleDataSet;
    AccDebitDatSrc: TDataSource;
    AccCredit: TOracleDataSet;
    AccCreditDatSrc: TDataSource;
    RestDebitDatSrc: TDataSource;
    RestCredit: TOracleDataSet;
    RestCreditDatSrc: TDataSource;
    AvaluteCreditVALUTE: TIntegerField;
    AvaluteCreditVALU_NAME: Twidestringfield;
    RestCreditOSTAT: TFloatField;
    RestCreditPOK_OSTAT: TFloatField;
    operations: TOracleDataSet;
    operationsDatSrc: TDataSource;
    CashSymbols: TOracleDataSet;
    CashSymbolsData: TDataSource;
    ConvertationSymbols: TOracleDataSet;
    ConvertationSymbolsData: TDataSource;
    CashSymbolsNAME: Twidestringfield;
    operationsID: TIntegerField;
    operationsNAME: Twidestringfield;
    RestCreditACC_ID: TFloatField;
    AccDebitID: TFloatField;
    AccDebitACC_NO: Twidestringfield;
    AccDebitNAME: Twidestringfield;
    RestDebit: TOracleDataSet;
    RestDebitACC_ID: TFloatField;
    RestDebitOSTAT: TFloatField;
    RestDebitPOK_OSTAT: TFloatField;
    TransactionDataDAT: TDateTimeField;
    TransactionDataNO_PROV: Twidestringfield;
    TransactionDataVID_OP: TIntegerField;
    TransactionDataVAL_ACC: TFloatField;
    TransactionDataRATE_D: TFloatField;
    TransactionDataDEBT: TFloatField;
    TransactionDataCURRENCYID_C: TIntegerField;
    TransactionDataRATE_C: TFloatField;
    TransactionDataKREDIT: TFloatField;
    TransactionDataAMMOUNT: TFloatField;
    TransactionDataAMMOUNT_C: TFloatField;
    TransactionDataLAMMOUNT: TFloatField;
    TransactionDataNAME: Twidestringfield;
    TransactionDataKASSA_B: Twidestringfield;
    TransactionDataKASSA_Z: TIntegerField;
    CashSymbolsSYMBOL: Twidestringfield;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTransactionViewer: TdmTransactionViewer;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

end.
