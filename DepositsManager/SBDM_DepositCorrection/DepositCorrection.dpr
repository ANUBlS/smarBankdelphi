library DepositCorrection;

uses
  ComServ,
  DepositCorrection_TLB in 'DepositCorrection_TLB.pas',
  DepositCorrectionImpl in 'DepositCorrectionImpl.pas' {FrmDepositCorrection: TActiveForm} {FrmDepositCorrection: CoClass};

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
