library EmanatView;

uses
  ComServ,
  Emanat_view_TLB in 'Emanat_view_TLB.pas',
  EmanatviewUnit in 'EmanatviewUnit.pas' {Emwanat_view: TActiveForm} {Emwanat_view: CoClass},
  dataEmantUnit in 'dataEmantUnit.pas' {DataEmanat: TDataModule};

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
