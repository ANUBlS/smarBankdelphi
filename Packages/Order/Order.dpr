library Order;

uses
  ComServ,
  Order_TLB in 'Order_TLB.pas',
  OrderImpl in 'OrderImpl.pas' {OrderForm: TActiveForm} {OrderForm: CoClass},
  OrderReportUnit in 'OrderReportUnit.pas' {OrderRpt: TQuickRep},
  OrderDataModuleUnit in 'OrderDataModuleUnit.pas' {DataModOrder: TDataModule},
  CurrencyToHRImpl in 'CurrencyToHRImpl.pas',
  CurrencyToHR_Azeri_ in 'CurrencyToHR_Azeri_.pas',
  OrderPropertyPage in 'OrderPropertyPage.pas' {PropertyPage1: TPropertyPage};

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
