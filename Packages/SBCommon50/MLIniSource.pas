unit MLIniSource;

interface

uses IniSource, SysUtils, IniFiles;

type
  TMLIniSource = class(TIniSource)
  private
    FLocaleID                 : Integer;
    FExtension                : String;
    FLanguage                 : String;
    FLocalizedIniFile         : TCustomIniFile;
    procedure SetLocaleID(Value: Integer);
    procedure SetExtension(const Value: String);
    procedure SetLanguage(const Value: String);
  protected
    procedure DoOpen; override;
    function GetFileExists: Boolean; override;
  public
    function GetStringData(const AName: String; const Default: String = '';
      const ASection: String = ''): String; override;
    property Extension: String read FExtension write SetExtension;
    property Language: String read FLanguage write SetLanguage stored False;
  published
    property LocaleID: Integer read FLocaleID write SetLocaleID stored False;
  end;

implementation

uses Classes, SBDecls;

procedure TMLIniSource.SetLocaleID(Value: Integer);
var
  Index                   : Integer;
begin
  if LocaleID <> Value then
  begin
    Close;
    FLocaleID := Value;
    with Languages do
    begin
      Index := IndexOf(Value);
      Extension := Ext[Index];
      Language := NameFromLocaleID[Value];
    end;
  end;
end;

procedure TMLIniSource.SetExtension(const Value: String);
var
  i                       : Integer;
begin
  if Extension <> Value then
  begin
    Close;
    with Languages do
      for i:=0 to Count-1 do
        if Ext[i] = Value then
        begin
          FExtension := Value;
          Self.LocaleID := LocaleID[i];
          exit;
        end;
    raise ENotFound.CreateFmt('Extension "%s" is not in language-depended extensions list', [Value]);
  end;
end;

procedure TMLIniSource.SetLanguage(const Value: String);
var
  i                       : Integer;
begin
  if Language <> Value then
  begin
    Close;
    with Languages do
      for i:=0 to Count-1 do
        if Name[i] = Value then
        begin
          FLanguage := Value;
          Self.LocaleID := LocaleID[i];
          exit;
        end;
    raise ENotFound.CreateFmt('Language "%s" is not in installed languages list', [Value]);
  end;
end;

procedure TMLIniSource.DoOpen;
begin
  with Languages do
    FLocalizedIniFile :=
      ConfigClass.Create(
        ChangeFileExt(
          Location,
            Format(
              '.%s%s',
              [
                Ext[IndexOf(Self.LocaleID)],
                ExtractFileExt(Location)
              ]
            )
        )
      );
  inherited;
end;

function TMLIniSource.GetFileExists: Boolean;
begin
  Result := FileExists(Location);
end;

function TMLIniSource.GetStringData(const AName: String; const Default: String = ''; const ASection: String = ''): String;
var
  TargetSection       : String;
const
  BadValue        = '!!!@@@&&&***bad value***&&&@@@!!!';
begin
  if ASection = EmptyStr then
    TargetSection := Section
  else
    TargetSection := ASection;
  {TODO: Check ValueExists}

  if FLocalizedIniFile.ValueExists(TargetSection, AName) then
    Result := FLocalizedIniFile.ReadString(TargetSection, AName, BadValue)
  else
    Result := inherited GetStringData(AName, Default, ASection);
end;

end.
