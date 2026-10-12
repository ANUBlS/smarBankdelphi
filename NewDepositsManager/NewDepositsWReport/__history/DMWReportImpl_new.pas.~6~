unit DMWReportImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDMWReport_new = class(TDataModule)
    TemplatesDataSet: TOracleDataSet;
    TemplatesDataSetID: TFloatField;
    TemplatesDataSetPATH: TWideStringField;
    TemplatesDataSetNAME: TWideStringField;
    TemplatesDataSrc: TDataSource;
    DepositInfoDataSet: TOracleDataSet;
    DepositInfoDataSrc: TDataSource;
    BookmarksDataSet: TOracleDataSet;
    BookmarksDataSrc: TDataSource;
    FieldsDataSet: TOracleDataSet;
    FieldsDataSetID: TFloatField;
    FieldsDataSetFIELDNAME: TWideStringField;
    FieldsDataSetDESCRIPTION: TWideStringField;
    FieldsDataSrc: TDataSource;
    ReplaceDataSet: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMWReport_new: TDMWReport_new;

implementation

{$R *.dfm}
    uses sboapiDatamoduleImpl;

procedure TDMWReport_new.DataModuleCreate(Sender: TObject);
begin
   TemplatesDataSet.Open
end;

procedure TDMWReport_new.DataModuleDestroy(Sender: TObject);
begin
   TemplatesDataSet.CloseAll
end;

end.
