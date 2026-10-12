unit CurrencyEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TCurrencyEdit = class(TEdit)
  private
    FValue            : Currency;
    FPrivateChanging  : Boolean;
    procedure SetValue(AValue: Currency);
    procedure SetText(const NewText: String);
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    function GetCurrencyFormated: String;
    function GetCurrencyUnFormated: String;
    procedure Change; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Value: Currency read FValue write SetValue;
  end;

procedure Register;

implementation

procedure TCurrencyEdit.DoEnter;
begin
  SetText(GetCurrencyUnFormated);
  SelectAll;
  inherited;
end;

procedure TCurrencyEdit.DoExit;
begin
  SetText(GetCurrencyFormated);
  inherited;
end;

procedure TCurrencyEdit.SetValue(AValue: Currency);
begin
  if AValue <> FValue then
  begin
    FValue := AValue;
    if Focused then
      SetText(GetCurrencyUnFormated)
    else
      SetText(GetCurrencyFormated);
  end;
end;

function TCurrencyEdit.GetCurrencyFormated: String;
begin
  Result := CurrToStrF(Value, ffCurrency,CurrencyDecimals);
end;

function TCurrencyEdit.GetCurrencyUnFormated: String;
begin
  Result := CurrToStrF(Value, ffGeneral,CurrencyDecimals);
end;

procedure TCurrencyEdit.Change;
begin
  if not FPrivateChanging then
    if Text <> '' then
      try
        FValue := StrToCurr(Text);
        inherited;
      except
        FValue := -1;
        raise;
      end
    else
      FValue := 0;
end;

constructor TCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited;
  Text := '0';
  FPrivateChanging := False;
end;

procedure TCurrencyEdit.SetText(const NewText: String);
begin
  FPrivateChanging := True;
  try
    Text := NewText;
  finally
    FPrivateChanging := False;
  end;
end;

procedure Register;
begin
  RegisterComponents('Standard', [TCurrencyEdit]);
end;

end.
