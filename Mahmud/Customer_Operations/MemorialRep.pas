unit MemorialRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TCO_MemorialRep = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabelTitle: TQRLabel;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRBand1: TQRBand;
    QRLV: TQRLabel;
    QRLM: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLD: TQRLabel;
    QRShape5: TQRShape;
    QRLK: TQRLabel;
    QRShape7: TQRShape;
    QRLMEB: TQRLabel;
    QRShape10: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLXV: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    c_val: TQRLabel;
    QRDBText7: TQRDBText;
    d_name: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  CO_MemorialRep: TCO_MemorialRep;

implementation

uses CO_Datamod_impl, SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TCO_MemorialRep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  c_val.caption := CO_DataMod.Account.fieldbyname('accval').asstring;
  d_name.caption := CO_DataMod.Account.fieldbyname('accname').asstring;

  SBTranslateProc.TranslateAllCompQuickRep(Self, sboapiDataModule.OrPack_SL);
end;

end.
