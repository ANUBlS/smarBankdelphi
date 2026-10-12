library MainResourcePr;

uses
  ComServ,
  MainResourcePr_TLB in 'MainResourcePr_TLB.pas',
  MainResourceImpl in 'MainResourceImpl.pas' {MainResource: TActiveForm} {MainResource: CoClass},
  UnitData in 'UnitData.pas' {DataModWares: TDataModule},
  UnitInsWares in 'UnitInsWares.pas' {FormInsert},
  UnitWares in 'UnitWares.pas' {FormUpdWares},
  UnitAddGroups in 'UnitAddGroups.pas' {FormAddGroups},
  UnitCalcWares in 'UnitCalcWares.pas' {FormCalcWares},
  UnitShowTrans in 'UnitShowTrans.pas' {FormShowTrans},
  UnitTraffics in 'UnitTraffics.pas' {FormTraffics},
  UnitTrafficsNL in 'UnitTrafficsNL.pas' {FormTrafficsNL},
  UnitCurrentRep in 'UnitCurrentRep.pas' {FormCurrentRep},
  UnitCurrentRepNL in 'UnitCurrentRepNL.pas' {FormCurrentRepNL},
  UnitTransOut in 'UnitTransOut.pas' {FormTransOut},
  UnitUpdGroups in 'UnitUpdGroups.pas' {FormUpdGroups},
  UnitDat in 'UnitDat.pas' {FormDat},
  UnitImpXLS in 'UnitImpXLS.pas' {FormImpXLS},
  UnitViewTurn in 'UnitViewTurn.pas' {FormViewTurn},
  UnitRepGroupNB in 'UnitRepGroupNB.pas' {QRepGroupAll: TQuickRep},
  UnitRepGroupNL in 'UnitRepGroupNL.pas' {QRepGroupAllNL: TQuickRep},
  Unit_All_Rep in 'Unit_All_Rep.pas' {QRep_All: TQuickRep},
  UnitFilter in 'UnitFilter.pas' {FormFilter},
  UnitGroupDat in 'UnitGroupDat.pas' {FormGroupDat},
  UnitExcel in 'UnitExcel.pas' {FormExcel},
  UnitArchiveWares in 'UnitArchiveWares.pas' {ArchiveWares},
  UnitWaresArSent in 'UnitWaresArSent.pas' {ArWaresS},
  UnitArWaresSRep in 'UnitArWaresSRep.pas' {ArWaresSRep},
  Unit1 in 'Unit1.pas' {FormMeans},
  UnitChoice in 'UnitChoice.pas' {FormChoice},
  Unit3 in 'Unit3.pas' {Form_enter},
  Unit4 in 'Unit4.pas' {FormDeleted},
  UnitInsert_t in 'UnitInsert_t.pas' {FormInsert_t},
  quickrep in 'quickrep.pas' {FormQrep},
  Unit22 in 'Unit22.pas' {Form2},
  Unit27 in 'Unit27.pas' {Form27},
  Uniybuysellwares in 'Uniybuysellwares.pas' {Formbuysellwares};

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
