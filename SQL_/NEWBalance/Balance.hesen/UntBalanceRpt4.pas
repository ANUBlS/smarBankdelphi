unit UntBalanceRpt4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TBalanceRpt4 = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLBank: TQRLabel;
    QRLCode: TQRLabel;
    QRLValute: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLSedr: TQRLabel;
    QRLBM: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText9: TQRDBText;
    FDate: TQRLabel;
    LDate: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
  private

  public

  end;

var
  BalanceRpt4: TBalanceRpt4;

implementation

uses UnitDataMod;
{$R *.DFM}


end.
