library PMy_Personal_Accident;

uses
  ComServ,
  My_Personal_Accident_TLB in 'My_Personal_Accident_TLB.pas',
  MainFormimpl in 'MainFormimpl.pas' {My_Personal_Accident: TActiveForm} {My_Personal_Accident: CoClass},
  Dm_PMy_Accimpl in 'Dm_PMy_Accimpl.pas' {DataModule2: TDataModule};

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
