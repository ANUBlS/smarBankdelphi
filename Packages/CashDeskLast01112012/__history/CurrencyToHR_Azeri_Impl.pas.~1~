unit CurrencyToHR_Azeri_Impl;

interface

uses CurrencyToHRImpl;

function CurrencyToHR_Azeri(Value: Extended; Decimals: Byte; Flags: TTranslatorFlags): String;

const
  LOCALE_AZERI = 0;

implementation

uses SysUtils, Math;

function CurrencyToHR_Azeri(Value: Extended; Decimals: Byte; Flags: TTranslatorFlags): String;

const
  s100 = 'йцз';
  s001 = 'г€пик';
  CurrencyName = 'манат';

  Digits1: array[1..9] of String = (
    'бир', 'ики', 'цч', 'дюрд', 'беш', 'алты', 'йедди', 'с€ккиз', 'доггуз'
  );

  Digits2: array[1..9] of String = (
    'он', 'ийирми', 'оттуз', 'гырх', '€лли', 'алтмыш', 'йетмиш', 'с€кс€н', 'дохсан'
  );

  Digits3: array[0..6] of String = (
    '', 'мин', 'милйон', 'миллиард', 'биллиард', 'триллион', 'триллиард'
  );

  function ConvertPart(Value: Int64): String;

    function Wrap(Value: Int64; Divider: Int64): Int64;
    begin
      Result := Round(System.Frac(Value / Divider) * Divider);
    end;

    function Merge(const Digits: array of String; var S: String; Index: Int64): String;
    begin
      if Index <> 0 then
        S := S + ' ' + Digits[Index-1];
    end;

  var
    Index: Int64;
  begin
    Result := '';
    Index := Trunc(Value / 100);
    if Index <> 0 then
    begin
      if Index <> 1 then
        Result := Digits1[Index] + ' ';
      Result := Result + s100;
    end;

    Value := Wrap(Value, 100);
    Merge(Digits2, Result, Trunc(Value / 10));
    Value := Wrap(Value, 10);
    Merge(Digits1, Result, Value);
    
    Result := Trim(Result);
  end;

  function ConvertInt(Int: Int64): String;
  var
    Part: Int64;
    Counter: Int64;
    Sign: Char;
  begin
    if Int < 0 then
    begin
      Sign := '-';
      Int := -Int;
    end
    else
      Sign := ' ';

    Counter := 0;
    while Int <> 0 do
    begin
      if Counter > High(Digits3) then
        raise EInvalidOp.Create('Too big integer to convert');
      Part := Round(System.Frac(Int / 1000) * 1000);
      Int := Trunc(Int / 1000);
      if Part <> 0 then
        Result := ConvertPart(Part) + ' ' + Digits3[Counter] + ' ' + Result;
      Inc(Counter);
    end;
    Result := Trim(Sign + Result);
  end;

  function ConvertFrac(Value: Extended): String;
  var
    Int: Int64;
  begin
    Int := Round(Value * Power(10, Decimals));
    if Int <> 0 then
    begin
      if tfFracDigital in Flags then
        Result := IntToStr(Int)
      else
        Result := ConvertInt(Int);
      if not (tfNoCent in Flags) then
        Result := Result + ' ' + s001;
      Result := Trim(Result);
    end
    else
      Result := '';
  end;

begin
  { convert integer part }
  if Round(Value) <> 0 then
    Result := ConvertInt(Round(Value));

  { convert fractal part }
 // if not (tfNoFrac in Flags) then
   // Result := Result + ' ' + ConvertFrac(Frac(Value));
   Result := Result + 'zaaaaaaa';
  Result := Trim(Result);
end;

end.
