library Resourceform;

uses
  ComServ,
  resorcen_TLB in 'resorcen_TLB.pas',
  Resourcen in 'Resourcen.pas' {resource: TActiveForm} {resource: CoClass},
  Unit1 in 'Group.pas' {Addgroup},
  datamod1 in 'datamod1.pas' {DataMod: TDataModule},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6};

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
