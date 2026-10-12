library Cust_Analyzimpl;

uses
  ComServ,
  CustAnalyz_TLB in 'CustAnalyz_TLB.pas',
  CustAnalyzUnit in 'CustAnalyzUnit.pas' {CustAnalyz: TActiveForm} {CustAnalyz: CoClass},
  DataAnalyz in 'DataAnalyz.pas' {DataModCustAnalyz: TDataModule},
  SeduleUnit in 'SeduleUnit.pas' {FormSedule},
  PaymentsUnit1pas in 'PaymentsUnit1pas.pas' {FormPayments};

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
