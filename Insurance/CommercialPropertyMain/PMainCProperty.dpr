library PMainCProperty;

uses
  ComServ,
  PMainCProperty_TLB in 'PMainCProperty_TLB.pas',
  UMainCProperty in 'UMainCProperty.pas' {frmMainCProperty: TActiveForm} {MainCProperty: CoClass},
  USearch in 'USearch.pas' {frmSearch},
  DMMainCPropertyImpl in 'DMMainCPropertyImpl.pas' {DMMainCProperty: TDataModule};

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
