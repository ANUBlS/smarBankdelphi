unit XFormExp;

interface

procedure Register;

implementation

uses Windows, SysUtils, Classes, ExptIntf, ToolIntf, IStreams, DsgnIntf, ActiveX,  XForm;

type
  TXFormExpert = class(TIExpert)
    function GetName: string; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
    function GetStyle: TExpertStyle; override;
    function GetState: TExpertState; override;
    function GetIDString: string; override;
    function GetAuthor: string; override;
    function GetPage: string; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

{ TXFormExpert }
const
  XFormName = 'XForm';

function TXFormExpert.GetName: string;
begin
  Result := XFormName;
end;

function TXFormExpert.GetComment: string;
begin
  Result := 'Screen docking and event enhaced form';
end;

function TXFormExpert.GetGlyph: HICON;
begin
  Result := LoadIcon(HInstance, '');
end;

function TXFormExpert.GetStyle: TExpertStyle;
begin
  Result := esForm;
end;

function TXFormExpert.GetState: TExpertState;
begin
  Result := [esEnabled];
end;

function TXFormExpert.GetIDString: string;
begin
  Result := XFormName + '.Expert';
end;

function TXFormExpert.GetAuthor: string;
begin
  Result := 'Roman Štìdronský';
end;

function TXFormExpert.GetPage: string;
begin
  Result := 'New';
end;

function TXFormExpert.GetMenuText: string;
begin
  Result := '';
end;

const
  FormUnitSource =
    'unit %0:s;'#13#10 +
    #13#10 +
    'interface'#13#10 +
    #13#10 +
    'uses Windows, Forms, XForm;'#13#10 +
    #13#10 +
    'type'#13#10 +
    '  T%1:s = class(TXForm)'#13#10 +
    '  private'#13#10 +
    '    { Private declarations }'#13#10 +
    '  public'#13#10 +
    '    { Public declarations }'#13#10 +
    '  end;'#13#10 +
    #13#10 +
    'var'#13#10 +
    '  %1:s: T%1:s;'#13#10 +
    #13#10 +
    'implementation'#13#10 +
    #13#10 +
    '{$R *.DFM}'#13#10 +
    #13#10 +
    'end.'#13#10;

  FormDfmSource = 'object %s: T%0:s end';

procedure TXFormExpert.Execute;
var
  UnitIdent, Filename: string;
  FormName: string;
  CodeStream: IStream;
  DFMStream: IStream;
  DFMString, DFMVCLStream: TStream;
begin
  if not ToolServices.GetNewModuleName(UnitIdent, FileName) then Exit;
  FormName := XFormName + Copy(UnitIdent, 5, 255);
  CodeStream := TIStreamAdapter.Create(TStringStream.Create(
    Format(FormUnitSource, [UnitIdent, FormName])), soOwned);
  try
    CodeStream._AddRef;
    DFMString := TStringStream.Create(Format(FormDfmSource, [FormName]));
    try
      DFMVCLStream := TMemoryStream.Create;
      try
        ObjectTextToResource(DFMString, DFMVCLStream);
        DFMVCLStream.Position := 0;
      except
        DFMVCLStream.Free;
      end;
      DFMStream := IStream(TIStreamAdapter.Create(DFMVCLStream, soOwned));
      try
        DFMStream._AddRef;
        ToolServices.CreateModuleEx(FileName, FormName, 'T' + XFormName, '', CodeStream, DFMStream,
          [cmAddToProject, cmShowSource, cmShowForm, cmUnNamed, cmMarkModified]);
      finally
        DFMStream._Release;
      end;
    finally
      DFMString.Free;
    end;
  finally
    CodeStream._Release;
  end;
end;

procedure Register;
begin
  RegisterCustomModule(TXForm, TCustomModule);
  RegisterLibraryExpert(TXFormExpert.Create);
end;

end.

