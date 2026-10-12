unit untrep1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQR1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRDBText4: TQRDBText;
    QRExprCount: TQRExpr;
    QRBand4: TQRBand;
    QRLabelDate: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRExpr5: TQRExpr;
    QRShape2: TQRShape;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr6: TQRExpr;
    QRDBText2: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QR1: TQR1;

implementation

uses ControlTapeImpl, untdatamod,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TQR1.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   //QRExprCount.Reset;
end;

procedure TQR1.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 QRExprCount.Reset;
end;

procedure TQR1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if FrmControlTape.ChBoxDebet.Checked =false then begin
   QRLabel5.Enabled :=false;
   QRExpr7.Enabled :=false;
   QRExpr3.Enabled :=false;
   QRExpr1.Enabled :=false;
   QRExpr10.Enabled :=false;
   QRExpr6.Enabled :=false;
   QRExpr2.Enabled :=false;
  end {if ChBoxDebet.Checked =false}
  else begin
   QRLabel5.Enabled :=true;
   QRExpr7.Enabled :=true;
   QRExpr3.Enabled :=true;
   QRExpr1.Enabled :=true;
   QRExpr10.Enabled :=true;
   QRExpr6.Enabled :=true;
   QRExpr2.Enabled :=true;
  end; {if ChBoxDebet.Checked =true}

  if FrmControlTape.ChBoxCredit.Checked =false then begin
   QRLabel6.Enabled :=false;
   QRExpr8.Enabled :=false;
   QRExpr9.Enabled :=false;
   QRExpr4.Enabled :=false;
   QRExpr11.Enabled :=false;
   QRExpr12.Enabled :=false;
   QRExpr13.Enabled :=false;
  end {if ChBoxCredit.Checked =false}
  else begin
   QRLabel6.Enabled :=true;
   QRExpr8.Enabled :=true;
   QRExpr9.Enabled :=true;
   QRExpr4.Enabled :=true;
   QRExpr11.Enabled :=true;
   QRExpr12.Enabled :=true;
   QRExpr13.Enabled :=true;
  end; {if ChBoxCredit.Checked =true}
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
