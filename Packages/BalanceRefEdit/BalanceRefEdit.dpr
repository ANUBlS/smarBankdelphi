library BalanceRefEdit;

uses
  ComServ,
  BalanceRefEdit_TLB in 'BalanceRefEdit_TLB.pas',
  BalanceRefEditImpl1 in 'BalanceRefEditImpl1.pas' {BalanceRefEditX: TActiveForm} {BalanceRefEditX: CoClass};

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
