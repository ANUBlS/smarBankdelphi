unit OrderPrintUnit_tarif;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrpctrls, jpeg;



type
  TQReportOrderTarif = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLBank: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
  private

  public

  end;

var
  QReportOrderTarif: TQReportOrderTarif;

implementation

uses UnitDataModPCustService;

{$R *.DFM}

end.
