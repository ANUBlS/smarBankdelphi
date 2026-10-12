unit UnitMainReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData;

type
  TQRFinanceRep = class(TQuickRep)
    ODSetRep: TOracleDataSet;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLDate: TQRLabel;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRYearActive: TQRLabel;
    QRYearPassiv: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText22: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRShape10: TQRShape;
    QRExpr6: TQRExpr;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRExpr7: TQRExpr;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape15: TQRShape;
    QRExpr8: TQRExpr;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape16: TQRShape;
    QRExpr9: TQRExpr;
    QRShape17: TQRShape;
    QRExpr10: TQRExpr;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRShape20: TQRShape;
    QRExpr11: TQRExpr;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRShape21: TQRShape;
    QRExpr12: TQRExpr;
    QRShape22: TQRShape;
    QRExpr13: TQRExpr;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRExpr14: TQRExpr;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRExpr15: TQRExpr;
    QRShape27: TQRShape;
    QRExpr16: TQRExpr;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRExpr17: TQRExpr;
    QRShape30: TQRShape;
    QRExpr18: TQRExpr;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRShape33: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRShape34: TQRShape;
    QRDBText45: TQRDBText;
    ODSetRepA11: TFloatField;
    ODSetRepP11: TFloatField;
    ODSetRepA12: TFloatField;
    ODSetRepP12: TFloatField;
    ODSetRepA13: TFloatField;
    ODSetRepP13: TFloatField;
    ODSetRepA14: TFloatField;
    ODSetRepP14: TFloatField;
    ODSetRepA15: TFloatField;
    ODSetRepP15: TFloatField;
    ODSetRepA21: TFloatField;
    ODSetRepP21: TFloatField;
    ODSetRepA22: TFloatField;
    ODSetRepP22: TFloatField;
    ODSetRepA23: TFloatField;
    ODSetRepP23: TFloatField;
    ODSetRepA24: TFloatField;
    ODSetRepP24: TFloatField;
    ODSetRepA25: TFloatField;
    ODSetRepP25: TFloatField;
    ODSetRepA26: TFloatField;
    ODSetRepP26: TFloatField;
    ODSetRepA27: TFloatField;
    ODSetRepP27: TFloatField;
    ODSetRepA31: TFloatField;
    ODSetRepP31: TFloatField;
    ODSetRepA32: TFloatField;
    ODSetRepP32: TFloatField;
    ODSetRepA33: TFloatField;
    ODSetRepP33: TFloatField;
    ODSetRepA34: TFloatField;
    ODSetRepP34: TFloatField;
    ODSetRepA35: TFloatField;
    ODSetRepP35: TFloatField;
    ODSetRepA41: TFloatField;
    ODSetRepP41: TFloatField;
    ODSetRepA42: TFloatField;
    ODSetRepP42: TFloatField;
    ODSetRepA51: TFloatField;
    ODSetRepP51: TFloatField;
    ODSetRepA52: TFloatField;
    ODSetRepP52: TFloatField;
    ODSetRepA53: TFloatField;
    ODSetRepP53: TFloatField;
    ODSetRepN31: TFloatField;
    ODSetRepN32: TFloatField;
    ODSetRepN33: TFloatField;
    ODSetRepN34: TFloatField;
    ODSetRepN35: TFloatField;
    ODSetRepN41: TFloatField;
    ODSetRepN42: TFloatField;
    ODSetRepN51: TFloatField;
    ODSetRepN52: TFloatField;
    ODSetRepN53: TFloatField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRFinanceRep: TQRFinanceRep;

implementation

uses Finance_State, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TQRFinanceRep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
