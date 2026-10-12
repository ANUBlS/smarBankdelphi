unit Unit_All_Rep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRep_All = class(TQuickRep)
    QRGroupHeader: TQRGroup;
    QRLabelGroupName: TQRLabel;
    DBTextGroupName: TQRDBText;
    ChildBandGroup: TQRChildBand;
    QRLabelWaresName: TQRLabel;
    QRLabelInvDate: TQRLabel;
    QRLabelPercent: TQRLabel;
    QRLabelFirst_Price: TQRLabel;
    QRLabelRemainder: TQRLabel;
    QRLabelAll_Amort: TQRLabel;
    QRLabelAmort: TQRLabel;
    DetailBand: TQRBand;
    DBTextWaresName: TQRDBText;
    DBTextInvDate: TQRDBText;
    DBTextFirst_Price: TQRDBText;
    DBTextRemainder: TQRDBText;
    DBTextAll_Amort: TQRDBText;
    DBTexAmort: TQRDBText;
    DBTextPercent: TQRDBText;
    QRBandGroupFooter: TQRBand;
    QRExprFirst_Price: TQRExpr;
    QRExprRemainder: TQRExpr;
    QRExprAll_Amort: TQRExpr;
    QRExprAmort: TQRExpr;
    QRBandSummary: TQRBand;
    QRExprFirst_PriceA: TQRExpr;
    QRLabelEndSum: TQRLabel;
    QRExprRemainderA: TQRExpr;
    QRExprAll_AmortA: TQRExpr;
    QRExprAmortA: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRep_All: TQRep_All;

implementation
             uses UnitData,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TQRep_All.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
