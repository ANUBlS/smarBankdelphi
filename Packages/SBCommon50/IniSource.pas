unit IniSource;

interface

  { debit ReadSection... }

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  CustomInst, SBAxCommon50_TLB, IniFiles, Registry, CommonClasses,
  Dialogs, StdVcl, AxCtrls;

type
  EIniSourceError = class(Exception);
  EIniSourceNotOpened = class(EIniSourceError);
  ENotImplemented = class(EIniSourceError);

  TIniFileClass = class of TCustomIniFile;

  EDelayedInstanceError = class(Exception);

  TDelayedInstance = class(TCustomInstance)
  private
    FActualState: Boolean;
  protected
    function CheckChangeState(WantOpen: Boolean): Boolean; virtual;
    procedure TryChangeState(DoOpen: Boolean; FailIfNotReady: Boolean); virtual;
    procedure ChangeState(DoOpen: Boolean); virtual;
    procedure DoOpen; override;
    procedure DoClose; override;
    property ActualState: Boolean read FActualState;
  end;

  TIniSourceLinks = class;

  TCustomIniSource = class(TDelayedInstance, ICustomIniSource)
  private
    FLocation: String;
    FDefaultSection: String;
    FModified: Boolean;
    FLinks: TIniSourceLinks;
    FHostIniSource: ICustomIniSource;
    FOleObject: ICustomIniSource;
  protected
    procedure SetLocation(const Value: String); virtual;
    procedure ChangeState(DoOpen: Boolean); override;
    procedure ConfigRequired(const IniSource: ICustomIniSource); virtual; safecall;
    { ICustomIniSource  support}
    function  Get_Location: WideString; safecall;
    procedure Set_Location(const Value: WideString); virtual; safecall;
    function  Get_DefaultSection: WideString; safecall;
    procedure Set_DefaultSection(const Value: WideString); safecall;
    function Get_Modified: WordBool; safecall;
    function  AxReadValue(const Section: WideString; const Name: WideString;
      DefaultValue: OleVariant): OleVariant; safecall;
    procedure AxWriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
      ValueType: Integer); safecall;
    procedure AxReadSections(const Sections: IStrings); safecall;
    procedure AxReadSectionValues(const Ident: WideString;
      const Strings: IStrings); safecall;
    procedure AxReadSection(const Ident: WideString; const Strings: IStrings); safecall;
    function Get_HostIniSource: ICustomIniSource; safecall;
    procedure Set_HostIniSource(const Value: ICustomIniSource); safecall;
    function  ICustomIniSource.ReadValue = AxReadValue;
    procedure ICustomIniSource.WriteValue = AxWriteValue;
    procedure ICustomIniSource.ReadSections = AxReadSections;
    procedure ICustomIniSource.ReadSectionValues = AxReadSectionValues;
    procedure ICustomIniSource.ReadSection = AxReadSection;
    property Links: TIniSourceLinks read FLinks;
  public
    { ICustomIniSource support }
    function  ReadValue(const Section: String; const Name: String;
      const DefaultValue: Variant): Variant; virtual; abstract;
    procedure WriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
      ValueType: Integer); virtual; abstract;
    procedure UpdateIniFile; safecall;
    procedure ReloadIniFile; safecall;
    property Modified: Boolean read FModified;
    procedure Erase; virtual; safecall; abstract;
    procedure Delete; virtual; safecall; abstract;
    procedure Upload(const Source: ICustomIniSource); virtual; safecall;
    procedure EraseSection(const Ident: WideString); virtual; safecall; abstract;
    procedure ReadSections(Sections: TStrings); virtual; abstract;
    procedure ReadSectionValues(const Ident: WideString;
      const Strings: TStrings); virtual; abstract;
    procedure ReadSection(const Ident: String; Strings: TStrings); virtual; abstract;
    property OleObject: ICustomIniSource read FOleObject;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Location: String read FLocation write SetLocation;
    property DefaultSection: String read FDefaultSection write FDefaultSection;
    property Active;
    property ActualState;
  end;

  TIniSourceClass = class of TCustomIniSource;

  TWinIniSource = class(TCustomIniSource)
  private
    FIniFile: TCustomIniFile;
    FIniFileClass: TIniFileClass;
  protected
    procedure DoOpen; override;
    procedure DoClose; override;
  public
    property IniFile: TCustomIniFile read FIniFile write FIniFile;
    property IniFileClass: TIniFileClass read FIniFileClass write FIniFileClass;
    function  ReadValue(const Section: String; const Name: String;
      const DefaultValue: Variant): Variant; override;
    procedure WriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
      ValueType: Integer); override;
    procedure Erase; override;
    procedure EraseSection(const Ident: WideString); override; safecall;
    procedure ReadSectionValues(const Ident: WideString; const Strings: TStrings); override;
    procedure ReadSections(Sections: TStrings); override;
    procedure ReadSection(const Ident: String; Strings: TStrings); override;
  end;

  TFileIniSource = class(TWinIniSource, IFileIniSource)
  protected
    { we need this to complete support of IFileIniSource :((( }
    function  IFileIniSource.ReadValue = AxReadValue;
    procedure IFileIniSource.WriteValue = AxWriteValue;
    procedure IFileIniSource.ReadSections = AxReadSections;
    procedure IFileIniSource.ReadSectionValues = AxReadSectionValues;
    procedure IFileIniSource.ReadSection = AxReadSection;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TMemIniSource = class(TWinIniSource, IMemIniSource)
  protected
    function  IMemIniSource.ReadValue = AxReadValue;
    procedure IMemIniSource.WriteValue = AxWriteValue;
    procedure IMemIniSource.ReadSections = AxReadSections;
    procedure IMemIniSource.ReadSectionValues = AxReadSectionValues;
    procedure IMemIniSource.ReadSection = AxReadSection;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TRegIniSource = class(TWinIniSource, IRegIniSource)
  protected
    function  IRegIniSource.ReadValue = AxReadValue;
    procedure IRegIniSource.WriteValue = AxWriteValue;
    procedure IRegIniSource.ReadSections = AxReadSections;
    procedure IRegIniSource.ReadSectionValues = AxReadSectionValues;
    procedure IRegIniSource.ReadSection = AxReadSection;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIniSource = class;
  TIniSourceNotifyProc = TNotifyEvent;

  TIniSource = class(TCustomIniSource, IIniSource{, ICustomIniSource})
  private
    FIniSourceType: TIniSourceType;
//    FHostIniSource: ICustomIniSource;
    FCreateIniSourceEvent: TIniSourceNotifyProc;
  protected
    procedure SetLocation(const Value: String); override;
    procedure ChangeState(DoOpen: Boolean); override;
    function CheckChangeState(WantOpen: Boolean): Boolean; override;
    {IIniSource}
    function  Get_IniSourceType: TIniSourceType; safecall;
    procedure Set_IniSourceType(const Value: TIniSourceType); safecall;
    function  IIniSource.ReadValue = AxReadValue;
    procedure IIniSource.WriteValue = AxWriteValue;
    procedure IIniSource.ReadSections = AxReadSections;
    procedure IIniSource.ReadSectionValues = AxReadSectionValues;
    procedure IIniSource.ReadSection = AxReadSection;
  public
    {IIniSource}
    function  ReadValue(const Section: String; const Name: String;
      const DefaultValue: Variant): Variant; override;
    procedure WriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
      ValueType: Integer); override;
    property IniSourceType: TIniSourceType read Get_IniSourceType write Set_IniSourceType;
    property HostIniSource: ICustomIniSource read FHostIniSource;
    procedure ReadSections(Sections: TStrings); override;
    procedure ReadSectionValues(const Ident: WideString;
      const Strings: TStrings); override;
    procedure ReadSection(const Ident: String; Strings: TStrings); override;
    procedure Upload(const Source: ICustomIniSource); override; safecall;
//    property OleObject: ICustomIniSource read FOleObject implements ICustomIniSource;
//    property IniSourceType: TIniSourceType read Get_IniSourceType write Set_IniSourceType;
    {ICustomIniSource}
    procedure ConfigRequired(const IniSource: ICustomIniSource); override; safecall;
  published
    property OnCreateIniSource: TIniSourceNotifyProc read FCreateIniSourceEvent write FCreateIniSourceEvent;
  end;

  TIniSourceManager = class(TDispatchedObject, IIniSourceManager)
  private
    FIniClasses: TList;
  protected
    { IIniSourceManager support }
    function  Get_Factory(Index: Integer): IIniSourceFactory; safecall;
    procedure Set_Factory(Index: Integer; const Value: IIniSourceFactory); safecall;
  public
    constructor Create;
    destructor Destroy; override;
    function  RegFactory(const Factory: IIniSourceFactory): Integer; safecall;
    procedure UnRegFactory(Index: Integer); safecall;
    property Factories[Index: Integer]: IIniSourceFactory read Get_Factory write Set_Factory;
    function CreateIniSource(IniSourceType: TIniSourceType): ICustomIniSource;
  end;

  TIniSourceFactory = class(TDispatchedObject, IIniSourceFactory)
  private
    FIniSourceClass: TIniSourceClass;
    FIniSourceType: TIniSourceType;
    FObjOwner: TComponent;
  protected
    function  Get_IniSourceType: WideString; safecall;
    procedure Set_IniSourceType(const Value: WideString); safecall;
  public
    function CreateIniSource(Owner: OleVariant; var Param: OleVariant): ICustomIniSource; virtual; safecall;
    constructor Create(ObjOwner: TComponent; IniSourceClass: TIniSourceClass; IniSourceType: TIniSourceType);
    property IniSourceClass: TIniSourceClass read FIniSourceClass;
    property IniSourceType: TIniSourceType read FIniSourceType;
  end;

  TIniSourceLink = class(TPersistent)
  private
    FIniSource: TCustomIniSource;
    FIndex: Integer;
    FOwner: TComponent;
    procedure SetIniSource(Value: TCustomIniSource);
  protected
    procedure DoStateChanged(Opened: Boolean); virtual; abstract;
  public
    procedure StateChanged(Opened: Boolean);
    property IniSource: TCustomIniSource read FIniSource write SetIniSource;
    property Index: Integer read FIndex;
    constructor Create(AOwner: TComponent); virtual;
    property Owner: TComponent read FOwner;
  end;

  TIniSourceLinks = class(TObject)
  private
    FList: TList;
    FNotificationEnabled: Boolean;
    function GetLink(Index: Integer): TIniSourceLink;
    procedure SetLink(Index: Integer; Value: TIniSourceLink);
    function GetCount: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Items[Index: Integer]: TIniSourceLink read GetLink write SetLink; default;
    function Add(Value: TIniSourceLink): Integer;
    procedure Remove(Index: Integer);
    procedure EnableNotification;
    procedure DisableNotification;
    procedure StateChanged(Opened: Boolean);
    property NotificationEnabled: Boolean read FNotificationEnabled;
    property Count: Integer read GetCount;
  end;

var
  IniSourceManager: TIniSourceManager = nil;

const
  istRegistry = 'registry';
  istMemory = 'memory';
  istWinIniFile = 'winini';

implementation

procedure TDelayedInstance.TryChangeState(DoOpen: Boolean; FailIfNotReady: Boolean);
begin
  if CheckChangeState(DoOpen) then
    ChangeState(DoOpen)
  else
  if FailIfNotReady then
    raise EDelayedInstanceError.Create('Failed to change instance state');  
end;

function TDelayedInstance.CheckChangeState(WantOpen: Boolean): Boolean;
begin
  Result := True;
end;

procedure TDelayedInstance.ChangeState(DoOpen: Boolean);
begin
  FActualState := DoOpen;
end;

procedure TDelayedInstance.DoOpen;
begin
  TryChangeState(True, False);
end;

procedure TDelayedInstance.DoClose;
begin
  TryChangeState(False, False);
end;

  { TCustomIniSource }

constructor TCustomIniSource.Create(AOwner: TComponent);
begin
  inherited;
  FLinks := TIniSourceLinks.Create;
end;

destructor TCustomIniSource.Destroy;
begin
  FLinks.Free;
  inherited;
end;

function  TCustomIniSource.Get_Location: WideString;
begin
  Result := Location;
end;

procedure TCustomIniSource.Set_Location(const Value: WideString);
begin
  Location := Value;
end;

procedure TCustomIniSource.UpdateIniFile;
begin
  FModified := False;
end;

procedure TCustomIniSource.ReloadIniFile;
begin
  FModified := False;
end;

function  TCustomIniSource.Get_DefaultSection: WideString;
begin
  Result := DefaultSection;
end;

procedure TCustomIniSource.Set_DefaultSection(const Value: WideString);
begin
  DefaultSection := Value;
end;

procedure TCustomIniSource.SetLocation(const Value: String);
begin
  FLocation := Value;
end;

procedure TCustomIniSource.ChangeState(DoOpen: Boolean);
begin
  Links.StateChanged(DoOpen);
end;

procedure TCustomIniSource.ConfigRequired(const IniSource: ICustomIniSource);
begin
  OleObject.ConfigRequired(IniSource);
end;

function TCustomIniSource.Get_Modified: WordBool;
begin
  Result := Modified;
end;

function  TCustomIniSource.AxReadValue(const Section: WideString; const Name: WideString;
  DefaultValue: OleVariant): OleVariant;
begin
  Result := ReadValue(Section, Name, DefaultValue);
end;

procedure TCustomIniSource.AxWriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
  ValueType: Integer);
begin
  WriteValue(Section, Name, Value, ValueType);
end;

procedure StringsToOleStrings(Strings: TStrings; OleStrings: IStrings);
var
  I: Integer;
begin
  for I := 0 to Strings.Count-1 do
    OleStrings.Add(Strings.Strings[I]);
end;

procedure TCustomIniSource.AxReadSections(const Sections: IStrings);
var
  ASections: TStrings;
begin
  ASections := TStringList.Create;
  try
    ReadSections(ASections);
    StringsToOleStrings(ASections, Sections);
  finally
    ASections.Free;
  end;
end;

procedure TCustomIniSource.AxReadSectionValues(const Ident: WideString;
  const Strings: IStrings); safecall;
var
  AStrings: TStrings;
begin
  AStrings := TStringList.Create;
  try
    ReadSectionValues(Ident, AStrings);
    StringsToOleStrings(AStrings, Strings);
  finally
    AStrings.Free;
  end;
end;

procedure TCustomIniSource.AxReadSection(const Ident: WideString; const Strings: IStrings);
var
  AStrings: TStrings;
begin
  AStrings := TStringList.Create;
  try
    ReadSection(Ident, AStrings);
    StringsToOleStrings(AStrings, Strings);
  finally
    AStrings.Free;
  end;
end;

function TCustomIniSource.Get_HostIniSource: ICustomIniSource;
begin
  Result := FHostIniSource;
end;

procedure TCustomIniSource.Set_HostIniSource(const Value: ICustomIniSource);
begin
  FHostIniSource := Value;
end;

procedure TCustomIniSource.Upload(const Source: ICustomIniSource);
var
  Sections: TStrings;
  OleSections: IStrings;
  SectionValues: TStrings;
  OleValues: IStrings;
  Index, VIndex: Integer;
  KeyName: String;
begin
  Erase;
  Sections := TStringList.Create;
  SectionValues := TStringList.Create;
  try
    GetOleStrings(Sections, OleSections);
    GetOleStrings(SectionValues, OleValues);
    Source.ReadSections(OleSections);

    for Index := 0 to Sections.Count-1 do
    begin
      SectionValues.Clear;
      Source.ReadSectionValues(Sections[Index], OleValues);
      for VIndex := 0 to SectionValues.Count-1 do
      begin
        KeyName := SectionValues.Names[VIndex];
        WriteValue(Sections[Index], KeyName, SectionValues.Values[KeyName], 0);
      end;
    end;

  finally
    Sections.Free;
    SectionValues.Free;
  end;
end;

  { TWinIniSource }

procedure TWinIniSource.DoOpen;
begin
  FIniFile := IniFileClass.Create(Copy(Location, Pos(':', Location)+1, Length(Location)));
end;

procedure TWinIniSource.DoClose;
begin
  FIniFile.Free;
  inherited;
end;

function TWinIniSource.ReadValue(const Section: String; const Name: String;
  const DefaultValue: Variant): Variant;
begin
//  inherited ReadValue(Section, Name, DefaultValue);
  Result := FIniFile.ReadString(Section, Name, DefaultValue);
end;

procedure TWinIniSource.WriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
  ValueType: Integer);
