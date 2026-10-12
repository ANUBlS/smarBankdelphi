unit AdministrationUserAdvGranReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TrptAdvgrant = class(TQuickRep)
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
  private

  public

  end;

var
  rptAdvgrant: TrptAdvgrant;

implementation

uses AdministrationDataModule;

{$R *.DFM}

end.
