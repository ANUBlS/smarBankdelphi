unit OrderPrintUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrpctrls, jpeg;

type
  TQReportOrder = class(TQuickRep)
    QRLabel18: TQRLabel;
    QRLabel46: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape3: TQRShape;
    QRLabel47: TQRLabel;
    QRFilVoin: TQRLabel;
    QRFilialName: TQRLabel;
    QRFilAdress: TQRLabel;
    QRLabel75: TQRLabel;
    QRDate: TQRLabel;
    QRLabel28: TQRLabel;
    QRPassword: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRSentname: TQRLabel;
    QRLabel3: TQRLabel;
    QRSerial: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRPaspplace: TQRLabel;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRPhoneM: TQRLabel;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRSentname1: TQRLabel;
    QRShape17: TQRShape;
    QRLabel13: TQRLabel;
    QRAmount: TQRLabel;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRKomission: TQRLabel;
    QRLabel23: TQRLabel;
    QRAllAmount: TQRLabel;
    QRShape15: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRDesciption: TQRLabel;
    QRShape28: TQRShape;
    QRMemo1: TQRMemo;
    QRShape30: TQRShape;
    QRLabel36: TQRLabel;
    QRShape31: TQRShape;
    QRLabel37: TQRLabel;
    QRShape27: TQRShape;
    QRLabel6: TQRLabel;
    QRShape52: TQRShape;
    QRBand3: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRFilVoin1: TQRLabel;
    QRFilialName1: TQRLabel;
    QRFilAdress1: TQRLabel;
    QRLabel17: TQRLabel;
    QRDate1: TQRLabel;
    QRLabel21: TQRLabel;
    QRPassword1: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape16: TQRShape;
    QRSentname2: TQRLabel;
    QRLabel29: TQRLabel;
    QRSerial1: TQRLabel;
    QRShape20: TQRShape;
    QRLabel31: TQRLabel;
    QRPaspplace1: TQRLabel;
    QRShape21: TQRShape;
    QRLabel33: TQRLabel;
    QRPhoneM1: TQRLabel;
    QRShape22: TQRShape;
    QRLabel35: TQRLabel;
    QRSentname3: TQRLabel;
    QRShape23: TQRShape;
    QRLabel41: TQRLabel;
    QRAmount1: TQRLabel;
    QRShape25: TQRShape;
    QRLabel43: TQRLabel;
    QRKomission1: TQRLabel;
    QRLabel45: TQRLabel;
    QRAllAmount1: TQRLabel;
    QRShape26: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDesciption1: TQRLabel;
    QRShape29: TQRShape;
    QRMemo2: TQRMemo;
    QRShape32: TQRShape;
    QRLabel52: TQRLabel;
    QRShape33: TQRShape;
    QRLabel53: TQRLabel;
    QRShape34: TQRShape;
    QRLabel54: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRDBImage2: TQRDBImage;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
  private

  public

  end;

var
  QReportOrder: TQReportOrder;

implementation

uses ExpDataModuleUnit;

{$R *.DFM}

end.