begin
//  inherited;
  FIniFile.WriteString(Section, Name, Value);
end;

procedure TWinIniSource.Erase;
var
  Index: Integer;
  Sections: TStrings;
begin
  Sections := TStringList.Create;
  try
    ReadSections(Sections);
    for Index := 0 to Sections.Count-1 do
      EraseSection(Sections[Index]);
  finally
    Sections.Free;
  end;
end;

procedure TWinIniSource.EraseSection(const Ident: WideString);
begin
  FIniFile.EraseSection(Ident);
end;

procedure TWinIniSource.ReadSectionValues(const Ident: WideString; const Strings: TStrings);
begin
  FIniFile.ReadSectionValues(Ident, Strings);
end;

procedure TWinIniSource.ReadSections(Sections: TStrings);
begin
  FIniFile.ReadSections(Sections);
end;

procedure TWinIniSource.ReadSection(const Ident: String; Strings: TStrings);
begin
  FIniFile.ReadSection(Ident, Strings);
end;

  { TFileIniSource }

constructor TFileIniSource.Create(AOwner: TComponent);
begin
  inherited;
  IniFileClass := TIniFile;
end;

  { TMemIniSource }

constructor TMemIniSource.Create(AOwner: TComponent);
begin
  inherited;
  IniFileClass := TMemIniFile;
