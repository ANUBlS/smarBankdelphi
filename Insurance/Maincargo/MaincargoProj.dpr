library MaincargoProj;

uses
  ComServ,
  MaincargoProj_TLB in 'MaincargoProj_TLB.pas',
  MaincargoImpl in 'MaincargoImpl.pas' {Maincargo: TActiveForm} {Maincargo: CoClass},
  DMMainCargoimpl in 'DMMainCargoimpl.pas' {DMMainCargo: TDataModule};

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
