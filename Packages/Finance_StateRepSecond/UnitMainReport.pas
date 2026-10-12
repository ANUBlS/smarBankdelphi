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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRYearActive: TQRLabel;
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
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
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
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRDBText45: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape3: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    ODSetRepK1: TFloatField;
    ODSetRepK2: TFloatField;
    ODSetRepK3: TFloatField;
    ODSetRepK4: TFloatField;
    ODSetRepK5: TFloatField;
    ODSetRepK6: TFloatField;
    ODSetRepK7: TFloatField;
    ODSetRepK8: TFloatField;
    ODSetRepK9: TFloatField;
    ODSetRepD1: TFloatField;
    ODSetRepD2: TFloatField;
    ODSetRepD3: TFloatField;
    ODSetRepD4: TFloatField;
    ODSetRepD5: TFloatField;
    ODSetRepD6: TFloatField;
    ODSetRepD7: TFloatField;
    ODSetRepD8: TFloatField;
    ODSetRepD9: TFloatField;
    ODSetRepD10: TFloatField;
    ODSetRepD11: TFloatField;
    ODSetRepD12: TFloatField;
    ODSetRepD13: TFloatField;
    ODSetRepD14: TFloatField;
    ODSetRepD15: TFloatField;
    ODSetRepD16: TFloatField;
    ODSetRepD17: TFloatField;
    ODSetRepD18: TFloatField;
    ODSetRepD19: TFloatField;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText6: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText26: TQRDBText;
    ODSetRepD20: TFloatField;
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
