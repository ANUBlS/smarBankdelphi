unit CrfrmReportTypeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ExtCtrls, Buttons, CMExcelExport;

type
  TfrmReportType = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    RGReport: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ExcelExport: TCMExcelExport;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure exportreport;
    procedure exportexel;
    function CalcFullIntpayment:Real;
  public
    { Public declarations }
  end;

var
  frmReportType: TfrmReportType;

implementation

{$R *.DFM}

uses CrReportImpl,CrScheduleMainFormImpl, crScheduleDataModuleImpl,crCommonDecls;

function TfrmReportType.CalcFullIntpayment:Real;
begin
   result := 0;
   with CrScheduleDataModule,ScheduleData do
   begin
      First;
      while not EOF do
      begin
       result := result+ FieldByName('INTEREST').AsFloat;
       Next;
      end;
   end;
end;

procedure TfrmReportType.exportreport;
var factint :real;
  s :string[5];

begin

    with CrScheduleDataModule,CreditInfo do  begin
          factint := (CalcFullIntpayment/FieldByName('CREDITLINEAMOUNT').AsFloat)*100;
           s := FloatToStr(FieldByName('ANNUALYINTERESTRATE').AsFloat);
   end;

    with ReportForm do
    begin

         ANNUALYINTERESTRATE.Caption := s+'%';
         FullIntPayment.Caption := FloatToStr(CalcFullIntpayment);
         s := Floattostr(factint);
         Facticalintforrest.Caption :=  s+'%';
         QrpfrmRep.Preview;
    end;

end;

procedure TfrmReportType.exportexel;
begin
   with CrScheduleDataModule,ExportData do begin
   if Active then close;
   setvariable('Creditid',Get_SelectedCrdID);
   open;
   with ExcelExport do
   begin
   connect;
   ExportDataset(ExportData,'Юдямя планы',true);
   Disconnect;
   end;
   end;
end;


procedure TfrmReportType.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmReportType.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close
end;

procedure TfrmReportType.BitBtn1Click(Sender: TObject);
begin
   close
end;

procedure TfrmReportType.BitBtn2Click(Sender: TObject);
begin
   with RGReport do
    case ItemIndex of
         0:exportreport;
         1:exportexel;
     end;     
end;

end.
