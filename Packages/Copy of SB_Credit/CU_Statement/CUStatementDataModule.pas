unit CUStatementDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TStatementDataMod = class(TDataModule)
    CreditsInfo: TOracleDataSet;
    DSCreditsInfo: TDataSource;
    DSTranches: TDataSource;
    Tranches: TOracleDataSet;
    DSPayments: TDataSource;
    Payments: TOracleDataSet;
    DSSchedule: TDataSource;
    Schedule: TOracleDataSet;
    DSUserGroups: TDataSource;
    UserGroups: TOracleDataSet;
    CreditsInfoCREDITLINEAMOUNT: TFloatField;
    CreditsInfoANNUALYINTERESTRATE: TFloatField;
    CreditsInfoANNUALYOVERDUERATE: TFloatField;
    CreditsInfoDATEOFCONCLUSION: TDateTimeField;
    CreditsInfoDUEDATEFIRSTCONTRACT: TDateTimeField;
    CreditsInfoDUEDATELASTCONTRACT: TDateTimeField;
    CreditsInfoPURPOSEOFCREDIT: TWideStringField;
    CreditsInfoUSRGROUP: TFloatField;
    CreditsInfoCUSTOMERTYPE: TFloatField;
    CreditsInfoCREDITTYPE: TFloatField;
    CreditsInfoNAME: TWideStringField;
    DSCreditTypes: TDataSource;
    CreditTypes: TOracleDataSet;
    DSCategories: TDataSource;
    Categories: TOracleDataSet;
    RestsInPeriod: TOracleDataSet;
    DSPeriod: TDataSource;
    IntrInPeriod: TOracleDataSet;
    RestsInPeriodREST: TFloatField;
    RestsInPeriodINTERESTREST: TFloatField;
    RestsInPeriodDUEREST: TFloatField;
    RestsInPeriodDUEINTERESTREST: TFloatField;
    IntrInPeriodINTEREST: TFloatField;
    IntrInPeriodDUEINTEREST: TFloatField;
    RestsInPeriodHDATE: TDateTimeField;
    IntrInPeriodHDATE: TDateTimeField;
    ScheduleID: TFloatField;
    ScheduleCREDITID: TFloatField;
    SchedulePAYMENTDATE: TDateTimeField;
    SchedulePRINCIPAL: TFloatField;
    ScheduleINTEREST: TFloatField;
    InterestsDataSource: TDataSource;
    ReportDataSet: TOracleDataSet;
    ReportDataSource: TDataSource;
    RatesDataSet: TOracleDataSet;
    RatesDataSource: TDataSource;
    AboutBank: TOracleDataSet;
    RatesDataSetRATE: TFloatField;
    ReportDataSetCONTRACTACCID: TFloatField;
    ReportDataSetBOOROWERID: TFloatField;
    ReportDataSetCURRENCY: TFloatField;
    ReportDataSetDATEOFCONCLUSION: TDateTimeField;
    ReportDataSetNAME: TWideStringField;
    ReportDataSetCLIENTACCNO: TWideStringField;
    ReportDataSetCONTRACTACCCNO: TWideStringField;
    ReportDataSetINTERESTACCCNO: TWideStringField;
    ReportDataSetDUELOANACCNO: TWideStringField;
    ReportDataSetDUEINTERESTACCNO: TWideStringField;
    ReportDataSetLOANACCACCNO: TWideStringField;
    PaymentsID: TFloatField;
    PaymentsCREDITID: TFloatField;
    PaymentsPAYDATE: TDateTimeField;
    PaymentsPAYEDAMT: TFloatField;
    PaymentsPAYEDINTAMT: TFloatField;
    PaymentsPAYEDDUEAMT: TFloatField;
    PaymentsPAYEDDUEINTAMT: TFloatField;
    PaymentsPAYEDPENALTYAMT: TFloatField;
    ReportDataSetVAL_NAME: TWideStringField;
    ProlongationDataSet: TOracleDataSet;
    ProlongationDataSetPROLONGDATE: TDateTimeField;
    ProlongationDataSetNEWCLOSEDATE: TDateTimeField;
    ProlongationDataSource: TDataSource;
    TranchesID: TFloatField;
    TranchesCREDITID: TFloatField;
    TranchesTRANCHEDATE: TDateTimeField;
    TranchesTRANCHEAMOUNT: TFloatField;
    DefIntDatSet: TOracleDataSet;
    CM_AK_REPORTS: TOraclePackage;
    ScheduleSM: TFloatField;
    PaymentsSM: TFloatField;
    ReportDataSetINN: TWideStringField;
    cust: TOracleDataSet;
    ScheduleSIRA: TFloatField;
    PaymentsSIRA: TFloatField;
    DataSource: TDataSource;
    DataSet: TOracleDataSet;
    DataSetUSER1: TWideStringField;
    DataSetHDATE: TDateTimeField;
    DataSetSYSDAT: TDateTimeField;
    DataSetOLDPARAM: TWideStringField;
    DataSetNEWPARAM: TWideStringField;
    DataSetPOLYA: TWideStringField;
    DataSetROWNUM: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatementDataMod : TStatementDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;


procedure TStatementDataMod.DataModuleCreate(Sender: TObject);
begin
   AboutBank.Open;
end;

procedure TStatementDataMod.DataModuleDestroy(Sender: TObject);
begin
   AboutBank.CloseAll;
end;

end.
