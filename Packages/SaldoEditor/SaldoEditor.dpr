library SaldoEditor;

uses
  ComServ,
  SaldoEditor_TLB in 'SaldoEditor_TLB.pas',
  SaldoEditorFormImpl in 'SaldoEditorFormImpl.pas' {SaldoEditorForm: TActiveForm} {SaldoEditorForm: CoClass};

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
