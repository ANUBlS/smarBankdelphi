{*****************************************}
{* TSequnce                              *}
{* Company : Smart Systems Technolgy ltd.*}
{* Author : Asif N. Nazarov              *}
{* Date : 15-mar-2004                    *}
{*****************************************}


unit Sequence;

interface

uses
  SysUtils , Classes;

type

   TSequence = class(TComponent)
   private
     FCurrentValue : Longword;
     FMaxValue   : Longword;
     FStartValue : Longword;
     FInclusive : Boolean;
     FStep : Word;
     FFirstStep : Boolean;
   protected
     function GetStartValue : Longword;
     procedure SetStartValue(const Value : Longword);
     procedure SetMaxValue(const Value : Longword);
     procedure SetInclusive(const Value : Boolean);
   public
     constructor Create(AOwner : TComponent); override;
     destructor Destroy; override;
     function CurrentValue : Longword;
     function NextValue : Longword;
     procedure Reset;
   published
     property MaxValue : Longword read FMaxValue write FMaxValue;
     property StartValue : Longword read GetStartValue write SetStartValue;
     property Step : Word read FStep write FStep;
     property Inclusive : Boolean read FInclusive write SetInclusive;
   end;

procedure Register;

implementation

constructor TSequence.Create;
begin
  inherited Create(AOwner);
  Reset
end;

destructor TSequence.Destroy;
begin
  inherited Destroy;
end;

function TSequence.GetStartValue : Longword;
begin
  Result := FStartValue;
end;

procedure TSequence.SetStartValue(const Value : Longword);
begin
  if (MaxValue = 0)
     or(FStartValue - Step * Byte(Inclusive)
     <= Value) then
  FStartValue := Value;
  FCurrentValue := FStartValue;
  FFirstStep := Inclusive and (FCurrentValue = FStartValue);
end;

procedure TSequence.SetMaxValue(const Value : Longword);
begin
  if (Value = 0)
     or((FStartValue - Step * Byte(Inclusive) <= Value)
     or (FCurrentValue <= Value)) then
  FMaxValue := Value;
end;

procedure TSequence.SetInclusive(const Value : Boolean);
begin
  FInclusive := Value;
  FFirstStep := Inclusive;
end;

function TSequence.CurrentValue : Longword;
begin
  Result := FCurrentValue;
end;

function TSequence.NextValue : LongWord;
var
  TempValue : Longword;
begin
  TempValue := FCurrentValue + Step * Byte(not FFirstStep);
  if (MaxValue = 0) or (TempValue <= MaxValue) then
  begin
    FCurrentValue := TempValue;
    FFirstStep := False;
  end;
  Result := FCurrentValue;

end;

procedure TSequence.Reset;
begin
  Inclusive := True;;
  FFirstStep := True;
  Step := 1;
  MaxValue := 0;
  StartValue := 0;
  FCurrentValue := 0;
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TSequence])
end;

end.
