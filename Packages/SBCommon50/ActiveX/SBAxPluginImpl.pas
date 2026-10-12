unit SBAxPluginImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBAxCommon_TLB, StdVcl;

type
  TIAxPlugin = class(TAutoObject, IConnectionPointContainer, IIAxPlugin)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IIAxPluginEvents;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  end;

implementation

uses ComServ;

procedure TIAxPlugin.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IIAxPluginEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TIAxPlugin.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


initialization
  TAutoObjectFactory.Create(ComServer, TIAxPlugin, Class_IAxPlugin,
    ciMultiInstance, tmApartment);
end.
