unit MainReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TMainReport = class(TQuickRep)
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRGroupOperation: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRGroupBalance: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBName: TQRDBText;
    QRDBCurrencyName: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabelDate: TQRLabel;
    QRExpr3: TQRExpr;
    QRExprSumOstat: TQRExpr;
    QRExprTotal: TQRExpr;
    QRTextFilter1: TQRTextFilter;
    procedure QRGroupBalanceAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  MainReport: TMainReport;

implementation

uses ExpertDataModule,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TMainReport.QRGroupBalanceAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 QRExpr1.Reset;
end;

procedure TMainReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
