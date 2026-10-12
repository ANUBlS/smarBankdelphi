unit FrmPaymentLossImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, Grids, DBGrids;

type
  TFrmPaymentLoss = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPaymentLoss: TFrmPaymentLoss;

implementation

{$R *.dfm}

procedure TFrmPaymentLoss.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close

end;

procedure TFrmPaymentLoss.XFButton1Click(Sender: TObject);
begin
close;
end;

end.
