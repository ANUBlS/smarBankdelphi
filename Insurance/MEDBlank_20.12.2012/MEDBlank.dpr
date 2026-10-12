library MEDBlank;

uses
  ComServ,
  MEDBlank_TLB in 'MEDBlank_TLB.pas',
  fmMedBlankImpl in 'fmMedBlankImpl.pas' {fmMedBlank: TActiveForm} {fmMedBlank: CoClass},
  UEmploees in 'UEmploees.pas' {fmEmploees},
  UDataMod in 'UDataMod.pas' {MedBDataMod: TDataModule};

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
