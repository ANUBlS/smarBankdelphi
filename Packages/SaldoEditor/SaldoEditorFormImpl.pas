unit SaldoEditorFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, SaldoEditor_TLB, StdVcl, StdCtrls, Grids, DBGrids,
  ComCtrls, ExtCtrls, DBCtrls, ToolWin, Db, OracleData;

type
  TSaldoEditorForm = class(TActiveForm, ISaldoEditorForm)
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Accs: TOracleDataSet;
    AccsSource: TDataSource;
    AccsACCOUNTNO: TStringField;
    AccsCURRENCYSNAME: TStringField;
    AccsACCOUNTNAME: TStringField;
    AccsLASTOPERATIONDATE: TDateTimeField;
    AccsAMOUNT: TFloatField;
    AccsLAMOUNT: TFloatField;
    AccsDEBITTURNOVER: TFloatField;
    AccsDEBITLTURNOVER: TFloatField;
    AccsCREDITTURNOVER: TFloatField;
    AccsCREDITLTURNOVER: TFloatField;
    Panel1: TPanel;
    AccountNoSearchEdit: TEdit;
    procedure AccountNoSearchEditChange(Sender: TObject);
  private
    { Private declarations }
    FEvents: ISaldoEditorFormEvents;
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

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TSaldoEditorForm }

procedure TSaldoEditorForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SaldoEditorFormPage); }
end;

procedure TSaldoEditorForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISaldoEditorFormEvents;
end;

procedure TSaldoEditorForm.Initialize;
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

function TSaldoEditorForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSaldoEditorForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSaldoEditorForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSaldoEditorForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSaldoEditorForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSaldoEditorForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSaldoEditorForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSaldoEditorForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSaldoEditorForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSaldoEditorForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSaldoEditorForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSaldoEditorForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSaldoEditorForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSaldoEditorForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSaldoEditorForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSaldoEditorForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSaldoEditorForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSaldoEditorForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSaldoEditorForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSaldoEditorForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSaldoEditorForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSaldoEditorForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSaldoEditorForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSaldoEditorForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSaldoEditorForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSaldoEditorForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSaldoEditorForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSaldoEditorForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSaldoEditorForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSaldoEditorForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSaldoEditorForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSaldoEditorForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSaldoEditorForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSaldoEditorForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSaldoEditorForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSaldoEditorForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSaldoEditorForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSaldoEditorForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSaldoEditorForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSaldoEditorForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSaldoEditorForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSaldoEditorForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSaldoEditorForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TSaldoEditorForm.AccountNoSearchEditChange(Sender: TObject);
begin
  with Sender as TEdit do
    Accs.SearchRecord(Copy(Name, 1, Length(Name) - 10), Text, []);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSaldoEditorForm,
    Class_SaldoEditorForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
