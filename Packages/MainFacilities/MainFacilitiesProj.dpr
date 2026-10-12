library MainFacilitiesProj;

uses
  ComServ,
  MainFacilitiesProj_TLB in 'MainFacilitiesProj_TLB.pas',
  UntMainFacilitiesImpl in 'UntMainFacilitiesImpl.pas' {MainFacilities: TActiveForm},
  MFDataModule in 'MFDataModule.pas' {MainFDataModule: TDataModule},
  UntAddWares in 'UntAddWares.pas' {FrmAddWares},
  UntRptMainF in 'UntRptMainF.pas' {RptDepartments: TQuickRep},
  UntAddGroups in 'UntAddGroups.pas' {FrmAddGroups},
  UntDelWares in 'UntDelWares.pas' {FrmDelWares},
  UntQuery in 'UntQuery.pas' {FrmQuery},
  UntPrint in 'UntPrint.pas' {FrmPrint},
  InventarCard in 'InventarCard.pas' {RPTInventarCard: TQuickRep},
  UntTaxPercents in 'UntTaxPercents.pas' {FrmTaxPercents},
  UntTraffics in 'UntTraffics.pas' {QRTraffics: TQuickRep},
  UntCloseYear in 'UntCloseYear.pas' {FrmSetCloseYear},
  UntDifferenceReport in 'UntDifferenceReport.pas' {RPTDifferenceReport: TQuickRep};

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
