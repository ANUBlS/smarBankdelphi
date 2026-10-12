unit UnitDataMod;

interface

uses
  SysUtils, Classes, DB, OracleData,Oracle;

type
  TDataModuleTax = class(TDataModule)
    DSFields: TDataSource;
    ODSFields: TOracleDataSet;
    ODSTaxPayment: TOracleDataSet;
    DataSource1: TDataSource;
    ODSTaxPaymentID: TFloatField;
    ODSTaxPaymentCUSTOMERID: TFloatField;
    ODSTaxPaymentTAXAMOUNT: TFloatField;
    ODSTaxPaymentTAXPAYAMOUNT: TFloatField;
    ODSTaxPaymentCUSTNAME: TWideStringField;
    ODSTaxPaymentCUSTPAYAMOUNT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleTax: TDataModuleTax;

implementation
uses sboapiDataModuleImpl;

{$R *.dfm}

end.
