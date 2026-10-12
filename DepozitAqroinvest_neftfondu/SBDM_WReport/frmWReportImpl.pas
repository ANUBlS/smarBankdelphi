unit frmWReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ImgList, WordXP, OleServer, StdCtrls, Mask,shlobj,
  DBCtrlsEh, DBLookupEh, Buttons, ExtCtrls,Variants, DBGridEh;

type
  TfrmWReport = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    WordApplication: TWordApplication;
    WordDocument: TWordDocument;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActinPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    TemplID :Integer;
  end;

var
  frmWReport: TfrmWReport;

  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses DMWReportImpl,CommonDeclsImpl;

procedure exportproc(S:String);export;
begin
   frmWReport.ShowModal;
end;
exports
   exportproc;

procedure TfrmWReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TfrmWReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TfrmWReport.ActinPrintExecute(Sender: TObject);
  resourcestring  FilenotFound = 'Fayıl tapılmadı';
  var
         Template,Templatebool,
         FTemplatePath,Itemindex,
         OBookmarkCount, What, oBookMarkName: Olevariant;
         IbookmarkCount: Integer;
         tFieldName:String;
         SaveChanges,
         OriginalFormat,
         RouteDocument: OleVariant;

         v_pozt:integer;
         v_filename, v_paziton:string;
         v_filePas:Olevariant;
 ////////-----------------//////////////////////////////////////
    function DesktopPath:string;
var zpath: array [0..MAX_PATH] of char;
 begin
 SHGetFolderPath(0, CSIDL_DESKTOP, 0, SHGFP_TYPE_CURRENT, @zpath);
 result:=   (zpath);
 end;
 begin

 v_filename:= DMWReport.TemplatesDataSet.FieldByName('Path').AsString;
 v_pozt:= lastdelimiter('\',v_filename);
 v_paziton:=Copy(v_filename, v_pozt + 1, Length(v_filename));

 DeleteFile(DesktopPath+'\'+v_paziton);
   CopyFile(PChar(v_filename),PChar(DesktopPath+'\'+v_paziton),false);
 v_filePas:=DesktopPath+'\'+v_paziton;
 ////////////////////---------------/////////////////////////////////

     What := OleVariant(wdGoToBookmark);
     FTemplatePath := DMWReport.TemplatesDataSet.FieldByName('Path').AsString;
     TemplID :=DMWReport.TemplatesDataSet.FieldByName('ID').AsInteger;

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

     WordApplication.Documents.Open(v_filePas,Template,TemplateBooL,Template,
     Template,Template,Template,Template,Template,Template,Template,Template,Template,Template,Template);

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
     WordDocument.Application.Get_ActiveWindow.Caption:=frmWReport.Caption;

     try

       with DMWReport, ReplaceDataSet, WordDocument do
       For IbookmarkCount := 1 to Bookmarks.Count do
       begin

         OBookmarkCount := IbookmarkCount ;
         oBookMarkName := Bookmarks.Item(OBookmarkCount).Get_Name;
         WordApplication.Selection.GoTo_(What, EmptyParam, EmptyParam, oBookMarkName);
         ReplaceDataSet.Close;
         SetVariable('tid', TemplID);
         SetVariable('bname', oBookMarkName);
         ReplaceDataSet.Open;
         tFieldName := FIeldByName('FIELDNAME').AsString;
         WordApplication.Selection.InsertAfter(DepositInfoDataSet.FieldByName(tFieldName).AsString);

       end;

     WordDocument.Disconnect;
     Wordapplication.Disconnect;

     except
       SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
        ShowMessage(oBookMarkName+'bukmark daxil edilməyib ');
     end;

end;

procedure TfrmWReport.FormShow(Sender: TObject);
begin
   with DMWReport,DepositInfoDataSet do
   begin
      CloseAll;
      SetVariable('ContractID',Get_SelectedContID);
      Open;
   end;
end;

procedure TfrmWReport.FormCreate(Sender: TObject);
begin
   DMWReport := TDMWReport.Create(Self);
end;

procedure TfrmWReport.FormDestroy(Sender: TObject);
begin
   DMWReport.Free;
end;

procedure TfrmWReport.ActnCloseExecute(Sender: TObject);
begin
   Close;
end;

initialization
   frmWReport := TfrmWReport.Create(CommonApplication);

end.
