unit PluginImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBAxCommon_TLB, StdVcl;

type
  TPlugin = class(TAutoObject, IConnectionPointContainer, IPlugin)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IPluginEvents;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Actions: Integer; safecall;
    function Get_DislpayName: Integer; safecall;
    function Get_Name: Integer; safecall;
    procedure InitializePlugin; safecall;
    procedure Cleanup; safecall;
    procedure Activate; safecall;
    procedure Deactivate; safecall;
  end;

implementation

uses ComServ;

procedure TPlugin.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPluginEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TPlugin.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


function TPlugin.Get_Actions: Integer;
begin

end;

function TPlugin.Get_DislpayName: Integer;
begin

end;

function TPlugin.Get_Name: Integer;
begin

end;

procedure TPlugin.InitializePlugin;
begin
  
end;

procedure TPlugin.Cleanup;
begin

end;

procedure TPlugin.Activate;
begin

end;

procedure TPlugin.Deactivate;
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TPlugin, Class_Plugin,
    ciMultiInstance, tmApartment);
end.
