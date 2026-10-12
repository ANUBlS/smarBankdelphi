unit correctionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons
  ;

type
  TFrmCorrection = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OracleDataSet1NUMBEROFCREDIT: TWideStringField;
    OracleDataSet1NAME: TWideStringField;
    OracleDataSet2HDATE: TDateTimeField;
    OracleDataSet2INTEREST: TFloatField;
    OracleDataSet2DUEINTEREST: TFloatField;
    OracleDataSet1ID: TFloatField;
    OracleDataSet2CREDITID: TFloatField;
    GroupBox1: TGroupBox;
    Editnumberofcredit: TEdit;
    Editname: TEdit;
    CorrectData: TOracleDataSet;
    CorrectDataNUM: TWideStringField;
    CorrectDataNAME: TWideStringField;
    CorrectDataREST: TFloatField;
    CorrectDataINTERESTREST: TFloatField;
    CorrectDataDUEREST: TFloatField;
    CorrectDataDUEINTERESTREST: TFloatField;
    CorrectDataGIVENAMOUNT: TFloatField;
    CorrectDataOBLIGATION: TFloatField;
    CorrectDataPENALTYREST: TFloatField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OracleDataSet2INTPRECISION: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure EditnumberofcreditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure EditnameKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
   procedure RefreshDS;
    { Private declarations }
  public
  procedure ActnSearchExecute(Sender: TObject);
   function FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;
    { Public declarations }
  end;

var
  FrmCorrection: TFrmCorrection;

 procedure InitPlugin(s:string);export;

implementation
uses CommonDecls,sbsystem,sboapiDataModuleImpl,SBTranslateProc;

{$R *.DFM}
procedure InitPlugin(s:string);export;
begin
   FrmCorrection.ShowModal;
end;
exports
     InitPlugin;


procedure TFrmCorrection.FormCreate(Sender: TObject);
begin
OracleDataSet1.open;
OracleDataSet2.Open;
OracleDataSet2.edit;
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;
procedure TFrmCorrection.ActnSearchExecute(Sender: TObject);
var SearchField,SearchRecord : String;
begin
   SearchField := Copy((Sender as TEdit).name,5,length((Sender as TEdit).name));
   SearchRecord := (Sender as TEdit).Text;
   FindNextRecord (OracleDataSet1,SearchField,SearchRecord);

end;
function TFrmCorrection.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

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


procedure TFrmCorrection.EditnumberofcreditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = #13)and(Editnumberofcredit.Text <> '')  then
     ActnSearchExecute(Sender);
end;

procedure TFrmCorrection.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TFrmCorrection.EditnameKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13)and(Editname.Text <> '')  then
     ActnSearchExecute(Sender);
end;
 procedure TFrmCorrection.RefreshDS;
var
  SavePoint : Pointer;
begin
  with OracleDataSet2 do
  begin
    SavePoint := GetBookmark;
    Refresh;
    GotoBookmark(SavePoint);
  end;
end;
procedure TFrmCorrection.SpeedButton1Click(Sender: TObject);
begin
  with OracleDataSet2.Session do
    ApplyUpdates([OracleDataSet2],True);
  RefreshDS;
//OracleDataSet2.post
end;

procedure TFrmCorrection.SpeedButton2Click(Sender: TObject);
begin
close
end;

initialization
   FrmCorrection := TFrmCorrection.Create(CommonApplication);
end.
end.
