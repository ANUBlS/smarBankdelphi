unit DockSite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin;

type
  TControlCollectionItem = class(TCollectionItem)
  private
    FControl: TWinControl;
  published
    property Control: TWinControl read FControl write FControl;
  end;

  TControls = class(TOwnedCollection)
  public
    function Add: TWinControl;
    function GetItem(Index: Integer): TWinControl;
    property Items[Index: Integer]: TWinControl read GetItem; default;
  end;

  TDockSite = class(TPanel)
  private
    FControls: TControls;
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Controls: TControls read FControls;
  end;

implementation

  { TControls }

function TControls.Add: TWinControl;
begin
  Result := TControlCollectionItem(inherited Add).Control;
end;

function TControls.GetItem(Index: Integer): TWinControl;
begin
  Result := TControlCollectionItem(inherited GetItem(Index)).Control;
end;

  { TDockSite }

constructor TDockSite.Create(AOwner: TComponent);
begin
  inherited;
  Align := alTop;
  AutoSize := True;
  FControls := TControls.Create(Self, TControlCollectionItem);
  FControls.GetOwner
end;

end.
