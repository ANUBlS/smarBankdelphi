
library Acceptedportfel;

uses
  ComServ,
  Accepted_portfel_TLB in 'Accepted_portfel_TLB.pas',
  mainUnit in 'mainUnit.pas' {Acceptedportfell: TActiveForm} {Acceptedportfell: CoClass},
  Datamodunit in 'Datamodunit.pas' {DataMod: TDataModule},
  NewFrm in 'NewFrm.pas' {Addingnew},
  trasactions in 'trasactions.pas' {Transacfrm},
  SettingsUnit in 'SettingsUnit.pas' {SettingFrm},
  PaymentsUnit in 'PaymentsUnit.pas' {Payments},
  PaymentreportUnit in 'PaymentreportUnit.pas' {Payreport},
  Unitselection in 'Unitselection.pas' {SelectionUnit},
  CourtUNIT in 'CourtUNIT.pas' {CourtFrm},
  PropertyUnit in 'PropertyUnit.pas' {Propertyfrm},
  Unittranarxiv in 'Unittranarxiv.pas' {ArxivTran},
  SelectionAcc in 'SelectionAcc.pas' {Accselect},
  EDÝTORFORM in 'EDÝTORFORM.pas' {Editform};

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
