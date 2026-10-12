unit dmPeriodReportImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TdmPeriodReport_new = class(TDataModule)
    valutes: TOracleDataSet;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: TWideStringField;
    valutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TWideStringField;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TWideStringField;
    CustomersKOD: TWideStringField;
    CategoriesDatSrc: TDataSource;
    Categories: TOracleDataSet;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: TWideStringField;
    FilialsDatSrc: TDataSource;
    persons: TOracleDataSet;
    personsID: TFloatField;
    personsNAME: TWideStringField;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TWideStringField;
    personsDatSrc: TDataSource;
    DepositTypesDatSrc: TDataSource;
    Deps: TOracleDataSet;
    DepsID: TFloatField;
    DepsCONTRACTNO: TWideStringField;
    DepsCONTRACTACCNO: TWideStringField;
    DepsDatSrc: TDataSource;
    ResultData: TOracleDataSet;
    ResultDataCONTRACTNO: TWideStringField;
    ResultDataOPENDATE: TDateTimeField;
    ResultDataCLOSEDATE: TDateTimeField;
    ResultDataBALANS: TFloatField;
    ResultDataCONTRACTACCNO: TWideStringField;
    ResultDataVAL_NAME: TWideStringField;
    ResultDataANNUALINT: TFloatField;
    ResultDataNAME: TWideStringField;
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
    ResultDataFILIAL: TWideStringField;
    ResultDataTYPE: TWideStringField;
    sbcm_period_report: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPeriodReport_new: TdmPeriodReport_new;

implementation

{$R *.dfm}
   USES sboapiDataModuleImpl;
procedure TdmPeriodReport_new.DataModuleCreate(Sender: TObject);
begin
   valutes.Open;
   Filials.Open;
   Customers.Open;
   DepositTypes.Open;
   Categories.Open;
   persons.Open;
   Deps.Open;
end;

procedure TdmPeriodReport_new.DataModuleDestroy(Sender: TObject);
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
