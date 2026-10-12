library SimCorpMgr;

uses
  ComServ,
  SimCorp_TLB in 'SimCorp_TLB.pas',
  SimCorpImpl in 'SimCorpImpl.pas' {SimCorp: TActiveForm} {SimCorp: CoClass},
  EditFormImpl in 'EditFormImpl.pas' {EditForm};

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
