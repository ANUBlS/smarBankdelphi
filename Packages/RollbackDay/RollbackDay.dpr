library RollbackDay;

uses
  ComServ,
  RollbackDay_TLB in 'RollbackDay_TLB.pas',
  RollbackDayImpl in 'RollbackDayImpl.pas' {FormRollbackDay: TActiveForm} {FormRollbackDay: CoClass};

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
