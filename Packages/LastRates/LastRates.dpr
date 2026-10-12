library LastRates;

uses
  ComServ,
  OldRatesProj_TLB in 'OldRatesProj_TLB.pas',
  OldRatesFormImpl in 'OldRatesFormImpl.pas' {FrmOldCourses: TActiveForm} {OldRatesFormX: CoClass};

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
