library DepositsManager;

uses
  ComServ,
  DepositsManagerImpl in 'DepositsManagerImpl.pas' {frmDepositsManager: TActiveForm} {DepositsManager: CoClass},
  DMDepositManagerImpl in 'DMDepositManagerImpl.pas' {DMDepositsManager: TDataModule},
  DepositsManager_TLB in 'DepositsManager_TLB.pas';

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
