library CC_CashOperationMgr;

uses
  ComServ,
  CC_CashOperationMgr_TLB in 'CC_CashOperationMgr_TLB.pas',
  CC_CashOperationImpl in 'CC_CashOperationImpl.pas' {CC_CashOperation: TActiveForm} {CC_CashOperation: CoClass},
  PayForm in 'PayForm.pas' {Pay},
  TransactionviewFormImpl in 'TransactionviewFormImpl.pas' {TransactionviewForm},
  cc_DataMod_CashOper in 'cc_DataMod_CashOper.pas' {DataMod_CCCashOper: TDataModule},
  OrderImpl in 'OrderImpl.pas' {FrmOrder},
  OrderPayRepFrm in 'OrderPayRepFrm.pas' {OrderPayRep};

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
