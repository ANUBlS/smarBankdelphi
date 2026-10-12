unit SBOutput;

interface

function Sb_LogGetLine(out Line: String): Boolean;
procedure Sb_LogEnable;
procedure Sb_LogDisable;
procedure Sb_LogPutLine(const Line: String);

implementation

uses sboapiDataModuleImpl, Oracle, SBCore;

function Sb_LogGetLine(out Line: String): Boolean;
var
  Status: Integer;
begin
  Result := sboapiDataModule.SBSession.Connected;
  if Result then
  try
    sboapiDataModule.SBSession.DBMS_Output.Get_Line(Line, Status);
    Result := Status = glSuccess;
  except
    on E: EOracleError do
      Sb_ProcessException(E);
  end;
end;

procedure Sb_LogEnable;
begin
  sboapiDataModule.SBSession.DBMS_Output.Enable;
end;

procedure Sb_LogDisable;
begin
  sboapiDataModule.SBSession.DBMS_Output.Disable;
end;

procedure Sb_LogPutLine(const Line: String);
begin
  sboapiDataModule.SBSession.DBMS_Output.Put_Line(Line);
end;

end.
