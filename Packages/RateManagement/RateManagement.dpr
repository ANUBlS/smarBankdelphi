library RateManagement;

uses
  ComServ,
  RateManagement_TLB in 'RateManagement_TLB.pas',
  RateManagementFormImpl in 'RateManagementFormImpl.pas' {RateManagementForm: TActiveForm} {RateManagementForm: CoClass},
  RateManagementRecalculate in 'RateManagementRecalculate.pas' {FmRecalculate};

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
