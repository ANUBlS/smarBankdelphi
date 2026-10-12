library goAmlReport;

uses
  ComServ,
  goAml_TLB in 'goAml_TLB.pas',
  goAmlImpl in 'goAmlImpl.pas' {goAml: TActiveForm} {goAml: CoClass},
  DMgoAmlUnit in 'DMgoAmlUnit.pas' {DMgoAml: TDataModule},
  DMgoAmlUnit_DT in 'DMgoAmlUnit_DT.pas' {DMgoAml_DT: TDataModule};

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
