unit SBPCommonReg;

interface

uses IniSource, MLIniSource;

procedure Register;

implementation

uses Classes, SysUtils, Dialogs, SBDecls, Windows, DsgnIntf;

type
  TIniFileEditor = class(TPropertyEditor)
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: String; override;
    procedure SetValue(const Value: String); override;
    procedure Edit; override;
  end;

  TMLIniSourceLocaleIDEditor = class(TPropertyEditor)
  protected
    function GetValue: string; override;
    procedure SetValue(const Value: String); override;
    procedure GetValues(GetStrProc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  { TIniFileEditor }

function TIniFileEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog];
end;

function TIniFileEditor.GetValue: String;
begin
  Result := TIniSource(GetComponent(0)).Location;
end;

procedure TIniFileEditor.SetValue(const Value: String);
begin
  TIniSource(GetComponent(0)).Location := Value;
end;

procedure TIniFileEditor.Edit;
begin
  with TOpenDialog.Create(nil) do
  try
    Filter := 'INI files (*.ini)|*.ini|Config files (*.cfg)|*.cfg|All files (*.*)|*.*';
    if Execute then
      Value := FileName;
  finally
    Free;
  end;
end;

  { MLIniSourceLocaleIDEditor }

function TMLIniSourceLocaleIDEditor.GetValue: string;
var
  LocaleID        : Integer;         
begin
  LocaleID := TMLIniSource(GetComponent(0)).LocaleID;
  Result := Format('$%x %s', [LocaleID, Languages.NameFromLocaleID[LocaleID]]);
end;

procedure TMLIniSourceLocaleIDEditor.SetValue(const Value: String);
var
  TargetLocale    : LCID;
  TargetLocaleS   : String;
  i               : Integer;
  Strings         : TStringList;
begin
  TargetLocaleS := Trim(Value);

  Strings := TStringList.Create;
  try
    ExtractStrings([#32,#9],[#32,#9],PChar(TargetLocaleS),Strings);
    TargetLocale := StrToInt(Strings[0]);
  finally
    Strings.Destroy;
  end;

  with Languages do
    for i:=0 to Count-1 do
      if LocaleID[i] = TargetLocale then
      begin
        TMLIniSource(GetComponent(0)).LocaleID := TargetLocale;
        exit;
      end;

  raise ENotFound.CreateFmt('$%x is incorrect locale id', [TargetLocale]);
end;

procedure TMLIniSourceLocaleIDEditor.GetValues(GetStrProc: TGetStrProc);
var
  i : Integer;
begin
  with Languages do
    for i:=0 to Count-1 do
      GetStrProc(Format('$%x %s', [LocaleID[i], Name[i]]));
end;

function TMLIniSourceLocaleIDEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList];
end;

procedure Register;
begin
  RegisterComponents(ComponentRegisterPage, [TIniSource, TMLIniSource]);
  RegisterPropertyEditor(TypeInfo(String), TIniSource, 'Location', TIniFileEditor);
  RegisterPropertyEditor(TypeInfo(Integer), TMLIniSource, 'LocaleID', TMLIniSourceLocaleIDEditor);
end;

end.
