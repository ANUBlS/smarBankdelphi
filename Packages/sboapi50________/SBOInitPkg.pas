unit SBOInitPkg;

interface

type
  TSBOData = packed record
    UserName: ShortString;
    Password: ShortString;
    Database: ShortString;
    SessionID: Cardinal;
  end;

  TAskForLogonOption = (
    aflShowDatabase,        // in logon query, database filed will shown
    aflShowDatabaseList     // if aftShowDatabase set, database list will shown
  );

  TAskForLogonOptions = set of TAskForLogonOption;

const
  DefaultLogonOptions = [aflShowDatabase, aflShowDatabaseList];

function Sb_Initialized: Boolean;
function Sb_Initialize(var ASBData: TSBOData; DoLogOn, AskForLogon: Boolean;
  const Options: TAskForLogonOptions = DefaultLogonOptions): Boolean;
procedure Sb_Cleanup;
function Sb_AskForLogin(var SBData: TSBOData; LogonOptions: TAskForLogonOptions;
  MaxRetryCount: Integer): Boolean;
procedure Sb_Disconnect;
procedure Sb_GetSBData(var SBData: TSBOData);

implementation

uses sboapiDataModuleImpl, SBLogin, Dialogs, Oracle;

var
  Initialized: Boolean = False;

const
  MaxLogonRetryCount = 3;

function Sb_Initialized: Boolean;
begin
  Result := Initialized;
end;

function Sb_Initialize(var ASBData: TSBOData; DoLogOn, AskForLogon: Boolean;
  const Options: TAskForLogonOptions = DefaultLogonOptions): Boolean;
begin
  Result := False;
  if not Sb_Initialized then
  begin
    sboapiDataModule := TsboapiDataModule.Create(nil);
    if DoLogOn then
      if AskForLogon then
      begin
        Result := Sb_AskForLogin(ASBData, Options, MaxLogonRetryCount);
        if Result then
          with sboapiDataModule do
          begin
            SetSBData(ASBData);
            LogOn;
            //Result := True;
            ASBData.SessionID := Sb_GetSessionID();
          end;
      end;
    Initialized := Result;
  end;
end;

procedure Sb_Cleanup;
begin
  if Sb_Initialized then
  begin
    Sb_Disconnect;
    sboapiDataModule.Free;
    Initialized := False;
  end;
end;

function Sb_AskForLogin(var SBData: TSBOData; LogonOptions: TAskForLogonOptions;
  MaxRetryCount: Integer): Boolean;

var
  RetryCounter: Integer;
  Succeeded: Boolean;

  function CheckStopCondition: Boolean;
  begin
    Result := not Succeeded;
    if Result then
    begin
      Result := MaxRetryCount = 0;
      if not Result then
      begin
        Result := RetryCounter <> 0;
        dec(RetryCounter);
      end;
    end;
  end;

begin
  Result := False;
  RetryCounter := MaxRetryCount;
  Succeeded := False;
  with sboapiDataModule do
    while CheckStopCondition do
      try
        Result := AskForLogon(SBData, LogonOptions);
        Succeeded := True;
      except
        on E: EOracleError do
          MessageDlg(E.Message, mtError, [mbOk], 0)
        else
          raise;
      end;
end;

procedure Sb_Disconnect;
begin
  with sboapiDataModule do
    SBSession.LogOff;
end;

procedure Sb_GetSBData(var SBData: TSBOData);
begin
  sboapiDataModule.GetSBData(SBData);
end;

initialization
finalization
  Sb_Cleanup;
end.
