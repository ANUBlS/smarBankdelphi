unit UnitReport4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  Tmemorial_rpt4 = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText7: TQRDBText;
    QRECount: TQRExpr;
    QRDBText8: TQRDBText;
    QRDBText13: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabelTitle: TQRLabel;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    TitleBand1: TQRBand;
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
    QRLMEB: TQRLabel;
    QRLDate2: TQRLabel;
    QRLDate1: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    CurrencyLongName: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  memorial_rpt4: Tmemorial_rpt4;

implementation

uses memorial_datamod,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure Tmemorial_rpt4.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
