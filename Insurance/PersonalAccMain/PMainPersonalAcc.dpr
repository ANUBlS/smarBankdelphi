library PMainPersonalAcc;

uses
  ComServ,
  PMainPersonalAcc_TLB in 'PMainPersonalAcc_TLB.pas',
  UMainPersonalAcc in 'UMainPersonalAcc.pas' {MainPersonalAcc: TActiveForm} {MainPersonalAcc: CoClass},
  USearch in 'USearch.pas' {frmSearch},
  DMMainPersonalImpl in 'DMMainPersonalImpl.pas' {DMMainPersonal: TDataModule};

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
