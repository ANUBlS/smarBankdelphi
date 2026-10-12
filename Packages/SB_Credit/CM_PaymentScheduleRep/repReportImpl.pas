unit repReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TReportForm = class(TForm)
    QrpfrmRep: TQuickRep;
    QRBand2: TQRBand;
    SeqNo: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    CustomerName: TQRDBText;
    QRDBText1: TQRDBText;
    CustAccno: TQRDBText;
    Loanaccno: TQRDBText;
    Creditamount: TQRDBText;
    Period: TQRDBText;
    Creditdate: TQRDBText;
    MonthPayment: TQRDBText;
    FullIntPayment: TQRLabel;
    QRDBImage2: TQRDBImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    Facticalintforrest: TQRLabel;
    ANNUALYINTERESTRATE: TQRLabel;
  private
  public
    { Public declarations }
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.DFM}
uses repScheduleDataModuleImpl;


end.
