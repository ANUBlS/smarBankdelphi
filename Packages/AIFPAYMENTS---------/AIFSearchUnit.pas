unit AIFSearchUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls,SearchEdit,XDBGrids,DB,AIFPAYMENTImpl,OracleData;

type
  ESearchError = class(Exception);

  TFormAifSearch = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CBSearchWhere: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     DbGr:TXDBGrid;
     function FindNextRecord(DataSet :TDataSet;FieldName : String;Value : String) : Boolean;

  end;

var
  FormAifSearch: TFormAifSearch;

implementation
  uses DataAIFUnit;

{$R *.dfm}

procedure TFormAifSearch.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormAifSearch.BitBtn2Click(Sender: TObject);
resourcestring
  rsNothingToSearch = 'Axtarılmalı olanı daxil edin!';
var
  FieldToSearch : String;
  SearchValue : String;
begin
  SearchValue := Edit1.Text;

  if SearchValue = '' then
  if not Visible then
  begin
    Show;
    Edit1.SetFocus;
    Edit1.SelectAll;
    Exit
  end
  else
    raise ESearchError.Create(rsNothingToSearch);

  with  AIFPAYMENTForm do
  begin
    DbGr.SelectedRows.Clear;
    FieldToSearch := CBSearchWhere.KeyValue;

  FindNextRecord(
      DbGr.DataSource.DataSet,
      FieldToSearch,
      SearchValue )
  end;

end;

function TFormAifSearch.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

resourcestring
  rsRecordRecachedEOF = 'Axtarış cərgənin sonuna çatıb .';
  rsContinueFromTop   = 'Əvvəldən axtarmaqla davam etmək istəyirsiniz?';
  rsRecordNotFound    = 'Yazı Tapılmadı.';

var
  SearchOptions : TSearchRecordOptions;

begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];
  with  (DataSet as TOracleDataSet) do
  begin

    Result := SearchRecord(
                FieldName,
                Value,
                SearchOptions + [srFromCurrent, srForward]
    );
    if not Result then

    if MessageDlg(
              rsRecordRecachedEOF + #10#13 + rsContinueFromTop
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    begin

      Result := SearchRecord(
                  FieldName,
                  Value,
                  SearchOptions + [srFromBeginning]
      );

      if not Result then
      MessageDlg(rsRecordNotFound,mtInformation,[mbOk],0);

    end;
  end;
end;



procedure TFormAifSearch.FormShow(Sender: TObject);
begin
  Edit1.Clear;
end;

end.
