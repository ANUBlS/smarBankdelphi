library CountriesP;

uses
  ComServ,
  CountriesP_TLB in 'CountriesP_TLB.pas',
  CountriesImpl1 in 'CountriesImpl1.pas' {Countries: TActiveForm} {Countries: CoClass};

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
