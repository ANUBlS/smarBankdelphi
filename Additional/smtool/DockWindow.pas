unit DockWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TDockWindow = class(TCustomForm)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

implementation

constructor TDockWindow.Create(AOwner: TComponent);
begin                  
  inherited;
end;

end.
