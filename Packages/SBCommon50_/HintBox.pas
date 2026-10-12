unit HintBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  THintStyle = (hsAlert, hsWarning, hsError, hsInformation, hsSuccess, hsNone, hsCustom);

const
  DefaultHintStyle = hsCustom;

type
  THintBox = class(TPanel)
  private
    FHintLabel: TLabel;
    FHintImage: TImage;
    FShape: TShape;
    FFont: TFont;
    FHintStyle: THintStyle;
    FTimeout: Integer;
    FHideTimer: TTimer;
    FBeepOnMessage: Boolean;
    FAfterShow: TNotifyEvent;
    FAfterHide: TNotifyEvent;
    FControl: TWinControl;
    procedure SetHintStyle(Value: THintStyle);
    procedure SetTimeout(Value: Integer);
    procedure OnHideTimer(Sender: TObject);
  protected
    procedure SetName(const Value: TComponentName); override;
    procedure VisibleChanging; override;
  public
    property HintLabel: TLabel read FHintLabel;
    property HintImage: TImage read FHintImage;
    constructor Create(AOwner: TComponent); override;
    procedure ShowMessage(const Message: String; ATimeout: Integer = 0);
  published
    property Font: TFont read FFont write FFont;
    property Brush;
    property HintStyle: THintStyle read FHintStyle write SetHintStyle default DefaultHintStyle;
    property Timeout: Integer read FTimeout write SetTimeout;
    property BeepOnMessage: Boolean read FBeepOnMessage write FBeepOnMessage;
    property AfterShow: TNotifyEvent read FAfterShow write FAfterShow;
    property AfterHide: TNotifyEvent read FAfterHide write FAfterHide;
    property Control: TWinControl read FControl write FControl;
  end;

implementation

{$R *.DCR}

const
  HintStyleBitmaps: array[THintStyle] of PChar = (
    'HINTSTYLE_ALERT',
    'HINTSTYLE_WARNING',
    'HINTSTYLE_ERROR',
    'HINTSTYLE_INFORMATION',
    'HINTSTYLE_SUCCESS',
    '', '' {not used}
  );

  DefaultTimeout = 4000;

constructor THintBox.Create(AOwner: TComponent);
begin
  inherited;

  Width := 150;
  Height := 18;
  Brush.Color := $00E0FEFC;
  BevelOuter := bvNone;
  AutoSize := True;

  FShape := TShape.Create(Self);
  with FShape do
  begin
    Parent := Self;
    Align := alClient;
    Brush.Assign(Self.Brush);
  end;

  FHintImage := TImage.Create(Self);
  with FHintImage do
  begin
    Parent := Self;
    Left := 1;
    Top := 1;
    Width := 16;
    Height := 16;
    Transparent := True;
  end;

  FHintLabel := TLabel.Create(Self);
  with FHintLabel do
  begin
    Parent := Self;
    Left := FHintImage.Width + 1;
    Top := 1;
    Transparent := True;
    AutoSize := True;
  end;

  FHideTimer := TTimer.Create(Self);
  with FHideTimer do
    OnTimer := OnHideTimer;

  HintStyle := DefaultHintStyle;
end;

procedure THintBox.SetName(const Value: TComponentName); 
begin
  inherited;
  FHintLabel.Caption := Name;
end;

procedure THintBox.SetHintStyle(Value: THintStyle);
var
  Handle: THandle;
begin
  FHintStyle := Value;
  if HintStyle in [hsNone, hsCustom] then
    with FHintImage.Picture.Bitmap do
    begin
      {do not know how to clear image}
    end
  else
  begin
    Handle := LoadBitmap(hInstance, HintStyleBitmaps[HintStyle]);
    if Handle = 0 then
      RaiseLastWin32Error;
    FHintImage.Picture.Bitmap.Handle := Handle;
  end;
end;

procedure THintBox.SetTimeout(Value: Integer);
begin
  if Value = 0 then
    Value := DefaultTimeout;
  FTimeout := Value;
  with FHideTimer do
    if Value <> -1 then
      begin
        Interval := Value;
        Enabled := True;
      end;
end;

procedure THintBox.OnHideTimer(Sender: TObject);
begin
  with Sender as TTimer do
    Enabled := False;
  Hide;
end;

procedure THintBox.ShowMessage(const Message: String; ATimeout: Integer = 0);
begin
  FHintLabel.Caption := Message;
  AutoSize := False;
  AutoSize := True;
  Realign;
  if FBeepOnMessage then
    Beep;
  if Assigned(Control) then
    Control.SetFocus;
  Show;
  Timeout := ATimeout;
end;

procedure THintBox.VisibleChanging;

  procedure CallEventHandler(Handler: TNotifyEvent);
  begin
    if Assigned(Handler) then
      Handler(Self);
  end;

begin
  if Visible then
    CallEventHandler(AfterHide)
  else
    CallEventHandler(AfterShow);
end;

end.
