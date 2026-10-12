unit SbdmReportUnit;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CMExcelExport;

type
  TFormReport = class(TForm)
    RGReport: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Exportdata: TCMExcelExport;
    procedure BitBtn2Click(Sender: TObject);
  private
//    procedure exportreport;
    procedure exportexel;
  public
     depositid:integer;
    { Public declarations }
  end;

var
  FormReport: TFormReport;

implementation

uses SbdmScheduleDataModuleImpl;

{$R *.dfm}

procedure TFormReport.BitBtn2Click(Sender: TObject);
begin
  with RGReport
  do
   case ItemIndex of
   // 0:exportreport;
   0,1:exportexel;
   end;
  end;

procedure TFormReport.exportexel;
begin
  with SbdmScheduleDataModule,OracleDataSet2 do begin
   if Active then close;
   setvariable('id',depositid);
   open;
   with Exportdata do
   begin
   connect;
   ExportDataset(OracleDataSet2,'Ödəmə planı',true,false);
   Disconnect;
   end;
   end;
end;



end.
