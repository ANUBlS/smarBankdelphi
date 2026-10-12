unit SymbolisticAnalysisImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, SymbolisticAnalysis_TLB, StdVcl, ExtCtrls, StdCtrls,
  ComCtrls, ImgList, ToolWin, CheckLst, Buttons;

type
  TFrmSymbolisticAnalysis = class(TActiveForm, IFrmSymbolisticAnalysis)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CLBNonExsists: TCheckListBox;
    GroupBox3: TGroupBox;
    CLBExsists: TCheckListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFrmSymbolisticAnalysisEvents;
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
    procedure FillSymbols(Target : TObject);
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, SADataModuleImpl;

{$R *.DFM}

{ TFrmSymbolisticAnalysis }

procedure TFrmSymbolisticAnalysis.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmSymbolisticAnalysisPage); }
end;

procedure TFrmSymbolisticAnalysis.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmSymbolisticAnalysisEvents;
end;

procedure TFrmSymbolisticAnalysis.Initialize;
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

function TFrmSymbolisticAnalysis.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmSymbolisticAnalysis.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmSymbolisticAnalysis.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmSymbolisticAnalysis.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmSymbolisticAnalysis.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmSymbolisticAnalysis.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmSymbolisticAnalysis.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmSymbolisticAnalysis.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmSymbolisticAnalysis.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmSymbolisticAnalysis.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmSymbolisticAnalysis.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmSymbolisticAnalysis.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmSymbolisticAnalysis.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmSymbolisticAnalysis.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmSymbolisticAnalysis.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmSymbolisticAnalysis.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmSymbolisticAnalysis.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmSymbolisticAnalysis.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmSymbolisticAnalysis._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmSymbolisticAnalysis.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmSymbolisticAnalysis.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmSymbolisticAnalysis.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmSymbolisticAnalysis.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmSymbolisticAnalysis.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmSymbolisticAnalysis.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmSymbolisticAnalysis.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmSymbolisticAnalysis.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmSymbolisticAnalysis.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmSymbolisticAnalysis.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmSymbolisticAnalysis.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmSymbolisticAnalysis.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFrmSymbolisticAnalysis.FillSymbols(Target : TObject);
begin
  with Target as TCheckListBox , SADataModule.AccountFlags do
  begin
    First;
    while not EOF do
    begin
      Items.Add(FieldByName('SYMBOL').AsString + ' - ' + FieldByName('DESCRIPTION').AsString);
      Next;
    end;
  end;
end;

procedure TFrmSymbolisticAnalysis.ToolButton1Click(Sender: TObject);
begin
  FillSymbols(CLBExsists);
  FillSymbols(CLBNonExsists);
end;

procedure TFrmSymbolisticAnalysis.ActiveFormCreate(Sender: TObject);
begin
   SADataModule := TSADataModule.Create(Self);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmSymbolisticAnalysis,
    Class_FrmSymbolisticAnalysis,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
