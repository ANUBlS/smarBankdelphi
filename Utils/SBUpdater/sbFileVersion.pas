unit sbFileVersion;
{*******************************************************************************
Unit:        sbFileVersion
Author:      Asif Nezerov
             Copyright (c) 2003 Smart Systems Technology Ltd.
             All rights reserved.
Date:        June 26, 2003
Description: Describes an object called TrsFileVersion that will retrieve
             version and build information from 32-bit executable files (exe,
             dll, ocx, vbx, vxd, drv, pdr, mpd, etc), if that information is
             present in the file.
Offical Thanks : Dimitry L. Akinshin from Smart Systems.
********************************************************************************}
interface

uses Windows, Classes, SysUtils;

type
  TFileVersion = class(TObject)
  private
    { Private declarations }
    FVersion: string;  {concatenation of major.minor.release}
    FMajor:   Integer; {major version number}
    FMinor:   Integer; {minor version number}
    FRelease: Integer; {release version number}
    FBuild:   Integer; {build number}
    procedure SetDefaultProperties;
    function  ReadVersionInfo(sProgram: string; Major, Minor,
                              Release, Build : pWord) :Boolean;
  public
    { Public declarations }
    property    Version: string  read FVersion;
    property    Major:   Integer read FMajor   default  0;
    property    Minor:   Integer read FMinor   default  0;
    property    Release: Integer read FRelease default  0;
    property    Build:   Integer read FBuild   default  0;
    constructor Create;
    function    GetFileVersion(sFile: string): boolean;
  end;

implementation

constructor TFileVersion.Create;
begin
  inherited Create;
  SetDefaultProperties;
end;

function TFileVersion.GetFileVersion(sFile: string): boolean;
var
  Major,Minor, Release, Build : Word;
begin
  {get version information from file sFile}
  Result := ReadVersionInfo(sFile, @Major, @Minor, @Release, @Build);
  if Result then begin
    FMajor   := Integer(Major);   {set major version property}
    FMinor   := Integer(Minor);   {set minor version property}
    FRelease := Integer(Release); {set release version property}
    FBuild   := Integer(Build);   {set build version property}
    FVersion := IntToStr(FMajor) + '.' + IntToStr(FMinor) + '.' +
                IntToStr(FRelease);
  end else begin
    SetDefaultProperties;
  end;
end;

procedure TFileVersion.SetDefaultProperties;
begin
  FVersion := '';
  FMajor :=   0;
  FMinor :=   0;
  FRelease := 0;
  FBuild :=   0;
end;

function TFileVersion.ReadVersionInfo(sProgram: string; Major, Minor,
                                        Release, Build : pWord) :Boolean;
var
  Info:       PVSFixedFileInfo;
  InfoSize:   Cardinal;
  nHwnd:      DWORD;
  BufferSize: DWORD;
  Buffer:     Pointer;
begin
  BufferSize := GetFileVersionInfoSize(pchar(sProgram),nHWnd); {Get buffer size}
  Result := True;
  if BufferSize <> 0 then begin {if zero, there is no version info}
    GetMem( Buffer, BufferSize); {allocate buffer memory}
    try
      if GetFileVersionInfo(PChar(sProgram),nHWnd,BufferSize,Buffer) then begin
        {got version info}
        if VerQueryValue(Buffer, '\', Pointer(Info), InfoSize) then begin
          {got root block version information}
          if Assigned(Major) then begin
            Major^ := HiWord(Info^.dwFileVersionMS); {extract major version}
          end;
          if Assigned(Minor) then begin
            Minor^ := LoWord(Info^.dwFileVersionMS); {extract minor version}
          end;
          if Assigned(Release) then begin
            Release^ := HiWord(Info^.dwFileVersionLS); {extract release version}
          end;
          if Assigned(Build) then begin
            Build^ := LoWord(Info^.dwFileVersionLS); {extract build version}
          end;
        end else begin
          Result := False; {no root block version info}
        end;
      end else begin
        Result := False; {couldn't extract version info}
      end;
    finally
      FreeMem(Buffer, BufferSize); {release buffer memory}
    end;
  end else begin
    Result := False; {no version info at all in the file}
  end;
end;

end.


