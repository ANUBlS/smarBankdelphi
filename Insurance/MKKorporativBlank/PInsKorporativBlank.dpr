library PInsKorporativBlank;

uses
  ComServ,
  PInsKorporativBlank_TLB in 'PInsKorporativBlank_TLB.pas',
  UInsKorporativKasco in 'UInsKorporativKasco.pas' {frmInsKorporativKasco: TActiveForm} {InsKorporativKasco: CoClass},
  DModuleInsKorporativ in 'DModuleInsKorporativ.pas' {DModuleKorporativ: TDataModule},
  UAvto in 'UAvto.pas' {frmAvto};

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
