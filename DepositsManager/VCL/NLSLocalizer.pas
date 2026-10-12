// ******************************
// Author : Asif N. Nazarov
// Date : 19 March 2003
// ******************************

unit NLSLocalizer;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Graphics, Controls;

type
  TNLSLocalizer = class(TComponent)
  private
    FCaption : String;
    FFont : TFont;
    FOwnerForm : TCustomForm;
    FSaveWndProc : TWndMethod;
  protected
    procedure NLSLocalize(Sender : TObject);
    procedure ClearOwnerCaption;
    procedure GetOwnerFormCaption;
    procedure SetFont(Value : TFont);
    procedure ActivateProc(var Message : TMessage);
    procedure DoActivate(Target : TWinControl);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property Caption : String read FCaption write FCaption;
    property Font : TFont read FFont write SetFont;
  end;

procedure Register;

implementation

constructor TNLSLocalizer.Create;
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  
  if Owner is TCustomForm then
  FOwnerForm := (Owner as TCustomForm);

  if (([csDesigning] * ComponentState) = []) and (FCaption = '') then
  GetOwnerFormCaption;
  
  if ( [csDesigning] * ComponentState ) = [] then
  DoActivate(FOwnerForm);
end;

destructor TNLSLocalizer.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TNLSLocalizer.ClearOwnerCaption;
begin
  if Owner is TCustomForm then
  if ( [csDesigning] * ComponentState ) = [] then
  (FOwnerForm as TCustomForm).Caption := '';
end;

procedure TNLSLocalizer.GetOwnerFormCaption;
begin
  FCaption := (FOwnerForm as TCustomForm).Caption;
end;

procedure TNLSLocalizer.SetFont(Value : TFont);
begin
  FFont.Assign(Value);
end;

procedure TNLSLocalizer.NLSLocalize(Sender : TObject);
var
    ACanvas: HDC;
    intLeftShift, intTopShift: Integer;
    PCaption : PChar;
begin
  GetMem(PCaption,Length(Caption)+1);
  PCaption := StrPCopy(PCaption,Caption);
  ACanvas := GetWindowDC(FOwnerForm.Handle);
  ClearOwnerCaption;
  try
      SetBkMode(ACanvas,Transparent);
      SetTextColor(ACanvas,clWhite);
      SelectObject(ACanvas, Font.Handle);
      intLeftShift := GetSystemMetrics(SM_CYMENU) + GetSystemMetrics(SM_CXBORDER) + 3;
      intTopShift := (GetSystemMetrics(SM_CYCAPTION) - Abs(Font.Height)) div 2 + 2;
      TextOut(ACanvas,intLeftShift, intTopShift, PCaption , StrLen(PCaption));
  finally
    DeleteObject(ACanvas);
    FreeMem(PCaption);
  end;
end;


procedure TNLSLocalizer.ActivateProc(var Message : TMessage);
begin
  if Assigned(FSaveWndProc) then
     FSaveWndProc(Message);
  if (Message.Msg in [WM_NCPAINT,WM_NCACTIVATE])  then
     NLSLocalize(Owner as TCustomForm);
end;

procedure TNLSLocalizer.DoActivate(Target : TWinControl);
begin
  FSaveWndProc:=Target.WindowProc;
  Target.WindowProc :=ActivateProc;
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TNLSLocalizer]);
end;

end.
