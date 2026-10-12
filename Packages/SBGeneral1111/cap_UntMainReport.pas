unit cap_UntMainReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRMainReport_cap = class(TQuickRep)
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape100: TQRShape;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRShape104: TQRShape;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRAmmountW1: TQRLabel;
    QRShape15: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRNum1: TQRLabel;
    QRDate: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRAmmountW11: TQRLabel;
    QRShape21: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRNum2: TQRLabel;
    QRDate1: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape22: TQRShape;
    QRAmmount1: TQRLabel;
    QRAmmount11: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape3: TQRShape;
    QRShape23: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape24: TQRShape;
    QRLabel64: TQRLabel;
    QRShape25: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRNo: TQRLabel;
    QRDName: TQRLabel;
    QRDBCOD: TQRLabel;
    QRDBINN: TQRLabel;
    QRDBCORACC: TQRLabel;
    QRDBSWIFT: TQRLabel;
    QRKBNAME: TQRLabel;
    QRKBCOD: TQRLabel;
    QRKBINN: TQRLabel;
    QRKBCORACC: TQRLabel;
    QRKBSWIFT: TQRLabel;
    QRMOD_BANK: TQRLabel;
    QRDACCNAME: TQRLabel;
    QRDACC_NO: TQRLabel;
    QRDBACCINN1: TQRLabel;
    QRKACCNAME: TQRLabel;
    QRKACC_NO: TQRLabel;
    QRKACCINN: TQRLabel;
    QRASSIGNMENT: TQRLabel;
    QREXTRA: TQRLabel;
    QRBUDGETCLASS: TQRLabel;
    QRBUDGETLEVEL: TQRLabel;
    QRDACCNAME1: TQRLabel;
    QRDACC_NO1: TQRLabel;
    QRDBACCINN11: TQRLabel;
    QRKACCNAME1: TQRLabel;
    QRKACC_NO1: TQRLabel;
    QRKACCINN1: TQRLabel;
    QRASSIGNMENT1: TQRLabel;
    QREXTRA1: TQRLabel;
    QRBUDGETCLASS1: TQRLabel;
    QRBUDGETLEVEL1: TQRLabel;
    QRNo1: TQRLabel;
    QRDName1: TQRLabel;
    QRDBCOD1: TQRLabel;
    QRDBINN1: TQRLabel;
    QRDBCORACC1: TQRLabel;
    QRDBSWIFT1: TQRLabel;
    QRKBNAME1: TQRLabel;
    QRKBCOD1: TQRLabel;
    QRKBINN1: TQRLabel;
    QRKBCORACC1: TQRLabel;
    QRKBSWIFT1: TQRLabel;
    QRMOD_BANK1: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRMainReport_cap: TQRMainReport_cap;

implementation

uses {PaymentDataModul,}sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TQRMainReport_cap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
