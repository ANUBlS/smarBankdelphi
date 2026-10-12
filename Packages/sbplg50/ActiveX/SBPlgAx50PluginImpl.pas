unit SBPlgAx50PluginImpl;

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, SBPlgAx50_TLB, StdVcl;

type
  TNamedPlugin = class(TAutoObject, IConnectionPointContainer, INamedObject)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FSinkList: TList;
    FEvents: INamedPluginEvents;
  public
    procedure Initialize; override;
  protected
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure CleanupPlugin; safecall;
    procedure InitializePlugin; safecall;
    function Get_Author: WideString; safecall;
    function Get_Description: WideString; safecall;
    function Get_IDString: WideString; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Author(const Value: WideString); safecall;
    procedure Set_Description(const Value: WideString); safecall;
    procedure Set_IDString(const Value: WideString); safecall;
    procedure Set_Name(const Value: WideString); safecall;
    { TODO: Change all instances of type [IPluginEvents] to [INamedPluginEvents].}
 { Delphi was not able to update this file to reflect
   The change of the name of your event interface
   because of the presence of instance variables. 
   The type library was updated but you must update 
   this implementation file by hand. }
end;

implementation

uses ComServ;

procedure TNamedPlugin.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as INamedPluginEvents;
  if FConnectionPoint <> nil then
     FSinkList := FConnectionPoint.SinkList;
end;

procedure TNamedPlugin.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


procedure TNamedPlugin.CleanupPlugin;
begin

end;

procedure TNamedPlugin.InitializePlugin;
begin

end;

function TNamedPlugin.Get_Author: WideString;
begin

end;

function TNamedPlugin.Get_Description: WideString;
begin

end;

function TNamedPlugin.Get_IDString: WideString;
begin

end;

function TNamedPlugin.Get_Name: WideString;
begin

end;

procedure TNamedPlugin.Set_Author(const Value: WideString);
begin

end;

procedure TNamedPlugin.Set_Description(const Value: WideString);
begin

end;

procedure TNamedPlugin.Set_IDString(const Value: WideString);
begin

end;

procedure TNamedPlugin.Set_Name(const Value: WideString);
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TNamedPlugin, Class_NamedPlugin,
    ciMultiInstance, tmApartment);
end.
