unit ReportImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CMExcelExport;

type
  TReportFrm = class(TForm)
    RadioGrpCont: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    ExcelExport: TCMExcelExport;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportFrm: TReportFrm;

implementation

uses DMprop;

{$R *.dfm}

procedure TReportFrm.Button1Click(Sender: TObject);
begin
with DMproperties.ReportDataSet do begin
    if RadioGrpCont.ItemIndex=0 then
    begin
      Close;
      SQL[23]:='';
      SQL[23]:=' and a.status=0' ;
      Open;
    end;
    if RadioGrpCont.ItemIndex=1 then
    begin
      Close;
      SQL[23]:='';
      SQL[23]:=' and a.status=1' ;
      Open;
    end;
    if RadioGrpCont.ItemIndex=2 then
    begin
      Close;
      SQL[23]:='';
      Open;
    end;
end;

with ExcelExport do
   begin
//   DMproperties.ReportDataSet.open;
   if   DMproperties.ReportDataSet.RecordCount=0 then
   begin
     ShowMessage('Heç bir məlumat tapılmadı ');
     exit;
   end;

      Connect;
      ExportDataset(DMproperties.ReportDataSet,' əmlaklar barədə hesabat',True);
      Disconnect;
end;
end;

procedure TReportFrm.Button2Click(Sender: TObject);
begin
close
end;

procedure TReportFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.
