unit ActionListImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBAxCommon_TLB, StdVcl, ItemListImpl;

type
  TActionList = class(TItemList, IConnectionPointContainer, IActionList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IActionListEvents;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure ExecuteAll; safecall;
    function AddAction(const Action: IAction): Integer; safecall;
    function GetAction(Index: Integer): IAction; safecall;
  end;

implementation

uses ComServ;

procedure TActionList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActionListEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TActionList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


procedure TActionList.ExecuteAll;
begin

end;

function TActionList.AddAction(const Action: IAction): Integer;
begin
end;

function TActionList.GetAction(Index: Integer): IAction;
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TActionList, Class_ActionList,
    ciMultiInstance, tmApartment);
end.
