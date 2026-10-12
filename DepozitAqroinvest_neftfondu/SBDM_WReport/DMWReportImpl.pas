unit DMWReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDMWReport = class(TDataModule)
    TemplatesDataSet: TOracleDataSet;
    TemplatesDataSetID: TFloatField;
    TemplatesDataSrc: TDataSource;
    DepositInfoDataSet: TOracleDataSet;
    DepositInfoDataSrc: TDataSource;
    BookmarksDataSet: TOracleDataSet;
    BookmarksDataSrc: TDataSource;
    FieldsDataSet: TOracleDataSet;
    FieldsDataSetID: TFloatField;
    FieldsDataSrc: TDataSource;
    ReplaceDataSet: TOracleDataSet;
    TemplatesDataSetPATH: TWideStringField;
    TemplatesDataSetNAME: TWideStringField;
    FieldsDataSetFIELDNAME: TWideStringField;
    FieldsDataSetDESCRIPTION: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMWReport: TDMWReport;

implementation

{$R *.DFM}
uses sboapiDatamoduleImpl;

procedure TDMWReport.DataModuleCreate(Sender: TObject);
begin
   TemplatesDataSet.Open
end;

procedure TDMWReport.DataModuleDestroy(Sender: TObject);
begin
   TemplatesDataSet.CloseAll
end;

end.
