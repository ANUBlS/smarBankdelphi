library SBAxCommon;

uses
  ComServ,
  SBAxCommon_TLB in 'SBAxCommon_TLB.pas',
  ItemListImpl in 'ItemListImpl.pas' {ItemList: CoClass},
  ActionListImpl in 'ActionListImpl.pas' {ActionList: CoClass},
  ActionImpl in 'ActionImpl.pas' {Action: CoClass},
  PluginImpl in 'PluginImpl.pas' {Plugin: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
