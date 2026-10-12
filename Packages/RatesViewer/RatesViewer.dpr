library RatesViewer;

uses
  ComServ,
  RatesViewer_TLB in 'RatesViewer_TLB.pas',
  UntRatesImpl in 'UntRatesImpl.pas' {FrmRates: TActiveForm} {FrmRates: CoClass};

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
