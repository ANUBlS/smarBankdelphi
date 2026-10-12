unit SBDMAgreeUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, Word97, OleServer, ImgList, ActnList, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Buttons, ExtCtrls, Db, OracleData;

type
  TAgreeForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    ImageList1: TImageList;
    WordDocument: TWordDocument;
    WordApplication: TWordApplication;
    NLSLocalizer1: TNLSLocalizer;
    SBWRTemplatesDSet: TOracleDataSet;
    SBWRTemplatesDSetID: TFloatField;
    SBWRTemplatesDSetNAME: TStringField;
    SBWRTemplatesDSetPATH: TStringField;
    SBDMInfoDataSet: TOracleDataSet;
    SBDMInfoDataSrc: TDataSource;
    SBReplaceDataSet: TOracleDataSet;
    SBDMInfoDataSetCUSTOMERID: TFloatField;
    SBDMInfoDataSetOPENDATE: TDateTimeField;
    SBDMInfoDataSetCLOSEDATE: TDateTimeField;
    SBDMInfoDataSetAMOUNT: TFloatField;
    SBDMInfoDataSetCONTRACTNO: TStringField;
    SBDMInfoDataSetINTEREST: TFloatField;
    SBDMInfoDataSetOVERDUEINTEREST: TFloatField;
    SBDMInfoDataSetPERSONALTYPE: TStringField;
    SBWRTemplatesDSetDatSrc: TDataSource;
    SBDMInfoDataSetNAME: TStringField;
    procedure ActinPrintExecute(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    TemplID:Integer;
  public
    { Public declarations }
  end;

var
  AgreeForm:TAgreeForm;

implementation

{$R *.DFM}
 uses sboapiDatamoduleImpl,CommonDeclsImpl;

procedure TAgreeForm.ActinPrintExecute(Sender: TObject);
resourcestring  FilenotFound = 'װאיכ עאןûכלאהû';
  var
         Template,Templatebool,
         FTemplatePath,Itemindex,
         OBookmarkCount, What, oBookMarkName: Olevariant;
         IbookmarkCount: Integer;
         tFieldName:String;
         SaveChanges,
         OriginalFormat,
         RouteDocument: OleVariant;

  begin

     What := OleVariant(wdGoToBookmark);
     FTemplatePath := SBWRTemplatesDSet.FieldByName('Path').AsString;
     TemplID := SBWRTemplatesDSet.FieldByName('ID').AsInteger;

     Template := EmptyParam;
     TemplateBooL:=False;
     Itemindex:=1;

     Wordapplication.Connect;

     Wordapplication.Visible := True;
     WordApplication.Documents.Application.Caption := DBLookupComboboxEh1.Text;

     WordApplication.Options.CheckSpellingAsYouType := False;
     WordApplication.Options.CheckGrammarAsYouType := False;
     

     if FileExists(FTemplatePath) then
     begin


     WordApplication.Documents.Open(FTemplatePath,Template,TemplateBooL,Template,
     Template,Template,Template,Template,Template,Template);

     end else
     begin
        SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
        ShowMessage(FilenotFound);
     end;

     WordDocument.ConnectTo(WordApplication.Documents.Item(Itemindex));
     WordDocument.Application.Get_ActiveWindow.Caption:= NLSLocalizer1.Caption;

    // try

       with  SBReplaceDataSet, WordDocument do
       For IbookmarkCount := 1 to Bookmarks.Count do
       begin
         OBookmarkCount := IbookmarkCount ;
         oBookMarkName := Bookmarks.Item(OBookmarkCount).Get_Name;
         WordApplication.Selection.GoTo_(What, EmptyParam, EmptyParam, oBookMarkName);
         Close;
         SetVariable('tid', TemplID);
         SetVariable('bname', oBookMarkName);
         Open;
         tFieldName := FIeldByName('FIELDNAME').AsString;
         WordApplication.Selection.InsertBefore({SBDMInfoDataSet.FieldByName(tFieldName).AsString}'ff');
       end;

     WordDocument.Disconnect;
     Wordapplication.Disconnect;

    { except
       SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
       ShowMessage('Bukmarklar daxil edilmeyib ');
     end; }

  end;


procedure TAgreeForm.ActnCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TAgreeForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TAgreeForm.FormCreate(Sender: TObject);
begin
     SBWRTemplatesDSet.Open;
end;

procedure TAgreeForm.FormDestroy(Sender: TObject);
begin
     SBDMInfoDataSet.CloseAll;
     SBWRTemplatesDSet.CloseAll;
end;

procedure TAgreeForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_ESCAPE then
    Close;
end;

procedure TAgreeForm.FormShow(Sender: TObject);
begin
        with SBDMInfoDataSet do begin
          if Active then close;
             SetVariable('conid',Get_SelectedContID);
          Open;
      end;

end;

end.
