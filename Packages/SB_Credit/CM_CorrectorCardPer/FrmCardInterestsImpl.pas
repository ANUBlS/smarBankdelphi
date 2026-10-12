unit FrmCardInterestsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ExtCtrls, DBCtrls, NLSLocalizer, StdCtrls, Buttons;

type
  TFrmCardInterests = class(TForm)
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    NLSLocalizer1: TNLSLocalizer;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardInterests: TFrmCardInterests;

implementation

{$R *.DFM}

uses DMCorrectorCardPerImpl;

procedure TFrmCardInterests.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TFrmCardInterests.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close;
end;

end.
