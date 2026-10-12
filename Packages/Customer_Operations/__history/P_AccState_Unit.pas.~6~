unit P_AccState_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExcelExporter, Db, OracleData, Grids, DBGrids, ComCtrls,
  StdCtrls, Buttons, ExtCtrls;

type
  TP_AccState = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    CloseButton: TButton;
    PageControl1: TPageControl;
    AccAmountSheet: TTabSheet;
    DBGridAccState: TDBGrid;
    AccTurnoverSheet: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    AccState: TDataSource;
    AccStateData: TOracleDataSet;
    AccStateDataACCID: TFloatField;
    AccStateDataAMOUNT: TFloatField;
    AccStateDataLAMOUNT: TFloatField;
    AccStateDataDEBITTURNOVER: TFloatField;
    AccStateDataDEBITLTURNOVER: TFloatField;
    AccStateDataCREDITTURNOVER: TFloatField;
    AccStateDataCREDITLTURNOVER: TFloatField;
    AccStateDataARCHIVEDATE: TDateTimeField;
    AccStateExporter: TExcelExporter;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMNCACTIVATE(var message: TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
  end;

var
  P_AccState: TP_AccState;
  AccountNumber: String;
  PriorAccountID, AccountID: Longint;

implementation

uses sboapiDataModuleImpl, CO_datamod_impl, SBTranslateProc;

{$R *.DFM}

procedure TP_AccState.WMNCACTIVATE(var message: TWMNCActivate);
var
  S: TWMNCPaint;
begin
  inherited;
  WMNCPaint(S);
end;

procedure TP_AccState.WMNCPaint(var message: TWMNCPaint);
const
  Capt = 'Hesabın qalıqları';
var
  dc: hDc;
begin
  inherited;
  Caption := '';
  dc := GetWindowDC(Handle);
  SetBkMode(dc, Transparent);
  SetTextColor(dc, clWhite);
  SelectObject(dc, Font.Handle);
  TextOut(dc, 23, 6, Capt, Length(Capt));
end;

procedure TP_AccState.SpeedButton1Click(Sender: TObject);
begin
  with AccStateExporter do
    if ExportSource.DataSet.Active and
      (ExportSource.DataSet.RecordCount > 0) then
    begin
      ExportSource.DataSet.Last;
      ExportSource.DataSet.First;
      Report;
    end;
end;

procedure TP_AccState.FormActivate(Sender: TObject);
begin

  with CO_Datamod.Account do
  begin
    Open;
    AccountID := FieldByName('ID').AsInteger;
    AccountNumber := FieldByName('accno').AsString;
  end;

  if AccountID <> PriorAccountID then
    with AccStateData do
    begin
      CloseAll;
      SetVariable('AccID', AccountID);
      Open;
    end;

  PriorAccountID := AccountID;
end;

procedure TP_AccState.FormCreate(Sender: TObject);
begin
  PriorAccountID := -1;

  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TP_AccState.CloseButtonClick(Sender: TObject);
begin
  close;
end;

end.
