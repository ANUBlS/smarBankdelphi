unit Version;

interface

uses Windows, SysUtils, Dialogs;

type
  PVersionData = ^TVersionData;
  TVersionData = record
    VersionSize     : Cardinal;
    RawLocaleID     : Integer;
    LocaleID        : Integer;
    PRawData        : Pointer;
    FixedFileInfo   : PVSFixedFileInfo;
    Translation     : ShortString;
  end;

  TReleaseFlag = (rfPrivate, rfDebug, rfPreview, rfSpecial);
  TReleaseFlags = set of TReleaseFlag;

  TTranslatedVersionData = record
    VersionNotation       : String;
    VersionNotationShort  : String;
    VersionMinor          : Cardinal;
    VersionMajor          : Cardinal;
    Release               : Cardinal;
    Build                 : Cardinal;
    ReleaseFlags          : TReleaseFlags;
    FlagString            : String;
    LocaleID              : Integer;
    RawLocaleID           : Integer;
    Language              : String;
    CompanyName           : String;
    FileDescription       : String;
    FileVersion           : String;
    InternalName          : String;
    LegalCopyright        : String;
    LegalTrademarks       : String;
    OriginalFilename      : String;
    ProductName           : String;
    ProductVersionString  : String;
    Comments              : String;
  end;

procedure GetVersionData(const FileName: String; var VersionData: TVersionData);
function GetTranslationHex(var VersionData: TVersionData): String;
function GetStringValue(var VersionData: TVersionData; const Name: String; RaiseErrors: Boolean = True): String;function GetVersionFlags(var VersionData: TVersionData): TReleaseFlags;
procedure GetVersionNumbers(var VersionData: TVersionData;
  var VersionMajor, VersionMinor, Release, Build: Cardinal);
function GetVersionLanguage(var VersionData: TVersionData): String;
procedure ReleaseVersionData(var VersionData: TVersionData);
procedure GetVersionLocaleID(Translation: Pointer; out RawLocaleID, LocaleID: Integer);

procedure SBTranslateVersionData(VersionData: TVersionData; var TranslatedVersionData: TTranslatedVersionData);
procedure SBGetTranslatedVersionData(const FileName: String; var TranslatedVersionData: TTranslatedVersionData);

implementation

procedure GetVersionData(const FileName: String; var VersionData: TVersionData);
type
  PInteger            = ^Integer;
var
  Handle            : Cardinal;
  PFixedFileInfo    : Pointer;
  PTranslation      : PInteger;
  ValueLen          : Cardinal;
begin
  with VersionData do
  begin
    {allocate memory}
    VersionSize := GetFileVersionInfoSize(PChar(FileName), Handle);
    if VersionSize = 0 then
      RaiseLastWin32Error;
    GetMem(PRawData, VersionSize);

    {get version info}
    if not GetFileVersionInfo(PChar(FileName), 0, VersionSize, PRawData) then
      RaiseLastWin32Error;

    {get fixed version info}
    ValueLen := 0;
    if not VerQueryValue(
      PRawData,
      '\',
      PFixedFileInfo,
      ValueLen)
    then
      RaiseLastWin32Error;
    FixedFileInfo := PFixedFileInfo;

    {get translation and localeID}
    ValueLen := 0;    
    if not VerQueryValue(
      PRawData,
      '\VarFileInfo\Translation',
      Pointer(PTranslation),
      ValueLen)
    then
      RaiseLastWin32Error;

    VersionData.RawLocaleID := PTranslation^;
    VersionData.LocaleID := LoWord(VersionData.RawLocaleID)*$10000+HiWord(VersionData.RawLocaleID);
    Translation := GetTranslationHex(VersionData);
  end;
end;

procedure GetVersionLocaleID(Translation: Pointer; out RawLocaleID, LocaleID: Integer);
begin
  RawLocaleID := PInteger(Translation)^;
  LocaleID := LoWord(RawLocaleID)*$10000+HiWord(RawLocaleID);
  ShowMessage(IntToStr(LocaleID));
end;

function GetTranslationHex(var VersionData: TVersionData): String;
begin
  Result := Format('%.8X', [VersionData.LocaleID]);
end;

function GetStringValue(var VersionData: TVersionData; const Name: String; RaiseErrors: Boolean = True): String;
var
  Buffer        : Pointer;
  Size          : Cardinal;
