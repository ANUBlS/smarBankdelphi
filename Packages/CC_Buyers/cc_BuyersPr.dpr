library cc_BuyersPr;

uses
  ComServ,
  cc_BuyersPr_TLB in 'cc_BuyersPr_TLB.pas',
  cc_BuyersImpl in 'cc_BuyersImpl.pas' {cc_Buyers: TActiveForm} {cc_Buyers: CoClass},
  UnitData in 'UnitData.pas' {DataMod_Buyers: TDataModule},
  UnitAddBuyers in 'UnitAddBuyers.pas' {FormAddBuyers},
  UnitUpdBuyers in 'UnitUpdBuyers.pas' {FormUpdBuyers},
  UnitAccBuyers in 'UnitAccBuyers.pas' {FormAccBuyers},
  CC_AccTransact_Unit in 'CC_AccTransact_Unit.pas' {FormAccTransaction},
  CC_FormInterval_Unit in 'CC_FormInterval_Unit.pas' {FormInterval},
  CC_AccState_Unit in 'CC_AccState_Unit.pas' {FormAccState},
  CC_AccTransaction_Unit in 'CC_AccTransaction_Unit.pas' {FormAccOut},
  CC_AccInForm_Unit in 'CC_AccInForm_Unit.pas' {CC_ACCOutForm},
  CC_AccOutForm_Unit in 'CC_AccOutForm_Unit.pas' {CC_AccInForm},
  CC_Settings_Unit in 'CC_Settings_Unit.pas' {CC_Settings},
  CC_ACCInUnit in 'CC_ACCInUnit.pas' {FormAccIn},
  CC_Commision_Trans_Unit in 'CC_Commision_Trans_Unit.pas' {CC_Country_ins},
  CC_Repairing_Unit in 'CC_Repairing_Unit.pas' {CC_FormRepairing},
  CC_Country_Unit in 'CC_Country_Unit.pas' {CC_Country},
  Contractimpl in 'Contractimpl.pas' {FrmContract},
  DatModConstimpl in 'DatModConstimpl.pas' {DatModConstr: TDataModule},
  FlatsMgrIMPL in 'FlatsMgrIMPL.pas' {FlatsMgrForm},
  RepContImpl in 'RepContImpl.pas' {RepCont};

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
