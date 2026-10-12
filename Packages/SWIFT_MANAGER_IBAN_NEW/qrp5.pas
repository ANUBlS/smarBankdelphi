unit qrp5;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrpctrls;

type
  TQuickReport5 = class(TQuickRep)
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
    QRPRichtext1: TQRPRichtext;
  private

  public

  end;

var
  QuickReport5: TQuickReport5;

implementation

{$R *.DFM}

end.
