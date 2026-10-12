
library BankInfo;

uses
  ComServ,
  BankInfo_TLB in 'BankInfo_TLB.pas' {/BankInfoImpl1 in 'BankInfoImpl1.pas' {BankInfoX: TActiveForm} {/BankInfoImpl1 in 'BankInfoImpl1.pas' {BankInfoX: TActiveForm} {BankInfoX: CoClass},
  BankInfoImpl1 in 'BankInfoImpl1.pas' {BankInfoX: TActiveForm} {BankInfoX: CoClass},
  Bnkinfo in 'Bnkinfo.pas' {Form21},
  frminfo in 'frminfo.pas' {Form23};

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
