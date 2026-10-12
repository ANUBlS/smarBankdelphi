unit UnitCurrentRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFormCurrentRep = class(TForm)
    QuickRep: TQuickRep;
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
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabelRemainder: TQRLabel;
    DBTextRemainder: TQRDBText;
    QRExprRemainder: TQRExpr;
    QRExprRemainderA: TQRExpr;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRLabelM: TQRLabel;
    QRExprC: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBandGroupAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCurrentRep: TFormCurrentRep;

implementation

uses UnitData;

{$R *.DFM}

procedure TFormCurrentRep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
QRLabelM.Caption:=(DataModWares.SB_MAIN_RESOURCE.CallDateFunction('last_calc_date',[]));
end;

procedure TFormCurrentRep.ChildBandGroupAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
QRExprC.Reset;
end;

end.
