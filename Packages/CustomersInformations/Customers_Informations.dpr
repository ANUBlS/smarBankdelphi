library Customers_Informations;

uses
  ComServ,
  Customers_Informations_TLB in 'Customers_Informations_TLB.pas',
  CustomersInformationsImpl in 'CustomersInformationsImpl.pas' {CustomersInformations: TActiveForm} {CustomersInformations: CoClass};

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
