unit SpecimenSettingsImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TSpecimenForm = class(TForm)
    SpecimenGrid: TDBGrid;
    Panel1: TPanel;
    LabeledEditSpecimen: TLabeledEdit;
    SBBrowse: TSpeedButton;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    OpenDlg: TOpenDialog;
    Button1: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnClose: TButton;
    procedure SBBrowseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpecimenForm: TSpecimenForm;

implementation

uses DataModuleImpl;

{$R *.dfm}

procedure TSpecimenForm.SBBrowseClick(Sender: TObject);
var
  SpecimenFile : String;
  DBase , DFile : String;
  I : INTEGER;
begin
  with OpenDlg do
  if Execute then
    SpecimenFile := FileName
  else
    Exit;

  LabeledEditSpecimen.Text := SpecimenFile;

  if MessageDlg(
       'All old settings will be lost ! '+#13+'Continue ?'
       ,mtWarning
       ,[mbYes,mbNo]
       ,0
       ) <> mrYes then Exit;

  if MessageDlg(
       'Are you sure?'
       ,mtConfirmation
       ,[mbYes,mbNo]
       ,0
       ) <> mrYes then Exit;

  DBase := ExtractFileDir(SpecimenFile);
  DFile := ExtractFileName(SpecimenFile);

  with TTable(SpecimenGrid.DataSource.DataSet) do
  begin
    Active := False;
    EmptyTable;
    Active := True;
    DataModuleMain.TempTable.DatabaseName := DBase;
    DataModuleMain.TempTable.TableName := DFile;
    DataModuleMain.TempTable.Active := True;
    DataModuleMain.TempTable.FieldList.Sort;
    DisableControls;
    Screen.Cursor := crSQLWait;
    try
      for I := 0  to DataModuleMain.TempTable.Fields.Count - 1 do
      begin
        Insert;
        FieldByName('FieldName').AsString := DataModuleMain.TempTable.Fields[I].DisplayName;
        FieldByName('FieldGroup').AsInteger := 0;
        FieldByName('AlphaField').AsBoolean := False;
        FieldByName('UseField').AsBoolean := True;
        FieldByName('Num').AsInteger := DataModuleMain.TempTable.Fields[I].FieldNo;
        Post
      end;
    finally
      EnableControls;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TSpecimenForm.Button1Click(Sender: TObject);
const
  SFormat = '%s/%s';
var
  Temp : String;  
begin
  with SpecimenGrid.DataSource.DataSet do
  begin
    if not Active then
      Exit;
    First;
    while not EOF do
    begin
      if not FieldByName('TagFirst').IsNull then
      begin
        Edit;
        Temp := FieldByName('TagFirst').AsString;
        FieldByName('TagLast').AsString :=Format(SFormat,[Copy(Temp,1,1),Copy(Temp,2,Length(Temp))]);
      end;
      Next;
    end;
  end;
end;

end.
