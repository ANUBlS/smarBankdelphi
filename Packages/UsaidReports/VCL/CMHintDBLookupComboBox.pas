unit CMHintDBLookupComboBox;

interface
uses
  Windows, Messages, Classes, Graphics, Controls, Forms, StdCtrls ,DBCtrls;

type
  TListBoxTip = class(THintWindow)
  end;

  TShowComboToolTipEvent = procedure (Sender : TObject;
                                     const ToolTipText : String;
                                     var HideToolTip : Boolean) of object;

  TCMHintDBLookupComboBox = class(TDBLookupComboBox)
  private
    FListBoxTip : TListBoxTip;
    FListHandle : HWND;
    FListWndProcInstance : TFarProc;
    FOldListWndProc : TFarProc;
    FOnListMouseMove: TMouseMoveEvent;
    FOnShowComboToolTip: TShowComboToolTipEvent;
    FShowToolTips: Boolean;
    FHorizontalExtent: Integer;
    procedure ListWndProc (var Message : TMessage);
    function ListBoxItemAtPos (I : Integer) : String;
    function ListBoxItemRectAtPos (I : Integer; AText : String) : TRect;
    procedure SetShowToolTips(const Value: Boolean);
    procedure SetHorizontalExtent(const Value: Integer);
  protected
    procedure DoListMouseMove (Shift: TShiftState; X, Y: Integer); dynamic;
    procedure DoShowComboToolTip (const ToolTipText : String;
                                 var HideToolTip : Boolean); dynamic;
    procedure WndProc (var Message: TMessage); override;
    procedure CreateParams (var Params : TCreateParams); override;
    procedure CreateWnd; override;
  public
    constructor Create (AOwner : TComponent); override;
    destructor Destroy; override;
    property HSListHandle : HWND read FListHandle;
    property ShowToolTips : Boolean read FShowToolTips
                         write SetShowToolTips default true;
    property OnListMouseMove : TMouseMoveEvent read FOnListMouseMove
        write FOnListMouseMove;
    property OnShowComboToolTip : TShowComboToolTipEvent
        read FOnShowComboToolTip write FOnShowComboToolTip;
    property HorizontalExtent : Integer read FHorizontalExtent
       write SetHorizontalExtent default -1;
  published

  end;

procedure Register;

implementation

uses SysUtils;

function RectWidth(R : TRect) : Integer;
begin
  Result := R.Right - R.Left;
end;

function RectHeight(R : TRect) : Integer;
begin
  Result := R.Bottom - R.Top;
end;

{ TCMHintDBLookupComboBox }

constructor TCMHintDBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FListBoxTip := TListBoxTip.Create(Self);
  FListBoxTip.Color := clInfoBk;
  FListWndProcInstance := MakeObjectInstance(ListWndProc);
  FShowToolTips := true;
  FHorizontalExtent := -1;
end;

destructor TCMHintDBLookupComboBox.Destroy;
begin
  if (FListHandle <> 0) AND IsWindow(FListHandle) then
    SetWindowLong(FListHandle, GWL_WNDPROC, LongInt(FOldListWndProc));
  FreeObjectInstance(FListWndProcInstance);
  inherited;
end;

procedure TCMHintDBLookupComboBox.DoShowComboToolTip(const ToolTipText: String;
                                             var HideToolTip : Boolean);
begin
  if Assigned(FOnShowComboToolTip) then
    FOnShowComboToolTip (Self, ToolTipText, HideToolTip);
end;

procedure TCMHintDBLookupComboBox.DoListMouseMove(Shift: TShiftState; X,
  Y: Integer);

  procedure AdjustHintRect (var R : TRect; const AHintStr : String);
  var
    DC : HDC;
    OldFont : HFONT;
    TextSize : SIZE;
  begin
    DC := GetDC (HWND_DESKTOP);
    try
      OldFont := SelectObject(DC, Screen.HintFont.Handle);
      try
        if (NOT GetTextExtentPoint32(DC, PChar(AHintStr), StrLen(PChar(AHintStr)), TextSize)) then
          RaiseLastWin32Error;
        Inc(TextSize.cx, 6);
        Inc(TextSize.cy, 2);
        if RectWidth(R) < TextSize.cx then
          R.Right := R.Left + TextSize.cx;
        if RectHeight(R) < TextSize.cy then
          R.Bottom := R.Top + TextSize.cy;
      finally
        SelectObject(DC, OldFont);
      end;
    finally
      ReleaseDC (HWND_DESKTOP, DC);
    end;
  end;

var R, ItemRect : TRect;
    I : Integer;
    ItemText : String;
    HideToolTip : Boolean;
