library CableManager;

uses
  ComServ,
  CableManager_TLB in 'CableManager_TLB.pas',
  CableManImpl in 'CableManImpl.pas' {CableMan: TActiveForm} {CableMan: CoClass},
  CableManDataModuleImpl in 'CableManDataModuleImpl.pas' {DataModCable: TDataModule},
  CableManAddEditImpl in 'CableManAddEditImpl.pas' {frmAbonAddEdit},
  CableManContractAdd in 'CableManContractAdd.pas' {frmContractAdd},
  CableManServAddEdit in 'CableManServAddEdit.pas' {frmServAddEdit},
  qrpCableRep in 'qrpCableRep.pas' {qrpMain: TQuickRep},
  CableManAccsImpl in 'CableManAccsImpl.pas' {frmAcc},
  CableManRepSet in 'CableManRepSet.pas' {frmPrintRep};

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
