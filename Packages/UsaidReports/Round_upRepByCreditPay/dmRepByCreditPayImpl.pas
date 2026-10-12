unit dmRepByCreditPayImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmRepByCreditPay = class(TDataModule)
    sysdat: TOracleDataSet;
    filialscpr: TOracleDataSet;
    CreditTypescpr: TOracleDataSet;
    valutescpr: TOracleDataSet;
    filialsds: TDataSource;
    CreditTypesds: TDataSource;
    valutesds: TDataSource;
    ODSmainds: TDataSource;
    Queriescpr: TOracleDataSet;
    ODSmaincpr: TOracleDataSet;
    DuePeriodscpr: TOracleDataSet;
    DuePeriodsds: TDataSource;
    DuePeriodscprID: TFloatField;
    DuePeriodscprNAME: TWideStringField;
    DuePeriodscprBPER: TFloatField;
    DuePeriodscprEPER: TFloatField;
    ODSmaincprID: TFloatField;
    ODSmaincprCOMMONCOUNTCRD: TFloatField;
    ODSmaincprCOMMONINITIALAMOUNT: TFloatField;
    ODSmaincprEXPCOUNTCRD: TFloatField;
    ODSmaincprEXPINITIALAMOUNT: TFloatField;
    ODSmaincprEXPCEOF: TFloatField;
    ODSmaincprG1: TFloatField;
    ODSmaincprG2: TFloatField;
    ODSmaincprG3: TFloatField;
    ODSmaincprG4: TFloatField;
    ODSmaincprG5: TFloatField;
    ODSmaincprG6: TFloatField;
    ODSmaincprDESCRIPTION: TWideStringField;
    ODSmaincprG7: TFloatField;
    ODSmaincprFG1: TFloatField;
    ODSmaincprFG2: TFloatField;
    ODSmaincprFG3: TFloatField;
    ODSmaincprFG4: TFloatField;
    ODSmaincprFG5: TFloatField;
    ODSmaincprFG6: TFloatField;
    ODSmaincprFG7: TFloatField;
    Summaincpr: TOracleDataSet;
    Summaincprds: TDataSource;
    SummaincprCOMMONCOUNTCRD: TFloatField;
    SummaincprCOMMONINITIALAMOUNT: TFloatField;
    SummaincprEXPCOUNTCRD: TFloatField;
    SummaincprEXPINITIALAMOUNT: TFloatField;
    SummaincprEXPCEOF: TFloatField;
    SummaincprG1: TFloatField;
    SummaincprG2: TFloatField;
    SummaincprG3: TFloatField;
    SummaincprG4: TFloatField;
    SummaincprG5: TFloatField;
    SummaincprG6: TFloatField;
    SummaincprG7: TFloatField;
    SummaincprFG1: TFloatField;
    SummaincprFG2: TFloatField;
    SummaincprFG3: TFloatField;
    SummaincprFG4: TFloatField;
    SummaincprFG5: TFloatField;
    SummaincprFG6: TFloatField;
    SummaincprFG7: TFloatField;
    Paymentsrestds: TDataSource;
    Paymentsrest: TOracleDataSet;
    LastPayments: TOracleDataSet;
    LastPaymentsds: TDataSource;
    LastPaymentsCNT: TFloatField;
    LastPaymentsREST: TFloatField;
    LastPaymentsINTERESTREST: TFloatField;
    PaymentsrestCNT: TFloatField;
    PaymentsrestREST: TFloatField;
    PaymentsrestINTERESTREST: TFloatField;
    ODSmaincprceofexp: TWideStringField;
    DetailInf1ds: TDataSource;
    DetailInf1: TOracleDataSet;
    DetailInf1NUMBEROFCREDIT: TWideStringField;
    DetailInf1NAME: TWideStringField;
    DetailInf1TRAMT: TFloatField;
    DetailInf1PERIOD: TFloatField;
    DetailInf1REST: TFloatField;
    DetailInf1ANNUALYINTERESTRATE: TFloatField;
    DetailInf1PERCENT: TFloatField;
    DetailInf1TRDAT: TDateTimeField;
    DetailInf1THISMONTHSPAYDAT: TDateTimeField;
    DetailInf1THISMONTHSPRINCIPAL: TFloatField;
    DetailInf1THISMONTHSINTEREST: TFloatField;
    DetailInf1PLANINTEREST: TFloatField;
    DetailInf1SUMPLANPAY: TFloatField;
    DetailInf1EXDATCOUNT: TFloatField;
    DetailInf1PAYREST: TFloatField;
    DetailInf1PAYINTREST: TFloatField;
    DetailInf1PAYPEN: TFloatField;
    DetailInf1SUMREALPAY: TFloatField;
    DetailInf1DESCRIPTION: TWideStringField;
    DetailInf1VALU_NAME: TWideStringField;
    DetailInf1FILIALNAME: TWideStringField;
    Details2ds: TDataSource;
    Detailinf2: TOracleDataSet;
    Detailinf2NUMBEROFCREDIT: TWideStringField;
    Detailinf2ACC_NO: TWideStringField;
    Detailinf2CUSTNAME: TWideStringField;
    Detailinf2TRAMT: TFloatField;
    Detailinf2REST: TFloatField;
    Detailinf2ANNUALYINTERESTRATE: TFloatField;
    Detailinf2PERCENT: TFloatField;
    Detailinf2CLOSE_DAT: TDateTimeField;
    Payments: TOracleDataSet;
    Plans: TOracleDataSet;
    Plansds: TDataSource;
    Paymentsds: TDataSource;
    PaymentsPAYDATE: TDateTimeField;
    PaymentsPAYEDPENALTYAMT: TFloatField;
    PaymentsPAYREST: TFloatField;
    PaymentsPAYINTREST: TFloatField;
    PlansPAYMENTDATE: TDateTimeField;
    PlansPRINCIPAL: TFloatField;
    PlansINTEREST: TFloatField;
    Detailinf2EXDATCOUNT: TFloatField;
    Detailinf2FILIALNAME: TWideStringField;
    Detailinf2VALU_NAME: TWideStringField;
    Detailinf2DESCRIPTION: TWideStringField;
    PlansSM: TFloatField;
    PaymentsSM: TFloatField;
    Detailinf2ID: TFloatField;
    ODSmaincprCNTG1: TFloatField;
    ODSmaincprCNTG2: TFloatField;
    ODSmaincprCNTG3: TFloatField;
    ODSmaincprCNTG4: TFloatField;
    ODSmaincprCNTG5: TFloatField;
    ODSmaincprCNTG6: TFloatField;
    ODSmaincprCNTG7: TFloatField;
    SummaincprCNTG1: TFloatField;
    SummaincprCNTG2: TFloatField;
    SummaincprCNTG3: TFloatField;
    SummaincprCNTG4: TFloatField;
    SummaincprCNTG5: TFloatField;
    SummaincprCNTG6: TFloatField;
    SummaincprCNTG7: TFloatField;
    DetailInf1THISMONTHSPENALTY: TFloatField;
    DetailInffull1: TOracleDataSet;
    DetailInffull1NUMBEROFCREDIT: TWideStringField;
    DetailInffull1NAME: TWideStringField;
    DetailInffull1TRAMT: TFloatField;
    DetailInffull1PERIOD: TFloatField;
    DetailInffull1REST: TFloatField;
    DetailInffull1PLANINTEREST: TFloatField;
    DetailInffull1SUMPLANPAY: TFloatField;
    DetailInffull1THISMONTHSPAYDAT: TDateTimeField;
    DetailInffull1THISMONTHSPRINCIPAL: TFloatField;
    DetailInffull1THISMONTHSINTEREST: TFloatField;
    DetailInffull1THISMONTHSPENALTY: TFloatField;
    DetailInffull1ANNUALYINTERESTRATE: TFloatField;
    DetailInffull1PERCENT: TFloatField;
    DetailInffull1TRDAT: TDateTimeField;
    DetailInffull1EXDATCOUNT: TFloatField;
    DetailInffull1PAYREST: TFloatField;
    DetailInffull1PAYINTREST: TFloatField;
    DetailInffull1PAYPEN: TFloatField;
    DetailInffull1SUMREALPAY: TFloatField;
    DetailInffull1DESCRIPTION: TWideStringField;
    DetailInffull1VALU_NAME: TWideStringField;
    DetailInffull1FILIALNAME: TWideStringField;
    DetailInffull1PHONENUMBER: TWideStringField;
    DetailInffull1ADDRESS: TWideStringField;
    DetailInffull1ds: TDataSource;
    DetailInf1smthismonthpay: TFloatField;
    Tel: TOracleDataSet;
    Telds: TDataSource;
    TelPHONENUMBER: TWideStringField;
    TelADDRESS: TWideStringField;
    DetailInf1ID: TFloatField;
    DetailInf30: TOracleDataSet;
    DetailInf30ID: TFloatField;
    DetailInf30NUMBEROFCREDIT: TWideStringField;
    DetailInf30NAME: TWideStringField;
    DetailInf30TRAMT: TFloatField;
    DetailInf30PERIOD: TFloatField;
    DetailInf30REST: TFloatField;
    DetailInf30PLANINTEREST: TFloatField;
    DetailInf30SUMPLANPAY: TFloatField;
    DetailInf30THISMONTHSPAYDAT: TDateTimeField;
    DetailInf30THISMONTHSPRINCIPAL: TFloatField;
    DetailInf30THISMONTHSINTEREST: TFloatField;
    DetailInf30THISMONTHSPENALTY: TFloatField;
    DetailInf30ANNUALYINTERESTRATE: TFloatField;
    DetailInf30PERCENT: TFloatField;
    DetailInf30TRDAT: TDateTimeField;
    DetailInf30EXDATCOUNT: TFloatField;
    DetailInf30PAYREST: TFloatField;
    DetailInf30PAYINTREST: TFloatField;
    DetailInf30PAYPEN: TFloatField;
    DetailInf30SUMREALPAY: TFloatField;
    DetailInf30DESCRIPTION: TWideStringField;
    DetailInf30VALU_NAME: TWideStringField;
    DetailInf30FILIALNAME: TWideStringField;
    DetailInf30smthismonthpay: TFloatField;
    DetailInf30ds: TDataSource;
    DetailInfAll: TOracleDataSet;
    DetailInfAllID: TFloatField;
    DetailInfAllNUMBEROFCREDIT: TWideStringField;
    DetailInfAllNAME: TWideStringField;
    DetailInfAllTRAMT: TFloatField;
    DetailInfAllPERIOD: TFloatField;
    DetailInfAllREST: TFloatField;
    DetailInfAllPLANINTEREST: TFloatField;
    DetailInfAllSUMPLANPAY: TFloatField;
    DetailInfAllTHISMONTHSPAYDAT: TDateTimeField;
    DetailInfAllTHISMONTHSPRINCIPAL: TFloatField;
    DetailInfAllTHISMONTHSINTEREST: TFloatField;
    DetailInfAllTHISMONTHSPENALTY: TFloatField;
    DetailInfAllANNUALYINTERESTRATE: TFloatField;
    DetailInfAllPERCENT: TFloatField;
    DetailInfAllTRDAT: TDateTimeField;
    DetailInfAllEXDATCOUNT: TFloatField;
    DetailInfAllPAYREST: TFloatField;
    DetailInfAllPAYINTREST: TFloatField;
    DetailInfAllPAYPEN: TFloatField;
    DetailInfAllSUMREALPAY: TFloatField;
    DetailInfAllDESCRIPTION: TWideStringField;
    DetailInfAllVALU_NAME: TWideStringField;
    DetailInfAllFILIALNAME: TWideStringField;
    DetailInfAllsmthismonthpay: TFloatField;
    DetailInfAllds: TDataSource;
    ODSmaincprPROGNOZ: TFloatField;
    ODSmaincprEXECUTIO_PROGNOZ: TFloatField;
    ODSmaincprceofPrognoz: TWideStringField;
    ODSmaincprceofEXECUTIO_PROGNOZ: TWideStringField;
    SummaincprPROGNOZ: TFloatField;
    SummaincprEXECUTIO_PROGNOZ: TFloatField;
    SummaincprceofPROGNOZ: TWideStringField;
    SummaincprceofEXECUTIO_PROGNOZ: TWideStringField;
    fulldur: TOracleDataSet;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ODSmaincprCalcFields(DataSet: TDataSet);
    procedure DetailInf1CalcFields(DataSet: TDataSet);
    procedure SummaincprCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRepByCreditPay: TdmRepByCreditPay;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TdmRepByCreditPay.DataModuleCreate(Sender: TObject);
