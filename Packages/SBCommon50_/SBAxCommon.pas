unit SBAxCommon;

interface

uses SBAxCommon_TLB, SysUtils, Classes;

type
  {  Parent for all IDispatch descendors }

  TDispatchedObject = class(TInterfacedObject, IUnknown, IDispatch)
  private
    FEventsSupported: Boolean;
    FOwner: TObject;
    FDispatchedObject: IDispatch;
    FEvent_IID: TGUID;
    FConnection: Longint;
    procedure SetEventsSupported(const Value: Boolean);
    function GetCanSupportEvents: Boolean;
  protected
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; virtual; stdcall;
    function _AddRef: Integer; virtual; stdcall;
    function _Release: Integer; virtual; stdcall;
    { IDispatch }
    function GetTypeInfoCount(out Count: Integer): HRESULT; virtual; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HRESULT; virtual; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HRESULT; virtual; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HRESULT; virtual; stdcall;
  public
    property DispatchedObject: IDispatch read FDispatchedObject write FDispatchedObject;
    property Event_IID: TGuid read FEvent_IID write FEvent_IID;
    property EventsSupported: Boolean read FEventsSupported write SetEventsSupported;
    property CanSupportEvents: Boolean read GetCanSupportEvents;
    destructor Destroy; override;
  end;

  { Parent for all event sinks (for automation object's events support) }

  TEventSink = class(TDispatchedObject)
  public
    constructor Create(AOwner: TObject; const ADispatchedObject: IDispatch;
      AEvent_IID: TGuid); virtual;
  end;

  TPluginAction = class(TDispatchedObject, IAction)
  protected
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function  Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function  Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function  Get_FullDescription: WideString; safecall;
    procedure Set_FullDescription(const Value: WideString); safecall;
    function  Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function  Get_Checked: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    function  Get_Default: WordBool; safecall;
    procedure Set_Default(Value: WordBool); safecall;
    procedure AxExecute; safecall;
    procedure AxUpdate; safecall;
    procedure IAction.Execute = AxExecute;
    procedure IAction.Update = AxUpdate;
  public
    procedure Execute;
    procedure Update; 
    property Name: WideString read Get_Name write Set_Name;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Descrption: WideString read Get_Description write Set_Description;
    property FullDescription: WideString read Get_FullDescription write Set_FullDescription;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Checked: WordBool read Get_Checked write Set_Checked;
    property Default: WordBool read Get_Default write Set_Default;
  end;

implementation

uses Windows, ActiveX, ComObj;

  { TDispatchedObject }

destructor TDispatchedObject.Destroy;
begin
  EventsSupported := False;
  inherited Destroy;
end;

procedure TDispatchedObject.SetEventsSupported(const Value: Boolean);
begin
  if Value then begin
    if (not FEventsSupported) and CanSupportEvents then begin
      InterfaceConnect(FDispatchedObject, Event_IID, Self, FConnection);
      FEventsSupported := False;
    end;
  end
  else
  if FEventsSupported and CanSupportEvents {be paranoid!} then begin
    // warning!
    // if one of the public properties DispatchedObject and/or Event_IID has been changed
    // after last SetEventSupported's call, we will have unpredicable result
    // in disconnection
    InterfaceDisconnect(DispatchedObject, Event_IID, FConnection);
    FEventsSupported := True;
  end;
end;

function TDispatchedObject.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  Result := E_NOINTERFACE;
  if GetInterface(IID, Obj) then
    Result := S_OK;
  if IsEqualGUID(IID, FEvent_IID) and GetInterface(IDispatch, Obj) then
    Result := S_OK;
end;

function TDispatchedObject._AddRef: Integer;
begin
  Result := 2;
end;

function TDispatchedObject._Release: Integer;
begin
  Result := 1;
end;

function TDispatchedObject.GetTypeInfoCount(out Count: Integer): HRESULT;
begin
  Result := 0;
end;

function TDispatchedObject.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HRESULT;
begin
  Result := E_NOTIMPL;
end;

function TDispatchedObject.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HRESULT;
begin
  Result := E_NOTIMPL;
end;

function TDispatchedObject.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HRESULT;
begin
  Result := E_UNEXPECTED;
end;

function TDispatchedObject.GetCanSupportEvents: Boolean;
begin
  Result := Assigned(FDispatchedObject) and
    not IsEqualGuid(FEvent_IID, GUID_NULL);
end;

  { TEventSink }

constructor TEventSink.Create(AOwner: TObject; const ADispatchedObject: IDispatch;
  AEvent_IID: TGuid);
begin
  inherited Create;
  FOwner := AOwner;
  FDispatchedObject := ADispatchedObject;
  FEvent_IID := AEvent_IID;
  EventsSupported := True;
end;

  { TPluginAction }

function  TPluginAction.Get_Name: WideString;
begin
  Result := (DispatchedObject as IAction).Get_Name;
end;

procedure TPluginAction.Set_Name(const Value: WideString);
begin
  (DispatchedObject as IAction).Set_Name(Value);
end;

function  TPluginAction.Get_Caption: WideString;
begin
  Result := (DispatchedObject as IAction).Get_Caption;
end;

procedure TPluginAction.Set_Caption(const Value: WideString);
begin
  (DispatchedObject as IAction).Set_Caption(Value);
end;

function  TPluginAction.Get_Description: WideString;
begin
  Result := (DispatchedObject as IAction).Get_Description;
end;

procedure TPluginAction.Set_Description(const Value: WideString);
begin
  (DispatchedObject as IAction).Set_Description(Value);
end;

function  TPluginAction.Get_FullDescription: WideString;
begin
  Result := (DispatchedObject as IAction).Get_FullDescription;
end;

procedure TPluginAction.Set_FullDescription(const Value: WideString);
begin
  (DispatchedObject as IAction).Set_FullDescription(Value);
end;

function  TPluginAction.Get_Enabled: WordBool;
begin
  Result := (DispatchedObject as IAction).Get_Enabled;
end;

procedure TPluginAction.Set_Enabled(Value: WordBool);
begin
  (DispatchedObject as IAction).Set_Enabled(Value);
end;

function  TPluginAction.Get_Checked: WordBool;
begin
  Result := (DispatchedObject as IAction).Get_Checked;
end;

procedure TPluginAction.Set_Checked(Value: WordBool);
begin
  (DispatchedObject as IAction).Set_Checked(Value);
end;

function  TPluginAction.Get_Default: WordBool;
begin
  Result := (DispatchedObject as IAction).Get_Default;
end;

procedure TPluginAction.Set_Default(Value: WordBool);
begin
  (DispatchedObject as IAction).Set_Default(Value);
end;

procedure TPluginAction.AxExecute;
begin
  (DispatchedObject as IAction).Execute;
end;

procedure TPluginAction.AxUpdate;
begin
  (DispatchedObject as IAction).Update;
end;

procedure TPluginAction.Execute;
begin
  AxExecute;
end;

procedure TPluginAction.Update;
begin
  AxUpdate;
end;

end.
