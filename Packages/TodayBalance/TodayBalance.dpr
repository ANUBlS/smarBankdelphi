library TodayBalance;

uses
  ComServ,
  TodayBalance_TLB in 'TodayBalance_TLB.pas',
  TodayBalanceImpl in 'TodayBalanceImpl.pas' {FrmTodayBalance: TActiveForm} {FrmTodayBalance: CoClass},
  UntBalanceRpt1 in 'UntBalanceRpt1.pas' {BalanceRpt1: TQuickRep},
  UntBalanceRpt2 in 'UntBalanceRpt2.pas' {BalanceRpt2: TQuickRep},
  UntBalnceRpt3 in 'UntBalnceRpt3.pas' {BalanceRpt3: TQuickRep},
  TB_DataModuleImpl in 'TB_DataModuleImpl.pas' {DataModTB: TDataModule},
  TB_DECLS in 'TB_DECLS.pas',
  BalanceChecking_Unit in 'BalanceChecking_Unit.pas' {FrmBalanceChecking};

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
