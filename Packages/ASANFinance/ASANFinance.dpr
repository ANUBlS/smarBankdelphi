library ASANFinance;

uses
  ComServ,
  ASANFinance_TLB in 'ASANFinance_TLB.pas',
  ASANFinanceImpl in 'ASANFinanceImpl.pas' {ASANFinanceForm: TActiveForm} {ASANFinanceForm: CoClass},
  AsanDmInpl in 'AsanDmInpl.pas' {AsanDm: TDataModule},
  PersonalQrFmImpl in 'PersonalQrFmImpl.pas' {PersonalQrFm},
  EpployeRepImpl in 'EpployeRepImpl.pas' {EpployeRepFrm},
  PensioonRepImpl in 'PensioonRepImpl.pas' {PesionRepFrm},
  EtkisRep›mpl in 'EtkisRep›mpl.pas' {RepEtkisFrm},
  VoenRepImpl in 'VoenRepImpl.pas' {VoenForm};

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
