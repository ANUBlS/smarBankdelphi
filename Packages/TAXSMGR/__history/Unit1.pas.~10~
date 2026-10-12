unit Unit1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls,dialogs, Forms, Quickrpt, QRCtrls, DB, OracleData;

type
  Trep = class(TQuickRep)
    DetailBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    AMOUNT: TQRLabel;
    AMNT_LET2: TQRLabel;
    ORDB_NAME: TQRLabel;
    ORDB_CODE: TQRLabel;
    ORDB_INN: TQRLabel;
    ORDB_ACC: TQRLabel;
    ORDB_BIC: TQRLabel;
    B_NAME: TQRLabel;
    BENB_CODE: TQRLabel;
    BENB_INN: TQRLabel;
    BENB_ACC: TQRLabel;
    BENB_BIC: TQRLabel;
    ORDC_NAME: TQRLabel;
    ORDC_ACC: TQRLabel;
    ORDC_INN: TQRLabel;
    BENC_NAME: TQRLabel;
    BENC_ACC: TQRLabel;
    BENC_INN: TQRLabel;
    iso: TQRLabel;
    POST: TQRLabel;
    tet: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape6: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ods_a: TOracleDataSet;
    ods_aCOLL_NUM: TWideStringField;
    ods_aBNAME: TWideStringField;
    ods_aCODE: TWideStringField;
    ods_aCOUNTS: TWideStringField;
    ods_aAMOUNT: TWideStringField;
    ods_aINSCOUNTID: TFloatField;
    ODS_tex: TOracleDataSet;
    ODS_texCOLL_NUM: TWideStringField;
    ODS_texCOLL_DATE: TDateTimeField;
    ODS_texAMMOUNT: TFloatField;
    ODS_texINN: TWideStringField;
    ODS_texACCNO: TWideStringField;
    ODS_texSYS_DATE: TDateTimeField;
    ODS_texAMOUNT_YAZI: TWideStringField;
    ODS_texDESCRPTION: TWideStringField;
    QRLabel30: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  rep: Trep;

implementation

uses  sboapiDataModuleImpl, SBTranslateProc,TaxsUnit;

{$R *.DFM}

procedure Trep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
