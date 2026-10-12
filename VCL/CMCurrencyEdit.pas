// Dima Ne Obejaysay

unit CMCurrencyEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TCMCurrencyEdit = class(TEdit)
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

procedure TCMCurrencyEdit.DoEnter;
begin
  SetText(GetCurrencyUnFormated);
  SelectAll;
  inherited;
end;

procedure TCMCurrencyEdit.DoExit;
begin
  SetText(GetCurrencyFormated);
  inherited;
end;

procedure TCMCurrencyEdit.SetValue(AValue: Currency);
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

function TCMCurrencyEdit.GetCurrencyFormated: String;
begin
  Result := CurrToStrF(Value, ffCurrency, CurrencyDecimals);
end;

function TCMCurrencyEdit.GetCurrencyUnFormated: String;
begin
  Result := CurrToStrF(Value, ffGeneral, CurrencyDecimals);
end;

procedure TCMCurrencyEdit.Change;
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

constructor TCMCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited;
  Text := '0';
  FPrivateChanging := False;
end;

procedure TCMCurrencyEdit.SetText(const NewText: String);
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
  RegisterComponents('CreditsMgr', [TCMCurrencyEdit]);
end;

end.
