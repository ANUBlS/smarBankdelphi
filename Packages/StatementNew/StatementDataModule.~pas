unit StatementDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TStatementDataModNew = class(TDataModule)
    P_Extraction_OP: TOraclePackage;
    Extraction_ODSt: TOracleDataSet;
    ExtractionTrans_ODSt: TOracleDataSet;
    Bankinfo_ODSt: TOracleDataSet;
    DataSource1: TDataSource;
    ODSSysKod: TOracleDataSet;
    DataSrcSysKod: TDataSource;
    ExtractionTrans_ODStID: TFloatField;
    ExtractionTrans_ODStDAT: TDateTimeField;
    ExtractionTrans_ODStTIM: TDateTimeField;
    ExtractionTrans_ODStCURRENCYID: TIntegerField;
    ExtractionTrans_ODStPAIRACCOUNTID: TFloatField;
    ExtractionTrans_ODStPAIRACCOUNTNAME: TStringField;
    ExtractionTrans_ODStPAIRCURRENCYID: TFloatField;
    ExtractionTrans_ODStDEBIT: TFloatField;
    ExtractionTrans_ODStKREDIT: TFloatField;
    ExtractionTrans_ODStLDEBIT: TFloatField;
    ExtractionTrans_ODStLKREDIT: TFloatField;
    ExtractionTrans_ODStNAME: TStringField;
    Extraction_ODStCUSTOMERNAME: TStringField;
    Extraction_ODStCUSTOMERID: TFloatField;
    Extraction_ODStACCOUNTNAME: TStringField;
    Extraction_ODStACCOUNTNUMBER: TStringField;
    Extraction_ODStACCOUNTID: TFloatField;
    Extraction_ODStCURRENCYID: TIntegerField;
    Extraction_ODStCURRENCYNAME: TStringField;
    Extraction_ODStBALANCECODE: TFloatField;
    Extraction_ODStCLOSE_DAT: TDateTimeField;
    Extraction_ODStDATDATE: TDateTimeField;
    Extraction_ODStLASTOPDATE: TDateTimeField;
    Extraction_ODStOSTAT: TFloatField;
    Extraction_ODStPOK_OSTAT: TFloatField;
    Extraction_ODStOBR_D: TFloatField;
    Extraction_ODStOBR_K: TFloatField;
    Extraction_ODStPOK_OBR_D: TFloatField;
    Extraction_ODStPOK_OBR_K: TFloatField;
    Extraction_ODStAP_BEG: TStringField;
    Extraction_ODStENDDATE: TDateTimeField;
    Extraction_ODStENDOSTAT: TFloatField;
    Extraction_ODStENDPOK_OSTAT: TFloatField;
    Extraction_ODStENDOBR_D: TFloatField;
    Extraction_ODStENDOBR_K: TFloatField;
    Extraction_ODStENDPOK_OBR_D: TFloatField;
    Extraction_ODStENDPOK_OBR_K: TFloatField;
    Extraction_ODStAP_END: TStringField;
    ExtractionTrans_ODStOWNACCOUNTID: TFloatField;
    DataSrcCurrency: TDataSource;
    Currency_ODSt: TOracleDataSet;
    Extraction_ODStCUSTOMERVOIN: TFloatField;
    RatesDataSet: TOracleDataSet;
    RatesDataSetVAL_KOD: TIntegerField;
    RatesDataSetDAT: TDateTimeField;
    RatesDataSetOSTAT: TFloatField;
    Extraction_ODStOPENDATE: TDateTimeField;
    RatesDataSetBegin: TOracleDataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FilialODS: TOracleDataSet;
    DsFials: TDataSource;
    DSUser: TDataSource;
    UserODS: TOracleDataSet;
    OraPackVExtraction: TOraclePackage;
    OraDataSetMainExell: TOracleDataSet;
    OraDataSetMainExellDAT: TStringField;
    OraDataSetMainExellVAL_NAME: TStringField;
    OraDataSetMainExellACC_NO: TStringField;
    OraDataSetMainExellDEBET: TFloatField;
    OraDataSetMainExellKREDIT: TFloatField;
    OraDataSetMainExellNAME: TStringField;
    OraDataSetMainExellAMMOUNT: TFloatField;
    OraDataSetMainExellLAMMOUNT: TFloatField;
    OraDataSetMainExellAMMOUNT_C: TFloatField;
    OraDataSetBalcns: TOracleDataSet;
    OraDataSetTurnBals: TOracleDataSet;
    OraDataSetTurnBalsBAL_CN1: TFloatField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatementDataModNew: TStatementDataModNew;

implementation
uses sboapiDataModuleImpl, StatementImpl;

{$R *.DFM}

procedure TStatementDataModNew.DataModuleDestroy(Sender: TObject);
begin
  RatesDataSet.Close;
  RatesDataSetBegin.Close;
  StatementDataModNew:= nil;
end;

procedure TStatementDataModNew.DataModuleCreate(Sender: TObject);
begin
  RatesDataSet.Open;
  RatesDataSetBegin.Open;
end;

end.
