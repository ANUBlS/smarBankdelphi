library SWIFT_INTERNATIONAL;

uses
  ComServ,
  INTER_SWIFT_TLB in 'INTER_SWIFT_TLB.pas',
  MAINUNIT in 'MAINUNIT.pas' {INTERNATIONAL_SWIFT: TActiveForm} {INTERNATIONAL_SWIFT: CoClass},
  INTdatamod in 'INTdatamod.pas' {DATAMODUL: TDataModule},
  adeditunit in 'adeditunit.pas' {addeditfrm};

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
