library MoneyTransfersImpl;

uses
  ComServ,
  MoneyTransfersImpl_TLB in 'MoneyTransfersImpl_TLB.pas',
  MoneyTtransfers in 'MoneyTtransfers.pas' {MoneyTransfers: TActiveForm} {MoneyTransfers: CoClass};

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
