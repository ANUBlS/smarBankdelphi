unit ObjectEventManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CustomInst;

type
  TEventNotificationProc = procedure(
    Sender: TObject;
    Source: TObject;
    const EventName: String;
    const args: array of const) of object;

  TEventClient = record
    NotificationProc        : TEventNotificationProc;
    EventName               : ShortString;
    EventSource             : TObject;
  end;

  PEventClient = ^TEventClient;

  TObjectEventManager = class(TComponent)
  private
    { Private declarations }
    FEventClients       : TList;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CallEvent(const AEventName: String; Source: TObject; const args: array of const);
    procedure AddEventNotification(const AEventName: String; AEventSource: TObject; EventNotificationProc: TEventNotificationProc);
    procedure DropEventNotification(const AEventName: String; AEventSource: TObject; EventNotificationProc: TEventNotificationProc);
  published
    { Published declarations }
  end;

  TEventManagerClient = class(TCustomInstance)
  private
    FEventName          : String;
    FEventSource        : TObject;
    FEventManager       : TObjectEventManager;
    FOnEvent            : TEventNotificationProc;
    procedure SetEventName(const Value: String);
    procedure SetEventSource(Value: TObject);
    procedure SetEventManager(Value: TObjectEventManager);
    procedure NotificationProc(Sender: TObject; Source: TObject; const EventName: String; const Args: array of const);
  protected
    procedure DoOpen; override;
    procedure DoClose; override;
  public
  published
    property EventManager: TObjectEventManager read FEventManager write SetEventManager;
    property EventName: String read FEventName write SetEventName;
    property EventSource: TObject read FEventSource write SetEventSource;
    property OnEvent: TEventNotificationProc read FOnEvent write FOnEvent;
  end;

var
  GlobalEventManager        : TObjectEventManager = nil;

procedure Register;

implementation

procedure TObjectEventManager.CallEvent(const AEventName: String; Source: TObject; const args: array of const);
var
  i       : Integer;
begin
  with FEventClients do
    for i:=0 to Count-1 do
      with PEventClient(Items[i])^ do
      begin
        if AEventName <> '' then
          if EventName <> AEventName then
            Continue;
        if EventSource <> nil then
          if Source <> EventSource then
            Continue;
        NotificationProc(Self, Source, AEventName, args);
      end;
end;

procedure TObjectEventManager.AddEventNotification(const AEventName: String; AEventSource: TObject; EventNotificationProc: TEventNotificationProc);
var
  NewEventClient        : PEventClient;
begin
  new(NewEventClient);
  with NewEventClient^ do
  begin
    NotificationProc := EventNotificationProc;
    EventName := AEventName;
    EventSource := AEventSource;
  end;
  FEventClients.Add(NewEventClient);
end;

procedure TObjectEventManager.DropEventNotification(const AEventName: String; AEventSource: TObject; EventNotificationProc: TEventNotificationProc);
var
  i               : Integer;
  EventClient     : PEventClient;
begin
  with FEventClients do
    for i:=0 to Count-1 do
    begin
      EventClient := PEventClient(Items[i]);
      with EventClient^ do
        if
          (EventName = AEventName)
          and (EventSource = AEventSource)
          and (@NotificationProc = @EventNotificationProc)
        then
        begin
          Delete(i);
          Dispose(EventClient);
          break;
        end;
    end;
end;

constructor TObjectEventManager.Create(AOwner: TComponent);
begin
  FEventClients := TList.Create;
  inherited;
end;

destructor TObjectEventManager.Destroy;
begin
  if Assigned(FEventClients) then
  begin
    while FEventClients.Count > 0 do
    begin
      dispose(FEventClients.Last);
      FEventClients.Delete(FEventClients.Count-1);
    end;
    FEventClients.Free;
  end;
  inherited;
end;

  { TEventManagerClient }

procedure TEventManagerClient.SetEventName(const Value: String);
begin
  Close;
  FEventName := Value;
  Open;
end;

procedure TEventManagerClient.SetEventSource(Value: TObject);
begin
  Close;
  FEventSource := Value;
  Open;
end;

procedure TEventManagerClient.SetEventManager(Value: TObjectEventManager);
begin
  Close;
  FEventManager := Value;
  Open;
end;

procedure TEventManagerClient.NotificationProc(
  Sender: TObject;
  Source: TObject;
  const EventName: String;
  const Args: array of const);
begin
  if Assigned(FOnEvent) then
    FOnEvent(Sender, Source, EventName, Args);
end;

procedure TEventManagerClient.DoOpen;
var
  Manager       : TObjectEventManager;
begin
  if EventManager = nil then
    Manager := GlobalEventManager
  else
    Manager := EventManager;
  Manager.AddEventNotification(EventName, Manager, NotificationProc);
end;

procedure TEventManagerClient.DoClose;
var
  Manager       : TObjectEventManager;
begin
  if EventManager = nil then
    Manager := GlobalEventManager
  else
    Manager := EventManager;
  Manager.DropEventNotification(EventName, Manager, NotificationProc);
end;

procedure Register;
begin
  RegisterComponents('Smart', [TObjectEventManager, TEventManagerClient]);
end;

initialization
  GlobalEventManager := TObjectEventManager.Create(nil);
finalization
  try
    GlobalEventManager.Free;
  finally
    GlobalEventManager := nil;
  end;
end.
