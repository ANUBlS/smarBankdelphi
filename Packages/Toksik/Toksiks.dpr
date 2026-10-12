library Toksiks;

uses
  ComServ,
  Toksik_TLB in 'Toksik_TLB.pas',
  Toksikimpl in 'Toksikimpl.pas' {Toksik: TActiveForm} {Toksik: CoClass},
  NewToksikForm in 'NewToksikForm.pas' {FormNewToksik};

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
