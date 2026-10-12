library FixedAssetsManagers;

uses
  ComServ,
  FixedAssetsManager_TLB in 'FixedAssetsManager_TLB.pas',
  FixedAssetsManager in 'FixedAssetsManager.pas' {FixedAssetsImpl: TActiveForm} {FixedAssetsImpl: CoClass},
  FixedAssetsAdditional in 'FixedAssetsAdditional.pas' {FixedAssetsAdd};

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
