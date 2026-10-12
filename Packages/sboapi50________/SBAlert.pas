unit SBAlert;

interface

type
  TAlertRaiseStatus = (arsRaised, arsTimeout);

const
  MAXWAIT = 86400000; // 1000 days

procedure Sb_AlertRegister(const AName: String);
procedure Sb_AlertWaitOne(const AName: String; out Message: String;
  out Status: TAlertRaiseStatus; Timeout: Integer = MAXWAIT);
procedure Sb_AlertSignal(const AName, Message: String);
procedure Sb_AlertWaitAny(out AName, Message: String;
  out Status: TAlertRaiseStatus; Timeout: Integer = MAXWAIT);
procedure Sb_AlertRemove(const AName: String);
procedure Sb_AlterRemoveAll;

implementation

uses sboapiDataModuleImpl;

procedure Sb_AlertRegister(const AName: String);
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    Register(AName);
end;

procedure DecodeAlertStatus(StatusInt: Integer; out Status: TAlertRaiseStatus);
begin
  if StatusInt = 0 then
    Status := arsRaised
  else
  {if StatusInt = 0 then}
  // assuming that timeout occured if code is unrecognized
    Status := arsTimeout;
end;

procedure Sb_AlertWaitOne(const AName: String; out Message: String;
  out Status: TAlertRaiseStatus; Timeout: Integer = MAXWAIT);
var
  StatusInt: Integer;
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    WaitOne(AName, Message, StatusInt, Timeout);
  DecodeAlertStatus(StatusInt, Status);
end;

procedure Sb_AlertSignal(const AName, Message: String);
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    Signal(AName, Message);
end;

procedure Sb_AlertWaitAny(out AName, Message: String;
  out Status: TAlertRaiseStatus; Timeout: Integer = MAXWAIT);
var
  StatusInt: Integer;
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    WaitAny(AName, Message, StatusInt, Timeout);
  DecodeAlertStatus(StatusInt, Status);
end;

procedure Sb_AlertRemove(const AName: String);
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    Remove(AName);
end;

procedure Sb_AlterRemoveAll;
begin
  with sboapiDataModule.SBSession.DBMS_Alert do
    RemoveAll;
end;

end.
