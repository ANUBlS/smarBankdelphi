unit SBPlgAx50CollectionImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBPlgAx50_TLB, StdVcl;

type
  TCollection = class(TAutoObject, IConnectionPointContainer, ICollection)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: ICollectionEvents;
    FCommunity: String;
    FCommunityID: Integer;
    procedure InitGlobalStorage;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Count: Integer; safecall;
    function Add(Item: OleVariant): Integer; safecall;
    function Get(Index: Integer): POleVariant1; safecall;
    function Get_Community: WideString; safecall;
    procedure Set_Community(const Value: WideString); safecall;
  end;

implementation

uses ComServ;

var
  GlobalStorage: IGlobalStorage = nil;

procedure TCollection.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICollectionEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TCollection.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
  FCommunityID := -1;
end;


function TCollection.Get_Count: Integer;
begin
  InitGlobalStorage;
  Result := GlobalStorage.ItemCount(FCommunityID);
end;

function TCollection.Add(Item: OleVariant): Integer;
begin
  InitGlobalStorage;
  Result := GlobalStorage.Add(FCommunityID, Item);
end;

function TCollection.Get(Index: Integer): POleVariant1;
begin
  InitGlobalStorage;
  Result := GlobalStorage.Get(FCommunityID, Index);
end;

function TCollection.Get_Community: WideString;
begin
  Result := WideString(FCommunity);
end;

procedure TCollection.Set_Community(const Value: WideString);
begin
  InitGlobalStorage;
  with GlobalStorage do
  begin
    if FCommunityID <> -1 then
      DisconnectCommunity(FCommunityID);
    FCommunityID := JoinCommunity(Value);
  end;
  FCommunity := String(Value);
end;

procedure TCollection.InitGlobalStorage;
begin
  if not Assigned(GlobalStorage) then
    GlobalStorage := CoGlobalStorage.Create;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TCollection, Class_Collection,
    ciMultiInstance, tmApartment);
end.
