library QK_IMORT;

uses
  ComServ,
  QKI_mport_TLB in 'QKI_mport_TLB.pas',
  QK_ImoprtUnit in 'QK_ImoprtUnit.pas' {QK_Import: TActiveForm} {QK_Import: CoClass},
  QK_İmpotDataMod in 'QK_İmpotDataMod.pas' {QKİmportDataMod: TDataModule},
  FormReport in 'FormReport.pas' {Form_Report},
  Income_Form in 'Income_Form.pas' {IncomeForm},
  FormAccNoBalCN in 'FormAccNoBalCN.pas' {FormAccNo_BalCN},
  FormBal_CN in 'FormBal_CN.pas' {FormBalCN},
  ExcelCheckImpl in 'ExcelCheckImpl.pas' {ExcelCheck};

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
