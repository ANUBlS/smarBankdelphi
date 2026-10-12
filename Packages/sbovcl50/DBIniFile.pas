unit DBIniFile;

  { for Oracle only! }

interface

uses IniFiles, IniSource, Oracle, Classes, SysUtils, Dialogs, SbAxCommon50_TLB, StdVcl;

type
  TDBIniFile = class(TCustomIniFile)
  private
    FSession: TOracleSession;
    FIniFileID: Integer;
    FPkg: TOraclePackage;
    procedure SetSession(Value: TOracleSession);
  protected
    procedure OpenIniFile; virtual;
  public
    property Session: TOracleSession read FSession write SetSession;
    function ReadString(const Section, Ident, Default: string): string; override;
    procedure WriteString(const Section, Ident, Value: String);  override;
    procedure ReadSection(const Section: string; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); override;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
    procedure EraseSection(const Ident: string); override;
    procedure DeleteKey(const Section, Ident: String); override;
    procedure UpdateFile; override;
    procedure Erase;
    procedure Delete;
    procedure AssignConfiguration(const Source: ICustomIniSource);
    constructor Create(const FileName: String);
    destructor Destroy; override;

    {

    This members will not be currently implemented

    function ReadInteger(const Section, Ident: string; Default: Longint): Longint; virtual;
    procedure WriteInteger(const Section, Ident: string; Value: Longint); virtual;
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean; virtual;
    procedure WriteBool(const Section, Ident: string; Value: Boolean); virtual;
    function ReadDate(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    function ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    function ReadFloat(const Section, Name: string; Default: Double): Double; virtual;
    function ReadTime(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    procedure WriteDate(const Section, Name: string; Value: TDateTime); virtual;
    procedure WriteDateTime(const Section, Name: string; Value: TDateTime); virtual;
    procedure WriteFloat(const Section, Name: string; Value: Double); virtual;
    procedure WriteTime(const Section, Name: string; Value: TDateTime); virtual;
    }
  end;

implementation

uses sbovclDataModuleImpl, sbovclInitPkg;

function TDBIniFile.ReadString(const Section, Ident, Default: string): string;
begin
  OpenIniFile;
  with sbovclDataModule.SBConfig do
    Result := CallStringFunction('ReadValue', [Section, Ident, Default]);
end;

procedure TDBIniFile.WriteString(const Section, Ident, Value: String);
begin
  OpenIniFile;
  with sbovclDataModule.SBConfig do
    CallProcedure('WriteValue', [Section, Ident, Value]);
end;

procedure TDBIniFile.ReadSection(const Section: string; Strings: TStrings);
begin
  OpenIniFile;
  with sbovclDataModule, ReadSectionQuery do
  begin
    ResultQuery.Close;
    ResultQuery.DeleteVariables;
    SetComplexVariable('SECTIONS', ResultQuery);
    SetVariable('Ident', Section);
    Execute;

    with ResultQuery do
    begin
      Execute;
      while not Eof do
      begin
        Strings.Add(Field(2));
        Next;
      end;
    end;

  end;
end;

procedure TDBIniFile.ReadSections(Strings: TStrings);
begin
  OpenIniFile;
  with sbovclDataModule, SectionsData do
  begin
    Close;
    Open;
    try
      while not Eof do
      begin
        Strings.Add(FieldByName('Name').AsString);
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TDBIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
begin
  OpenIniFile;
  with sbovclDataModule, ReadSectionValuesQuery do
  begin
    ResultQuery.Close;
    ResultQuery.DeleteVariables;
    SetComplexVariable('sections_values', ResultQuery);
    SetVariable('Ident', Section);
    Execute;

    with ResultQuery do
    begin
      Execute;
      while not Eof do
      begin
        Strings.Values[Field('Name')] := Field('Value');
        Next;
      end;
    end;

  end;
end;

procedure TDBIniFile.DeleteKey(const Section, Ident: String);
begin
end;

procedure TDBIniFile.UpdateFile;
begin
end;

procedure TDBIniFile.OpenIniFile;
begin
  if FIniFileID = 0 then
    with sbovclDataModule.SBConfig do
      FIniFileID := CallIntegerFunction('OpenFile', [FileName]);
end;

procedure TDBIniFile.Erase;
begin
end;

procedure TDBIniFile.Delete;
begin
end;

procedure TDBIniFile.AssignConfiguration(const Source: ICustomIniSource);
begin
end;

procedure TDBIniFile.EraseSection(const Ident: String);
begin
end;

procedure TDBIniFile.SetSession(Value: TOracleSession);
begin
  FPkg.Session := Value;
  FSession := Value;
end;

constructor TDBIniFile.Create(const FileName: String);
begin
  FPkg := TOraclePackage.Create(nil);
  FPkg.PackageName := 'SBCONFIG';
  inherited;
end;

destructor TDBIniFile.Destroy;
begin
  FPkg.Free;
  inherited;
end;

end.