begin

  FListBoxTip.Canvas.Font.Name := Canvas.Font.Name;

  HideToolTip := True;
  if FShowToolTips then begin
    Windows.GetClientRect(FListHandle, R);
    if PtInRect(R, Point(X,Y)) AND (Shift = []) then begin
      I := SendMessage(FListHandle, LB_ITEMFROMPOINT, 0, MakeLParam(X,Y));
      if HiWord(I) <> 0 then
        I := -1;
      if I <> -1 then begin
        ItemText := ListBoxItemAtPos(I);
        ItemRect := ListBoxItemRectAtPos(I, ItemText);
        if RectWidth(ItemRect) > RectWidth(R) then begin
          Windows.ClientToScreen(FListHandle, ItemRect.TopLeft);
          Windows.ClientToScreen(FListHandle, ItemRect.BottomRight);
          Dec(ItemRect.Left, 3);
          Inc(ItemRect.Right, 6);
          HideToolTip := false;
          DoShowComboToolTip (ItemText, HideToolTip);
          if NOT HideToolTip then
            if NOT (IsWindow(FListBoxTip.Handle) and
                    IsWindowVisible(FListBoxTip.Handle) and
                   (StrComp(PChar(FListBoxTip.Caption),PChar(ItemText)) = 0)) then begin
              AdjustHintRect (ItemRect, ItemText);
              FListBoxTip.ActivateHint(ItemRect, ItemText);
            end;
        end;
      end;
    end;
  end;
  if HideToolTip then
    FListBoxTip.ReleaseHandle;
  if Assigned(FOnListMouseMove) then
    FOnListMouseMove(Self, Shift, X, Y);
end;

function TCMHintDBLookupComboBox.ListBoxItemAtPos(I: Integer): String;
var
  L : Integer;
begin
  if I <> -1 then begin
    L := SendMessage(FListHandle, LB_GETTEXTLEN, I, 0);
    SetLength(Result, L+1);
    SendMessage(FListHandle, LB_GETTEXT, I, Integer(PChar(Result)));
  end else
    Result := '';
end;

function TCMHintDBLookupComboBox.ListBoxItemRectAtPos(I: Integer;
  AText: String): TRect;
var
  DC : HDC;
  OldFont : HFONT;
begin
  Result := Rect(0, 0, 0, 0);
  if (I <> -1) AND (SendMessage(FListHandle, LB_GETITEMRECT, I,
                    Integer(@Result)) <> LB_ERR) then begin
    DC := GetDC(FListHandle);
    try
      OldFont := SelectObject(DC, Font.Handle);
      try
        DrawText(DC, PChar(AText), -1, Result, DT_CALCRECT);
      finally
        SelectObject(DC, OldFont);
      end;
    finally
      ReleaseDC(FListHandle, DC);
    end;
  end;
end;

procedure TCMHintDBLookupComboBox.ListWndProc(var Message: TMessage);
begin
  case Message.Msg of
  WM_MOUSEMOVE:
    with TWMMouseMove(Message) do
      DoListMouseMove(KeysToShiftState(Keys), XPos, YPos);
  WM_SHOWWINDOW:
    if Message.WParam = 0 then
      FListBoxTip.ReleaseHandle();
  end;
  with Message do
    Result := CallWindowProc(FOldListWndProc, FListHandle, Msg, WParam, LParam);
end;

procedure TCMHintDBLookupComboBox.SetShowToolTips(const Value: Boolean);
begin
  FShowToolTips := Value;
end;

procedure TCMHintDBLookupComboBox.WndProc(var Message: TMessage);
begin
  if (Message.Msg = WM_CTLCOLORLISTBOX) AND (FListHandle = 0) then begin
    FListHandle := HWND(Message.LParam);
    FOldListWndProc := Pointer(GetWindowLong(FListHandle, GWL_WNDPROC));
    SetWindowLong(FListHandle,
                  GWL_WNDPROC, LongInt(FListWndProcInstance));
  end;
  inherited;
end;

procedure TCMHintDBLookupComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if FHorizontalExtent <> -1 then
    with Params do
      Style := Style OR WS_HSCROLL;
end;

procedure TCMHintDBLookupComboBox.SetHorizontalExtent(const Value: Integer);
begin
  if (FHorizontalExtent <> Value) then begin
    FHorizontalExtent := Value;
    if NOT (csLoading in ComponentState) then
      RecreateWnd();
  end;
end;

procedure TCMHintDBLookupComboBox.CreateWnd;
begin
  inherited;
  if FHorizontalExtent <> -1 then
    Perform(CB_SETHORIZONTALEXTENT, FHorizontalExtent, 0);
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TCMHintDBLookupComboBox])
end;

end.
