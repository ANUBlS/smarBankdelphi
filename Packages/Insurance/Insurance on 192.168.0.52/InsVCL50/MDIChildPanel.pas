unit MDIChildPanel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons;

const
  WM_MDIPClose = WM_USER + 138;

type
  TMDIChildPanel = class(TPanel)
  private
    sbClose : TSpeedButton;
    FButtonCloseClick : TNotifyEvent;
    OwnerHandle : THandle;
    procedure ButtonCloseClick(Sender : TObject);
  protected
    { Protected declarations }
  public
    pClient : TPanel;
    pHeader : TPanel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnClose : TNotifyEvent read FButtonCloseClick write FButtonCloseClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TMDIChildPanel]);
end;


constructor TMDIChildPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OwnerHandle := (owner as TWinControl).Handle;
  Self.BevelInner := bvNone;
  Self.BevelOuter := bvRaised;
  Self.Width := 310;
  Self.Height := 280;

  pHeader := TPanel.Create(Self);
  with  pHeader do
  begin
    Parent := Self;
    Color := clNavy;
    Align := alTop;
    Height := 16;
  end;

  pClient := TPanel.Create(Self);
  with pClient do
  begin
    Parent := Self;
    Align := alClient;
    Caption := 'You will see';
    BevelInner := bvNone;
    BevelOuter := bvNone;
  end;

  sbClose := TSpeedButton.Create(Self);
  with sbClose do
  begin
    Parent := pHeader;
    Caption := 'X';
    Font.Name := 'Tahoma';
    Font.Style := [fsBold];
    Height := 14;
    Width := 16;
    Top := Self.Top + 2;
    Left := Self.Left + 168;
    Anchors := [akTop, akRight];
    Layout := blGlyphBottom;
    OnClick := ButtonCloseClick;
  end;

end;

procedure TMDIChildPanel.ButtonCloseClick(Sender : TObject);
begin
  if Assigned(FButtonCloseClick) then
       begin
        FButtonCloseClick(Self);
        SendMessage(OwnerHandle, WM_MDIPClose, Self.tag, 0);
       end;
end;


destructor TMDIChildPanel.Destroy;
begin
  sbClose.Free;

  pHeader.Free;

  pClient.Free;
  inherited Destroy;
end;

end.
