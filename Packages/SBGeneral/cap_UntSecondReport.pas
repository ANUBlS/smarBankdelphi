unit cap_UntSecondReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRCommonReport_cap = class(TQuickRep)
    QRBand8: TQRBand;
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
    QRAmmountW: TQRLabel;
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
    QRDBText10: TQRDBText;
    QRNum: TQRLabel;
    QRDate: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape22: TQRShape;
    QRAmmount: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBank_name: TQRLabel;
    QRDBank_code: TQRLabel;
    QRDBank_inn: TQRLabel;
    QRDBank_CorAcc: TQRLabel;
    QRDBnk_SIWFT: TQRLabel;
    QRKBank_name: TQRLabel;
    QRKBank_code: TQRLabel;
    QRKBank_inn: TQRLabel;
    QRKBank_CorAcc: TQRLabel;
    QRKBnk_SIWFT: TQRLabel;
    QRMOD_BANK: TQRLabel;
    QRDBACCNAME: TQRLabel;
    QRDBACC_NO: TQRLabel;
    QRDBACCINN: TQRLabel;
    QRKBACCNAME: TQRLabel;
    QRKBACC_NO: TQRLabel;
    QRKBACCINN: TQRLabel;
    QRASSIGNMENT: TQRLabel;
    QREXTRA: TQRLabel;
    QRBUDGETCLASS: TQRLabel;
    QRBUDGETLEVEL: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRCommonReport_cap: TQRCommonReport_cap;

implementation

uses {PaymentDataModul,}sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TQRCommonReport_cap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.
