library ContractCorrection;

uses
  ComServ,
  ContractCorrection_TLB in 'ContractCorrection_TLB.pas',
  UntContractCorrectionImpl in 'UntContractCorrectionImpl.pas' {FrmContractCorrection: TActiveForm} {FrmContractCorrection: CoClass};

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
