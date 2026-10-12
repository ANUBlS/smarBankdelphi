unit LogSrv;

interface

type
  TLogNotificationStaticProc = procedure(const Message: String);
  TLogNotificationObjectProc = procedure(const Message: String) of object;
  PLogNotificationStaticProc = ^TLogNotificationStaticProc;
  PLogNotificationObjectProc = ^TLogNotificationObjectProc;

  TLogEventType = (etDebug, etError, etWarning, etMessage);

procedure SB_LogMessage(const Message: String); overload;
procedure SB_LogMessage(const ModuleName, Message: String); overload;
procedure SB_LogMessage(EventType: TLogEventType; const Message: String); overload;
procedure SB_LogMessage(EventType: TLogEventType; const ModuleName, Message: String); overload;
procedure SB_AddLogNotification(LogNotificationProc: TLogNotificationStaticProc); overload;
procedure SB_AddLogNotification(LogNotificationProc: TLogNotificationObjectProc); overload;
procedure SB_DropLogNotification(ALogNotificationProc: TLogNotificationStaticProc); overload;
procedure EnumLogMessages(EnumProc: TLogNotificationStaticProc);

implementation

uses Classes, SysUtils;

var
  Initialized: Boolean = False;
  LogMessages: TStringList = nil;
  LogClients : TList = nil;

type
  TNotifyProcType = (nptStatic, nptObject);
  TLogClient = packed record
    NotifyProcType        : TNotifyProcType;
    NotifyProcAddr        : Pointer;
  end;
  PLogClient = ^TLogClient;

procedure Initialize;
begin
  if not Initialized then
  begin
    LogMessages := TStringList.Create;
    LogClients := TList.Create;
    Initialized := True;
  end;
end;

procedure Cleanup;
begin
  if Initialized then
  begin
    Initialized := False;
    LogClients.Free;
    LogMessages.Free;
  end;
end;

procedure CheckInitialized;
begin
  if not Initialized then
    Initialize;
end;

procedure SB_CallLogNotifications(const Message: String);
var
  i           : Integer;
begin
  with LogClients do
    for i:=0 to Count-1 do
      with PLogClient(Items[i])^ do
        case NotifyProcType of
          nptStatic: TLogNotificationStaticProc(NotifyProcAddr)(Message);
//          nptObject: TLogNotificationObjectProc(NotifyProcAddr)(Message);
        end;
end;

procedure SB_LogMessage(const Message: String);
var
  NotifyMessage       : String;
begin
  CheckInitialized;
  NotifyMessage := Format('%s %s %s', [DateToStr(Date), TimeToStr(Time), Message]);
  LogMessages.Add(NotifyMessage);
  SB_CallLogNotifications(NotifyMessage);
end;

procedure SB_LogMessage(const ModuleName, Message: String);
begin
  SB_LogMessage(Format('[%s] %s', [ModuleName, Message]));
end;

procedure SB_LogMessage(EventType: TLogEventType; const Message: String);

  function EventTypeToStr(EventType: TLogEventType): String;
  begin
    case EventType of
      etDebug: Result := 'debug';
      etError: Result := 'error';
      etWarning: Result := 'warning';
      etMessage: Result := 'message'; 
    end;
  end;

begin
  SB_LogMessage(Format('%s: %s', [EventTypeToStr(EventType), Message]));
end;

procedure SB_LogMessage(EventType: TLogEventType; const ModuleName, Message: String);
begin
  SB_LogMessage(EventType, Format('[%s] %s', [ModuleName, Message]));
end;

procedure SB_AddLogNotification(LogClientType: TNotifyProcType; LogNotificationProc: Pointer); overload;
var
  LogClientDescr        : PLogClient;
begin
  CheckInitialized;
  GetMem(LogClientDescr, SizeOf(TLogClient));
  with LogClientDescr^ do
  begin
    NotifyProcType := LogClientType;
    NotifyProcAddr := Pointer(LogNotificationProc);
  end;
  LogClients.Add(LogClientDescr);
end;

procedure SB_AddLogNotification(LogNotificationProc: TLogNotificationStaticProc);
begin
  SB_AddLogNotification(nptStatic, @LogNotificationProc);
end;

procedure SB_AddLogNotification(LogNotificationProc: TLogNotificationObjectProc);
begin
  SB_AddLogNotification(nptObject, @LogNotificationProc);
end;

procedure SB_DropLogNotification(ALogNotificationProc: TLogNotificationStaticProc);
var
  i           : Integer;
  LogClient   : PLogClient;
begin
  i := 0;
  while i < LogClients.Count do
  begin
    LogClient := PLogClient(LogClients[i]);
    with LogClient^ do
      if NotifyProcAddr = @ALogNotificationProc then
      begin
        LogClients.Delete(i);
        FreeMem(LogClient);
      end
      else
        inc(i);
  end;
end;

procedure EnumLogMessages(EnumProc: TLogNotificationStaticProc);
var
  i       : Integer;
begin
  try
    for i:=0 to LogMessages.Count-1 do
      EnumProc(NewStr(LogMessages[i])^);
  except
    on EAbort do
    else
      raise;
  end;
end;

initialization
finalization
  Cleanup;
end.
