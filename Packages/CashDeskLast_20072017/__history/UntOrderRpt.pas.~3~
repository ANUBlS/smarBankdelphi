unit UntOrderRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickRptOrder = class(TQuickRep)
    QRWithDraw2: TQRBand;
    QRLabel5: TQRLabel;
    QRDBImage2: TQRDBImage;
    QRLBankName1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel26: TQRLabel;
    QRLBankInn1: TQRLabel;
    QRShape7: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel28: TQRLabel;
    QRShape11: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape12: TQRShape;
    QRLabel34: TQRLabel;
    QRLAmmount1: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel36: TQRLabel;
    QRShape16: TQRShape;
    QRDBText16: TQRDBText;
    QRLabel37: TQRLabel;
    QRShape17: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText38: TQRDBText;
    QRInn2: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel44: TQRLabel;
    QRDBImage3: TQRDBImage;
    QRLBankName2: TQRLabel;
    QRShape23: TQRShape;
    QRLBankInn2: TQRLabel;
    QRShape24: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel51: TQRLabel;
    QRShape25: TQRShape;
    QRLabel53: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape26: TQRShape;
    QRLabel57: TQRLabel;
    QRDBText25: TQRDBText;
    QRLAmmount2: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape27: TQRShape;
    QRDBText26: TQRDBText;
    QRLabel60: TQRLabel;
    QRShape28: TQRShape;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel61: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText39: TQRDBText;
    QRInn3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    ChildBand2: TQRChildBand;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRLBankName: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRShape8: TQRShape;
    QRLBankInn: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRLabel18: TQRLabel;
    QRShape10: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLAmmount: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape6: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText37: TQRDBText;
    QRInn1: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText18: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape22: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRShape33: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel90: TQRLabel;
    QRShape91: TQRShape;
    QRLabel92: TQRLabel;
    QRShape93: TQRShape;
    QRLabel94: TQRLabel;
    QRShape95: TQRShape;
    QRDBImage5: TQRDBImage;
    QRDBImage4: TQRDBImage;
    QRDBImage6: TQRDBImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickRptOrder: TQuickRptOrder;

implementation

uses CashDeskImpl, CashDataModule, UntCashSettings, UntQRReceiptOrder,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}




procedure TQuickRptOrder.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
