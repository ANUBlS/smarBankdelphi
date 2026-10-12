unit UnitCurrentRepNL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, QRExport;

type
  TFormCurrentRepNL = class(TForm)
    QuickRepNL: TQuickRep;
    DetailBand: TQRBand;
    DBTextWaresName: TQRDBText;
    DBTextInvDate: TQRDBText;
    DBTextFirst_Price: TQRDBText;
    DBTextAll_Amort: TQRDBText;
    DBTexAmort: TQRDBText;
    DBTextPercent: TQRDBText;
    QRGroupHeader: TQRGroup;
    QRLabelGroupName: TQRLabel;
    DBTextGroupName: TQRDBText;
    QRBandGroupFooter: TQRBand;
    QRExprFirst_Price: TQRExpr;
    QRExprAll_Amort: TQRExpr;
    QRExprAmort: TQRExpr;
    QRBandSummary: TQRBand;
    QRExprFirst_PriceA: TQRExpr;
    QRLabelEndSum: TQRLabel;
    QRExprAll_AmortA: TQRExpr;
    QRExprAmortA: TQRExpr;
    ChildBandGroup: TQRChildBand;
    QRLabelWaresName: TQRLabel;
    QRLabelInvDate: TQRLabel;
    QRLabelPercent: TQRLabel;
    QRLabelFirst_Price: TQRLabel;
    QRLabelAll_Amort: TQRLabel;
    QRLabelAmort: TQRLabel;
    QRLabelRemainder: TQRLabel;
    DBTextRemainder: TQRDBText;
    QRExprRemainder: TQRExpr;
    QRExprRemainderA: TQRExpr;
    QRLabel1: TQRLabel;
    TitleBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabelT: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRExprC1: TQRExpr;
    procedure QuickRepNLBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBandGroupAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCurrentRepNL: TFormCurrentRepNL;

implementation

uses UnitData;

{$R *.DFM}

procedure TFormCurrentRepNL.QuickRepNLBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
QRLabelT.Caption:=(DataModWares.SB_MAIN_RESOURCE.CallDateFunction('last_calc_date',[]));
end;

procedure TFormCurrentRepNL.ChildBandGroupAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
QRExprC1.Reset;
end;

end.
