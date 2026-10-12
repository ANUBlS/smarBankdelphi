library RepairNew;

uses
  ComServ,
  RepairNew_TLB in 'RepairNew_TLB.pas',
  RepairNewDataModule in 'RepairNewDataModule.pas' {RapNewDataModule: TDataModule},
  RepairNewImpl in 'RepairNewImpl.pas' {RepairNewMain: TActiveForm} {RepairNewMain: CoClass},
  RepairNewEdit in 'RepairNewEdit.pas' {RepairEdit},
  RepairDelete in 'RepairDelete.pas' {RepDelete};

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
