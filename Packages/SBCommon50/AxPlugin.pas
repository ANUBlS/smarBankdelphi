unit AxPlugin;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBCommon50_TLB, StdVcl;

type
  TAxPlugin = class(TAutoObject, IConnectionPointContainer, IAxPlugin)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IAxPluginEvents;
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

procedure TAxPlugin.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAxPluginEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TAxPlugin.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


initialization
  TAutoObjectFactory.Create(ComServer, TAxPlugin, Class_AxPlugin,
    ciMultiInstance, tmApartment);
end.
