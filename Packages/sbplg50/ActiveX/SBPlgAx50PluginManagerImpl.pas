unit SBPlgAx50PluginManagerImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBPlgAx50_TLB, StdVcl;

type
  TPluginManager = class(TAutoObject, IConnectionPointContainer, INamedPluginManager)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IPluginManagerEvents;
    FPlugins: IPluginCollection;
    FName: String;
  public
    procedure Initialize; override;
    property Plugins: IPluginCollection read FPlugins;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Plugins: PluginCollection; safecall;
    procedure Close; safecall;
    procedure Open; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
  end;

implementation

uses ComServ;

procedure TPluginManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPluginManagerEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TPluginManager.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
  FPlugins := CoPluginCollection.Create;
  FPlugins.Community := Name;
end;


function TPluginManager.Get_Plugins: PluginCollection;
begin
  Result := FPlugins;
end;

procedure TPluginManager.Close;
var
  Index: Integer;
begin
  for Index := 0 to Plugins.Count-1 do
    Plugins.GetPlugin(Index).CleanupPlugin;
end;

procedure TPluginManager.Open;
var
  Index: Integer;
begin
  for Index := 0 to Plugins.Count-1 do
    Plugins.GetPlugin(Index).InitializePlugin;
end;

function TPluginManager.Get_Name: WideString;
begin
  Result := FName;
end;

procedure TPluginManager.Set_Name(const Value: WideString);
begin
  FName := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TPluginManager, Class_PluginManager,
    ciMultiInstance, tmApartment);
end.
