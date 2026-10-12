unit ProductVersion;

interface

uses Windows, Version;

const
  unknown = '(unknown)';

var
  VersionNotation       : String = unknown;
  VersionMinor          : Cardinal = 0;
  VersionMajor          : Cardinal = 0;
  Release               : Cardinal = 0;
  Build                 : Cardinal = 0;
  ReleaseFlags          : TReleaseFlags = [];
  FlagString            : String = unknown;
  LocaleID              : Integer = 0;
  RawLocaleID           : Integer = 0;
  Language              : String = unknown;

  CompanyName           : String = unknown;
  FileDescription       : String = unknown;
  FileVersion           : String = unknown;
  InternalName          : String = unknown;
  LegalCopyright        : String = unknown;
  LegalTrademarks       : String = unknown;
  OriginalFilename      : String = unknown;
  ProductName           : String = unknown;
  ProductVersionString  : String = unknown;
  Comments              : String = unknown;
  Author                : String = unknown;
  EMail                 : String = unknown;

procedure Initialize(const FileName: String);

implementation

uses SysUtils, Dialogs;

var
  VersionData   : TVersionData;
  Initialized   : Boolean = False;

procedure Cleanup;
begin
  if Initialized then
    ReleaseVersionData(VersionData);
end;

procedure Initialize(const FileName: String);
begin
  {Initialize version data}

  Cleanup;

  GetVersionData(FileName, VersionData);

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

  RawLocaleID := VersionData.RawLocaleID;
  LocaleID := VersionData.LocaleID;
  Language := GetVersionLanguage(VersionData);
  ProductName := GetStringValue(VersionData, 'ProductName');
  FileDescription := GetStringValue(VersionData, 'FileDescription');
  CompanyName := GetStringValue(VersionData, 'CompanyName');
  Comments := GetStringValue(VersionData, 'Comments');
  ProductVersionString := Format('%s. %s', [ProductName, VersionNotation]);
  InternalName := GetStringValue(VersionData, 'InternalName');
end;

initialization
finalization
  Cleanup;
end.
