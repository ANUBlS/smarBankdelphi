library ObrSaved;

uses
  ComServ,
  Project1_TLB in 'Project1_TLB.pas',
  ActXObrImplUnt in 'ActXObrImplUnt.pas' {ActXObr: TActiveForm},
  UntOBRDM in 'UntOBRDM.pas' {DataModMain: TDataModule},
  UntRep1 in 'UntRep1.pas' {QuickRepObr1: TQuickRep},
  UntRep2 in 'UntRep2.pas' {QuickRepObr2: TQuickRep};

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
