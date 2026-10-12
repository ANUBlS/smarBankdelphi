unit CommandManagement;

interface

uses SBAxCommon50_TLB, CommonClasses, SysUtils, Classes;

type
  TCommand = class(TDispatchedObject, ICommand)
  private
    FName: String;
    FCaption: String;
    FEnabled: Boolean;
    FIndex: Integer;
    FSection: ICommandSectionContainer;
    FExecuteEvent: TNotifyEvent;
    FUpdateEvent: TNotifyEvent;
  protected
    function  Get_Name: WideString; safecall;
    function  Get_Caption: WideString; safecall;
    function  Get_Index: Integer; safecall;
    function  Get_Enabled: WordBool; safecall;
    function  Get_Section: ICommandSectionContainer; safecall;
    procedure DoExecute; virtual;
    procedure DoUpdate; virtual; 
  public
    property Name: String read FName write FName;
    property Caption: String read FCaption write FCaption;
    property Enabled: Boolean read FEnabled write FEnabled;
    property Index: Integer read FIndex write FIndex;
    property Section: ICommandSectionContainer read FSection write FSection;
    procedure Execute; safecall;
    procedure Update; safecall;
    property OnExecute: TNotifyEvent read FExecuteEvent write FExecuteEvent;
    property OnUpdate: TNotifyEvent read FUpdateEvent write FUpdateEvent;
  end;

implementation

function  TCommand.Get_Name: WideString;
begin
  Result := Name;
end;

function  TCommand.Get_Caption: WideString;
begin
  Result := Caption;
end;

function  TCommand.Get_Index: Integer;
begin
  Result := Index;
end;

function  TCommand.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function  TCommand.Get_Section: ICommandSectionContainer;
begin
  Result := Section;
end;

procedure TCommand.Execute;
begin
  DoExecute;
end;

procedure TCommand.Update;
begin
  DoUpdate;
end;

procedure TCommand.DoExecute;
begin
  if Assigned(FExecuteEvent) then
    FExecuteEvent(Self);
end;

procedure TCommand.DoUpdate;
begin
  if Assigned(FUpdateEvent) then
    FUpdateEvent(Self);
end;

end.