end;

  { TRegIniSource }

constructor TRegIniSource.Create(AOwner: TComponent);
begin
  inherited;
  IniFileClass := TRegistryIniFile;
end;

  { TIniSource }

procedure TIniSource.SetLocation(const Value: String);
var
  Position: Integer;
begin
  Position := Pos(':', Value);

  if Position <> 0 then
    IniSourceType := Copy(Value, 1, Position-1);

  inherited SetLocation(Value);
  TryChangeState(Active, False);
end;

procedure TIniSource.ChangeState(DoOpen: Boolean);
begin
  if DoOpen and (not (csDesigning in ComponentState)) then
  begin
    {temporary commented}
//    FOleObject := IniSourceManager.CreateIniSource(Self, IniSourceType);
    FHostIniSource := IniSourceManager.CreateIniSource(IniSourceType);
    FHostIniSource.Location := Location;
    FHostIniSource.Open;
    if Assigned(OnCreateIniSource) then
      OnCreateIniSource(Self);
  end;
  inherited;
end;

function TIniSource.CheckChangeState(WantOpen: Boolean): Boolean;
begin
  Result :=
    (WantOpen and (Location <> '') and (IniSourceType <> ''))
    or ((not WantOpen) and (not ActualState));
end;

procedure TIniSource.ConfigRequired(const IniSource: ICustomIniSource);
begin
//  IniSource.
  {do not call to inherited!!!}
