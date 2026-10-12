library MKBlank;

uses
  ComServ,
  MKBlank_TLB in 'MKBlank_TLB.pas',
  UMKBlank in 'UMKBlank.pas' {fmMKBlank: TActiveForm} {fmMKBlank: CoClass},
  UMKDataMod in 'UMKDataMod.pas' {InsMKDataMod: TDataModule},
  UMKAccesories in 'UMKAccesories.pas' {frmAccessories},
  UClaims in 'UClaims.pas' {frmClaims};

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
