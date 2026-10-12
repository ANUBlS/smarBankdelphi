unit dmReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmReport = class(TDataModule)
    valutes: TOracleDataSet;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: Twidestringfield;
    valutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: Twidestringfield;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    Categories: TOracleDataSet;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: Twidestringfield;
    FilialsDatSrc: TDataSource;
    persons: TOracleDataSet;
    personsID: TFloatField;
    personsNAME: Twidestringfield;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: Twidestringfield;
    personsDatSrc: TDataSource;
    DepositTypesDatSrc: TDataSource;
    Deps: TOracleDataSet;
    DepsID: TFloatField;
    DepsCONTRACTNO: Twidestringfield;
    DepsCONTRACTACCNO: Twidestringfield;
    DepsDatSrc: TDataSource;
    ReportData: TOracleDataSet;
    ReportDataCONTRACTNO: Twidestringfield;
    ReportDataVAL_NAME: Twidestringfield;
    ReportDataCUSTNAME: Twidestringfield;
    ReportDataCONTRACTACCNO: Twidestringfield;
    ReportDataINTERESTACCNO: Twidestringfield;
    ReportDataCLIENTACCNO: Twidestringfield;
    ReportDataOPENDATE: TDateTimeField;
    ReportDataCLOSEDATE: TDateTimeField;
    ReportDataAMOUNT: TFloatField;
    ReportDataINTEREST: TFloatField;
    ReportDataOVERDUEINTEREST: TFloatField;
    ReportDataDUEINTEREST: TFloatField;
    ReportDataFACTICALDEBT: TFloatField;
    ReportDataEFACTICALDEBT: TFloatField;
    ReportDataFACTICALINTERESTDEBT: TFloatField;
    ReportDataEFACTICALINTERESTDEBT: TFloatField;
    ReportDataCATEGORY: Twidestringfield;
    ReportDataPERNAME: Twidestringfield;
    ReportDataTYPE: Twidestringfield;
    ReportDataFILNAME: Twidestringfield;
    ReportDataCUSTID: TFloatField;
    ReportDataBALANS: TFloatField;
    ReportDataPAYAMT: TFloatField;
    ReportDataEPAYAMT: TFloatField;
    ReportDataEAMOUNT: TFloatField;
    ReportDataFIRSTOPDATE: TDateTimeField;
    ReportDatafclosedat: TDateField;
    Contracts: TOracleDataSet;
    ContractsDataSource: TDataSource;
    CustomersID: TIntegerField;
    CustomersNAME: Twidestringfield;
    CustomersKOD: Twidestringfield;
    ContractsCONTRACTACCID: TFloatField;
    ContractsNAME: Twidestringfield;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportDataCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReport: TdmReport;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TdmReport.DataModuleCreate(Sender: TObject);
begin
   valutes.Open;
   Filials.Open;
   Contracts.Open;
   Customers.Open;
   DepositTypes.Open;
   Categories.Open;
   persons.Open;
   Deps.Open;
end;

procedure TdmReport.DataModuleDestroy(Sender: TObject);
begin
   valutes.CloseAll;
   Filials.CloseAll;
   Contracts.CloseAll;
   Customers.CloseAll;
   DepositTypes.CloseAll;
   Categories.CloseAll;
   persons.CloseAll;
   Deps.CloseAll;

end;

procedure TdmReport.ReportDataCalcFields(DataSet: TDataSet);
begin
   with ReportData do begin
    fieldByName('fclosedat').AsDateTime := fieldByName('FIRSTOPDATE').AsDateTime;
    if fieldByName('FIRSTOPDATE').IsNull then
    fieldByName('fclosedat').AsDateTime := fieldByName('CLOSEDATE').AsDateTime;
  end;
end;

end.