end;

function  TIniSource.ReadValue(const Section: String; const Name: String;
  const DefaultValue: Variant): Variant;
begin
  Result := FHostIniSource.ReadValue(Section, Name, DefaultValue);
end;

procedure TIniSource.WriteValue(const Section: WideString; const Name: WideString; Value: OleVariant;
  ValueType: Integer);
begin
  FHostIniSource.WriteValue(Section, Name, Value, ValueType);
end;

function  TIniSource.Get_IniSourceType: TIniSourceType;
begin
  Result := FIniSourceType;
end;

procedure TIniSource.Set_IniSourceType(const Value: TIniSourceType);
begin
  FIniSourceType := Value;
end;

procedure TIniSource.ReadSections(Sections: TStrings);
var
  OleStrings: IStrings;
begin
  GetOleStrings(Sections, OleStrings);
  FHostIniSource.ReadSections(OleStrings);
end;

procedure TIniSource.ReadSectionValues(const Ident: WideString;
  const Strings: TStrings);
var
  OleStrings: IStrings;
begin
  GetOleStrings(Strings, OleStrings);
  FHostIniSource.ReadSectionValues(Ident, OleStrings);
end;

procedure TIniSource.ReadSection(const Ident: String; Strings: TStrings);
var
  OleStrings: IStrings;
