unit PaymentsPlaneDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TPlaneDataModule = class(TDataModule)
    DataSrcPaymentsPlane: TDataSource;
    PaymentsPlaneData: TOracleDataSet;
    PaymentsPlane: TOraclePackage;
    PaymentsPlaneDataID: TFloatField;
    PaymentsPlaneDataFACTICALDEBTPAYMENT: TFloatField;
    PaymentsPlaneDataINTERESTDEBTPAYMENT: TFloatField;
    PaymentsPlaneDataPAID: TStringField;
    PaymentsPlaneDataHDATE: TDateTimeField;
    PaymentsPlaneDataID2: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlaneDataModule: TPlaneDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.
