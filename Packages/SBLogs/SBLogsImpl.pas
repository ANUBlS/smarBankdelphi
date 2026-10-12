unit SBLogsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, SBLogsX_TLB, StdVcl, DBCtrls, Grids, DBGrids, ExtCtrls,
  ActnList, ToolWin, ComCtrls, CMExcelExport;

type
  TSBLogs = class(TActiveForm, ISBLogs)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    CoolBar1: TCoolBar;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ExcelExport: TCMExcelExport;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: ISBLogsEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, About1, DMImpl;

{$R *.DFM}

{ TSBLogs }

procedure TSBLogs.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SBLogsPage); }
end;

procedure TSBLogs.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISBLogsEvents;
end;

procedure TSBLogs.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TSBLogs.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSBLogs.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSBLogs.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSBLogs.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSBLogs.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSBLogs.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSBLogs.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSBLogs.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSBLogs.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSBLogs.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSBLogs.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSBLogs.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSBLogs.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSBLogs.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSBLogs.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSBLogs.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSBLogs.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSBLogs.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSBLogs._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBLogs.AboutBox;
begin
  ShowSBLogsAbout;
end;

procedure TSBLogs.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSBLogs.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSBLogs.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSBLogs.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSBLogs.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSBLogs.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSBLogs.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSBLogs.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSBLogs.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSBLogs.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSBLogs.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSBLogs.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSBLogs.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSBLogs.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSBLogs.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSBLogs.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSBLogs.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSBLogs.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBLogs.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSBLogs.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSBLogs.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSBLogs.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSBLogs.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSBLogs.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TSBLogs.DBLookupComboBox1CloseUp(Sender: TObject);
const
  logStr = 'select %s from sbav_logs_%s ';
begin
  with DataModuleLogs do begin
    odsLogQ.Close;
    odsLogQ.SQL.Text := Format(logStr, [odsTablesQueryst.AsString, odsTablesName.AsString]);
    odsLogQ.Open;
  end;
end;

procedure TSBLogs.ActiveFormCreate(Sender: TObject);
begin
  DataModuleLogs := TDataModuleLogs.Create(Self);
end;

procedure TSBLogs.DBGrid2CellClick(Column: TColumn);
begin
  DBLookupComboBox1CloseUp(Self);
end;

procedure TSBLogs.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  Column.Title.Color := clNavy;
  Column.Title.Font.Color := clWhite;
end;

procedure TSBLogs.ToolButton1Click(Sender: TObject);
begin
  with DataModuleLogs do
    odsTables.Refresh;
end;

procedure TSBLogs.ToolButton2Click(Sender: TObject);
begin
  with DataModuleLogs, odsLogQ do begin
    close;
    sql.Add('where to_date(tim) between '''+formatdatetime('dd-mmm-yyyy',dt1.date)+''' and '''+formatdatetime('dd-mmm-yyyy',dt2.date)+'''');
    open;
    sql.Delete(1);
  end;
end;

procedure TSBLogs.ToolButton5Click(Sender: TObject);
var
  i: integer;
begin
with DataModuleLogs, odsLogQ do begin
  First;
  for i := 0 to RecordCount-1 do begin
    SB_ADM.CallProcedure('logs_del',[Fields[0].AsVariant]);
    Next;
  end;
  Refresh;
end;
end;

procedure TSBLogs.ToolButton7Click(Sender: TObject);
begin
with ExcelExport do begin
  Connect;
  ExportDataset(DBGrid1.DataSource.DataSet,'Sheet', True);
end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSBLogs,
    Class_SBLogs,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
