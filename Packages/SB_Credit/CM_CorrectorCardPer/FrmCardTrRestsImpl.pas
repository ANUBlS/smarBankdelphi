unit FrmCardTrRestsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, DBCtrls;

type
  TFrmCardTrRests = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardTrRests: TFrmCardTrRests;

implementation

{$R *.DFM}
uses DMCorrectorCardPerImpl;

procedure TFrmCardTrRests.BitBtn1Click(Sender: TObject);
begin
   Close
end;

procedure TFrmCardTrRests.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TFrmCardTrRests.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then Close
end;

end.
