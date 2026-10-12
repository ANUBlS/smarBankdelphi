unit DBLabeledEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  TDBLabeledEdit = class(TDBEdit)
  private
    FDBEditLabel : TLabel;
    { Private declarations }
  protected
    procedure  AlligningLabel(newTop,newLeft,newHeight,newWidth :Integer);
    { Protected declarations }
  public
     constructor  Create(AOwner :TComponent);override;
     destructor   Destroy;override;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TDBLabeledEdit.Create;
begin
end;
destructor  TDBLabeledEdit.Destroy;
begin
  FDBEditLabel.Destroy;
  inherited Destroy;
end;
procedure  TDBLabeledEdit.AlligningLabel;
begin

end;
procedure Register;
begin
  RegisterComponents('Smart Visuals', [TDBLabeledEdit]);
end;

end.
