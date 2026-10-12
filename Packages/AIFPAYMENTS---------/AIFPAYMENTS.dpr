library AIFPAYMENTS;

uses
  ComServ,
  AIFPAYMENTS_TLB in 'AIFPAYMENTS_TLB.pas',
  AIFPAYMENTImpl in 'AIFPAYMENTImpl.pas' {AIFPAYMENT: TActiveForm} {AIFPAYMENT: CoClass},
  DataAIFUnit in 'DataAIFUnit.pas' {DataModuleAIF: TDataModule},
  AIFSearchUnit in 'AIFSearchUnit.pas' {FormAifSearch},
  AIFDirektoryUnit in 'AIFDirektoryUnit.pas' {FormAIFDirectory},
  UnitAifAdmin in 'UnitAifAdmin.pas' {FormAdmin},
  UnitAIFArchive in 'UnitAIFArchive.pas' {FormAifArchive},
  UnitAifMxAccount in 'UnitAifMxAccount.pas' {FormAifMxAccount},
  UnitAccountTrans in 'UnitAccountTrans.pas' {FormAccountTrans};

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
