unit dmReportAnalysOfPortfelImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmReportAnalysOfPortfel = class(TDataModule)
    sysdat: TOracleDataSet;
    filials: TOracleDataSet;
    CreditTypes: TOracleDataSet;
    valutes: TOracleDataSet;
    valutesds: TDataSource;
    CreditTypesds: TDataSource;
    filialsds: TDataSource;
    CategoriesSumds: TDataSource;
    CategoriesSum: TOracleDataSet;
    CategoriesSumSECTOR: TWideStringField;
    CategoriesSumCRDCOUNT: TFloatField;
    CategoriesSumCEOFCOUNT: TFloatField;
    CategoriesSumINITIALAMOUNT: TFloatField;
    CategoriesSumCEOFINITAMT: TFloatField;
    CategoriesSumPROQNOZ: TFloatField;
    CategoriesSumDELTA: TFloatField;
    CategoriesSumCUSTOMERTYPE: TFloatField;
    PersonsSum: TOracleDataSet;
    PersonsSumds: TDataSource;
    PersonsSumSECTOR: TWideStringField;
    PersonsSumCRDCOUNT: TFloatField;
    PersonsSumCEOFCOUNT: TFloatField;
    PersonsSumINITIALAMOUNT: TFloatField;
    PersonsSumCEOFINITAMT: TFloatField;
    PersonsSumPROQNOZ: TFloatField;
    PersonsSumDELTA: TFloatField;
    PersonsSumPERSONALTYPE: TFloatField;
    PledgsPledgsSumds: TDataSource;
    PledgsSum: TOracleDataSet;
    ValutesSumds: TDataSource;
    ValutesSum: TOracleDataSet;
    RegionsSum: TOracleDataSet;
    RegionsSumds: TDataSource;
    CountriesSumds: TDataSource;
    CountriesSum: TOracleDataSet;
    CalcMethodsSum: TOracleDataSet;
    CalcMethodsSumDs: TDataSource;
    ReservesSumds: TDataSource;
    ReservesSum: TOracleDataSet;
    ReservesSumSECTOR: TWideStringField;
    ReservesSumCRDCOUNT: TFloatField;
    ReservesSumCEOFCOUNT: TFloatField;
    ReservesSumINITIALAMOUNT: TFloatField;
    ReservesSumCEOFINITAMT: TFloatField;
    ReservesSumPROQNOZ: TFloatField;
    ReservesSumDELTA: TFloatField;
    ReservesSumRESERVEID: TFloatField;
    RegionsSumSECTOR: TWideStringField;
    RegionsSumCRDCOUNT: TFloatField;
    RegionsSumCEOFCOUNT: TFloatField;
    RegionsSumINITIALAMOUNT: TFloatField;
    RegionsSumCEOFINITAMT: TFloatField;
    RegionsSumPROQNOZ: TFloatField;
    RegionsSumDELTA: TFloatField;
    RegionsSumDEPEND_ID: TFloatField;
    CalcMethodsSumSECTOR: TWideStringField;
    CalcMethodsSumCRDCOUNT: TFloatField;
    CalcMethodsSumCEOFCOUNT: TFloatField;
    CalcMethodsSumINITIALAMOUNT: TFloatField;
    CalcMethodsSumCEOFINITAMT: TFloatField;
    CalcMethodsSumPROQNOZ: TFloatField;
    CalcMethodsSumDELTA: TFloatField;
    CalcMethodsSumINTCALCMETHOD: TFloatField;
    CountriesSumSECTOR: TWideStringField;
    CountriesSumCRDCOUNT: TFloatField;
    CountriesSumCEOFCOUNT: TFloatField;
    CountriesSumINITIALAMOUNT: TFloatField;
    CountriesSumCEOFINITAMT: TFloatField;
    CountriesSumPROQNOZ: TFloatField;
    CountriesSumDELTA: TFloatField;
    CountriesSumCOUNTRYCODE: TWideStringField;
    PledgsSumSECTOR: TWideStringField;
    PledgsSumCRDCOUNT: TFloatField;
    PledgsSumCEOFCOUNT: TFloatField;
    PledgsSumINITIALAMOUNT: TFloatField;
    PledgsSumCEOFINITAMT: TFloatField;
    PledgsSumPROQNOZ: TFloatField;
    PledgsSumDELTA: TFloatField;
    PledgsSumPLEDGEID: TFloatField;
    ValutesSumSECTOR: TWideStringField;
    ValutesSumCRDCOUNT: TFloatField;
    ValutesSumCEOFCOUNT: TFloatField;
    ValutesSumINITIALAMOUNT: TFloatField;
    ValutesSumCEOFINITAMT: TFloatField;
    ValutesSumPROQNOZ: TFloatField;
    ValutesSumDELTA: TFloatField;
    ValutesSumCURRENCY: TFloatField;
    Queries: TOracleDataSet;
    CategoriesSumceofCEOFCOUNT: TWideStringField;
    CategoriesSumceofCEOFINITAMT: TWideStringField;
    PersonsSumceofCEOFCOUNT: TWideStringField;
    PersonsSumceofCEOFINITAMT: TWideStringField;
    PledgsSumceofCEOFINITAMT: TWideStringField;
    PledgsSumceofCEOFCOUNT: TWideStringField;
    CountriesSumceofCEOFCOUNT: TWideStringField;
    CountriesSumceofCEOFINITAMT: TWideStringField;
    CalcMethodsSumceofCEOFINITAMT: TWideStringField;
    CalcMethodsSumceofCEOFCOUNT: TWideStringField;
    ValutesSumceofCEOFCOUNT: TWideStringField;
    ValutesSumceofCEOFINITAMT: TWideStringField;
    RegionsSumceofCEOFINITAMT: TWideStringField;
    RegionsSumceofCEOFCOUNT: TWideStringField;
    ReservesSumceofCEOFCOUNT: TWideStringField;
    ReservesSumceofCEOFINITAMT: TWideStringField;
    AnnualIntSum: TOracleDataSet;
    AnnualIntSumds: TDataSource;
    AnnualIntSumCRDCOUNT: TFloatField;
    AnnualIntSumCEOFCOUNT: TFloatField;
    AnnualIntSumINITIALAMOUNT: TFloatField;
    AnnualIntSumCEOFINITAMT: TFloatField;
    AnnualIntSumPROQNOZ: TFloatField;
    AnnualIntSumDELTA: TFloatField;
    AnnualIntSumSECTOR: TWideStringField;
    PeriodsSum: TOracleDataSet;
    PeriodsSumds: TDataSource;
    PeriodsSumCRDCOUNT: TFloatField;
    PeriodsSumCEOFCOUNT: TFloatField;
    PeriodsSumINITIALAMOUNT: TFloatField;
    PeriodsSumCEOFINITAMT: TFloatField;
    PeriodsSumPROQNOZ: TFloatField;
    PeriodsSumDELTA: TFloatField;
    PeriodsSumSECTOR: TWideStringField;
    AnnualIntSumceofCEOFCOUNT: TWideStringField;
    AnnualIntSumceofCEOFINITAMT: TWideStringField;
    PeriodsSumceofCEOFCOUNT: TWideStringField;
    PeriodsSumceofCEOFINITAMT: TWideStringField;
    ODSDetailds: TDataSource;
    ODSDetail: TOracleDataSet;
    ODSDetailFILIALNAME: TWideStringField;
    ODSDetailDESCRIPTION: TWideStringField;
    ODSDetailVALU_NAME: TWideStringField;
    ODSDetailNUMBEROFCREDIT: TWideStringField;
    ODSDetailACC_NO: TWideStringField;
    ODSDetailCUSTNAME: TWideStringField;
    ODSDetailCREDITLINEAMOUNT: TFloatField;
    ODSDetailANNUALYINTERESTRATE: TFloatField;
    ODSDetailPERCENT: TFloatField;
    ODSDetailREST: TFloatField;
    ODSDetailINTERESTREST: TFloatField;
    ODSDetailDATEOFCONCLUSION: TDateTimeField;
    ODSDetailDUEDATEFIRSTCONTRACT: TDateTimeField;
    AnnualIntSumBPER: TFloatField;
    AnnualIntSumEPER: TFloatField;
    PeriodsSumBPER: TFloatField;
    PeriodsSumEPER: TFloatField;
    CategoriesSumceofdelta: TWideStringField;
    PersonsSumceofdelta: TWideStringField;
    PledgsSumceofdelta: TWideStringField;
    ValutesSumceofdelta: TWideStringField;
    RegionsSumceofdelta: TWideStringField;
    ReservesSumceofdelta: TWideStringField;
    AnnualIntSumceofdelta: TWideStringField;
    PeriodsSumceofdelta: TWideStringField;
    procedure CategoriesSumCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReportAnalysOfPortfel: TdmReportAnalysOfPortfel;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TdmReportAnalysOfPortfel.CategoriesSumCalcFields(
  DataSet: TDataSet);
begin
   with  DataSet do begin
   FieldByName('ceofCEOFCOUNT').AsString := FormatFloat('#,##0.00',FieldByName('CEOFCOUNT').AsFloat)+'%';
   FieldByName('ceofCEOFINITAMT').AsString := FormatFloat('#,##0.00',FieldByName('CEOFINITAMT').AsFloat)+'%';
   FieldByName('ceofdelta').AsString := FormatFloat('#,##0.00',FieldByName('delta').AsFloat)+'%';

   end;
end;

procedure TdmReportAnalysOfPortfel.DataModuleCreate(Sender: TObject);
begin
    sysdat.open;
    filials.open;
    CreditTypes.open;
    valutes.open;
end;

procedure TdmReportAnalysOfPortfel.DataModuleDestroy(Sender: TObject);
begin
    sysdat.CloseAll;
    filials.CloseAll;
    CreditTypes.CloseAll;
    valutes.CloseAll;
end;

end.
