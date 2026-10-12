unit UnitRepGroupNB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRepGroupAll = class(TQuickRep)
    QRBandSummary: TQRBand;
    QRExprFirst_PriceA: TQRExpr;
    QRLabelEndSum: TQRLabel;
    QRExprRemainderA: TQRExpr;
    QRExprAll_AmortA: TQRExpr;
    QRExprAmortA: TQRExpr;
    DetailBand: TQRBand;
    DBTextWaresName: TQRDBText;
    DBTextInvDate: TQRDBText;
    DBTextFirst_Price: TQRDBText;
    DBTextRemainder: TQRDBText;
    DBTextAll_Amort: TQRDBText;
    DBTexAmort: TQRDBText;
    DBTextPercent: TQRDBText;
    QRBand1: TQRBand;
    QRLabelWaresName: TQRLabel;
    QRLabelInvDate: TQRLabel;
    QRLabelPercent: TQRLabel;
    QRLabelFirst_Price: TQRLabel;
    QRLabelRemainder: TQRLabel;
    QRLabelAll_Amort: TQRLabel;
    QRLabelAmort: TQRLabel;
    QRLabelRED: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRepGroupAll: TQRepGroupAll;

implementation
            uses UnitData,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TQRepGroupAll.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
