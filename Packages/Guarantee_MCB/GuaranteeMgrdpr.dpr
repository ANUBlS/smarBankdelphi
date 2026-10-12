library GuaranteeMgrdpr;

uses
  ComServ,
  GuaranteeMgrdpr_TLB in 'GuaranteeMgrdpr_TLB.pas',
  GuaranteeMgrImpl in 'GuaranteeMgrImpl.pas' {GuaranteeMgr: TActiveForm} {GuaranteeMgr: CoClass},
  DataMGuarantee in 'DataMGuarantee.pas' {GuaDataMGuarante: TDataModule},
  FormGuarAddlmpl in 'FormGuarAddlmpl.pas' {FormGuarAdd},
  FormGuarpldginfolmpl in 'FormGuarpldginfolmpl.pas' {FormGuarpldginfo},
  FormGinfolmpl in 'FormGinfolmpl.pas' {FormGinfo},
  FormGua_Creditlmpl in 'FormGua_Creditlmpl.pas' {FormGua_Credit},
  AftoInfiIpl in 'AftoInfiIpl.pas' {AftoInfiIpl},
  Unit16 in 'Unit16.pas' {FormGua_creditDel},
  UnitAvtoAdd in 'UnitAvtoAdd.pas' {FormAfto};

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
