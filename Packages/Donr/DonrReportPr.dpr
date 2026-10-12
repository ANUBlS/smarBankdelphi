library DonrReportPr;

uses
  ComServ,
  DonrReportPr_TLB in 'DonrReportPr_TLB.pas',
  DonrReportImpl in 'DonrReportImpl.pas' {DonrReport: TActiveForm} {DonrReport: CoClass},
  DataModDonrimpl in 'DataModDonrimpl.pas' {DataModDonr: TDataModule},
  ExDonurimpl in 'ExDonurimpl.pas' {exdonr};

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
