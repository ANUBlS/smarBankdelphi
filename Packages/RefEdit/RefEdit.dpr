library RefEdit;

uses
  ComServ,
  RefEdit_TLB in 'RefEdit_TLB.pas',
  RefEditFormImpl in 'RefEditFormImpl.pas' {RefEditForm: TActiveForm} {RefEditForm: CoClass};

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
