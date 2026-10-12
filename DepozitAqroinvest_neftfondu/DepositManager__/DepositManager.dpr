library DepositManager;

uses
  ComServ,
  DepositManager_TLB in 'DepositManager_TLB.pas',
  DepositManagerImpl in 'DepositManagerImpl.pas' {FrmDepositManager: TActiveForm} {FrmDepositManager: CoClass},
  UntDataModule in 'UntDataModule.pas' {DataModDeposits: TDataModule},
  ProgressUnit in 'ProgressUnit.pas' {ProgressForm},
  ExportUnit in 'ExportUnit.pas' {FrmExport};

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
