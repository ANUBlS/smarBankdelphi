unit SBUtils;

interface

uses SysUtils, Registry;

function FindCmdLineParam(Param: String; SwitchChars: TSysCharSet; ParamChar: Char; IgnoreCase: Boolean): String;
procedure SetTargetLanguage(const ProgramLocation: String; LocaleID: Integer);

const
  SwitchChars: TSysCharSet = ['/','-'];
  ParamChar = '=';

implementation

function FindCmdLineParam(Param: String; SwitchChars: TSysCharSet; ParamChar: Char; IgnoreCase: Boolean): String;
var
  i               : Integer;
  S               : String;
  P               : Integer;
  ParamLine       : String;
begin
  Result := '';
  if IgnoreCase then
    Param := LowerCase(Param);
  for i:=1 to ParamCount() do
  begin
    S := ParamStr(i);
    if (Length(S) > 0) and (S[1] in SwitchChars) then
    begin
      Delete(S, 1, 1);
      P := Pos(ParamChar, S);
      if P <> 0 then
      begin
        ParamLine := Copy(S, 1, P-1);
        if IgnoreCase then
          ParamLine := LowerCase(ParamLine);
        if ParamLine = Param then
        begin
          Result := Copy(S, P+1, Length(S));
          exit;
        end;
      end;
    end;
  end;
end;

procedure SetTargetLanguage(const ProgramLocation: String; LocaleID: Integer);
begin
  with TRegistry.Create do
  try
    OpenKey('\Software\Borland\Locales', True);
    WriteString(ProgramLocation, Languages.Ext[Languages.IndexOf(LocaleID)]);
  finally
    Destroy;
  end;
end;

end.
