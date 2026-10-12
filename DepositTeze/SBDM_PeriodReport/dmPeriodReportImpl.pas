unit dmPeriodReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TdmPeriodReport = class(TDataModule)
    valutes: TOracleDataSet;
    valutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    Categories: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    persons: TOracleDataSet;
    DepositTypes: TOracleDataSet;
    personsDatSrc: TDataSource;
    DepositTypesDatSrc: TDataSource;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: Twidestringfield;
    FilialsID: TFloatField;
    FilialsNAME: Twidestringfield;
    CustomersID: TIntegerField;
    CustomersNAME: Twidestringfield;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: Twidestringfield;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: Twidestringfield;
    personsID: TFloatField;
    personsNAME: Twidestringfield;
    Deps: TOracleDataSet;
    DepsDatSrc: TDataSource;
    DepsID: TFloatField;
    DepsCONTRACTNO: Twidestringfield;
    DepsCONTRACTACCNO: Twidestringfield;
    CustomersKOD: Twidestringfield;
    ResultData: TOracleDataSet;
    ResultDataCONTRACTNO: Twidestringfield;
    ResultDataOPENDATE: TDateTimeField;
    ResultDataCLOSEDATE: TDateTimeField;
    ResultDataCONTRACTACCNO: Twidestringfield;
    ResultDataNAME: Twidestringfield;
    ResultDataFREST: TFloatField;
    ResultDataEFREST: TFloatField;
    ResultDataFINTERESTREST: TFloatField;
    ResultDataEFINTERESTREST: TFloatField;
    ResultDataTRAMT: TFloatField;
    ResultDataETRAMT: TFloatField;
    ResultDataPAYAMT: TFloatField;
    ResultDataEPAYAMT: TFloatField;
    ResultDataPAYINT: TFloatField;
    ResultDataEPAYINT: TFloatField;
    ResultDataSREST: TFloatField;
    ResultDataESREST: TFloatField;
    ResultDataSINTERESTREST: TFloatField;
    ResultDataESINTERESTREST: TFloatField;
    sbcm_period_report: TOraclePackage;
    ResultDataANNUALINT: TFloatField;
    ResultDataVAL_NAME: Twidestringfield;
    ResultDataBALANS: TFloatField;
    ResultDataFILIAL: Twidestringfield;
    ResultDataTYPE: Twidestringfield;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPeriodReport: TdmPeriodReport;

implementation

{$R *.DFM}
USES sboapiDataModuleImpl;

procedure TdmPeriodReport.DataModuleCreate(Sender: TObject);
begin
   valutes.Open;
   Filials.Open;
   Customers.Open;
   DepositTypes.Open;
   Categories.Open;
   persons.Open;
   Deps.Open;
end;

procedure TdmPeriodReport.DataModuleDestroy(Sender: TObject);
begin
   valutes.CloseAll;
   Filials.CloseAll;
   Customers.CloseAll;
   DepositTypes.CloseAll;
   Categories.CloseAll;
   persons.CloseAll;
   Deps.CloseAll;

end;

end.
