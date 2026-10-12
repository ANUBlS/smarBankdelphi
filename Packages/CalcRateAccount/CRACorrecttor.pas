unit CRACorrecttor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls,DB,oracle,oracledata, ActnList, DBGridEhGrouping,
  GridsEh;

type
  TFormCorrection = class(TForm)
    GroupBox1: TGroupBox;
    EditContractno: TEdit;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    DBGridEh1: TDBGridEh;
    ActionList: TActionList;
    ActionSearch: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditContractnoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure RefreshDS;
    function FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCorrection: TFormCorrection;

implementation

{$R *.DFM}

uses CRADatModImpl,sbtranslateproc,sboapiDataModuleimpl;

procedure TFormCorrection.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Ord(Key) = VK_ESCAPE then
    ModalResult := mrCancel

end;

procedure TFormCorrection.RefreshDS;
var
  SavePoint : Pointer;
begin
  with CRADatMod.Corrector do
  begin
    SavePoint := GetBookmark;
    Refresh;
    GotoBookmark(SavePoint);
  end;
end;


procedure TFormCorrection.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TFormCorrection.Button3Click(Sender: TObject);
begin
   Close;
end;

procedure TFormCorrection.FormCreate(Sender: TObject);
begin
   with CRADatMod do
        Corrector.Open;
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormCorrection.FormDestroy(Sender: TObject);
begin
   with CRADatMod do
        Corrector.CloseAll;
end;

procedure TFormCorrection.Button1Click(Sender: TObject);
begin
  with CRADatMod.Corrector.Session do
    ApplyUpdates([CRADatMod.Corrector],True);
  RefreshDS;
end;

function TFormCorrection.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

resourcestring
  rsRecordRecachedEOF = 'Axtarış cərgənin sonuna çatıb .';
  rsContinueFromTop   = 'Əvvəldən axtarmaqla davam etmək istəyirsiniz?';
  rsRecordNotFound    = 'Yazı tapılmadı.';

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


procedure TFormCorrection.ActionSearchExecute(Sender: TObject);
var SearchField,SearchRecord : String;
begin
   SearchField := Copy((Sender as TEdit).name,5,length((Sender as TEdit).name));
   SearchRecord := (Sender as TEdit).Text;
   FindNextRecord (CRADatMod.Corrector,SearchField,SearchRecord);
end;

procedure TFormCorrection.Button2Click(Sender: TObject);
begin
  with CRADatMod.Corrector.Session do
  CancelUpdates([CRADatMod.Corrector]);
  RefreshDS;

end;

procedure TFormCorrection.EditContractnoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = #13)and(EditContractno.Text <> '')  then
     ActionSearchExecute(Sender);
end;

end.
