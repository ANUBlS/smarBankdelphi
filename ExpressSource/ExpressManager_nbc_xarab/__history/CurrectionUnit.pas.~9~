unit CurrectionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,ExpDataModuleUnit,
  DBCtrls, StdCtrls, ExtCtrls, Mask, DBCtrlsEh, OracleData,sboapiDataModuleImpl,SearchEdit,
  Buttons, ComCtrls,DB,XDBGrids;

type
  ESearchError = class(Exception);

  TFormCurrection = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

    { Private declarations }
  public
    DbGr:TXDBGrid;
    function FindNextRecord(DataSet :TDataSet;FieldName : String;Value : String) : Boolean;
    { Public declarations }
  end;

var
  FormCurrection: TFormCurrection;

implementation

uses ExpUnitImpl, ExpressManagerImpl;

{$R *.DFM}

procedure TFormCurrection.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCurrection.BitBtn2Click(Sender: TObject);
resourcestring
  rsNothingToSearch = 'Axtarılmalı olanı daxil edin!';
var
  FieldToSearch : String;
  SearchValue   : String;
begin
  Edit2.Text:=Edit1.Text;
 with Edit2 do
      begin
          Text := StringReplace(Text, 'i', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'İ', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'ı', '`', [rfReplaceAll]);
      end;
  SearchValue :=Edit2.Text{ Edit1.Text};

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

  with  ExpressFrom do
  begin
   (Sender as TXDBGrid).SelectedRows.Clear; //!!!
  FieldToSearch := DBLookupComboBox1.KeyValue;
  if FieldToSearch='NAME' then
  FieldToSearch:='INAME'    ;

 { if}
  FindNextRecord((Sender as TXDBGrid).DataSource.DataSet,
                  FieldToSearch,
                  SearchValue
                  ) {then
  with CmbBoxFindWhat.Items do
  if IndexOf(SearchValue) = -1 then
  Add(SearchValue);                }
  end;

end;




function TFormCurrection.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

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


procedure TFormCurrection.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 //Close;
end;

procedure TFormCurrection.FormShow(Sender: TObject);
begin
  Edit1.Clear;
end;

end.
