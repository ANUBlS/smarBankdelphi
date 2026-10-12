unit PrReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, CMExcelExport;

type
  TFormReport = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    CMExcelReport: TCMExcelExport;
    Panel3: TPanel;
    RadioGroupHesabat: TRadioGroup;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReport: TFormReport;
  pdat:TDateTime;
  edat:TDateTime;
implementation
uses PrCmDMImpl;
{$R *.dfm}

procedure TFormReport.Button1Click(Sender: TObject);
begin
  with CMExcelReport,PrCmDM do
  begin
    if RadioGroupHesabat.ItemIndex=0 then
    begin
      ReportDelays.close;
      ReportDelays.SetVariable('dat1',edat);
      ReportDelays.Open;
      Connect;
      ExportDataset(ReportDelays,'Gecikmələr',True);
      Disconnect;
    end
    else
      if RadioGroupHesabat.ItemIndex=1 then
      begin
        ReportInterval.close;
        ReportInterval.SetVariable('dat1',edat);
        ReportInterval.Open;
        if ReportInterval.RecordCount>0
        then
        begin
          Connect;
          ExportDataset(ReportInterval,'Gecikmə_Aralıqları',True);
          Disconnect;
        end
        else ShowMessage('Heç bir məlumat yoxdur');
       end;
    if RadioGroupHesabat.ItemIndex=2 then
    begin
      pdat:=trunc(DateTimePicker1.DateTime);
      edat:=trunc(DateTimePicker2.DateTime);
      PrPackage.CallProcedure('portfel_araliq_7',['begindat',pdat,'enddat',edat]);
      ODSDueDay7.Refresh;
      Connect;
      ExportDataset(ODSDueDay7,'Gecikmələrdə yerdəyişmə',True);
      Disconnect;
    end;
    if RadioGroupHesabat.ItemIndex=3 then
    begin
      pdat:=trunc(DateTimePicker1.DateTime);
      edat:=trunc(DateTimePicker2.DateTime);
      PrPackage.CallProcedure('portfel_araliq_7',['begindat',pdat,'enddat',edat]);
      ODSDueDay6.Refresh;
      Connect;
      ExportDataset(ODSDueDay6,'Gecikmələrdə yerdəyişmə cəm',True);
      Disconnect;
    end;
  end;
end;

procedure TFormReport.DateTimePicker1Change(Sender: TObject);
begin
  pdat:=trunc(DateTimePicker1.DateTime);
end;

procedure TFormReport.DateTimePicker2Change(Sender: TObject);
begin
  edat:=trunc(DateTimePicker2.DateTime);
end;

end.
