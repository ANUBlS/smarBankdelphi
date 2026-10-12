library ccBuyers;

uses
  ComServ,
  ccBuyers_TLB in 'ccBuyers_TLB.pas',
  ccBuyersFormImpl1 in 'ccBuyersFormImpl1.pas' {ccBuyersForm: TActiveForm} {ccBuyersForm: CoClass},
  UnitDataModccBuyers in 'UnitDataModccBuyers.pas' {DataModccBuyers: TDataModule},
  UnitBuyers in 'UnitBuyers.pas' {FormBuyers};

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
