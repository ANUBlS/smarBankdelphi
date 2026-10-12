unit MultiLang;

interface

type
  HSOURCE = LongWord;
  HSECTION = LongWord;

function OpenDataSource(const FileName: String): HSOURCE;
function OpenDataSection(hSource: HSOURCE; const Name: String; LCID: Integer): HSECTION;
function GetStringData(hSection: HSECTION; const Name: String): String;
procedure CloseDataSection(hSection: HSECTION);
procedure CloseDataSource(hSource: HSOURCE);

implementation

uses SysUtils, Classes, IniFiles;

type
  TIniFileClass = class of TCustomIniFile;

const
  IniClass: TIniFileClass = TIniFile;

function OpenDataSource(const FileName: String): HSOURCE;
begin
  if not FileExists(FileName) then
    raise EStreamError.CreateFmt('File not found: "%s"', [FileName]);
  Result := HSOURCE(IniClass.Create(FileName));
end;

function OpenDataSection(hSource: HSOURCE; const Name: String; LCID: Integer): HSECTION;
var
  SectionName       : String;
begin
  SectionName := Format('%s.$%X', [Name, LCID]);
  Result := HSECTION(TStringList.Create);
  try
    with TCustomIniFile(hSource) do
      if SectionExists(SectionName) then
        ReadSectionValues(SectionName, TStrings(Result))
      else
        raise EStreamError.CreateFmt('Section named "%s" not found in "%s"', [SectionName, FileName]);
  except
    CloseDataSection(Result);
  end;
end;

function GetStringData(hSection: HSECTION; const Name: String): String;
begin
  Result := TStringList(hSection).Values[Name];
end;

procedure CloseDataSection(hSection: HSECTION);
begin
  TStrings(hSection).Destroy;
end;

procedure CloseDataSource(hSource: HSOURCE);
begin
  TCustomIniFile(hSource).Destroy;
end;

end.
