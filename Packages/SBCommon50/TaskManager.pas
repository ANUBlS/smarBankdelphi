unit TaskManager;

interface

uses Classes, Task;

type
  TTaskManager = class;
  TTaskActionNotify = procedure(TaskManager: TTaskManager; Task: TTask) of object;

  TTaskManager = class(TComponent)
  private
    FTasks: TList;
    FTaskStart: TTaskActionNotify;
    FTaskSuspend: TTaskActionNotify;
    FTaskResume: TTaskActionNotify;
    FTaskTerminate: TTaskActionNotify;
    FTaskStatus: TTaskActionNotify;
    FTaskFinish: TTaskActionNotify;
    function GetItem(Index: Integer): TTask;
    procedure SetItem(Index: Integer; Value: TTask);
    function GetCount: Integer;
  public
    property Items[Index: Integer]: TTask read GetItem write SetItem;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Delete(Index: Integer);
    function Add(TaskClass: TTaskClass): TTask; virtual;
    function Terminate(const AGroup: String = ''): Integer;
    function Suspend(const AGroup: String = ''): Integer;
    function WaitFor(const AGroup: String = ''): Integer;
    function Resume(const AGroup: String = ''): Integer;
    property Count: Integer read GetCount;
    function TaskByID(ThreadID: Integer): TTask; virtual;
  published
    property OnTaskStart: TTaskActionNotify read FTaskStart write FTaskStart;
    property OnTaskSuspend: TTaskActionNotify read FTaskSuspend write FTaskSuspend;
    property OnTaskResume: TTaskActionNotify read FTaskResume write FTaskResume;
    property OnTaskTerminate: TTaskActionNotify read FTaskTerminate write FTaskTerminate;
    property OnTaskStatus: TTaskActionNotify read FTaskStatus write FTaskStatus;
    property OnTaskFinish: TTaskActionNotify read FTaskFinish write FTaskFinish;
  end;

implementation

constructor TTaskManager.Create(AOwner: TComponent);
begin
  inherited;
  FTasks := TList.Create;
end;

destructor TTaskManager.Destroy;
begin
  inherited;
  FTasks.Free;
end;

function TTaskManager.GetItem(Index: Integer): TTask;
begin
  Result := TTask(FTasks[Index]);
end;

procedure TTaskManager.SetItem(Index: Integer; Value: TTask);
begin
  FTasks[Index] := Pointer(Value);
end;

procedure TTaskManager.Delete(Index: Integer);
begin
  FTasks.Delete(Index);
end;

function TTaskManager.Add(TaskClass: TTaskClass): TTask;
begin
  Result := TaskClass.Create(True);
  Result.Manager := Self;
  FTasks.Add(Result);
end;

function TTaskManager.Terminate(const AGroup: String = ''): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 0 to FTasks.Count-1 do
    with Items[Index] do
      if (AGroup = '') or (Group = AGroup) then
      begin
        Terminate;
        Inc(Result);
      end;
end;

function TTaskManager.Suspend(const AGroup: String = ''): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 0 to FTasks.Count-1 do
    with Items[Index] do
      if (AGroup = '') or (Group = AGroup) then
      begin
        Suspend;
        Inc(Result);
      end;
end;

function TTaskManager.WaitFor(const AGroup: String = ''): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 0 to FTasks.Count-1 do
    with Items[Index] do
      if (AGroup = '') or (Group = AGroup) then
      begin
        WaitFor;
        Inc(Result);
      end;
end;

function TTaskManager.Resume(const AGroup: String = ''): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 0 to FTasks.Count-1 do
    with Items[Index] do
      if (AGroup = '') or (Group = AGroup) then
      begin
        Resume;
        Inc(Result);
      end;
end;

function TTaskManager.GetCount: Integer;
begin
  Result := FTasks.Count;
end;

function TTaskManager.TaskByID(ThreadID: Integer): TTask;
var
  Index: Integer;
begin
  for Index := 0 to Count-1 do
  begin
    Result := Items[Index];
    if Result.ThreadID = Cardinal(ThreadID) then
      exit;
  end;
  Result := nil;
end;

end.
