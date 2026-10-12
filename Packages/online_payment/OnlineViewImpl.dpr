library OnlineViewImpl;

uses
  ComServ,
  OnlineView_TLB in 'OnlineView_TLB.pas',
  OnlineViewUnit in 'OnlineViewUnit.pas' {OnlineView: TActiveForm} {OnlineView: CoClass},
  WspayDataUnit in 'WspayDataUnit.pas' {WS_PAYDataModule: TDataModule};

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
