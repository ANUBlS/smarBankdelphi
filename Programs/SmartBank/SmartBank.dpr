program SmartBank;

uses
  Forms,
  sbMainForm_Unit in 'sbMainForm_Unit.pas' {sbMainForm},
  PluginViewImpl in 'PluginViewImpl.pas' {PluginViewForm},
  AlertThread in 'AlertThread.pas',
  ErrorFormImpl in 'ErrorFormImpl.pas' {ErrorForm},
  AbountProgrammUnit in 'AbountProgrammUnit.pas' {frmAbout},
  PasswordChange_unit in 'PasswordChange_unit.pas' {PasswordChange},
  SmLicense1 in 'SmLicense1.pas',
  CompanySelection in 'CompanySelection.pas' {CompanyForm};

{$R *.RES}

begin
  HintWindowClass := TAzHint;
  Application.Initialize;
  Application.CreateForm(TsbMainForm, sbMainForm);
  Application.CreateForm(TErrorForm, ErrorForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TCompanyForm, CompanyForm);
  Application.Run;
end.
