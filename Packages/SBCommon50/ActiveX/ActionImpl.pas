unit ActionImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBAxCommon_TLB, StdVcl;

type
  TAction = class(TAutoObject, IConnectionPointContainer, IAction)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IActionEvents;
    FName: String;
    FCaption: String;
    FDescription: String;
    FFullDescription: String;
    FEnabled: Boolean;
    FDefault: Boolean;
    FChecked: Boolean;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Caption: WideString; safecall;
    function Get_Description: WideString; safecall;
    function Get_FullDescription: WideString; safecall;
    function Get_Name: WideString; safecall;
    procedure Execute; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Description(const Value: WideString); safecall;
    procedure Set_FullDescription(const Value: WideString); safecall;
    procedure Set_Name(const Value: WideString); safecall;
    procedure Update; safecall;
    function Get_Checked: WordBool; safecall;
    function Get_Default: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    procedure Set_Default(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
  end;

implementation

uses ComServ;

procedure TAction.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActionEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TAction.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


function TAction.Get_Caption: WideString;
begin
  Result := FCaption;
end;

function TAction.Get_Description: WideString;
begin
  Result := FDescription;
end;

function TAction.Get_FullDescription: WideString;
begin
  Result := FFullDescription;
end;

function TAction.Get_Name: WideString;
begin
  Result := FName;
end;

procedure TAction.Execute;
begin
  if Assigned(FEvents) then
    FEvents.Execute;
end;

procedure TAction.Set_Caption(const Value: WideString);
begin
  FCaption := Value;
end;

procedure TAction.Set_Description(const Value: WideString);
begin
  FDescription := Value; 
end;

procedure TAction.Set_FullDescription(const Value: WideString);
begin
  FFullDescription := Value;
end;

procedure TAction.Set_Name(const Value: WideString);
begin
  FName := Value;
end;

procedure TAction.Update;
begin
  if Assigned(FEvents) then
    FEvents.Update;
end;

function TAction.Get_Checked: WordBool;
begin
  Result := FChecked;
end;

function TAction.Get_Default: WordBool;
begin
  Result := FDefault;
end;

function TAction.Get_Enabled: WordBool;
begin
  Result := FEnabled;
end;

procedure TAction.Set_Checked(Value: WordBool);
begin
  FChecked := Value; 
end;

procedure TAction.Set_Default(Value: WordBool);
begin
  FDefault := Value; 
end;

procedure TAction.Set_Enabled(Value: WordBool);
begin
  FEnabled := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAction, Class_Action,
    ciMultiInstance, tmApartment);
end.
