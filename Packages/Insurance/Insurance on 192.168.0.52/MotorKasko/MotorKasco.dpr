library MotorKasco;

uses
  ComServ,
  MotorKasco_TLB in 'MotorKasco_TLB.pas',
  fmMotorkascoImpl in 'fmMotorkascoImpl.pas' {fmMotorKasco: TActiveForm} {fmMotorkasco: CoClass},
  UMotorKascoDataMod in 'UMotorKascoDataMod.pas' {DataModkasco: TDataModule};

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
