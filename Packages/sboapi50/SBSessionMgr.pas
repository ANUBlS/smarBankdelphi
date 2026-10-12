unit SBSessionMgr;

interface

procedure Sb_KillSession(const SessionID, Serial: String;
  const Message: String = ''; UserTimeout: Single = 0; SleepTimeout: Single = -1);

procedure Sb_KillAll(
  const UserNameMask, Message: String;
  Timeout: Single);

procedure Sb_SendMessage(const SessionID, Message: String; const MessageName: String = '');

implementation

uses sboapiDataModuleImpl, SBSrvIntf, Oracle, SBCore, Variants;

procedure Sb_KillSession(const SessionID, Serial: String;
  const Message: String = ''; UserTimeout: Single = 0; SleepTimeout: Single = -1);
var
  ASleepTimeout: Variant;
begin
  if SleepTimeout = -1 then
    ASleepTimeout := Null
  else
    ASleepTimeout := SleepTimeout;
  try
    with sboapiDataModule.SBSessionMgr do
      CallProcedure(sPN_KillSession, [SessionID, Serial, Message, UserTimeout, ASleepTimeout]);
  except
    on E: EOracleError do
      Sb_ProcessException(E);
  end;
end;

procedure Sb_KillAll(const UserNameMask, Message: String; Timeout: Single);
begin
  try
    with sboapiDataModule.SBSessionMgr do
      CallProcedure(sPN_KillAll, [UserNameMask, Message, Timeout]);
  except
    on E: EOracleError do
      Sb_ProcessException(E);
  end;
end;

procedure Sb_SendMessage(const SessionID, Message: String; const MessageName: String = '');
var
  AMessageName: Variant;
begin
  if MessageName = '' then
    AMessageName := Null
  else
    AMessageName := MessageName;
  with sboapiDataModule.SBSessionMgr do
    CallProcedure(sPN_SendMessage, [SessionID, Message, AMessageName]);
end;

end.
