library LVPCSSManager;

uses
  ComServ,
  LVPCSSManager_TLB in 'LVPCSSManager_TLB.pas',
  LVPCSSImpl in 'LVPCSSImpl.pas' {LVPCSSForm: TActiveForm} {LVPCSS: CoClass},
  cryptounit in 'cryptounit.pas',
  Data_Unit in 'Data_Unit.pas' {DataMod: TDataModule},
  FileSend_Unit in 'FileSend_Unit.pas' {SendFileForm},
  Payment_Det in 'Payment_Det.pas' {PaymentDetalsForm},
  PrepareFile_Unit in 'PrepareFile_Unit.pas' {PrepareFile_Form},
  Properties_Unit in 'Properties_Unit.pas' {PropertiesForm},
  ReceiveMessDetals_Unit in 'ReceiveMessDetals_Unit.pas' {RecMessDet_Form},
  Transaction_Unit in 'Transaction_Unit.pas' {TransForm},
  TransTypeUnit in 'TransTypeUnit.pas' {TransCodeForm},
  AcceptTransUnit in 'AcceptTransUnit.pas' {FormAcceptTransaction},
  add_new_shablon in 'add_new_shablon.pas' {Add_new},
  Get_to_shablon_unit in 'Get_to_shablon_unit.pas' {Form_get_to_shablon},
  Unit_setting in 'Unit_setting.pas' {Form_Setting},
  Unit_Report in 'Unit_Report.pas' {Form_Report},
  Admin_Setting in 'Admin_Setting.pas' {Form_Admin_Setting},
  Unit_Report_in in 'Unit_Report_in.pas' {Form_Report_in},
  Vergi_Unit in 'Vergi_Unit.pas' {VergiForm},
  Unit_ReportX in 'Unit_ReportX.pas' {ReportX},
  Witch in 'Witch.pas' {FormWitch},
  Unit_ReportinX in 'Unit_ReportinX.pas' {ReportinX: TQuickRep},
  Verifying in 'Verifying.pas' {verify},
  Unit20 in 'Unit20.pas' {Form20};

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
