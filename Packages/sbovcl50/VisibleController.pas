unit VisibleController;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls;

type
  TVCButton = class(TButton)
  end;

  TVCPanel = class(TPanel)
  end;

  TVCPanelParams = record
    Top: Integer;
  end;

  TLineStyle = (lsNone, lsSingle, lsDouble);
  TVisibleController = class(TPanel)
  private
    FLineStyle: TLineStyle;
    FCloseButton: TVCButton;
    procedure SetLineStyle(Value: TLineStyle);
  protected
    procedure SetName(const Value: TComponentName); override;
    procedure HidePanel(Panel: TVCPanel); virtual;
//    procedure ShowPanel(Panel: TVCPanel; const Params: TVCPanelParams); virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LineStyle: TLineStyle read FLineStyle write SetLineStyle;
  end;

implementation

constructor TVisibleController.Create(AOwner: TComponent);
begin
  inherited;
  BevelOuter := bvNone;
  Alignment := taLeftJustify;
  LineStyle := lsDouble;

  FCloseButton := TVCButton.Create(Self);
  with FCloseButton do
  begin
    Width := 7;
    Height := 7;
    Caption := '';
    Left := Self.Width - 8;
    Top := 1;
    Anchors := [akRight, akTop];
    Parent := Self;
  end;

  Height := 8;

end;

procedure TVisibleController.SetLineStyle(Value: TLineStyle);
begin
  FLineStyle := Value;
  case LineStyle of
  lsNone:
    begin
{      HidePanel(Panel1);
      HidePanel(Panel2);}
    end;
  lsSingle:
    begin
    end;
  end;
end;

procedure TVisibleController.SetName(const Value: TComponentName);
begin
  inherited;
  Caption := '';
end;

procedure TVisibleController.HidePanel(Panel: TVCPanel);
begin
  Panel.Visible := False;
end;

end.
