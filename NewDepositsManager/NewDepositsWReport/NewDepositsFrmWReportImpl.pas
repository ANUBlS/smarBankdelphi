unit NewDepositsFrmWReportImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WordXP, OleServer, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons,
  ExtCtrls, ImgList, ActnList, DBGridEh;

type
  TNewDepositsFrmWReport = class(TForm)
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    ImageList1: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    WordApplication: TWordApplication;
    WordDocument: TWordDocument;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
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
  NewDepositsFrmWReport: TNewDepositsFrmWReport;

  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses NewDepositsDMWReportImpl,NewCommonDeclsImpl,SBTranslateProc,sboapiDataModuleimpl;

procedure exportproc(S:String);export;
begin
  NewDepositsFrmWReport.ShowModal
end;
exports
   exportproc;
procedure TNewDepositsFrmWReport.ActinPrintExecute(Sender: TObject);

 resourcestring  FilenotFound = 'Fayl tapılmadı';
  var
         Template,Templatebool,
         FTemplatePath,Itemindex,
         OBookmarkCount, What, oBookMarkName: Olevariant;
         IbookmarkCount: Integer;
         tFieldName:String;
         SaveChanges,
         OriginalFormat,
         RouteDocument: OleVariant;
         i:integer;

  begin
    With NewDepositsDMWReport do
    begin
      DMGroups.First;
      for i:=0 to DMGroups.RecordCount-1 do
      begin
        TemplatesDataSet.Close;
        TemplatesDataSet.SetVariable('id',DMGroups.FieldByName('tempid').AsInteger);
        TemplatesDataSet.Open;

        What := OleVariant(wdGoToBookmark);
        FTemplatePath := TemplatesDataSet.FieldByName('Path').AsString;
        TemplID :=TemplatesDataSet.FieldByName('ID').AsInteger;

        Template := EmptyParam;
        TemplateBooL:=False;
        Itemindex:=1;

        Wordapplication.Connect;


        WordApplication.Documents.Application.Caption := DBLookupComboboxEh1.Text;

        WordApplication.Options.CheckSpellingAsYouType := False;
        WordApplication.Options.CheckGrammarAsYouType := False;

        if FileExists(FTemplatePath) then
        begin

          WordApplication.Documents.Open(FTemplatePath,Template,TemplateBooL,Template,
          Template,Template,Template,Template,Template,Template,Template,Template,Template,Template,Template);

        end
        else
        begin

          SaveChanges := WdDoNotSaveChanges;
          OriginalFormat := UnAssigned;
          RouteDocument := UnAssigned;
          WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
          WordApplication.Disconnect;
          ShowMessage(FilenotFound);

        end;

        WordDocument.ConnectTo(WordApplication.Documents.Item(Itemindex));
        WordDocument.Application.Get_ActiveWindow.Caption:=NewDepositsFrmWReport.Caption;

        try

         with NewDepositsDMWReport, ReplaceDataSet, WordDocument do
         For IbookmarkCount := 1 to Bookmarks.Count do
         begin

           OBookmarkCount := IbookmarkCount ;
           OBookMarkName := Bookmarks.Item(OBookmarkCount).Get_Name;
           WordApplication.Selection.GoTo_(What, EmptyParam, EmptyParam, oBookMarkName);
           ReplaceDataSet.Close;
           SetVariable('tid', TemplID);
           SetVariable('bname', oBookMarkName);
           ReplaceDataSet.Open;
           tFieldName := FIeldByName('FIELDNAME').AsString;
           WordApplication.Selection.InsertAfter(DepositInfoDataSet.FieldByName(tFieldName).AsString);

         end;

        Wordapplication.Visible := True;
        WordDocument.Disconnect;
        Wordapplication.Disconnect;

       except
        SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
        WordApplication.Disconnect;
        ShowMessage('Bukmarklar daxil edilməyib ');
       end;
       Next;
      end;
    end;

end;

procedure TNewDepositsFrmWReport.ActnCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmWReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TNewDepositsFrmWReport.FormCreate(Sender: TObject);
begin
   NewDepositsDMWReport := TNewDepositsDMWReport.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmWReport.FormDestroy(Sender: TObject);
begin
  NewDepositsDMWReport.Free;
end;

procedure TNewDepositsFrmWReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TNewDepositsFrmWReport.FormShow(Sender: TObject);
begin
   with NewDepositsDMWReport,DepositInfoDataSet do
   begin
      Close;
      SetVariable('ContractID',Get_SelectedContID);
      Open;
      DMGroups.Close;
      DMGroups.Open
   end;
end;
   initialization
   NewDepositsFrmWReport := TNewDepositsFrmWReport.Create(CommonApplication);
end.
