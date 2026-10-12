unit AboutProgramImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, jpeg, ExtCtrls;

type
  TfrmAboutProgram = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    OK: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAboutProgram: TfrmAboutProgram;

implementation

{$R *.DFM}

procedure TfrmAboutProgram.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TfrmAboutProgram.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.
