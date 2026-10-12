library PCPropertyBlank;

uses
  ComServ,
  PCPropertyBlank_TLB in 'PCPropertyBlank_TLB.pas',
  UCProperty in 'UCProperty.pas' {CProperty: TActiveForm} {CProperty: CoClass},
  URisks in 'URisks.pas' {RiskForm},
  UDModule in 'UDModule.pas' {DModule: TDataModule};

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
