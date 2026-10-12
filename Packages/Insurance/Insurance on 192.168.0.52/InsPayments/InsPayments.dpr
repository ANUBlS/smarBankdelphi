library InsPayments;

uses
  ComServ,
  InsPayments_TLB in 'InsPayments_TLB.pas',
  PaymentsMainImpl in 'PaymentsMainImpl.pas' {fmPaymentsMain: TActiveForm} {fmPaymentsMain: CoClass},
  InsDataMod in 'InsDataMod.pas' {PayDataMod: TDataModule},
  InsNewPayment in 'InsNewPayment.pas' {fmNewPayments};

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
