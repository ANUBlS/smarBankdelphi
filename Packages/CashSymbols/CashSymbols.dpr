library CashSymbols;

uses
  ComServ,
  CashSymbols_TLB in 'CashSymbols_TLB.pas',
  CashSymbolImpl in 'CashSymbolImpl.pas' {CashSymbolX: TActiveForm} {CashSymbolX: CoClass};

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
