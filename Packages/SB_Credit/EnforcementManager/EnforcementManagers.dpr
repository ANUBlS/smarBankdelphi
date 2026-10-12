library EnforcementManagers;

uses
  ComServ,
  EnforcementManagers_TLB in 'EnforcementManagers_TLB.pas',
  UnitEnforcementManager in 'UnitEnforcementManager.pas' {EnforcementManager: TActiveForm} {EnforcementManager: CoClass},
  DataModEnforcement in 'DataModEnforcement.pas' {DataModuleEnforcement: TDataModule};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}

begin
end.
