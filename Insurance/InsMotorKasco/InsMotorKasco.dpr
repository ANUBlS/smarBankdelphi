library InsMotorKasco;

uses
  ComServ,
  InsMotorKasco_TLB in 'InsMotorKasco_TLB.pas',
  InsMotorKascoImpl in 'InsMotorKascoImpl.pas' {fmInsMotorKasco: TActiveForm} {fmInsMotorKasco: CoClass},
  InsSettings in 'InsSettings.pas' {fmSettings},
  InsFindFilter in 'InsFindFilter.pas' {fmFind},
  DMMotorkaskoImpl in 'DMMotorkaskoImpl.pas' {DMMotorkasko: TDataModule};

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
