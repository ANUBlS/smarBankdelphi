unit qrp1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrpctrls;

type
  TQuickReport1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRPRichtext1: TQRPRichtext;
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses Unit2;

{$R *.DFM}

end.
