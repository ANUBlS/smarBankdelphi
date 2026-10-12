unit IniSourceViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniSource;

type
  TViewerIniSourceLink = class(TIniSourceLink)
  protected
    procedure DoStateChanged(Opened: Boolean); override;
  end;

  TIniSourceViewer = class(TMemo)
  private
    { Private declarations }
    FIniSource: TIniSource;
    FIniSourceLink: TIniSourceLink;
    procedure SetIniSource(Value: TIniSource);
  protected
    { Protected declarations }
    procedure StateChanged(Opened: Boolean); virtual;
  public
    { Public declarations }
    procedure Open;
    procedure Close;
    procedure Save; overload;
    procedure Save(IniSource: TCustomIniSource); overload;
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property IniSource: TIniSource read FIniSource write SetIniSource;
  end;

implementation

  { TIniSourceViewer }

function StrPas(const Str: PWideChar): UnicodeString;
begin
  Result := Str;
end;

procedure TIniSourceViewer.Open;
var
  Sections: TStrings;
  Index: Integer;
  SectionValues: TStringList;
begin
  if not (csDesigning in ComponentState) then
  begin
    Close;
    Sections := TStringList.Create;
    SectionValues := TStringList.Create;
    try
      IniSource.ReadSections(Sections);
      for Index := 0 to Sections.Count-1 do
      begin
        Lines.Add(Format('[%s]', [Sections[Index]]));
        IniSource.ReadSectionValues(Sections[Index], SectionValues);
        Lines.AddStrings(SectionValues);
        SectionValues.Clear;
        Lines.Add('');
      end;
      Modified := False;
    finally
      Sections.Free;
      SectionValues.Free;
    end;
  end;
end;

procedure TIniSourceViewer.Close;
begin
  Lines.Clear;
end;

procedure TIniSourceViewer.StateChanged(Opened: Boolean);
begin
  if Opened then
    Open
  else
    Close;
end;

constructor TIniSourceViewer.Create(AOwner: TComponent);
begin
  inherited;
  FIniSourceLink := TViewerIniSourceLink.Create(Self);;
end;

procedure TIniSourceViewer.SetIniSource(Value: TIniSource);
begin
  FIniSource := Value;
  FIniSourceLink.IniSource := IniSource;
  if IniSource.Active then
    Open;
end;

procedure TIniSourceViewer.Save;
begin
  Save(IniSource);
end;

procedure TIniSourceViewer.Save(IniSource: TCustomIniSource);
var
  TempSource: TIniSource;
  Buf: array[0..1023] of WideChar;  //char;
  TempPath: WideString; //String;
  TempFileName: String;
begin
  GetTempPath(1024, @Buf);
  TempPath := StrPas(@Buf);
  if GetTempFileName(PChar(TempPath), 'sbini_', 0, @Buf) = 0 then
    RaiseLastWin32Error;

  TempFileName := StrPas(@Buf);

  TempSource := TIniSource.Create(Self);
  with TempSource do
  try
    Location := Format('winini:%s', [TempFileName]);
    Lines.SaveToFile(TempFileName);
    try
      Open;
      IniSource.Upload(TempSource);
    finally
      DeleteFile(TempFileName);
    end;
  finally
    Free;
  end;
end;

  { TViewerIniSourceLink }

procedure TViewerIniSourceLink.DoStateChanged(Opened: Boolean);
begin
  with Owner as TIniSourceViewer do
    StateChanged(Opened);
end;

end.
