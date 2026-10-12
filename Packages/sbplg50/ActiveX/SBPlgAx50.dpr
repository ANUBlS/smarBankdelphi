library SBPlgAx50;

uses
  ComServ,
  SBPlgAx50_TLB in 'SBPlgAx50_TLB.pas',
  SBPlgAc50BufferFormImpl in 'SBPlgAc50BufferFormImpl.pas' {SBPlgAc50BufferForm: TActiveForm} {SBPlgAc50BufferForm: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

{$E ocx}

begin
end.
