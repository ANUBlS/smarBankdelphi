unit UnitReport3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  Tmemorial_rpt3 = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText7: TQRDBText;
    QRECount: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr3: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRLabelTitle: TQRLabel;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRLBank: TQRLabel;
    QRLV: TQRLabel;
    QRLVoin: TQRLabel;
    QRLM: TQRLabel;
    QRShape1: TQRShape;
    QRLSENED: TQRLabel;
    QRShape2: TQRShape;
    QRLENU: TQRLabel;
    QRShape4: TQRShape;
    QRLD: TQRLabel;
    QRShape5: TQRShape;
    QRLK: TQRLabel;
    QRShape7: TQRShape;
    QRLXV: TQRLabel;
    QRLMAN: TQRLabel;
    QRShape9: TQRShape;
    QRLMEB: TQRLabel;
    QRShape10: TQRShape;
    QRLDate2: TQRLabel;
    QRLDate1: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    CurrencyLongName: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  memorial_rpt3: Tmemorial_rpt3;

implementation

uses memorial_datamod,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure Tmemorial_rpt3.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
