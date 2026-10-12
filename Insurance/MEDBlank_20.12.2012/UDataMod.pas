unit UDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TMedBDataMod = class(TDataModule)
    ODSMedical: TOracleDataSet;
    ODSMedicalID: TIntegerField;
    ODSMedicalEMPNUM: TIntegerField;
    ODSMedicalGROUPA: TIntegerField;
    ODSMedicalGROUPACOVERAGE: TWideStringField;
    ODSMedicalGROUPB: TIntegerField;
    ODSMedicalGROUPBCOVERAGE: TWideStringField;
    ODSMedicalGROUPC: TIntegerField;
    ODSMedicalGROUPCCOVERAGE: TWideStringField;
    ODSMedicalINSPROGRAM: TWideStringField;
    ODSMedicalSERV_ID: TIntegerField;
    ODSMedicalBEGINDATE: TDateTimeField;
    ODSMedicalENDDATE: TDateTimeField;
    ODSMedicalEMPS_ID: TWideStringField;
    ODSMedicalINPATSERV: TIntegerField;
    ODSMedicalOUTPATSERV: TIntegerField;
    ODSMedicalEMERAID: TIntegerField;
    ODSMedicalPRESCDRUGS: TIntegerField;
    ODSMedicalDENTSERV: TIntegerField;
    ODSMedicalPROPHYSERV: TIntegerField;
    ODSMedicalPROPHYINS: TIntegerField;
    ODSMedicalSANATORIUM: TIntegerField;
    ODSMedicalCHILDBIRTH: TIntegerField;
    ODSMedicalPRIVATEDRSERV: TIntegerField;
    ODSMedicalMEDICALEVAC: TIntegerField;
    ODSMedicalPROSTINS: TIntegerField;
    ODSMedicalCHEMORADIOTHERAPY: TIntegerField;
    ODSMedicalKLI_ID: TIntegerField;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TWideStringField;
    ODSCustsADDRESS: TWideStringField;
    DSCusts: TDataSource;
    ODSMedServices: TOracleDataSet;
    ODSMedServicesID: TFloatField;
    ODSMedServicesNAME: TWideStringField;
    DSMedServices: TDataSource;
    ODSEmployees: TOracleDataSet;
    ODSEmployeesID: TIntegerField;
    ODSEmployeesMED_ID: TIntegerField;
    ODSEmployeesNAME: TWideStringField;
    ODSEmployeesSURNAME: TWideStringField;
    ODSEmployeesFATHERNAME: TWideStringField;
    ODSEmployeesDATEOFBIRTH: TDateTimeField;
    ODSEmployeesSEX: TIntegerField;
    ODSEmployeesOCC_ID: TIntegerField;
    ODSEmployeesGROUP_: TWideStringField;
    DSEmployees: TDataSource;
    ODSOccupation: TOracleDataSet;
    DSOccupation: TDataSource;
    ODSEmployeesOCCCombo: TWideStringField;
    DSMedical: TDataSource;
    ODSOccupationID: TFloatField;
    ODSOccupationNAME: TWideStringField;
    OPCOMMON: TOraclePackage;
    procedure ODSEmployeesAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  MedBDataMod: TMedBDataMod;

implementation
uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TMedBDataMod.ODSEmployeesAfterInsert(DataSet: TDataSet);
begin
   with DataSet do
     FieldByName('MED_ID').AsFloat := ODSMedicalID.Value;
end;

procedure TMedBDataMod.DataModuleCreate(Sender: TObject);
begin
   ODSCusts.Open;
   ODSMedServices.Open;
end;

end.
