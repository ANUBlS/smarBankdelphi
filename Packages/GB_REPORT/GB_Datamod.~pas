unit GB_Datamod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle, sboapiDataModuleImpl;

type
  TDataMod_GBReport = class(TDataModule)
    OP_GB_Report: TOraclePackage;
    OracleDataSet_GB: TOracleDataSet;
    DataSource_GB: TDataSource;
    OracleDataSet_DATE: TOracleDataSet;
    OracleDataSet_unicode: TOracleDataSet;
    OracleDataSet_Setting: TOracleDataSet;
    OracleDataSet_SQL: TOracleDataSet;
    OracleDataSet_VID_OP: TOracleDataSet;
    DataSourceVid_OP: TDataSource;
    DataSource_SQL: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod_GBReport: TDataMod_GBReport;

implementation

{$R *.DFM}

procedure TDataMod_GBReport.DataModuleCreate(Sender: TObject);
begin
  OracleDataSet_SQL.Open;
end;

end.
