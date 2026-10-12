unit landscaper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TLandsrep = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRChildBand1: TQRChildBand;
    procedure QuickRep1AfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Landsrep: TLandsrep;

implementation

{$R *.dfm}

procedure TLandsrep.QuickRep1AfterPreview(Sender: TObject);
begin
      showmessage('After preview');
end;

end.
