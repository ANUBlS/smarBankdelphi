unit crProlongDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TProlongDataMod = class(TDataModule)
    ProlongsData: TOracleDataSet;
    DataSrcProlongsData: TDataSource;
    CR_PROLONGATION: TOraclePackage;
    CreditInfo: TOracleDataSet;
    DSCreditInfo: TDataSource;
    ProlongsDataID: TFloatField;
    ProlongsDataCREDITID: TFloatField;
    ProlongsDataPROLONGDATE: TDateTimeField;
    ProlongsDataNEWCLOSEDATE: TDateTimeField;
    ProlongsDataOLDCLOSEDATE: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProlongDataMod: TProlongDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.
