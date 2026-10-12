unit SBInstallation;

interface

uses Classes;

type
  TOperationCode = Integer;

const
  opcExecSQL = 1;
  opcExecTask = 2;

function Sb_GetTaskID(const TaskName: String): Integer;

function Sb_AddTaskAction(TaskID: Integer; const TaskName: String; Metrica: Integer;
  const Code: String; OperationCode: TOperationCode): Integer;

procedure Sb_UpdateTaskAction(QueryID: Integer; const TaskName: String; Metrica: Integer;
  const Code: String; OperationCode: TOperationCode);

procedure Sb_DeleteTaskAction(QueryID: Integer);
procedure Sb_ExecuteTaskAction(QueryID: Integer; Params: TStrings; IgnoreErrors: Boolean);

procedure Sb_DeleteTaskActions(TaskID: Integer);

implementation

uses sboapiDataModuleImpl, SBSrvIntf;

function Sb_GetTaskID(const TaskName: String): Integer;
begin
  with sboapiDataModule.SBInstallation do
    Result := CallIntegerFunction(sPN_GetTaskID, [TaskName]);
end;

function Sb_AddTaskAction(TaskID: Integer; const TaskName: String; Metrica: Integer;
  const Code: String; OperationCode: TOperationCode): Integer;
begin
  with sboapiDataModule.SBInstallation do
     Result := CallIntegerFunction(sPN_AddTaskQuery, [
      TaskID, TaskName, Metrica, Code, OperationCode]);
end;

procedure Sb_UpdateTaskAction(QueryID: Integer; const TaskName: String; Metrica: Integer;
  const Code: String; OperationCode: TOperationCode);
begin
  with sboapiDataModule.SBInstallation do
    CallProcedure(sPN_UpdateTaskQuery, [
      QueryID, TaskName, Metrica, Code, OperationCode]);
end;

procedure Sb_DeleteTaskAction(QueryID: Integer);
begin
  with sboapiDataModule.SBInstallation do
    CallProcedure(sPN_DeleteTaskQuery, [QueryID]);
end;

procedure Sb_ExecuteTaskAction(QueryID: Integer; Params: TStrings; IgnoreErrors: Boolean);
begin
  with sboapiDataModule.SBInstallation do
    CallProcedure(sPN_ExecuteTaskQuery, [QueryID, Params.CommaText, IgnoreErrors]);
end;

procedure Sb_DeleteTaskActions(TaskID: Integer);
begin
  with sboapiDataModule.SBInstallation do
    CallProcedure(sPN_DeleteTaskActions, [TaskID]);
end;

end.
