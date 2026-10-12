unit SBPlgAx50GlobalStorageImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBPlgAx50_TLB, StdVcl, SysUtils;

type
  EGlobalStorageException = class(Exception);

  TGlobalStorage = class(TAutoObject, IConnectionPointContainer, IGlobalStorage)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IGlobalStorageEvents;
    FCommunityList: TStringList;
    FCommunityCount: Integer;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function JoinCommunity(const Community: WideString): Integer; safecall;
    function GetCommunityID(const Community: WideString): Integer; safecall;
    function GetCommunity(CommunityID: Integer): WideString; safecall;
    function Add(CommunityID: Integer; Item: OleVariant): Integer; safecall;
    function Get(CommunityID, Index: Integer): POleVariant1; safecall;
    procedure Clear(CommunityID: Integer); safecall;
    function Get_CommunityCount: Integer; safecall;
    function ItemCount(CommunityID: Integer): Integer; safecall;
    function DisconnectCommunity(CommunityID: Integer): Integer; safecall;
  end;

implementation

uses ComServ;

type
  TCommunity = class
  private
    FIndex: Integer;
    FName: String;
    FList: TList;
    FRefCount: Integer;
    function GetCount: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Index: Integer read FIndex write FIndex;
    property Name: String read FName write FName;
    function Add(Item: OleVariant): Integer;
    function Get(Index: Integer): POleVariant1;
    function Delete(Index: Integer): Integer;
    procedure Clear;
    property Count: Integer read GetCount;
    property RefCount: Integer read FRefCount;
    function Release: Integer;
    function Connect: Integer;
  end;

  TOleVariantNode = record
    OleItem: OleVariant;
  end;
  POleVariantNode = ^TOleVariantNode;

  { TCommunity }

constructor TCommunity.Create;
begin
  FRefCount := 0;
  FList := TList.Create;
  inherited;
end;

destructor TCommunity.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TCommunity.Add(Item: OleVariant): Integer;
var
  Node: POleVariantNode;
begin
  GetMem(Node, SizeOf(TOleVariantNode));
  Node^.OleItem := Item;
  Result := FList.Add(Node);
end;

function TCommunity.Get(Index: Integer): POleVariant1;
begin
  Result := @(POleVariantNode(FList[Index])^.OleItem);
end;

function TCommunity.Delete(Index: Integer): Integer;
begin
  FList.Delete(Index);
  Result := FList.Count;
end;

procedure TCommunity.Clear;
begin
  while FList.Count <> 0 do
    FreeMem(Get(0));
  FList.Clear;
end;

function TCommunity.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TCommunity.Release: Integer;
begin
  dec(FRefCount);
  Result := FRefCount;
end;

function TCommunity.Connect: Integer;
begin
  inc(FRefCount);
  Result := FRefCount;
end;

  { TGlobalStorage }

procedure TGlobalStorage.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IGlobalStorageEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TGlobalStorage.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
  FCommunityList := TStringList.Create;
end;

function TGlobalStorage.JoinCommunity(
  const Community: WideString): Integer;
var
  ACommunity: TCommunity;
begin
  with FCommunityList do
  begin
    if IndexOf(Community) <> -1 then
      raise EGlobalStorageException.CreateFmt('Community "%s" already exists', [Community]);

    ACommunity := TCommunity.Create;
    with ACommunity do
    begin
      Name := Community;
      Connect;
      Index := FCommunityList.AddObject(Community, ACommunity);
      Result := Index;
    end;

    inc(FCommunityCount);
  end;
end;

function TGlobalStorage.GetCommunityID(
  const Community: WideString): Integer;
var
  ComObject: TObject;
begin
  with FCommunityList do
  begin
    ComObject := Objects[IndexOf(Community)];
    if ComObject = nil then
      Result := -1
    else
      Result := TCommunity(ComObject).Index;
  end;
end;

function TGlobalStorage.GetCommunity(CommunityID: Integer): WideString;
begin
  Result := TCommunity(FCommunityList.Objects[CommunityID]).Name;
end;

function TGlobalStorage.Add(CommunityID: Integer;
  Item: OleVariant): Integer;
begin
  Result := TCommunity(FCommunityList.Objects[CommunityID]).Add(Item);
end;

function TGlobalStorage.Get(CommunityID, Index: Integer): POleVariant1;
begin
  Result := TCommunity(FCommunityList.Objects[CommunityID]).Get(Index);
end;

procedure TGlobalStorage.Clear(CommunityID: Integer);
var
  Index: Integer;
begin
  if CommunityID = -1 then
    for Index := 0 to FCommunityCount-1 do
      TCommunity(FCommunityList.Objects[Index]).Clear
  else
    TCommunity(FCommunityList.Objects[CommunityID]).Clear;
end;

function TGlobalStorage.Get_CommunityCount: Integer;
begin
  Result := FCommunityCount;
end;

function TGlobalStorage.ItemCount(CommunityID: Integer): Integer;
begin
  Result := TCommunity(FCommunityList.Objects[CommunityID]).Count;
end;

function TGlobalStorage.DisconnectCommunity(CommunityID: Integer): Integer;
var
  Community: TCommunity;
begin
  Community := TCommunity(FCommunityList.Objects[CommunityID]);
  if Community.Release = 0 then
  begin
    FCommunityList.Objects[CommunityID] := nil;
    Community.Free;
  end;
  dec(FCommunityCount);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TGlobalStorage, Class_GlobalStorage,
    ciMultiInstance, tmApartment);
end.
