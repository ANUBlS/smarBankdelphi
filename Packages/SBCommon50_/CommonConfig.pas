unit CommonConfig;

interface

uses IniSource, MLIniSource;

var
  CommonIniSource: TIniSource = nil;
  CommonMultiLang: TMLIniSource = nil;

procedure SetIniSource(IniSource: TIniSource); overload;
procedure SetIniSource(const FileName: String); overload;
procedure SetMultiLang(MLIniSource: TMLIniSource); overload;
procedure SetMultiLang(const FileName: String; LocaleID: Integer; const Section: String); overload;

implementation

var
  ISInternallyCreated   : Boolean = False;
  MLInternallyCreated   : Boolean = False;

procedure SetIniSource(IniSource: TIniSource);
begin
  CommonIniSource := IniSource;
  ISInternallyCreated := False;
end;

procedure SetIniSource(const FileName: String);
var
  IniSource       : TIniSource;
begin
  IniSource := TMlIniSource.Create(nil);
  IniSource.Location := FileName;
  IniSource.Open;
  SetIniSource(IniSource);
  ISInternallyCreated := True;
end;

procedure SetMultiLang(MLIniSource: TMLIniSource);
begin
  CommonMultiLang := MLIniSource;
  MLInternallyCreated := False;
end;

procedure SetMultiLang(const FileName: String; LocaleID: Integer; const Section: String); overload;
var
  MLIniSource       : TMLIniSource;
begin
  MLIniSource := TMLIniSource.Create(nil);
  MLIniSource.Location := FileName;
  MLIniSource.LocaleID := LocaleID;
  MLIniSource.Section := Section;
  MLIniSource.Open;
  SetMultiLang(MLIniSource);
  MLInternallyCreated := True;
end;

procedure Cleanup;
begin
  if ISInternallyCreated then
    CommonIniSource.Free;
  if MLInternallyCreated then
    CommonMultiLang.Free;
end;

initialization
finalization
  Cleanup;
end.
