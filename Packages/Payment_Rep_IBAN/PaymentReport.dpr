library PaymentReport;

uses
  ComServ,
  PaymentReport_TLB in 'PaymentReport_TLB.pas',
  PaymentReportImpl in 'PaymentReportImpl.pas' {Payment_Report: TActiveForm} {Payment_Report: CoClass},
  Frmaccgrimpl in 'Frmaccgrimpl.pas' {PaymentACC};

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
