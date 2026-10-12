 library CableSet;

uses
  ComServ,
  CableSet_TLB in 'CableSet_TLB.pas',
  CableSettingsImpl in 'CableSettingsImpl.pas' {CableSettings: TActiveForm} {CableSettings: CoClass};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
