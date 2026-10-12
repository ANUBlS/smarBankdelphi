unit OrderReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TOrderRpt = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLContractNum: TQRLabel;
    QRLDate: TQRLabel;
    QRBand1: TQRBand;
    QRChildBand1: TQRChildBand;
    QRMemo: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Chef: TQRLabel;
    CreditChef: TQRLabel;
    Manager: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  OrderRpt: TOrderRpt;

implementation

uses OrderDataModuleUnit, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TOrderRpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self, sboapiDataModule.OrPack_SL);
end;

end.
