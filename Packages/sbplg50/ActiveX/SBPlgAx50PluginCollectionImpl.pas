unit SBPlgAx50PluginCollectionImpl;

interface

uses
  Windows, ComObj, ActiveX, AxCtrls, Classes, SysUtils, SBPlgAx50_TLB, StdVcl, SBPlgAx50CollectionImpl;

type
  EInterfaceNotSupported = class(Exception);
  
  TPluginCollection = class(TCollection, IConnectionPointContainer, IPluginCollection)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IPluginCollectionEvents;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function AddPlugin(const Item: Plugin): Integer; safecall;
    function GetPlugin(Index: Integer): Plugin; safecall;
  end;

implementation

uses ComServ;

procedure TPluginCollection.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPluginCollectionEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TPluginCollection.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


function TPluginCollection.AddPlugin(const Item: Plugin): Integer;
begin
  Result := Add(Item);
end;

function TPluginCollection.GetPlugin(Index: Integer): Plugin;
begin
  {WARNING!!! avoid AV}
  if IUnknown(TVarData(Get(Index)^).VUnknown).QueryInterface(IID_IPlugin, Result) <> S_OK then
    raise EInterfaceNotSupported.Create('Interface not supported');
end;

initialization
  TAutoObjectFactory.Create(ComServer, TPluginCollection, Class_PluginCollection,
    ciMultiInstance, tmApartment);
end.
