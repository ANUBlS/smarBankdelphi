program XmlExporter;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DataModuleImpl in 'DataModuleImpl.pas' {DataModuleMain: TDataModule},
  BankInfoImpl in 'BankInfoImpl.pas' {BankInfoForm},
  SpecimenSettingsImpl in 'SpecimenSettingsImpl.pas' {SpecimenForm},
  ReportDateImpl in 'ReportDateImpl.pas' {ReportDateForm},
  UnicodeSettingsImpl in 'UnicodeSettingsImpl.pas' {DecodingForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDecodingForm, DecodingForm);
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TBankInfoForm, BankInfoForm);
  Application.CreateForm(TSpecimenForm, SpecimenForm);
  Application.CreateForm(TReportDateForm, ReportDateForm);
  Application.Run;
end.
