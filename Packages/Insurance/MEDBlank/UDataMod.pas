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
    ODSMedicalGROUPACOVERAGE: TStringField;
    ODSMedicalGROUPB: TIntegerField;
    ODSMedicalGROUPBCOVERAGE: TStringField;
    ODSMedicalGROUPC: TIntegerField;
    ODSMedicalGROUPCCOVERAGE: TStringField;
    ODSMedicalINSPROGRAM: TStringField;
    ODSMedicalSERV_ID: TIntegerField;
    ODSMedicalBEGINDATE: TDateTimeField;
    ODSMedicalENDDATE: TDateTimeField;
    ODSMedicalEMPS_ID: TStringField;
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
    ODSCustsNAME: TStringField;
    ODSCustsADDRESS: TStringField;
    DSCusts: TDataSource;
    ODSMedServices: TOracleDataSet;
    ODSMedServicesID: TFloatField;
    ODSMedServicesNAME: TStringField;
    DSMedServices: TDataSource;
    ODSEmployees: TOracleDataSet;
    ODSEmployeesID: TIntegerField;
    ODSEmployeesMED_ID: TIntegerField;
    ODSEmployeesNAME: TStringField;
    ODSEmployeesSURNAME: TStringField;
    ODSEmployeesFATHERNAME: TStringField;
    ODSEmployeesDATEOFBIRTH: TDateTimeField;
    ODSEmployeesSEX: TIntegerField;
    ODSEmployeesOCC_ID: TIntegerField;
    ODSEmployeesGROUP_: TStringField;
    DSEmployees: TDataSource;
    ODSOccupation: TOracleDataSet;
    DSOccupation: TDataSource;
    ODSEmployeesOCCCombo: TStringField;
    DSMedical: TDataSource;
    ODSOccupationID: TFloatField;
    ODSOccupationNAME: TStringField;
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
