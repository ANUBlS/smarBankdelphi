unit PluginMgr;

interface

uses SysUtils, Classes, Forms, Windows, ActnList, Controls, graphics, Dialogs, comctrls, extctrls,
     menus, IniFiles, CustomInst;

type
  TRegisterPluginProc = TProcedure;

  

implementation

{$R *.DCR}

ResourceString
  SRegisterPluginProc = 'RegisterPlugin';

  { TPlugin }

constructor TLibPlugin.Create(Manager: TComponent);
begin
  FManager := TPluginManager(Manager);
  FActionList := TActionList.Create(Self);
  inherited Create(nil);
end;

destructor TLibPlugin.Destroy;
begin
  inherited;
  FActionList.Free;
end;

procedure TLibPlugin.DoOpen;
var
  RegProc       : TRegisterPluginProc;
begin
  FModuleHandle := LoadPackage(FFileName);
  @RegProc := GetProcAddress(FModuleHandle, PChar(SRegisterPluginProc));
  if not Assigned(@RegProc) then
    RaiseLastWin32Error;
  RegProc();
end;

procedure TLibPlugin.DoClose;
begin
  UnloadPackage(FModuleHandle);
end;

procedure TLibPlugin.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if AComponent is TAction then
    with AComponent as TAction do
      ActionList := FActionList;
  inherited;
end;

  { TPluginCollectionItem }

constructor TPluginCollectionItem.Create(Collection: TCollection);
begin
  FPlugin := TPlugin.Create(nil);
  inherited;
end;

destructor TPluginCollectionItem.Destroy;
begin
  inherited;
  FPlugin.Free;
end;

  { TPlugins }

constructor TPlugins.Create(Manager: TPluginManager);
begin
  FManager := Manager;
end;

function TPlugins.GetItem(Index: Integer): TPlugin;
begin
  Result := TPluginCollectionItem(inherited Items[Index]).Plugin;
end;

function TPlugins.Add: TPlugin;
begin
  Result := TPluginCollectionItem(inherited Add).Plugin;
  Result.Manager := Manager;
end;

  { TPluginManager }

constructor TPluginManager.Create(AOwner: TComponent);
begin
  FPlugins := TPlugins.Create(Self);
  inherited;
end;

destructor TPluginManager.Destroy;
begin
  inherited;
  FPlugins.Destroy;
end;

function TPluginManager.PluginByHInstance(HInstance: HMODULE): TPlugin;
var
  i         : Integer;
begin
  Result := nil;
  for i:=0 to Plugins.Count-1 do
    if Plugins[i].ModuleHandle = HInstance then
    begin
      Result := Plugins[i];
      break;
    end;
end;

  { TPluginAction }

procedure TPluginAction.SetResourcePath(const Value: String);
begin
  FResourcePath := Value;
end;

end.
