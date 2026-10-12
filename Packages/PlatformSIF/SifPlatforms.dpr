library SifPlatforms;

uses
  ComServ,
  Sifplatform_TLB in 'Sifplatform_TLB.pas',
  MainForm in 'MainForm.pas' {Sif: TActiveForm} {Sif: CoClass},
  Datamoduls in 'Datamoduls.pas' {DataMod: TDataModule},
  UnitApprove in 'UnitApprove.pas' {ApproveForm},
  Unitreject in 'Unitreject.pas' {RejectForm};

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