begin
  GetOleStrings(Strings, OleStrings);
  FHostIniSource.ReadSection(Ident, OleStrings);
end;

procedure TIniSource.Upload(const Source: ICustomIniSource);
begin
  FHostIniSource.Upload(Source);
end;

  { TIniSourceManager }

function  TIniSourceManager.RegFactory(const Factory: IIniSourceFactory): Integer;
begin
  Result := FIniClasses.Add(Pointer(Factory));
end;

procedure TIniSourceManager.UnRegFactory(Index: Integer);
begin
  FIniClasses.Delete(Index);
end;

function  TIniSourceManager.Get_Factory(Index: Integer): IIniSourceFactory;
begin
  Result := IIniSourceFactory(FIniClasses.Items[Index]);
end;

procedure TIniSourceManager.Set_Factory(Index: Integer; const Value: IIniSourceFactory);
begin
  FIniClasses.Items[Index] := Pointer(Value);
end;

function TIniSourceManager.CreateIniSource(IniSourceType: TIniSourceType): ICustomIniSource;
var
  Index: Integer;
  Param: OleVariant;
begin
  for Index := 0 to FIniClasses.Count-1 do
  begin
    if Factories[Index].IniSourceType = IniSourceType then
    begin
      Param := VarNull;
      Result := Factories[Index].CreateIniSource(VarNull, Param);
