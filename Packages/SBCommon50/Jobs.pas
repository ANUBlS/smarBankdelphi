unit Jobs;

interface

uses SBAxCommon50_TLB, SysUtils, Classes, CommonClasses;

type
  EJobError = class(Exception);

  TThreadEvent = procedure of object;
  TJobThread = class(TThread)
  private
    FExecuteEvent: TThreadEvent;
  protected
    procedure Execute; override;
  public
    property OnExecute: TThreadEvent read FExecuteEvent write FExecuteEvent;
  end;

  TJob = class(TDispatchedObject, IJob)
  private
    FTitle: String;
    FCommunity: String;
    FSeparateThread: Boolean;
    FThreadID: Integer;
    FProgressJob: Boolean;
    FProgress: Integer;
    FThread: TJobThread;
    FTerminated: Boolean;
    procedure ThreadExecute();
    procedure NotApplicable(const Method: String);
  protected
    property Thread: TJobThread read FThread;
    procedure DoExecute; virtual; abstract;
    procedure DoTerminate; virtual;
    {IJob}
    function  Get_Title: WideString; safecall;
    function  Get_Community: WideString; safecall;
    function  Get_SeparateThread: WordBool; safecall;
    function  Get_ThreadID: Integer; safecall;
    function  Get_ProgressJob: WordBool; safecall;
    function  Get_Progress: Integer; safecall;
  public
    procedure Start; safecall;
    procedure Suspend; safecall;
    procedure Terminate; safecall;
    procedure Resume; safecall;
    property Title: String read FTitle;
    property Community: String read FCommunity;
    property SeparateThread: Boolean read FSeparateThread;
    property ThreadID: Integer read FThreadID;
    property ProgressJob: Boolean read FProgressJob;
    property Progress: Integer read FProgress;
    property Terminated: Boolean read FTerminated;
    constructor Create;
    destructor Destroy; override;
  end;

  TJobs = class(TDispatchedObject, IJobs)
  private
    FJobs: Tlist;
    function GetItem(Index: Integer): TJob;
  public
    procedure Add(const Job: IJob); safecall;
    procedure Delete(Index: Integer); safecall;
    function Get_Count: Integer; safecall;
    constructor Create;
    destructor Destroy; override;
    property Items[Index: Integer]: TJob read GetItem; default;
    property Count: Integer read Get_Count;
  end;


  TJobManager = class(TDispatchedObject, IJobManager)
  private
    FJobs: TJobs;
  protected
    function Get_Jobs: IJobs; safecall;
  public
    procedure Suspend(const ACommunity: WideString); safecall;
    procedure Resume(const ACommunity: WideString); safecall;
    procedure Terminate(const ACommunity: WideString); safecall;
    constructor Create;
    destructor Destroy; override;
    property Jobs: TJobs read FJobs;
  end;

implementation

  { TJobThread }

procedure TJobThread.Execute;
begin
  FExecuteEvent();
end;

  { TJob }

function  TJob.Get_Title: WideString;
begin
  Result := FTitle;
end;

function  TJob.Get_Community: WideString;
begin
  Result := FCommunity;
end;

function  TJob.Get_SeparateThread: WordBool;
begin
  Result := FSeparateThread;
end;

function  TJob.Get_ThreadID: Integer;
begin
  Result := FThreadID;
end;

function  TJob.Get_ProgressJob: WordBool;
begin
  Result := FProgressJob;
end;

function  TJob.Get_Progress: Integer;
begin
  Result := FProgress;
end;

procedure TJob.Start;
begin
  if SeparateThread then
    FThread.Resume
  else
    DoExecute;
end;

procedure TJob.NotApplicable(const Method: String);
begin
  raise EJobError.CreateFmt('%s applicable only to multythread jobs', [Method]);
end;

procedure TJob.Suspend;
begin
  if SeparateThread then
    FThread.Suspend
  else
    NotApplicable('Suspend');
end;

procedure TJob.Terminate;
begin
  if SeparateThread then
    FThread.Terminate
  else
    DoTerminate;
end;

procedure TJob.Resume;
begin
  if SeparateThread then
    FThread.Terminate
  else
    NotApplicable('Resume');
end;

procedure TJob.ThreadExecute;
begin
  DoExecute;
end;

procedure TJob.DoTerminate;
begin
  FTerminated := True;
end;

constructor TJob.Create;
begin
  FThread := TJobThread.Create(False);
  FThread.OnExecute := ThreadExecute;
  FThreadID := Thread.ThreadID;
  inherited;
end;

destructor TJob.Destroy;
begin
  FThread.Free;
  inherited;
end;

  { TJobs }

function TJobs.GetItem(Index: Integer): TJob;
begin
  Result := FJobs[Index];
end;

procedure TJobs.Add(const Job: IJob);
begin
  FJobs.Add(Pointer(Job));
end;

procedure TJobs.Delete(Index: Integer);
begin
  FJobs.Delete(Index);
end;

function TJobs.Get_Count: Integer;
begin
  Result := FJobs.Count;
end;

constructor TJobs.Create;
begin
  FJobs := TList.Create;
  inherited;
end;

destructor TJobs.Destroy;
begin
  FJobs.Free;
  inherited;
end;

  { TJobManager }

procedure TJobManager.Suspend(const ACommunity: WideString);
var
  Index: Integer;
begin
  for Index := 0 to Jobs.Count-1 do
    with Jobs[Index] do
      if (ACommunity = '') or (Community = ACommunity) then
        Suspend;
end;

procedure TJobManager.Resume(const ACommunity: WideString);
var
  Index: Integer;
begin
  for Index := 0 to Jobs.Count-1 do
    with Jobs[Index] do
      if (ACommunity = '') or (Community = ACommunity) then
        Resume;
end;

procedure TJobManager.Terminate(const ACommunity: WideString);
var
  Index: Integer;
begin
  for Index := 0 to Jobs.Count-1 do
    with Jobs[Index] do
      if (ACommunity = '') or (Community = ACommunity) then
        Terminate;
end;

constructor TJobManager.Create;
begin
  FJobs := TJobs.Create;
  inherited;
end;

destructor TJobManager.Destroy;
begin
  FJobs.Free;
  inherited;
end;

function TJobManager.Get_Jobs: IJobs;
begin
  Result := FJobs as IJobs;
end;

end.
