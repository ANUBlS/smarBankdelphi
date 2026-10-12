unit NewDepositsDmReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TNewDepositsDmReport = class(TDataModule)
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
    ReportData: TOracleDataSet;
    ReportDataCONTRACTNO: TWideStringField;
    ReportDataVAL_NAME: TWideStringField;
    ReportDataCUSTNAME: TWideStringField;
    ReportDataCUSTID: TFloatField;
    ReportDataCONTRACTACCNO: TWideStringField;
    ReportDataINTERESTACCNO: TWideStringField;
    ReportDataCLIENTACCNO: TWideStringField;
    ReportDataBALANS: TFloatField;
    ReportDataOPENDATE: TDateTimeField;
    ReportDataCLOSEDATE: TDateTimeField;
    ReportDatafclosedat: TDateField;
    ReportDataFIRSTOPDATE: TDateTimeField;
    ReportDataAMOUNT: TFloatField;
    ReportDataEAMOUNT: TFloatField;
    ReportDataINTEREST: TFloatField;
    ReportDataOVERDUEINTEREST: TFloatField;
    ReportDataDUEINTEREST: TFloatField;
    ReportDataFACTICALDEBT: TFloatField;
    ReportDataEFACTICALDEBT: TFloatField;
    ReportDataFACTICALINTERESTDEBT: TFloatField;
    ReportDataEFACTICALINTERESTDEBT: TFloatField;
    ReportDataPAYAMT: TFloatField;
    ReportDataEPAYAMT: TFloatField;
    ReportDataTYPE: TWideStringField;
    ReportDataCATEGORY: TWideStringField;
    ReportDataPERNAME: TWideStringField;
    ReportDataFILNAME: TWideStringField;
    Contracts: TOracleDataSet;
    ContractsCONTRACTACCID: TFloatField;
    ContractsNAME: TWideStringField;
    ContractsDataSource: TDataSource;
    ReportDataAGENTNAME: TWideStringField;
    ReportDataAGENTACCNO: TWideStringField;
    ReportDataUSERNAME: TWideStringField;
    ReportDataCAPITALPERIODNAME: TWideStringField;
    ReportDataPERIODNAME: TWideStringField;
    ReportDataPASSPORT: TWideStringField;
    ReportDataPASSPIN: TWideStringField;
    ReportDataBIRTHDAY: TDateTimeField;
    ReportDataPRIZENAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ReportDataCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsDmReport: TNewDepositsDmReport;

implementation

{$R *.dfm}

procedure TNewDepositsDmReport.DataModuleCreate(Sender: TObject);
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

procedure TNewDepositsDmReport.DataModuleDestroy(Sender: TObject);
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

procedure TNewDepositsDmReport.ReportDataCalcFields(DataSet: TDataSet);
begin
   with ReportData do begin
    fieldByName('fclosedat').AsDateTime := fieldByName('FIRSTOPDATE').AsDateTime;
    if fieldByName('FIRSTOPDATE').IsNull then
    fieldByName('fclosedat').AsDateTime := fieldByName('CLOSEDATE').AsDateTime;
  end;
end;

end.
