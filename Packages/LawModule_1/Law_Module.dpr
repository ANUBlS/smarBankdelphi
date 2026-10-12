library Law_Module;

uses
  ComServ,
  Lawmodule_TLB in 'Lawmodule_TLB.pas',
  Mainscreen in 'Mainscreen.pas' {Lawmodule: TActiveForm} {Lawmodule: CoClass},
  CourtUNIT in 'CourtUNIT.pas' {CourtFrm},
  Unit5 in 'Unit5.pas' {DataModule5: TDataModule};

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
