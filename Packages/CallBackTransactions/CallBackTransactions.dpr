library CallBackTransactions;

uses
  ComServ,
  CallBackTransactions_TLB in 'CallBackTransactions_TLB.pas',
  CallBackTransactionsImpl in 'CallBackTransactionsImpl.pas' {CallBackTransactionsForm: TActiveForm} {CallBackTransactionsForm: CoClass};

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
