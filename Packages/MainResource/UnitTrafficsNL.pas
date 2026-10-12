unit UnitTrafficsNL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFormTrafficsNL = class(TForm)
    QuickRep: TQuickRep;
    QRBand2: TQRBand;
    QRDBTextAmortDate: TQRDBText;
    QRDBTextRemainder: TQRDBText;
    QRDBTextall_amort: TQRDBText;
    QRDBTextamort: TQRDBText;
    QRBand1: TQRBand;
    QRLabelWares_Name: TQRLabel;
    QRDBTextwares_name: TQRDBText;
    QRLabelFirst_Price: TQRLabel;
    QRDBTextFIRST_PRICE: TQRDBText;
    QRLabelAmort_Date: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabelPercent: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTrafficsNL: TFormTrafficsNL;

implementation
  uses UnitData,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TFormTrafficsNL.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(QuickRep,sboapiDataModule.OrPack_SL);
end;

end.
