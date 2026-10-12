library Swift_Clearing;

uses
  ComServ,
  Swift_Clearing_TLB in 'Swift_Clearing_TLB.pas',
  Swift_Unit in 'Swift_Unit.pas' {Swift_Form: TActiveForm} {Swift_Form: CoClass},
  SelDialog in 'SelDialog.pas' {SelDirFrm},
  Transaction_Unit in 'Transaction_Unit.pas' {TransForm},
  Data_Unit in 'Data_Unit.pas' {DataMod: TDataModule},
  Payment_Det in 'Payment_Det.pas' {PaymentDetalsForm},
  TransTypeUnit in 'TransTypeUnit.pas' {TransCodeForm},
  Properties_Unit in 'Properties_Unit.pas' {PropertiesForm},
  PrepareFile_Unit in 'PrepareFile_Unit.pas' {PrepareFile_Form},
  FileSend_Unit in 'FileSend_Unit.pas' {SendFileForm},
  ReceiveMessDetals_Unit in 'ReceiveMessDetals_Unit.pas' {RecMessDet_Form};

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
