unit CurrencyToHRImpl;

interface

uses Windows;

type
  TTranslatorFlag = Byte;
  TTranslatorFlags = set of TTranslatorFlag;

  TCurrencyTranslatorProc =
    function(Value: Extended; Decimals: Byte; Flags: TTranslatorFlags): String;

  PCurrencyTranslatorProc = ^TCurrencyTranslatorProc;

function CurrencyToHR(Value: Extended; Decimals: Byte; Flags: TTranslatorFlags;
  LocaleID: LCID = 0): String;
  
procedure RegCurrencyTranslator(ALocaleID: LCID; ATranslatorProc: TCurrencyTranslatorProc);
procedure UnRegCurrencyTranslator(LocaleID: LCID);

const
  tfNoFrac = 1;
  tfFracDigital = 2;
  tfNoCent = 4;

implementation

uses SysUtils, Classes, Math, CurrencyToHR_Azeri_Impl;

var
  Translators: TList = nil;

type
  TTranslatorDesc = record
    LocaleID: LCID;
    TranslatorProc: TCurrencyTranslatorProc;
  end;
  PTranslatorDesc = ^TTranslatorDesc;

function GetTranslatorIndex(ALocaleID: LCID): Integer;
begin
  for Result := 0 to Translators.Count-1 do
    with PTranslatorDesc(Translators[Result])^ do
      if LocaleID = ALocaleID then
        break;
end;

function GetTranslatorProc(ALocaleID: LCID): TCurrencyTranslatorProc;
var
  Index: Integer;
begin
  Index := GetTranslatorIndex(ALocaleID);
  if Index <> -1 then
    Result := PTranslatorDesc(Translators[Index])^.TranslatorProc
  else
    Result := nil;
end;

function CurrencyToHR(Value: Extended; Decimals: Byte; Flags: TTranslatorFlags;
  LocaleID: LCID = 0): String;
var
  P: TCurrencyTranslatorProc;
begin
  P := GetTranslatorProc(LocaleID);//(Value, Decimals, Flags);
  Result := P(Value, Decimals, Flags);
end;

procedure RegCurrencyTranslator(ALocaleID: LCID; ATranslatorProc: TCurrencyTranslatorProc);
var
  Desc: PTranslatorDesc;
begin
  UnRegCurrencyTranslator(ALocaleID);
  GetMem(Desc, SizeOf(TTranslatorDesc));
  with Desc^ do
  begin
    LocaleID := ALocaleID;
    TranslatorProc := ATranslatorProc;
  end;
  Translators.Add(Desc);
end;

procedure UnRegCurrencyTranslator(LocaleID: LCID);
var
  Index: Integer;
begin
  for Index := 0 to Translators.Count-1 do
    Translators.Delete(Index);
end;

procedure Initialize;
begin
  Translators := TList.Create;
  // temporary locates here
  RegCurrencyTranslator(LOCALE_AZERI, @CurrencyToHR_Azeri);
end;

procedure Cleanup;
begin
  Translators.Free;
end;

initialization
  Initialize;
finalization
  Cleanup;
end.
