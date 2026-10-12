library DepositsManagernew;

uses
  ComServ,
  DepositsManager_New_TLB in 'DepositsManager_New_TLB.pas',
  DepositsManagerImpl_new in 'DepositsManagerImpl_new.pas' {DepositsManager_new: TActiveForm} {DepositsManager_new: CoClass},
  DMDepositManagerImpl_new in 'DMDepositManagerImpl_new.pas' {DMDepositsManager_new: TDataModule};

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
