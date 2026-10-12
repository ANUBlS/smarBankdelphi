library Round_upCreditRep;

uses
  ComServ,
  Round_upCreditRep_TLB in 'Round_upCreditRep_TLB.pas',
  frmRound_upCreditRepImpl in 'frmRound_upCreditRepImpl.pas' {frmRound_upCreditRep: TActiveForm} {frmRound_upCreditRep: CoClass},
  dmRound_upCreditRepImpl in 'dmRound_upCreditRepImpl.pas' {dmRound_upCreditRep: TDataModule},
  frmDetailImpl in 'frmDetailImpl.pas' {frmDetail};

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
