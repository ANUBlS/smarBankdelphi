unit ItemListImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBCommon50_TLB, StdVcl;

type
  TItemList = class(TAutoObject, IConnectionPointContainer, IItemList)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: IItemListEvents;
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


initialization
  TAutoObjectFactory.Create(ComServer, TItemList, Class_ItemList,
    ciMultiInstance, tmApartment);
end.
