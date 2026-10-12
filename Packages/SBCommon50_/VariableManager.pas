unit VariableManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CustomInst, IniSource;

type
  TVariableManager = class(TMLIniSource)
  private
    { Private declarations }
    FVariables        : TStringList;
    function GetVariableCount: Integer;
    function GetVariable(Index: Integer): String;
    function GetValue(const Name: String): String;
    procedure SetValue(const Name, Value: String);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Variables[Index: Integer]: String read GetVariable;
    property Values[const Name: String]: String read GetValue write SetValue;
    property Count: Integer read GetVariableCount;
    function ExpandVariables(const Source: String): String;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TVariableManager]);
end;

function TVariableManager.GetVariableCount: Integer;
begin
  Result := FVariables.Count;
end;

function TVariableManager.GetVariable(Index: Integer): String;
begin
  Result := FVariables.Names[Index];
end;

function TVariableManager.GetValue(const Name: String): String;
begin
  Result := FVariables.Values[Name];
end;

procedure TVariableManager.SetValue(const Name, Value: String);
begin
  FVariables.Values[Name] := Value;
end;

constructor TVariableManager.Create(AOwner: TComponent);
begin
  FVariables := TStringList.Create;
  inherited;
end;

destructor TVariableManager.Destroy;
begin
  inherited;
  FVariables.Free;
end;

function TVariableManager.ExpandVariables(const Source: String): String;
var
  i, P        : Integer;
  VarName     : String;
begin
  Result := Source;
  for i:=0 to Count-1 do
  begin
    VarName := Variables[i];
    while True do
    begin
      P := Pos(Format('$(%s)', [VarName]), Result);
      if P = 0 then
        break;
      System.Delete(Result, P, Length(VarName)+3);
      System.Insert(Values[VarName], Result, P);
    end;
  end;
end;

end.
