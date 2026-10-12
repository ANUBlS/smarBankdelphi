unit AccStatesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Db, OracleData,
  ExcelExporter;

type
  TAccStatesForm = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    CloseButton: TButton;
    AccAmountSheet: TTabSheet;
    AccTurnoverSheet: TTabSheet;
    DBGrid1: TDBGrid;
    AccStateData: TOracleDataSet;
    AccState: TDataSource;
    AccStateDataACCID: TFloatField;
    AccStateDataAMOUNT: TFloatField;
    AccStateDataLAMOUNT: TFloatField;
    AccStateDataDEBITTURNOVER: TFloatField;
    AccStateDataDEBITLTURNOVER: TFloatField;
    AccStateDataCREDITTURNOVER: TFloatField;
    AccStateDataCREDITLTURNOVER: TFloatField;
    AccStateDataARCHIVEDATE: TDateTimeField;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    AccStateExporter: TExcelExporter;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccStatesForm: TAccStatesForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl, AccountDataModuleImpl;

procedure TAccStatesForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAccStatesForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TAccStatesForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_F3 then
  with AccStateExporter do
  if
    ExportSource.DataSet.Active and
    (ExportSource.DataSet.RecordCount > 0) then
  Report
end;

end.