//      Result.HostIniSource := Caller;
      exit;
    end;
  end;
  raise ENotImplemented.CreateFmt('IniSourceType "%s" not implemented', [IniSourceType]);
end;

var
  {
   List to store locally registered factories
   created in constructor of TIniSourceManager
   List items MUST be a TIniSourceFactory's (or descendants) instances
   List items should be terminated in destructor of TIniSourceManager
  }
  
  FactoriesToTerminate: TList;

constructor TIniSourceManager.Create;
begin
  FIniClasses := TList.Create;
  FactoriesToTerminate := TList.Create;
  inherited Create;
end;

destructor TIniSourceManager.Destroy;
var
  Index: Integer;
begin
  FIniClasses.Free;
  for Index := 0 to FactoriesToTerminate.Count-1 do
    TIniSourceFactory(FactoriesToTerminate[Index]).Free;
  FactoriesToTerminate.Free;
  inherited;
end;

  { TIniSourceFactory }

constructor TIniSourceFactory.Create(ObjOwner: TComponent; IniSourceClass: TIniSourceClass; IniSourceType: TIniSourceType);
begin
  inherited Create;
  FIniSourceClass := IniSourceClass;
  FIniSourceType := IniSourceType;
  FObjOwner := ObjOwner;
  FactoriesToTerminate.Add(Self);
end;

function TIniSourceFactory.CreateIniSource(Owner: OleVariant; var Param: OleVariant): ICustomIniSource;
begin
  Result := IniSourceClass.Create(nil);
end;

function  TIniSourceFactory.Get_IniSourceType: WideString;
begin
  Result := FIniSourceType;
end;

procedure TIniSourceFactory.Set_IniSourceType(const Value: WideString);
begin
  FIniSourceType := Value;
end;

  { TIniSourceLink }

procedure TIniSourceLink.SetIniSource(Value: TCustomIniSource);
begin
  if FIniSource <> nil then
    FIniSource.Links.Remove(Index);
  FIniSource := nil;
  if Value <> nil then
  begin
    FIndex := Value.Links.Add(Self);
    FIniSource := Value;
  end;
end;

constructor TIniSourceLink.Create(AOwner: TComponent);
begin
  inherited Create;
  FOwner := AOwner;
end;

procedure TIniSourceLink.StateChanged(Opened: Boolean);
begin
  DoStateChanged(Opened);
end;

  { TIniSourceLinks }

constructor TIniSourceLinks.Create;
begin
  inherited;
  FList := TList.Create;
  EnableNotification;
end;

destructor TIniSourceLinks.Destroy;
begin
  FList.Free;
  inherited;
end;

function TIniSourceLinks.GetLink(Index: Integer): TIniSourceLink;
begin
  Result := FList.Items[Index];  
end;

procedure TIniSourceLinks.SetLink(Index: Integer; Value: TIniSourceLink);
begin
  FList.Items[Index] := Value;
end;

function TIniSourceLinks.Add(Value: TIniSourceLink): Integer;
begin
  Result := FList.Add(Value);
end;

procedure TIniSourceLinks.Remove(Index: Integer);
begin
  FList.Delete(Index);
end;

procedure TIniSourceLinks.EnableNotification;
begin
  FNotificationEnabled := True;
end;

procedure TIniSourceLinks.DisableNotification;
begin
  FNotificationEnabled := False;
end;

procedure TIniSourceLinks.StateChanged(Opened: Boolean);
var
  Index: Integer;
begin
  if NotificationEnabled then
    for Index := 0 to Count-1 do
      Items[Index].StateChanged(Opened);
end;

function TIniSourceLinks.GetCount: Integer;
begin
  Result := FList.Count;
end;

initialization

  IniSourceManager := TIniSourceManager.Create;

  { Register currently defined Ini sources }
  IniSourceManager.RegFactory( TIniSourceFactory.Create( nil, TFileIniSource, istWinIniFile ) );
  IniSourceManager.RegFactory( TIniSourceFactory.Create( nil, TMemIniSource,  istMemory     ) );
  IniSourceManager.RegFactory( TIniSourceFactory.Create( nil, TRegIniSource,  istRegistry   ) );

finalization

  { Registered factories, which descends from TIniSourceFactory
    will be automatically terminated when IniSourceManager destroyed }

  IniSourceManager.Free;

end.
