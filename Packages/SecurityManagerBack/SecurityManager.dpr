library SecurityManager;

uses
  ComServ,
  SecurityManager_TLB in 'SecurityManager_TLB.pas',
  SecurityManagerFormImpl in 'SecurityManagerFormImpl.pas' {SecurityManagerForm: TActiveForm} {SecurityManagerForm: CoClass},
  GroupPropsFormImpl in 'GroupPropsFormImpl.pas' {GroupPropsForm},
  UserPropsFormImpl in 'UserPropsFormImpl.pas' {UserPropsForm},
  InstallationTaskManagerPageImpl in 'InstallationTaskManagerPageImpl.pas' {InstallationTaskManagerPage: TPropertyPage},
  PasswordInputDialogImpl in 'PasswordInputDialogImpl.pas' {PasswordInputDialog},
  ModulePropsForm_Unit in 'ModulePropsForm_Unit.pas' {ModulePropsForm};

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
