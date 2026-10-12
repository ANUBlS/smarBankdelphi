library BBPayings;

uses
  ComServ,
  BBPayings_TLB in 'BBPayings_TLB.pas',
  BBPayingsImpl in 'BBPayingsImpl.pas' {BBPayingsForm: TActiveForm} {BBPayingsForm: CoClass},
  UnitDataModBBPayings in 'UnitDataModBBPayings.pas' {DataModBBPayings: TDataModule},
  UnitBBPayingAdd in 'UnitBBPayingAdd.pas' {FormBBPayingAdd};

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
