unit DtFloatWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TDtFloatWindow = class(TPanel)
  private
    FTitlePanel: TPanel;
  protected
    procedure SetCaption(const Value: TCaption);
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    property TitlePanel: TPanel read FTitlePanel;
  published
    property Caption write SetCaption;
  end;

implementation

constructor TDtFloatWindow.Create(AOwner: TComponent);
begin
  inherited;
  Width := 100;
  Height := 100;
  FTitlePanel := TPanel.Create(Self);
  with FTitlePanel do
  begin
    Alignment := taLeftJustify;
    Height := 20;
    Align := alTop;
    Color := clNavy;
    Font.Color := clWhite;
    Parent := Self;
  end;
end;

procedure TDtFloatWindow.SetCaption(const Value: TCaption);
begin
  TitlePanel.Caption := Value;
  inherited Caption := Value;
end;

function TDtFloatWindow.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := ControlCount > 1;
  Result := Result and (inherited CanAutoSize(NewWidth, NewHeight));
end;

procedure TDtFloatWindow.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opInsert) and (AComponent is TControl) and (AComponent <> Self) and (Assigned(TitlePanel)) then
  begin
    TControl(AComponent).Parent := Self;
  end;
end;

end.
