library RepOfKindPayOfDep;

uses
  ComServ,
  RepOfKindPayOfDep_TLB in 'RepOfKindPayOfDep_TLB.pas',
  frmRepOfKindPayOfDepImpl in 'frmRepOfKindPayOfDepImpl.pas' {frmRepOfKindPayOfDep: TActiveForm} {frmRepOfKindPayOfDep: CoClass},
  dmfrmRepOfKindPayOfDepImpl in 'dmfrmRepOfKindPayOfDepImpl.pas' {dmfrmRepOfKindPayOfDep: TDataModule};

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
