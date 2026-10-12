unit CashReportMain;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData,Dialogs,
  QRExport;

type
  TMainCashReport = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLBankName: TQRLabel;
    QRLDate: TQRLabel;
    QRLCode: TQRLabel;
    QRLabel4: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
    QRTextFilter1: TQRTextFilter;
  private

  public

  end;

var
  MainCashReport: TMainCashReport;

implementation

uses CashDeskImpl, CashDataModule;

{$R *.DFM}

end.
