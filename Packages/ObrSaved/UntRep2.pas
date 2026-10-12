unit UntRep2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TQuickRepObr2 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    c: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBImage1: TQRDBImage;
    ValNames: TQRMemo;
    ValRates: TQRMemo;
    SummaryBand1: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    ChildBand1: TQRChildBand;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickRepObr2: TQuickRepObr2;

implementation

uses UntOBRDM, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TQuickRepObr2.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
