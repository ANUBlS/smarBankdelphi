library WesternUnion;

uses
  ComServ,
  WesternUnion_TLB in 'WesternUnion_TLB.pas',
  WesternUnionImpl in 'WesternUnionImpl.pas' {WesternUnionForm: TActiveForm} {WesternUnionForm: CoClass},
  DataModuleUnit in 'DataModuleUnit.pas' {DataModWU: TDataModule},
  ConfigUnit in 'ConfigUnit.pas' {FormConfig};

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
