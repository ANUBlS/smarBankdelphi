unit IcraReportImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, XDBGrids, Buttons, CMExcelExport;

type
  TIcraReportFrm = class(TForm)
    Panel1: TPanel;
    XDBGrid1: TXDBGrid;
    ExcelExport: TCMExcelExport;
    SpeedButton1: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IcraReportFrm: TIcraReportFrm;

implementation

{$R *.dfm}
uses FlReCalculationDataModuleImpl;
procedure TIcraReportFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TIcraReportFrm.SpeedButton1Click(Sender: TObject);
begin
with ExcelExport do
  begin
    Connect;
    ExportDataset(XDBGrid1.DataSource.DataSet,'Odenishler',True);
  end;
end;

end.
