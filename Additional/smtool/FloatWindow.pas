unit FloatWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TFloatWindow = class(TComponent)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

implementation

constructor TFloatWindow.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
