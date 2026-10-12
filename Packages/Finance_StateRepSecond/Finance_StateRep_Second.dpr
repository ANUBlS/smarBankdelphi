library Finance_StateRep_Second;
  
uses
  ComServ,
  Finance_StateRep_Second_TLB in 'Finance_StateRep_Second_TLB.pas',
  Finance_State in 'Finance_State.pas' {Finance_StateForm: TActiveForm} {Finance_State: CoClass},
  UnitMainReport in 'UnitMainReport.pas' {QRFinanceRep: TQuickRep};

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
