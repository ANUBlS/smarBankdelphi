unit frmReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmRep = class(TForm)
    QrpfrmRep: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    CustomerName: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    FacticalInt: TQRDBText;
    MonthPayment: TQRDBText;
    Creditdate: TQRDBText;
    AnnInt: TQRDBText;
    Period: TQRDBText;
    Creditamount: TQRDBText;
    Loanaccno: TQRDBText;
    CustAccno: TQRDBText;
    QRDBImage2: TQRDBImage;
    QRGroup1: TQRGroup;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    SeqNo: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    FullIntPayment: TQRLabel;
    procedure QrpfrmRepPreview(Sender: TObject);
  private
    function CalcFullIntPayment:real;
  public
    { Public declarations }
  end;

var
  frmRep: TfrmRep;

implementation

{$R *.DFM}

uses ScheduleDataModuleImpl;

function TfrmRep.CalcFullIntPayment:real;
begin
   result := 0;

   with ScheduleDataModule,ScheduleData do
   begin
      First;
      while not EOF do
      begin
         Result := Result + FieldbyName('INTEREST').AsFloat;
         next;
      end;
   end;
end;

procedure TfrmRep.QrpfrmRepPreview(Sender: TObject);
begin
//   FullIntPayment.Caption := FloatToStr(CalcFullIntPayment)
end;

end.
