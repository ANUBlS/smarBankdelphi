unit UntRep1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TQuickRepObr1 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    ValRates: TQRMemo;
    ValNames: TQRMemo;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    SummaryBand1: TQRBand;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickRepObr1: TQuickRepObr1;

implementation

uses UntOBRDM, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TQuickRepObr1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