begin
  if not VerQueryValue(
    VersionData.PRawData,
    PChar(Format('\StringFileInfo\%s\%s', [VersionData.Translation, Name])),
    Buffer,
    Size)
  then
    if RaiseErrors then
      RaiseLastWin32Error;
  Result := String(PChar(Buffer));
end;

function GetVersionFlags(var VersionData: TVersionData): TReleaseFlags;
begin
  Result := [];
  with VersionData do
  begin
    if (VS_FF_DEBUG and FixedFileInfo.dwFileFlags and FixedFileInfo.dwFileFlagsMask) <> 0 then
      Include(Result, rfDebug);
    if (VS_FF_PRERELEASE and FixedFileInfo.dwFileFlags and FixedFileInfo.dwFileFlagsMask) <> 0 then
      Include(Result, rfPreview);
    if (VS_FF_PRIVATEBUILD and FixedFileInfo.dwFileFlags and FixedFileInfo.dwFileFlagsMask) <> 0 then
      Include(Result, rfPrivate);
    if (VS_FF_SPECIALBUILD and FixedFileInfo.dwFileFlags and FixedFileInfo.dwFileFlagsMask) <> 0 then
      Include(Result, rfSpecial);
  end;
end;

procedure GetVersionNumbers(var VersionData: TVersionData;
  var VersionMajor, VersionMinor, Release, Build: Cardinal);
begin
  with VersionData do
  begin
    VersionMajor := HiWord(FixedFileInfo.dwFileVersionMS);
    VersionMinor := LoWord(FixedFileInfo.dwFileVersionMS);
    Release := HiWord(FixedFileInfo.dwFileVersionLS);
    Build := LoWord(FixedFileInfo.dwFileVersionLS);
  end;
end;

procedure ReleaseVersionData(var VersionData: TVersionData);
begin
  FreeMem(VersionData.PRawData);
end;

function GetVersionLanguage(var VersionData: TVersionData): String;
var
  RawLang       : array[0..63] of Char;
  LangSize      : Integer;
begin
  with VersionData do
  begin
    LangSize := VerLanguageName(RawLocaleID, @RawLang, SizeOf(RawLang));
    if (LangSize = 0) or (LangSize > SizeOf(RawLang)) then
      RaiseLastWin32Error;
    Result := Copy(String(RawLang), 1, LangSize);
  end;
end;

procedure SBTranslateVersionData(VersionData: TVersionData; var TranslatedVersionData: TTranslatedVersionData);
begin
  {Initialize version data}

  with TranslatedVersionData do
  begin
    ReleaseFlags := GetVersionFlags(VersionData);
    FlagString := '';
    if rfDebug in ReleaseFlags then
      FlagString := Format('%s, debug', [FlagString]);
    if rfPreview in ReleaseFlags then
      FlagString := Format('%s, preview', [FlagString]);
    if rfPrivate in ReleaseFlags then
      FlagString := Format('%s, private', [FlagString]);
    if rfSpecial in ReleaseFlags then
      FlagString := Format('%s, special', [FlagString]);
    Delete(FlagString, 1, 2);

    GetVersionNumbers(VersionData, VersionMajor, VersionMinor, Release, Build);

    VersionNotation := Format('Version %d.%d.%d, Build %d. [%s]', [
      VersionMajor,
      VersionMinor,
      Release,
      Build,
      FlagString
    ]);
    VersionNotationShort := Format('%d.%d.%d.%d', [
      VersionMajor,
      VersionMinor,
      Release,
      Build
    ]);

    RawLocaleID := VersionData.RawLocaleID;
    LocaleID := VersionData.LocaleID;
    Language := GetVersionLanguage(VersionData);
    ProductName := GetStringValue(VersionData, 'ProductName', False);
    FileDescription := GetStringValue(VersionData, 'FileDescription', False);
    CompanyName := GetStringValue(VersionData, 'CompanyName', False);
    Comments := GetStringValue(VersionData, 'Comments', False);
    ProductVersionString := Format('%s. %s', [ProductName, VersionNotation]);
    InternalName := GetStringValue(VersionData, 'InternalName', False);
  end;
end;

procedure SBGetTranslatedVersionData(const FileName: String; var TranslatedVersionData: TTranslatedVersionData);
var
  VersionData       : TVersionData;
begin
  GetVersionData(FileName, VersionData);
  try
    SBTranslateVersionData(VersionData, TranslatedVersionData);
  finally
    ReleaseVersionData(VersionData);
  end;
end;

end.
