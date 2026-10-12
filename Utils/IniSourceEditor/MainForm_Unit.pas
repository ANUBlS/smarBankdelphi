unit MainForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle, IniFiles, ShellApi;

type
  TForm1 = class(TForm)
    SBConfig: TOraclePackage;
    Sections: TOracleDataSet;
    SectionValues: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GenTempFileName(const Ext: String): String;
    procedure LoadOraIni(const FileName, TempFile, AUserName, AConnection: String);
    procedure UploadOraIni(const TempFile, FileName: String);
    procedure EditIniSource(const IniSourceLocation, UserName, Connection: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses OpenIniFileFormImpl, sboapiDataModuleImpl, SBOInitPkg, ProgressFormImpl;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  IniSourceLocation: String;
  UserName: String;
  Connection: String;
begin
  if ParamCount < 1 then
    IniSourceLocation := ''
  else
    IniSourceLocation := ParamStr(1);
  if ParamCount < 2 then
    UserName := ''
  else
    UserName := ParamStr(2);
  if ParamCount < 3 then
    Connection := ''
  else
    Connection := ParamStr(3);
  EditIniSource(IniSourceLocation, UserName, Connection);
  Application.Terminate;
end;

function TForm1.GenTempFileName(const Ext: String): String;
var
  pTempPath: PChar;
  pTempFile: PChar;
begin
  pTempPath := StrAlloc(MAX_PATH);
  try
    if GetTempPath(MAX_PATH, pTempPath) = 0 then
      RaiseLastWin32Error;
    pTempFile := StrAlloc(MAX_PATH);
    try
      if GetTempFileName(pTempPath, 'sbini_', 0, pTempFile) = 0 then
        RaiseLastWin32Error;
      Result := StrPas(pTempFile);
    finally
      StrDispose(pTempFile);
    end;
  finally
    StrDispose(pTempPath);
  end;
  Result := ChangeFileExt(Result, Ext);
end;

procedure TForm1.LoadOraIni(const FileName, TempFile, AUserName, AConnection: String);
var
  SBData: TSBOData;
  Ident: String;
  IniFile: TStrings;
  ProgressForm: TProgressForm;
begin

  with SBData do
  begin
    UserName := AUserName;
    Password := 'Password';
    Database := AConnection;
  end;

  if Sb_Initialize(SBData, True, True) then
    with SBConfig do
    begin
      CallIntegerFunction('OpenFile', [FileName]);
      IniFile := TStringList.Create;
      ProgressForm := TProgressForm.Create(Self);
      try
        ProgressForm.StartDialog('Ini source editor', 'Loading ini file...', True, True);
        with Sections do
        begin
          Close;
          Open;
          ProgressForm.StatusMessage(Format('Retreiving section: %s', [Ident]));
          ProgressForm.Repaint;
          while not Eof do
          begin
            Ident := FieldByName('Name').AsString;
            with SectionValues do
            begin
              Close;
              SetVariable('Ident', Ident);
              Open;
              IniFile.Add(Format('[%s]', [Ident]));
              while not Eof do
              begin
                IniFile.Add(Format('%s=%s', [FieldByName('Name').AsString, FieldByName('Value').AsString]));
                Next;
              end;
            end;
            IniFile.Add('');
            Next;
          end;
        end;
        IniFile.SaveToFile(TempFile);
      finally
        ProgressForm.DoneDialog;
        ProgressForm.Release;
        IniFile.Free;
      end;
    end
  else
    Abort;
end;

procedure TForm1.UploadOraIni(const TempFile, FileName: String);
var
  IniFile: TIniFile;
  Sections: TStrings;
  Index, I: Integer;
  Values: TStrings;
begin
  SBConfig.CallProcedure('EraseFile', []);
  Sections := TStringList.Create;
  Values := TStringList.Create;
  try
    IniFile := TIniFile.Create(TempFile);
    try
      Sections.Clear;
      IniFile.ReadSections(Sections);
      for Index := 0 to Sections.Count-1 do
      begin
        Values.Clear;
        IniFile.ReadSectionValues(Sections[Index], Values);
        for I := 0 to Values.Count-1 do
          SBConfig.CallProcedure('WriteValue', [Sections[Index], Values.Names[I], Values.Values[Values.Names[I]]]);
      end;
    finally
      IniFile.Free;
    end;
  finally
    Sections.Free;
    Values.Free;
  end;
end;

procedure TForm1.EditIniSource(const IniSourceLocation, UserName, Connection: String);
var
  TempFile: String;
  ExecInfo: TShellExecuteInfo;
  AFileName: String;
  AIniSourceType: String;
begin
  if IniSourceLocation = '' then
    with TOpenIniFileForm.Create(Self) do
    try
      if Execute then
      begin
        AFileName := FileName;
        AIniSourceType := IniSourceType;
      end
      else
        exit;
    finally
      Release;
    end
  else
  begin
    AIniSourceType := Copy(IniSourceLocation, 1, Pos(':', IniSourceLocation)-1);
    AFileName := Copy(IniSourceLocation, Length(AIniSourceType)+2, Length(IniSourceLocation));
  end;

  if AFileName <> '' then
  begin
    TempFile := GenTempFileName('.ini');
    if AIniSourceType = 'winini' then
    begin
      if not CopyFile(PChar(AFileName), PChar(TempFile), False) then
        RaiseLastWin32Error;
    end
    else
    if AIniSourceType = 'ora' then
      LoadOraIni(AFileName, TempFile, UserName, Connection)
    else
      TempFile := AFileName;
    with ExecInfo do
    begin
      cbSize := SizeOf(ExecInfo);
      fMask := SEE_MASK_NOCLOSEPROCESS;
      Wnd := Handle;
      lpFile := 'notepad.exe';
      lpParameters := PChar(TempFile);
      lpDirectory := nil;
      nShow := SW_SHOWNORMAL;
      lpVerb := 'open';
    end;
    if not ShellExecuteEx(@ExecInfo) then
      RaiseLastWin32Error;
    if WaitForSingleObject(ExecInfo.hProcess, INFINITE) <> WAIT_OBJECT_0 then
      RaiseLastWin32Error;
    if AIniSourceType = 'ora' then
      UploadOraIni(TempFile, AFileName);
  end;
end;

end.
