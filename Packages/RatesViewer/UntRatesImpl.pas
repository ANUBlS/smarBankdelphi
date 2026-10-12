unit UntRatesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, RatesViewer_TLB, StdVcl, ExtCtrls, StdCtrls, Grids,
  DBGrids, Db, OracleData;

type
  TFrmRates = class(TActiveForm, IFrmRates)
    Panel1: TPanel;
    FilterPanel: TGroupBox;
    DBGrid1: TDBGrid;
    DataSrcRates: TDataSource;
    RatesDataSet: TOracleDataSet;
    procedure ActiveFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FEvents: IFrmRatesEvents;
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

uses ComObj, ComServ;

{$R *.DFM}

{ TFrmRates }

procedure TFrmRates.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmRatesPage); }
end;

procedure TFrmRates.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmRatesEvents;
end;

procedure TFrmRates.Initialize;
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

function TFrmRates.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmRates.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmRates.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmRates.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmRates.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmRates.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmRates.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmRates.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmRates.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmRates.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmRates.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmRates.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmRates.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmRates.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmRates.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmRates.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmRates.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmRates.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmRates._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmRates.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmRates.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmRates.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmRates.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmRates.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmRates.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmRates.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmRates.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmRates.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmRates.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmRates.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmRates.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmRates.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmRates.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmRates.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmRates.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmRates.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmRates.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmRates.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmRates.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmRates.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmRates.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmRates.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmRates.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFrmRates.ActiveFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if  (ssCtrl in Shift) and ((Key = Ord('F')) or (Key = Ord('f'))) then
      FilterPanel.Visible :=not FilterPanel.Visible  
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmRates,
    Class_FrmRates,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
