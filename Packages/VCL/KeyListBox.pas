unit KeyListBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  TKeyListBox = class(TCheckListBox)
  private
    FKeys: TStringList;                             
    procedure SetKeys(Value: TStringList);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    function GetCheckedKeyList: TStringList;
  published
    property Keys: TStringList read FKeys write SetKeys;
  end;

procedure Register;

implementation

constructor TKeyListBox.Create;
begin
  inherited;
  FKeys := TStringList.Create;
end;

procedure TKeyListBox.SetKeys;
begin
  FKeys.Assign(Value);
end;

function TKeyListBox.GetCheckedKeyList;
var
  i:Integer;
  Rez: TStringList;
begin
  //dvf
  Rez := TStringList.Create;
  for i := 0 to FKeys.Count-1 do
    if Checked[i] then
       Rez.Add(FKeys[i]);
  Result:=Rez;
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr', [TKeyListBox]);
end;

end.
