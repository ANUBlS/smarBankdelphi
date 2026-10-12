unit ReserveHistoryUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExcelExporter,Oracle,OracleData;

type
  TFrmHistory = class(TForm)
    GroupBox1: TGroupBox;
    BtnExport: TButton;
    DTPTargetDate: TDateTimePicker;
    HistoryExporter: TExcelExporter;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistory: TFrmHistory;

implementation

uses UntDataModule ,StoredProgramsUnit;

{$R *.DFM}

procedure TFrmHistory.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27 then
  Close;
end;

procedure TFrmHistory.BtnExportClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    with  HistoryExporter , TOracleDataSet(ExportSource.DataSet) do
    begin
      if Active then CloseAll;
      SetVariable('HDate',Integer(Trunc(DTPTargetDate.DateTime)));
      Open;
      Report;
    end;
  finally
    Screen.Cursor := crDefault ;
    Close;
  end;
end;

procedure TFrmHistory.FormCreate(Sender: TObject);
begin
  DTPTargetDate.DateTime := GetBankDate;
end;

end.
