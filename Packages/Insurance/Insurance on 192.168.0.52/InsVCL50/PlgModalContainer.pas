unit PlgModalContainer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UPlgContainer;

type
  TPlgModalContainer = class(TComponent)
  private
    fmContainer : TfmContainer;
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(Owner : TComponent); override;
    destructor Destroy;  override;
    function ShowModal(ObjGuid : TGUID; Params : TStringList):Integer;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TPlgModalContainer]);
end;


constructor  TPlgModalContainer.Create(Owner : TComponent);
begin
  inherited Create(Owner);

end;

destructor TPlgModalContainer.Destroy;
begin
//  fmContainer.Free;
  inherited Destroy;
end;

function TPlgModalContainer.ShowModal(ObjGuid : TGUID; Params : TStringList):Integer;
begin
 Result := mrNone;
 fmContainer := TfmContainer.Create(Self);
 if Assigned(fmContainer) then begin
  fmContainer.OpenObj(ObjGuid, Params);
  result := fmContainer.ShowModal;
 end;

end;


end.
 