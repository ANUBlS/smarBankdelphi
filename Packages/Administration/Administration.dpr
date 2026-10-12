library Administration;



uses
  ComServ,
  Administration_TLB in 'Administration_TLB.pas',
  AdministrationDataModule in 'AdministrationDataModule.pas' {AdministrationData: TDataModule},
  AdministrationMainForm in 'AdministrationMainForm.pas' {AdministrationForm: TActiveForm} {AdministrationForm: CoClass},
  AdmBarForm in 'AdmBarForm.pas' {BarForm},
  AdministrationUserAddForm in 'AdministrationUserAddForm.pas' {fmUserSetup},
  AdministrationClassEdit in 'AdministrationClassEdit.pas' {fmClassEdit},
  AdministrationUserPassw in 'AdministrationUserPassw.pas' {fmUserPassw},
  AdministrationModEdit in 'AdministrationModEdit.pas' {fmModEdit},
  AdministrationOwnerSheep in 'AdministrationOwnerSheep.pas' {FmOwnerSheep},
  administrationUsersRefresh in 'administrationUsersRefresh.pas' {fmUsersRefresh},
  AdministrationAdvancedGrants in 'AdministrationAdvancedGrants.pas' {fmAdvancedgrants},
  AdministrationOwnerSheepAdvanced in 'AdministrationOwnerSheepAdvanced.pas' {fmAdmOwnerChangeAdvanced},
  DuplicateUint in 'DuplicateUint.pas',
  AdministrationGroupReport in 'AdministrationGroupReport.pas' {rptQroup: TQuickRep},
  AdministrationUserGranReport in 'AdministrationUserGranReport.pas' {rptUsers: TQuickRep},
  AdministrationUtils in 'AdministrationUtils.pas',
  AdministrationProfOptions in 'AdministrationProfOptions.pas' {fmProfOptions},
  adm_AdvGrantAddEditForm in 'adm_AdvGrantAddEditForm.pas' {frmAddEditAdvGrants},
  AdministrationUserAdvGranReport in 'AdministrationUserAdvGranReport.pas' {rptAdvgrant: TQuickRep},
  adm_classesAdvInfoImpl in 'adm_classesAdvInfoImpl.pas' {frmClassesAdvInfo},
  adm_classesGrants in 'adm_classesGrants.pas' {frmClassGrants},
  COPYCLASS in 'COPYCLASS.pas' {CLSCOPY},
  finger in 'finger.pas' {fingers},
  bsdkdll in 'bsdkdll.pas';

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
