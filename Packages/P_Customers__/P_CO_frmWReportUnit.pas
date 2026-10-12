unit P_CO_frmWReportUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ActnList, ImgList, OleServer, StdCtrls, shlobj,
  Mask, WordXP, Variants, DBCtrls;

type
  TPh_CO_frmWReport = class(TForm)
    WordApplication: TWordApplication;
    WordDocument: TWordDocument;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure ActinPrintExecute(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    TemplID: Integer;
    { Public declarations }
  end;

var
  Ph_CO_frmWReport: TPh_CO_frmWReport;

implementation

uses P_Datamod_Unit,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TPh_CO_frmWReport.ActinPrintExecute(Sender: TObject);
resourcestring
  FilenotFound = 'Fayl tapılmadı';
var
  Template, Templatebool, FTemplatePath, Itemindex, OBookmarkCount, What,
    oBookMarkName: Olevariant;
  IbookmarkCount: Integer;
  tFieldName: String;
  SaveChanges, OriginalFormat, RouteDocument: Olevariant;

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

 v_filename:=  P_DataModule.Templates.FieldByName('Path').AsString;
 v_pozt:= lastdelimiter('\',v_filename);
 v_paziton:=Copy(v_filename, v_pozt + 1, Length(v_filename));

 DeleteFile(DesktopPath+'\'+v_paziton);
   CopyFile(PChar(v_filename),PChar(DesktopPath+'\'+v_paziton),false);
 v_filePas:=DesktopPath+'\'+v_paziton;
 ////////////////////---------------/////////////////////////////////

  What := Olevariant(wdGoToBookmark);
  FTemplatePath := P_DataModule.Templates.FieldByName('Path').AsString;
  TemplID := P_DataModule.Templates.FieldByName('ID').AsInteger;

  Template := EmptyParam;
  Templatebool := False;
  Itemindex := 1;

  WordApplication.Connect;

  WordApplication.Visible := True;
  WordApplication.Documents.Application.Caption := DBLookupComboBox1.Text;

  WordApplication.Options.CheckSpellingAsYouType := False;
  WordApplication.Options.CheckGrammarAsYouType := False;

  if FileExists(FTemplatePath) then
  begin

    WordApplication.Documents.Open(v_filePas{FTemplatePath}, Template, Templatebool,
      Template, Template, Template, Template, Template, Template, Template,
      Template, Template, Template, Template, Template);

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
  // WordDocument.Application.Get_ActiveWindow.Caption:=NLSLocalizer1.Caption;

  try

    with P_DataModule, ReplaceCustDataSet, WordDocument do
      For IbookmarkCount := 1 to Bookmarks.Count do
      begin

        OBookmarkCount := IbookmarkCount;
        oBookMarkName := Bookmarks.Item(OBookmarkCount).Get_Name;
        WordApplication.Selection.GoTo_(What, EmptyParam, EmptyParam,
          oBookMarkName);
        ReplaceCustDataSet.Close;
        SetVariable('tid', TemplID);
        SetVariable('bname', oBookMarkName);
        ReplaceCustDataSet.Open;
        tFieldName := FieldByName('FIELDNAME').AsString;
        WordApplication.Selection.InsertAfter
          (CustomerInfoDataSet.FieldByName(tFieldName).AsString);

      end;

    WordDocument.Disconnect;
    WordApplication.Disconnect;

  except
    SaveChanges := WdDoNotSaveChanges;
    OriginalFormat := UnAssigned;
    RouteDocument := UnAssigned;
    WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
    WordApplication.Disconnect;
    ShowMessage('Bukmarklar daxil edilmeyib ');
  end;

end;

procedure TPh_CO_frmWReport.ActnCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TPh_CO_frmWReport.FormCreate(Sender: TObject);
begin

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
