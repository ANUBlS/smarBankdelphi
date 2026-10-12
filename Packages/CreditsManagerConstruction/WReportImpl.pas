unit WReportImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WordXP, ActnList, ImgList, OleServer, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, Buttons;

type
  TWReport = class(TForm)
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    WordDocument: TWordDocument;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    WordApplication: TWordApplication;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Action1: TAction;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);

  private
    { Private declarations }
  public

    TemplID :Integer;
    { Public declarations }
  end;

var
  WReport: TWReport;

implementation

uses DatModConstructionImpl;

{$R *.dfm}





procedure TWReport.SpeedButton3Click(Sender: TObject);
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
     FTemplatePath := DatModConstruction.Templates.FieldByName('Path').AsString;
     TemplID :=DatModConstruction.Templates.FieldByName('ID').AsInteger;

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
     Template,Template,Template,Template,Template,Template,Template,
     Template,Template,Template,Template)

     end else
     begin

        SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
        ShowMessage('FilenotFound');

     end;

     WordDocument.ConnectTo(WordApplication.Documents.Item(Itemindex));
//     WordDocument.Application.Get_ActiveWindow.Caption:=NLSLocalizer1.Caption;

     try

       with DatModConstruction, ReplaceCustDataSet, WordDocument do
       For IbookmarkCount := 1 to Bookmarks.Count do
       begin

         OBookmarkCount := IbookmarkCount ;
         oBookMarkName := Bookmarks.Item(OBookmarkCount).Get_Name;
         WordApplication.Selection.GoTo_(What, EmptyParam, EmptyParam, oBookMarkName);
         ReplaceCustDataSet.Close;
         SetVariable('tid', TemplID);
         SetVariable('bname', oBookMarkName);
         ReplaceCustDataSet.Open;
         tFieldName := FIeldByName('FIELDNAME').AsString;
         WordApplication.Selection.InsertAfter(cc_bookmarkDataSet.FieldByName(tFieldName).AsString);

       end;

     WordDocument.Disconnect;
     Wordapplication.Disconnect;

     except
        SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
        ShowMessage('Bukmarklar daxil edilmeyib ');
     end;
end;

procedure TWReport.SpeedButton4Click(Sender: TObject);
begin
Close;
end;

end.
