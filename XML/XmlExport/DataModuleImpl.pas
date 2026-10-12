unit DataModuleImpl;

interface

uses
  SysUtils, Classes, DB, DBTables, TntDB;

type
  TDataModuleMain = class(TDataModule)
    DataSrcTagSettings: TDataSource;
    TagSettings: TTable;
    TagSettingsFieldName: TStringField;
    TagSettingsTagFirst: TStringField;
    TagSettingsTagLast: TStringField;
    TagSettingsTagPrefix: TStringField;
    TagSettingsTagSuffix: TStringField;
    TagSettingsAlphaField: TBooleanField;
    TagSettingsFieldGroup: TIntegerField;
    TempTable: TTable;
    DataSrcDecoding: TDataSource;
    UnicodeSettings: TTable;
    UnicodeSettingsInvalidCharCode: TIntegerField;
    UnicodeSettingsValidCharCode: TIntegerField;
    UnicodeSettingsValidChar: TTntStringField;
    UnicodeSettingsInvalidChar: TTntStringField;
    EXPORT: TTable;
    TagSettingsNum: TIntegerField;
    TagSettings__: TQuery;
    TagSettingsUseField: TBooleanField;
    TagSettingsParentGroup: TIntegerField;
    procedure TagSettingsBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure UnicodeSettingsBeforeOpen(DataSet: TDataSet);
    procedure UnicodeSettingsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure UnicodeSettingsAfterScroll(DataSet: TDataSet);
    procedure TagSettings__BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

uses MainUnit, UnicodeSettingsImpl;

{$R *.dfm}

procedure TDataModuleMain.TagSettingsBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TTable do
  begin
    DatabaseName := MainForm.SettingsPath;
    TableName := 'TagSettings.DB';
  end;
end;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
begin
  TagSettings.Active := True;
  UnicodeSettings.Active := True;
  TagSettings__.Active := True;
end;

procedure TDataModuleMain.UnicodeSettingsBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TTable do
  begin
    DatabaseName := MainForm.SettingsPath;
    TableName := 'UnicodeSettings.DB';
  end;
end;

procedure TDataModuleMain.UnicodeSettingsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   Action := daAbort
end;

procedure TDataModuleMain.UnicodeSettingsAfterScroll(DataSet: TDataSet);
begin
  with DataSet do
  if RecordCount > 0 then
  begin
    DecodingForm.TntEdit2.Text := WideChar(FieldByName('ValidCharCode').AsInteger);
    DecodingForm.TntEdit1.Text := WideChar(FieldByName('InValidCharCode').AsInteger);
  end else
  begin
    DecodingForm.TntEdit2.Text := '';
    DecodingForm.TntEdit1.Text := '';
  end;
end;

procedure TDataModuleMain.TagSettings__BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TQuery do
    DatabaseName := MainForm.SettingsPath;
end;

end.
