unit ShecudileImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSecudile = class(TForm)
    RGAnnuty: TRadioGroup;
    GroupBox3: TGroupBox;
    Gdovr: TEdit;
    GroupBox5: TGroupBox;
    CmbBoxPeriodRate: TComboBox;
    BitBtn1: TBitBtn;
    procedure GdovrKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Secudile: TSecudile;

implementation

{$R *.dfm}
  uses Dmretsetitnq;
procedure TSecudile.BitBtn1Click(Sender: TObject);
var
PerRate :integer;
begin
dmrt.PersonLinkANUITET.AsInteger:=Secudile.RGAnnuty.ItemIndex;
dmrt.PersonLinkGUZESHT.AsInteger:=strtoint(Secudile.Gdovr.text);
case CmbBoxPeriodRate.ItemIndex of
      0 : PerRate := 1;
      1 : PerRate := 3;
      2 : PerRate := 6;
    else
      PerRate := 12;
    end; // Case
dmrt.PersonLinkPERRATE.AsInteger:=PerRate ;
close;
end;

procedure TSecudile.GdovrKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
begin Key:=#0;
Beep;
end;
end;

end.
