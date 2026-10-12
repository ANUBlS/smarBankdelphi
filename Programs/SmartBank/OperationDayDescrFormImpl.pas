unit OperationDayDescrFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, sbAxSplash_TLB, StdVcl, StdCtrls, ExtCtrls, ImgList, SbPlgAx50_TLB;

type
  TOperationDayDescrForm = class(TActiveForm, IOperationDayDescrForm, IIconExporter)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    ImageList1: TImageList;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
  private
    { Private declarations }
    FEvents: IOperationDayDescrFormEvents;
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
    procedure Set_Visible(Value: WordBool); safecall;  function IOperationDayDescrForm.Get_Color = IOperationDayDescrForm_Get_Color;
    function IOperationDayDescrForm.Get_Font = IOperationDayDescrForm_Get_Font;
    procedure IOperationDayDescrForm._Set_Font = IOperationDayDescrForm__Set_Font;
    procedure IOperationDayDescrForm.Set_Color = IOperationDayDescrForm_Set_Color;
    procedure IOperationDayDescrForm.Set_Font = IOperationDayDescrForm_Set_Font;
  
    function IOperationDayDescrForm_Get_Color: OLE_COLOR; safecall;
    function IOperationDayDescrForm_Get_Font: IFontDisp; safecall;
    procedure IOperationDayDescrForm__Set_Font(var Value: IFontDisp); safecall;
    procedure IOperationDayDescrForm_Set_Color(Value: OLE_COLOR); safecall;
    procedure IOperationDayDescrForm_Set_Font(const Value: IFontDisp); safecall;
    {IIconExporter}
    function Get_Icon: OLE_HANDLE; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TOperationDayDescrForm }

procedure TOperationDayDescrForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_OperationDayDescrFormPage); }
end;

procedure TOperationDayDescrForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IOperationDayDescrFormEvents;
end;

procedure TOperationDayDescrForm.Initialize;
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

function TOperationDayDescrForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TOperationDayDescrForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TOperationDayDescrForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TOperationDayDescrForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TOperationDayDescrForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TOperationDayDescrForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TOperationDayDescrForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TOperationDayDescrForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TOperationDayDescrForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TOperationDayDescrForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TOperationDayDescrForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TOperationDayDescrForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TOperationDayDescrForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TOperationDayDescrForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TOperationDayDescrForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TOperationDayDescrForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TOperationDayDescrForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TOperationDayDescrForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TOperationDayDescrForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TOperationDayDescrForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TOperationDayDescrForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TOperationDayDescrForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TOperationDayDescrForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TOperationDayDescrForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TOperationDayDescrForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TOperationDayDescrForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TOperationDayDescrForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TOperationDayDescrForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TOperationDayDescrForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TOperationDayDescrForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TOperationDayDescrForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TOperationDayDescrForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TOperationDayDescrForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TOperationDayDescrForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TOperationDayDescrForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TOperationDayDescrForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TOperationDayDescrForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TOperationDayDescrForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TOperationDayDescrForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TOperationDayDescrForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TOperationDayDescrForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TOperationDayDescrForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TOperationDayDescrForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TOperationDayDescrForm.IOperationDayDescrForm_Get_Color: OLE_COLOR;
begin

end;

function TOperationDayDescrForm.IOperationDayDescrForm_Get_Font: IFontDisp;
begin

end;

procedure TOperationDayDescrForm.IOperationDayDescrForm__Set_Font(var Value: IFontDisp);

begin

end;

procedure TOperationDayDescrForm.IOperationDayDescrForm_Set_Color(Value: OLE_COLOR);
begin

end;

procedure TOperationDayDescrForm.IOperationDayDescrForm_Set_Font(const Value: IFontDisp);

begin

end;

function TOperationDayDescrForm.Get_Icon: OLE_HANDLE;
begin
  Icon.ReleaseHandle;
  ImageList1.GetIcon(0, Icon);
  Result := Icon.Handle;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TOperationDayDescrForm,
    Class_OperationDayDescrForm,
    2,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
