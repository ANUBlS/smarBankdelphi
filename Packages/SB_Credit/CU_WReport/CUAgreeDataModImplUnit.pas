unit CUAgreeDataModImplUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TAgreeDataModule = class(TDataModule)
    TemplatesDataSet: TOracleDataSet;
    TemplatesDataSrc: TDataSource;
    CreditInfoDataSet: TOracleDataSet;
    CreditInfoDataSrc: TDataSource;
    BookmarksDataSet: TOracleDataSet;
    BookmarksDataSrc: TDataSource;
    FieldsDataSet: TOracleDataSet;
    FieldsDataSrc: TDataSource;
    ReplaceDataSet: TOracleDataSet;
    yazi: TOracleDataSet;
    TemplatesDataSetID: TFloatField;
    TemplatesDataSetPATH: TWideStringField;
    TemplatesDataSetNAME: TWideStringField;
    FieldsDataSetID: TFloatField;
    FieldsDataSetFIELDNAME: TWideStringField;
    FieldsDataSetDESCRIPTION: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CreditInfoDataSetCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgreeDataModule: TAgreeDataModule;

implementation
   uses   sboapiDataModuleImpl,CUCommonDataModuleImpl,CUcommondecls;
{$R *.DFM}

procedure TAgreeDataModule.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 1 then
      (Components[i] as TDataSet).Open;                            
end;

procedure TAgreeDataModule.CreditInfoDataSetCalcFields(DataSet: TDataSet);
begin
//CreditInfoDataSet.FieldByName('manat').asstring:='dfdf';
end;

end.
