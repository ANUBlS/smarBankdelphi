unit SBCMSplashFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, sbAxSplash_TLB, StdVcl, StdCtrls, ExtCtrls, ImgList, SBPlgAx50_TLB;

type
  TSBCMSplashForm = class(TActiveForm, ISBCMSplashForm, IIconExporter)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label8: TLabel;
    ImageList1: TImageList;
  private
    { Private declarations }
    FEvents: ISBCMSplashFormEvents;
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
    procedure Set_Visible(Value: WordBool); safecall;  function ISBCMSplashForm.Get_Color = ISBCMSplashForm_Get_Color;
    function ISBCMSplashForm.Get_Font = ISBCMSplashForm_Get_Font;
    procedure ISBCMSplashForm._Set_Font = ISBCMSplashForm__Set_Font;
    procedure ISBCMSplashForm.Set_Color = ISBCMSplashForm_Set_Color;
    procedure ISBCMSplashForm.Set_Font = ISBCMSplashForm_Set_Font;
  
    function ISBCMSplashForm_Get_Color: OLE_COLOR; safecall;
    function ISBCMSplashForm_Get_Font: IFontDisp; safecall;
    procedure ISBCMSplashForm__Set_Font(var Value: IFontDisp); safecall;
    procedure ISBCMSplashForm_Set_Color(Value: OLE_COLOR); safecall;
    procedure ISBCMSplashForm_Set_Font(const Value: IFontDisp); safecall;
    {IIconExporter}
    function Get_Icon: OLE_HANDLE; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TSBCMSplashForm }

procedure TSBCMSplashForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SBCMSplashFormPage); }
end;

procedure TSBCMSplashForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISBCMSplashFormEvents;
end;

procedure TSBCMSplashForm.Initialize;
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

function TSBCMSplashForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSBCMSplashForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSBCMSplashForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSBCMSplashForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSBCMSplashForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSBCMSplashForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSBCMSplashForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSBCMSplashForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSBCMSplashForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSBCMSplashForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSBCMSplashForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSBCMSplashForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSBCMSplashForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSBCMSplashForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSBCMSplashForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSBCMSplashForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSBCMSplashForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSBCMSplashForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSBCMSplashForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBCMSplashForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSBCMSplashForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSBCMSplashForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSBCMSplashForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSBCMSplashForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSBCMSplashForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSBCMSplashForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSBCMSplashForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSBCMSplashForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSBCMSplashForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSBCMSplashForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSBCMSplashForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSBCMSplashForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSBCMSplashForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSBCMSplashForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSBCMSplashForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSBCMSplashForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSBCMSplashForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBCMSplashForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSBCMSplashForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSBCMSplashForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSBCMSplashForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSBCMSplashForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSBCMSplashForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TSBCMSplashForm.ISBCMSplashForm_Get_Color: OLE_COLOR;
begin

end;

function TSBCMSplashForm.ISBCMSplashForm_Get_Font: IFontDisp;
begin

end;

procedure TSBCMSplashForm.ISBCMSplashForm__Set_Font(var Value: IFontDisp);
begin

end;

procedure TSBCMSplashForm.ISBCMSplashForm_Set_Color(Value: OLE_COLOR);
begin

end;

procedure TSBCMSplashForm.ISBCMSplashForm_Set_Font(const Value: IFontDisp);
begin

end;

function TSBCMSplashForm.Get_Icon: OLE_HANDLE;
begin
  Icon.ReleaseHandle;
  ImageList1.GetIcon(0, Icon);
  Result := Icon.Handle;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSBCMSplashForm,
    Class_SBCMSplashForm,
    4,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
