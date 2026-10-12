library CurrencyPosition;

uses
  ComServ,
  CurrencyPosition_TLB in 'CurrencyPosition_TLB.pas',
  CurrencyPositionImpl in 'CurrencyPositionImpl.pas' {FrmCurrencyPosition: TActiveForm} {FrmCurrencyPosition: CoClass},
  DataModCurrPositin in 'DataModCurrPositin.pas' {CPDataMod: TDataModule},
  UntCPReport in 'UntCPReport.pas' {CPReport: TQuickRep},
  UntMore in 'UntMore.pas' {FrmTuning},
  UntChecking in 'UntChecking.pas' {FrmChecking},
  UntCapital in 'UntCapital.pas' {frmCapital};

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
