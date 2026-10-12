unit ItemListImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBAxCommon_TLB, StdVcl;

type
  TItemList = class(TAutoObject, IConnectionPointContainer, IItemList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IItemListEvents;
    FList: TList;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Add(Item: OleVariant): Integer; virtual; safecall; 
    function Get(Index: Integer): OleVariant; virtual; safecall;
    function Get_Count: Integer; safecall;
    procedure Clear; safecall;
  end;

implementation

uses ComServ;

type
  TListItem = record
    Data: OleVariant;
  end;
  PListItem = ^TListItem;

procedure TItemList.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IItemListEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TItemList.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


function TItemList.Add(Item: OleVariant): Integer;
var
  NewItem: PListItem;
begin
  new(NewItem);
  NewItem^.Data := Item;
  FList.Add(NewItem);
end;

function TItemList.Get(Index: Integer): OleVariant;
begin
  Result := PListItem(FList[Index])^.Data;
end;

function TItemList.Get_Count: Integer;
begin
  Result := FList.Count;
end;

procedure TItemList.Clear;
begin
  FList.Clear;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TItemList, Class_ItemList,
    ciMultiInstance, tmApartment);
end.
