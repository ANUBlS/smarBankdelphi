library InsCustomers;

uses
  ComServ,
  InsCustomers_TLB in 'InsCustomers_TLB.pas',
  InsDataModule in 'InsDataModule.pas' {InsDataMod: TDataModule},
  InsCustomersProperties in 'InsCustomersProperties.pas' {fmCustomersProperties},
  AccountPropertiesImpl in 'AccountPropertiesImpl.pas' {AccountPropertiesForm},
  InsNewInsurance in 'InsNewInsurance.pas' {fmNewInsurance},
  InsSettings in 'InsSettings.pas' {fmSettings},
  InsAccSettings in 'InsAccSettings.pas' {fmAccSettings},
  InsPaymentPlan in 'InsPaymentPlan.pas' {fmPaymentPlan},
  InsAgents in 'InsAgents.pas' {frmAgents},
  InsProfit in 'InsProfit.pas' {fmBeneficary},
  InsPlanBuilder in 'InsPlanBuilder.pas' {fmPlanBuilder},
  InsPlanForm in 'InsPlanForm.pas' {fmPlanForm},
  InsCustomersFormImpl in 'InsCustomersFormImpl.pas' {InsCustomersForm: TActiveForm},
  AccInterval in 'AccInterval.pas' {FormInterval},
  InsCustFind in 'InsCustFind.pas' {fmCustFind},
  InsContFind in 'InsContFind.pas' {fmContFind},
  FrmAddAccpayment_lossImpl in 'FrmAddAccpayment_lossImpl.pas' {FrmAddAccpayment_loss},
  FrmAddBanksImpl in 'FrmAddBanksImpl.pas' {FrmAddBanks};

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
