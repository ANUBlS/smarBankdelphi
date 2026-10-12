library UserManager;

uses
  ComServ,
  UserManager_TLB in 'UserManager_TLB.pas',
  UserManagerFormImpl in 'UserManagerFormImpl.pas' {UserManagerForm: TActiveForm} {UserManagerForm: CoClass};

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
