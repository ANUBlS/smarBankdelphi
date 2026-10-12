unit ReportImpl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport1 = class(TQuickRep)
    Report: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation
 uses PaymentPlaneMgrUnit;
{$R *.DFM}

end.
