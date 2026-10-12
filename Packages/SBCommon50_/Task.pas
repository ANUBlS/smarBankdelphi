unit Task;

interface

uses Classes;

type
  TTask = class(TThread)
  private
    FGroup: String;
    FDescription: String;
    FStatus: String;
    FTaskManager: TObject;
  protected
    procedure SetStatus(const Value: String); virtual;
    procedure Execute; override;
    procedure ExecuteTask; virtual; abstract;
    procedure StatusNotify; virtual;
    procedure StartNotify; virtual;
    procedure TerminateNotify; virtual;
    procedure ResumeNotify; virtual;
    procedure SuspendNotify; virtual;
    procedure FinishNotify; virtual;
  public
    property Group: String read FGroup write FGroup;
    property Description: String read FDescription write FDescription;
    property Manager: TObject read FTaskManager write FTaskManager;
    property Status: String read FStatus write SetStatus;
    procedure Start; virtual;
    procedure Terminate; virtual;
    procedure Resume; virtual;
    procedure Suspend; virtual;
    constructor Create(CreateSuspended: Boolean); virtual;
  end;

  TTaskClass = class of TTask;

implementation

uses TaskManager;

procedure TTask.SetStatus(const Value: String);
begin
  FStatus := Value;
  StatusNotify;
end;

procedure TTask.Start;
begin
  StartNotify;
  Resume;
end;

procedure TTask.Terminate;
begin
  TerminateNotify;
  inherited;
end;

procedure TTask.Resume;
begin
  ResumeNotify;
  inherited Resume;
end;

procedure TTask.Suspend;
begin
  SuspendNotify;
  inherited Suspend;
end;

procedure TTask.Execute;
begin
  try
    ExecuteTask;
  finally
    FinishNotify;
  end;
end;

procedure TTask.StatusNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskStatus) then
      OnTaskStatus(TTaskManager(Manager), Self);
end;

procedure TTask.StartNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskStart) then
      OnTaskStart(TTaskManager(Manager), Self);
end;

procedure TTask.TerminateNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskTerminate) then
      OnTaskTerminate(TTaskManager(Manager), Self);
end;

procedure TTask.ResumeNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskResume) then
      OnTaskResume(TTaskManager(Manager), Self);
end;

procedure TTask.SuspendNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskSuspend) then
      OnTaskSuspend(TTaskManager(Manager), Self);
end;

procedure TTask.FinishNotify;
begin
  with Manager as TTaskManager do
    if Assigned(OnTaskFinish) then
      OnTaskFinish(TTaskManager(Manager), Self);
end;

constructor TTask.Create(CreateSuspended: Boolean);
begin
  inherited;
end;

end.
