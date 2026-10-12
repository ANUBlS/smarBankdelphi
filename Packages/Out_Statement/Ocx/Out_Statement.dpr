library Out_Statement;

uses
  ComServ,
  Out_Statement_TLB in 'Out_Statement_TLB.pas',
  Out_StatementImpl in 'Out_StatementImpl.pas' {Out_StatementForm: TActiveForm} {ActiveFormX: CoClass},
  Out_Stdatamod_Unit in 'Out_Stdatamod_Unit.pas' {Out_Stdatamod: TDataModule},
  Out_Rep_Unit in 'Out_Rep_Unit.pas' {FormRep},
  Out_RepR_Unit in 'Out_RepR_Unit.pas' {FormRepR},
  Out_FormTransView_Unit in 'Out_FormTransView_Unit.pas' {FormTransView};

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
