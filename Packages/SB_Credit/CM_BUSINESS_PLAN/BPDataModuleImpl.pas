unit BPDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TBPDataModule = class(TDataModule)
    CreditInfo: TOracleDataSet;
    DSCreditInfo: TDataSource;
    BPData: TOracleDataSet;
    DSBPData: TDataSource;
    BPPurposes: TOracleDataSet;
    DSBPPurposes: TDataSource;
    BPTypes: TOracleDataSet;
    DSBPTypes: TDataSource;
    BPDataCREDITID: TFloatField;
    BPDataPROJECTCOST: TFloatField;
    BPDataGIVENCREDIT: TFloatField;
    BPDataCONCESSIONPERIOD: TFloatField;
    BPDataPURPOSE: TFloatField;
    BPDataTYPE: TFloatField;
    BPDataUNTMEANSOFPRODUCTION: TWideStringField;
    BPDataNUMBEROFPRODUCTION: TFloatField;
    BPDataUNTPRODUCTION: TWideStringField;
    BPDataPRODUCTION: TFloatField;
    BPDataPRODUCTIVITY: TFloatField;
    BPDataPRODUCTIONCOST: TFloatField;
    BPDataSUMPROFIT: TFloatField;
    BPDataBOUGHTMATERIAL: TFloatField;
    BPDataOPERATIONEXPENSE: TFloatField;
    BPDataTAXEXPENSE: TFloatField;
    BPDataOTHEREXPENCE: TFloatField;
    BPDataSUMEXPENSE: TFloatField;
    CM_CREDIT: TOraclePackage;
    DistrictsDataSet: TOracleDataSet;
    VillagesDataSet: TOracleDataSet;
    AKTargetsDataSet: TOracleDataSet;
    AKPurposesDataSet: TOracleDataSet;
    DistrictsDataSrc: TDataSource;
    VillagesDataSrc: TDataSource;
    AKTargetsDataSrc: TDataSource;
    AKPurposesDataSrc: TDataSource;
    CM_AKF: TOraclePackage;
    BPDataVILLAGEID: TFloatField;
    BPDataAKPURPOSE: TFloatField;
    PortInf: TOracleDataSet;
    PortInfSrc: TDataSource;
    PortInfCREDITID: TFloatField;
    PortInfCREDITLINEAMOUNT: TFloatField;
    PortInfPROJECTID: TFloatField;
    PortInfPROJECT: TWideStringField;
    PortInfDISTRICT: TWideStringField;
    PortInfVILLAGE: TWideStringField;
    BPSources: TOracleDataSet;
    DSBPSources: TDataSource;
    BPDataSOURCE: TFloatField;
    PortInfNUMBEROFCREDIT: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure BPDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BPDataModule: TBPDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl, CommonDecls;

procedure TBPDataModule.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  BPPurposes.Open;
  BPSources.Open;
  BPTypes.Open;

  for i:=0 to ComponentCount-1 do
    if Components[i].Tag = 21 then
      (Components[i] as TDataSet).Open;
      
  for i:=0 to ComponentCount-1 do
    if Components[i].Tag = 20 then
      (Components[i] as TDataSet).Open;

end;


procedure TBPDataModule.BPDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
  p_CreditID : Integer;
  p_projectcost : Real;
  p_givencredit : Real;
  p_concessionperiod : Integer;
  p_purpose : Integer;
  p_source : String;
  p_type : Integer;
  p_untmeansofproduction : String;
  p_numberofproduction : Integer;
  p_untproduction : String;
  p_production : Integer;
  p_productivity : Integer;
  p_productioncost : Real;
  p_sumprofit : Real;
  p_boughtmaterial : Real;
  p_operationexpense : Real;
  p_taxexpense : Real;
  p_otherexpence : Real;
  p_sumexpense : Real;
  p_villageid : Real;
  p_akpurpose : Real;
  
  Result : Integer;
  
begin
  with Sender do
  begin
    p_CreditID := FieldByName('CreditID').AsInteger;
    p_projectcost := FieldByName('projectcost').AsFloat;
    p_givencredit := FieldByName('givencredit').AsFloat;
    p_concessionperiod := FieldByName('concessionperiod').AsInteger;
    p_purpose := FieldByName('purpose').AsInteger;
    p_source := FieldByName('Source').AsString;
    p_type := FieldByName('Type').AsInteger;
    p_untmeansofproduction := FieldByName('untmeansofproduction').AsString;
    p_numberofproduction := FieldByName('numberofproduction').AsInteger;
    p_untproduction := FieldByName('untproduction').AsString;
    p_production := FieldByName('production').AsInteger;
    p_productivity := FieldByName('productivity').AsInteger;
    p_productioncost := FieldByName('productioncost').AsFloat;
    p_sumprofit := FieldByName('sumprofit').AsFloat;
    p_boughtmaterial := FieldByName('boughtmaterial').AsFloat;
    p_operationexpense := FieldByName('operationexpense').AsFloat;
    p_taxexpense := FieldByName('taxexpense').AsFloat;
    p_otherexpence := FieldByName('otherexpence').AsFloat;
    p_sumexpense := FieldByName('sumexpense').AsFloat;
    p_villageid := FieldByName('villageid').AsInteger;
    p_akpurpose := FieldByName('akpurpose').AsInteger;
  end;

  case Action of
  'I','U' :
    begin
      Result :=
      CM_AKF.CallIntegerFunction('BusinessPlan_AK_AddEdit',[
        p_CreditID,
        p_projectcost,
        p_givencredit,
        p_concessionperiod,
        p_purpose,
        p_source,
        p_type,
        p_untmeansofproduction,
        p_numberofproduction,
        p_untproduction,
        p_production,
        p_productivity,
        p_productioncost,
        p_sumprofit,
        p_boughtmaterial,
        p_operationexpense,
        p_taxexpense,
        p_otherexpence,
        p_sumexpense,
        p_villageid,
        p_akpurpose
      ]);
      Applied := True;
    end;
  else
    Applied := False;
  end;
end;

end.
