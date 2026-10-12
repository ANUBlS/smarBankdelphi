unit UntRptMainF;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TRptDepartments = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRGroup2: TQRGroup;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRMainName: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRCount: TQRExpr;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRDateFormat: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  RptDepartments: TRptDepartments;

implementation

uses MFDataModule;

{$R *.DFM}

procedure TRptDepartments.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 QRCount.Reset;
end;

end.
