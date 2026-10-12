unit Ferdi_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, OleServer, WordXP,ComObj  ;

type
  TForm1 = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    XFButton1: TXFButton;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure XFButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  openDialog : TOpenDialog;


implementation
uses Data_Unit;
{$R *.DFM}

   procedure InitPlugin(s:string);export;
begin
   Form1.ShowModal;
end;
exports
     InitPlugin;


procedure TForm1.Button1Click(Sender: TObject);
var
  Word: OleVariant;
  PageBreak: Integer;
begin
  Word:=CreateOleObject('Word.Application');
  Word.WordBasic.FileNew;
  Word.WordBasic.Insert('page1');
  PageBreak:=1;
  Word.Selection.InsertBreak(PageBreak);
  Word.WordBasic.Insert('page2');
  Word.Visible:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Clear;
Memo2.Clear;
end;

procedure TForm1.XFButton1Click(Sender: TObject);
var
 Word: OleVariant;
  PageBreak: Integer;

  WordApp : Variant;
  Range : Variant;
  i : integer;
  Selection : Variant;
begin

openDialog1.Filter := 'Word files only|*.doc';
if OpenDialog1.Execute then
begin
 WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := false;
  Wordapp.documents.open(OpenDialog1.FileName);
    Word.WordBasic.Insert('page1');  //
    PageBreak:=1;//
    Word.Selection.InsertBreak(PageBreak);    //
  Word.WordBasic.Insert('page2');//
  Range := WordApp.Documents.Item(1).Range;
  WordApp.documents.item(1).select;
  WordApp.selection.copy;
  Memo1.lines.clear;
  Memo1.pastefromclipboard;
  WordApp.documents.item(1).Close;
  WordApp.Quit;




end;
end;


initialization
 Form1 := TForm1.Create(Application);

end.




begin
  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);

  // Set up the starting directory to be the current one
  openDialog.InitialDir := GetCurrentDir;

  // Only allow existing files to be selected
  openDialog.Options := [ofFileMustExist];

  // Allow only .dpr and .pas files to be selected
  openDialog.Filter :=
    'Delphi project files|*.dpr|Delphi pascal files|*.pas';

  // Select pascal files as the starting filter type
  openDialog.FilterIndex := 2;

  // Display the open file dialog
  if openDialog.Execute
  then ShowMessage('File : '+openDialog.FileName)
  else ShowMessage('Open file was cancelled');

  // Free up the dialog
  openDialog.Free;
end;
