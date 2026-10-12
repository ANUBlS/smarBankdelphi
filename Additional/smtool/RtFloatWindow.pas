unit RtFloatWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TRtFloatWindow = class(TCustomForm)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

implementation

constructor TRtFloatWindow.Create(AOwner: TComponent);
begin                  
  inherited;
end;

end.
