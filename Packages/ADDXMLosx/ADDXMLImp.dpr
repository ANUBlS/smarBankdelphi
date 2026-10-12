library ADDXMLImp;

uses
  ComServ,
  ADD_XML_TLB in 'ADD_XML_TLB.pas',
  ADD_XML in 'ADD_XML.pas' {ADDXML: TActiveForm} {ADDXML: CoClass},
  UnitFile in 'UnitFile.pas' {FormFile};

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
