
library TaxsImpl;

uses
  ComServ,
  TAXS_TLB in 'TAXS_TLB.pas',
  Unit1 in 'Unit1.pas' {repp: TQuickRep},
  TaxsUnit in 'TaxsUnit.pas' {TAXS: TActiveForm} {TAXS: CoClass},
  Unit3 in 'Unit3.pas' {Form3};

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
