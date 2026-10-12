unit TrafficDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TTrafficDataModule = class(TDataModule)
    DataSrcTraffic: TDataSource;
    TrafficData: TOracleDataSet;
    TrafficDataID: TFloatField;
    TrafficDataID2: TFloatField;
    TrafficDataHDATE: TDateTimeField;
    TrafficDataTOTAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrafficDataModule: TTrafficDataModule;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;

end.
