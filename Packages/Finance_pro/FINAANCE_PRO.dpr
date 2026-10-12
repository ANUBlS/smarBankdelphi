library FINAANCE_PRO;

uses
  ComServ,
  FINANCE_PRO_TLB in 'FINANCE_PRO_TLB.pas',
  FinanceProUnit in 'FinanceProUnit.pas' {FINANCEPRO: TActiveForm} {FINANCEPRO: CoClass};

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
