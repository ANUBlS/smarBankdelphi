unit dmFinishPeriodCreditsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmFinishPeriodCredits = class(TDataModule)
    valutes: TOracleDataSet;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: TStringField;
    valutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TStringField;
    pledgsDatSrc: TDataSource;
    pledgs: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    Categories: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    persons: TOracleDataSet;
    CreditTypes: TOracleDataSet;
    personsDatSrc: TDataSource;
    CreditTypesDatSrc: TDataSource;
    ReportData: TOracleDataSet;
    pledgsID: TFloatField;
    pledgsDESCRIPTION: TStringField;
    CreditTypesID: TFloatField;
    CreditTypesDESCRIPTION: TStringField;
    personsID: TFloatField;
    personsDESCRIPION: TStringField;
    Reserves: TOracleDataSet;
    ReservesDatSrc: TDataSource;
    DueReserves: TOracleDataSet;
    DueReservesDatSrc: TDataSource;
    usrgroups: TOracleDataSet;
    usrgroupsDatSrc: TDataSource;
    ReservesID: TFloatField;
    ReservesDESCR: TStringField;
    DueReservesID: TFloatField;
    DueReservesDESCR: TStringField;
    usrgroupsID: TFloatField;
    usrgroupsDESCRIPTION: TStringField;
    ReportDataOPENDATE: TDateTimeField;
    ReportDataCLOSEDATE: TDateTimeField;
    ReportDataCREDITLINEAMOUNT: TFloatField;
    ReportDataANNUALYINTERESTRATE: TFloatField;
    ReportDataCUSTNAME: TStringField;
    ReportDataCUSTID: TIntegerField;
    ReportDataCONTRACTACCNO: TStringField;
    ReportDataBALACC: TFloatField;
    ReportDataREST: TFloatField;
    ReportDataINTERESTREST: TFloatField;
    ReportDataDUEREST: TFloatField;
    ReportDataDUEINTERESTREST: TFloatField;
    ReportDataSTOPCALCDATE: TDateTimeField;
    ReportDataRESERVEID: TFloatField;
    ReportDataDUERESERVEID: TFloatField;
    CategoriesID: TFloatField;
    CategoriesDESCRIPTION: TStringField;
    Customers: TOracleDataSet;
    CustomersDatSrc: TDataSource;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersKOD: TStringField;
    ReportDataPAYAMT: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinishPeriodCredits: TdmFinishPeriodCredits;

implementation

{$R *.DFM}

uses CMOracleApiDataModuleImpl;

procedure TdmFinishPeriodCredits.DataModuleCreate(Sender: TObject);
begin
   valutes.Open;
   Filials.Open;
   pledgs.Open;
   CreditTypes.Open;
   Categories.Open;
   persons.Open;
   Reserves.Open;
   DueReserves.Open;
   usrgroups.Open;
   Customers.Open;
end;

procedure TdmFinishPeriodCredits.DataModuleDestroy(Sender: TObject);
begin
   valutes.CloseAll;
   Filials.CloseAll;
   pledgs.CloseAll;
   CreditTypes.CloseAll;
   Categories.CloseAll;
   persons.CloseAll;
   Reserves.CloseAll;
   DueReserves.CloseAll;
   usrgroups.CloseAll;
   Customers.CloseAll;
end;

end.
