unit frmReportTypeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, Buttons, CMExcelExport;

type
  TfrmReportType = class(TForm)
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

uses ReportImpl,ReportBKFormUnit,ScheduleMainFormImpl, ScheduleDataModuleImpl,CommonDecls;


function TfrmReportType.CalcFullIntpayment:Real;
begin
   result := 0;
   with ScheduleDataModule,ScheduleData do
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
  num:string;
  dat:TDateTime;

begin
   with ScheduleDataModule,CreditInfo do  begin
        //  factint := (CalcFullIntpayment/FieldByName('CREDITLINEAMOUNT').AsFloat)*100;
           s := FloatToStr(FieldByName('ANNUALYINTERESTRATE').AsFloat);
           num:=FieldByName('numberofcredit').AsString;
           dat:=  FieldByName('DATEOFCONCLUSION').AsDateTime;
   end;

    with ReportBKForm,ReportForm do
    begin


    with ScheduleDataModule,ScheduleData_report do
    begin
      ClearVariables;
     SetVariable('CreditID',Get_SelectedCrdID);

      Open ;

    end;



  with ScheduleDataModule.BankInfo do
           begin
             close;
      SetVariable('v_KOD_FIL', ScheduleDataModule.CreditInfo.FieldByName('BranchID').AsInteger);
             open;
           end;



         QRLabel22.Caption:=datetostr(dat);
         QRLabel23.Caption:=num+'  saylı lizinq müqaviləsinə Əlavə №C';
         QRLabel27.Caption:=datetostr(dat)+'-cü il tarixli ' ;
        // FullIntPayment.Caption := FloatToStr(CalcFullIntpayment);
        // s := Floattostr(factint); }
//         Facticalintforrest.Caption :=  s+'%';


      with ScheduleDataModule do
      begin
      if CreditInfoILINODENISH.AsFloat>0then
         QrpfrmRep.Preview
          else
         QrpfrmRepBK.Preview;
      end;

    end;

end;

procedure TfrmReportType.exportexel;
begin
   with ScheduleDataModule,ScheduleData_report{ExportData} do begin
   if Active then close;
   setvariable('Creditid',Get_SelectedCrdID);
   open;
   with ExcelExport do
   begin
   connect;
   ExportDataset(ScheduleData_report,'Ödəmə planı',true,false);
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
