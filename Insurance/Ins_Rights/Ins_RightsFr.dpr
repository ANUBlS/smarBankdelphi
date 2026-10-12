library Ins_RightsFr;

uses
  ComServ,
  Ins_Rights_TLB in 'Ins_Rights_TLB.pas',
  Ins_RightsUnit in 'Ins_RightsUnit.pas' {Ins_Rights: TActiveForm} {Ins_Rights: CoClass};

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
