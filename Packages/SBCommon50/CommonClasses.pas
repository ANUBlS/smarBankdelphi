unit CommonClasses;

interface

type
  TDispatchedObject = class(TInterfacedObject, IUnknown, IDispatch)
  private
    FEventsSupported: Boolean;
    FOwner: TObject;
    FDispatchedObject: IDispatch;
    FEvent_IID: TGUID;
    FConnection: Longint;
    procedure SetEventsSupported(const Value: Boolean);
    function GetCanSupportEvents: Boolean;
  public
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

implementation

uses ComObj, Windows, ActiveX;

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

end.
