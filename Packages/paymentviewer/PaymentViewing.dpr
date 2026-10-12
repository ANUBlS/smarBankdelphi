library PaymentViewing;

uses
  ComServ,
  PaymentViewing_TLB in 'PaymentViewing_TLB.pas',
  ViewPayments in 'ViewPayments.pas' {PaymentViewer: TActiveForm} {PaymentViewer: CoClass},
  Datamodules in 'Datamodules.pas' {DataModule5: TDataModule};

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
