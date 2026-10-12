unit TurnOverReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TReportTurnOver = class(TQuickRep)
    QRBandTitle: TQRBand;
    QRLabel8: TQRLabel;
    QRLabelDate: TQRLabel;
    QRGroupOperation: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroupBalance: TQRGroup;
    QRBandDetail: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBandSumBalance: TQRBand;
    QRBandSumOperation: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  ReportTurnOver: TReportTurnOver;

implementation

uses ExpertDataModule,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TReportTurnOver.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