begin
    sysdat.open;
    filialscpr.open;
    CreditTypescpr.open;
    valutescpr.open;
    DuePeriodscpr.open;

end;

procedure TdmRepByCreditPay.DataModuleDestroy(Sender: TObject);
begin
   sysdat.CloseAll;
    filialscpr.CloseAll;
    CreditTypescpr.CloseAll;
    valutescpr.CloseAll;
    DuePeriodscpr.CloseAll;

end;

procedure TdmRepByCreditPay.ODSmaincprCalcFields(DataSet: TDataSet);
begin
    with ODSmaincpr do begin
    fieldbyname('ceofEXECUTIO_PROGNOZ').asstring := FormatFloat('#,##0.00',fieldbyname('EXECUTIO_PROGNOZ').asFloat)+'%';
    fieldbyname('ceofEXPCEOF').asstring := FormatFloat('#,##0.00',fieldbyname('EXPCEOF').asFloat)+'%';
    fieldbyname('ceofPrognoz').asstring := FormatFloat('#,##0.00',fieldbyname('Prognoz').asFloat)+'%';
//    ShowMessage(floattostr(fieldbyname('EXECUTIO_PROGNOZ').asFloat));
    end;
end;

procedure TdmRepByCreditPay.DetailInf1CalcFields(DataSet: TDataSet);
begin
   with DataSet do
   FieldByName('smthismonthpay').asFloat :=  FieldByName('THISMONTHSPRINCIPAL').asFloat
   + FieldByName('THISMONTHSINTEREST').asFloat+ FieldByName('THISMONTHSPENALTY').asFloat;
end;

procedure TdmRepByCreditPay.SummaincprCalcFields(DataSet: TDataSet);
begin
    with ODSmaincpr do begin
    //fieldbyname('ceofEXPCEOF').asstring := FormatFloat('#,##0.00',fieldbyname('EXPCEOF').asFloat)+'%';
    fieldbyname('ceofPrognoz').asstring := FormatFloat('#,##0.00',fieldbyname('Prognoz').asFloat)+'%';
    fieldbyname('ceofEXECUTIO_PROGNOZ').asstring := FormatFloat('#,##0.00',fieldbyname('EXECUTIO_PROGNOZ').asFloat)+'%';
    end;

end;

end.
