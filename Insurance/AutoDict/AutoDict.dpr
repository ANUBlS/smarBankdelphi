library AutoDict;

uses
  ComServ,
  AutoDict_TLB in 'AutoDict_TLB.pas',
  AutoDictImpl in 'AutoDictImpl.pas' {fmAutoDict: TActiveForm} {fmAutoDict: CoClass},
  DMAutoDictImpl in 'DMAutoDictImpl.pas' {DMAutoDict: TDataModule};

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
