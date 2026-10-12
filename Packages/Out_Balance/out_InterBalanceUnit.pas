unit out_InterBalanceUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFormOut_InterBalance = class(TQuickRep)
    HeaderBand: TQRBand;
    QRDBText1: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    GroupHeader: TQRGroup;
    GroupFooter: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel4: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  FormOut_InterBalance: TFormOut_InterBalance;

implementation

uses out_UnitDataMod,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TFormOut_InterBalance.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
