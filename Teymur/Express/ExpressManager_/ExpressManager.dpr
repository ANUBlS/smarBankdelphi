library ExpressManager;

uses
  ComServ,
  ExpressManager_TLB in 'ExpressManager_TLB.pas',
  ExpressManagerImpl in 'ExpressManagerImpl.pas' {Express: TActiveForm} {Express: CoClass},
  ExpDataModuleUnit in 'ExpDataModuleUnit.pas' {ExpDataModule: TDataModule},
  ExpUnitImpl in 'ExpUnitImpl.pas' {ExpFormAdd: TExpFormAdd},
  ExpParameterUnit in 'ExpParameterUnit.pas' {ExpParameter},
  OrderPrintUnit in 'OrderPrintUnit.pas' {QReportOrder: TQuickRep},
  CurrectionUnit in 'CurrectionUnit.pas' {FormCurrection},
  ExpSubUnit in 'ExpSubUnit.pas' {ExpSubForm},
  ExpComAccUnit in 'ExpComAccUnit.pas' {ExpComAccForm},
  ExpCustomersTypeUnit in 'ExpCustomersTypeUnit.pas' {ExpCustomersType},
  ExpComTransactionUnit in 'ExpComTransactionUnit.pas' {ExpComTransactionForm},
  ExpArchiveUnit in 'ExpArchiveUnit.pas' {ExpArchiveForm},
  OrderPrintXUnit in 'OrderPrintXUnit.pas' {QuickReportXOrder: TQuickRep},
  AdminUnit in 'AdminUnit.pas' {AdminForm},
  ExpUnitNewImpl in 'ExpUnitNewImpl.pas' {ExpFormNew},
  ExpAllParametrUnit in 'ExpAllParametrUnit.pas' {ExpAllParametr},
  ExpAccTypeUnit in 'ExpAccTypeUnit.pas' {ExpAccType},
  UnitSearchCustName in 'UnitSearchCustName.pas' {FormSearchCustName},
  ExpPasswordUnit in 'ExpPasswordUnit.pas' {ExpPasswordForm},
  UnitSearchLegalCustName in 'UnitSearchLegalCustName.pas' {FormSearchLegalCustName},
  UnitPayments in 'UnitPayments.pas' {FormPayments},
  UnitPaymentsCredit in 'UnitPaymentsCredit.pas' {FormPaymentsCredit},
  AdminAllUnit in 'AdminAllUnit.pas' {AdminAllForm};


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
