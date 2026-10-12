unit DataUnitFullMotor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TMotorFull=record
     id:longint;
     kli_id:longint;
     //contact_person:string;
     banking_details:string;
     profitid:longint;
     {profitname:string;
     profitaddress:string;
     profit_phone:string;
     profit_bankingdetails:string; }
     insuredtype:string;
     insuredcolor:string;
     insuredoutputyear:integer;
     insuredmodel:string;
     insuredstatenum:string;
     insurednumseats:byte;
     insuredenginenum:string;
     insuredchassisnum:string;
     insuredactualvalue:longint;
     transmission_type:string;
     presence_alarm:string;
     motor_usage:string;
     motorstorageplace:string;
     existingdamage:string;
     insurancegeographicallimit:string;
     broker:longint;
     insuredbody:string;
     begindate:variant;
     enddate:variant;
  end;
const
     cs_generateID = 'GenerateID';
     cs_generateAcc_ID = 'GenerateAcc_ID';
     cs_generateAcs_id='GenerateAcs_ID';
     cs_generateMoreID='generateMore_ID';
     cs_add_motorinfo = 'add_fullmotor';
     cs_update_motorinfo='update_fullmotor';
     cs_delete_motorinfo='delete_fullmotor';

type
  TDataModuleFullMotor = class(TDataModule)
    Ins_MotorFullData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
    Accesories: TOracleDataSet;
    AccesoriesData: TDataSource;
    MoreThanOneData: TDataSource;
    MoreThanOne: TOracleDataSet;
    PINS_FULLMOTOR: TOraclePackage;
    CustomersData: TDataSource;
    Customers: TOracleDataSet;
    Ins_ReportData: TDataSource;
    Ins_Report: TOracleDataSet;
    Accesories_Report: TOracleDataSet;
    More_Report: TOracleDataSet;
    AccReportData: TDataSource;
    MoreReportData: TDataSource;
    Suggestion: TOracleDataSet;
    SuggestionData: TDataSource;
    BankInfoData: TDataSource;
    BankInfo: TOracleDataSet;
    AValuteData: TDataSource;
    AValute: TOracleDataSet;
    Policy: TOracleDataSet;
    PolicyData: TDataSource;
    PolicyID: TFloatField;
    PolicyMS_ID: TFloatField;
    PolicySUBJECTVALUE: TFloatField;
    Accesories_ReportID: TFloatField;
    Accesories_ReportTYPE: TStringField;
    Accesories_ReportMAKE: TStringField;
    Accesories_ReportVALUE: TFloatField;
    Accesories_ReportHOWCREATED: TStringField;
    Accesories_ReportFULL_ID: TFloatField;
    Ins_ReportID: TFloatField;
    Ins_ReportNAME: TStringField;
    Ins_ReportADDRESS: TStringField;
    Ins_ReportPHONE: TStringField;
    Ins_ReportFAX: TStringField;
    Ins_ReportINSUREDMODEL: TStringField;
    Ins_ReportINSUREDTYPE: TStringField;
    Ins_ReportINSUREDSTATENUM: TStringField;
    Ins_ReportINSUREDCOLOR: TStringField;
    Ins_ReportINSUREDOUTPUTYEAR: TIntegerField;
    Ins_ReportINSUREDNUMSEATS: TIntegerField;
    Ins_ReportINSUREDENGINENUM: TStringField;
    Ins_ReportINSUREDCHASSISNUM: TStringField;
    Ins_ReportINSUREDACTUALVALUE: TFloatField;
    Ins_ReportTRANSMISSION_TYPE: TStringField;
    Ins_ReportPRESENCE_ALARM: TStringField;
    Ins_ReportMOTOR_USAGE: TStringField;
    Ins_ReportMOTORSTORAGEPLACE: TStringField;
    Ins_ReportEXISTINGDAMAGE: TStringField;
    Ins_ReportINSURANCEGEOGRAPHICALLIMIT: TStringField;
    Ins_Rep: TOracleDataSet;
    Ins_RepData: TDataSource;
    Ins_RepNAME: TStringField;
    Ins_RepADDRESS: TStringField;
    Ins_RepID: TFloatField;
    Suggest_Rep: TOracleDataSet;
    Suggest_RepData: TDataSource;
    Policy_Report: TOracleDataSet;
    StringField1: TStringField;
    Policy_ReportID: TFloatField;
    Policy_ReportMS_ID: TFloatField;
    Policy_reportData: TDataSource;
    AValuteVALUTE: TIntegerField;
    AValuteVAL_NAME: TStringField;
    AValuteVALU_NAME: TStringField;
    AValuteVALU_SHORT: TStringField;
    MoreThan: TOracleDataSet;
    MoreThanOneNAME: TStringField;
    MoreThanData: TDataSource;
    Ins_PRep: TOracleDataSet;
    Ins_PRepData: TDataSource;
    RisksData: TDataSource;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    Conditions: TOracleDataSet;
    ConditionsID: TFloatField;
    ConditionsNAME: TStringField;
    Franshiz: TOracleDataSet;
    FranshizID: TFloatField;
    FranshizNAME: TStringField;
    Risktypes: TOracleDataSet;
    RisktypesID: TFloatField;
    RisktypesNAME: TStringField;
    ConditionsData: TDataSource;
    FranshizData: TDataSource;
    RisktypesData: TDataSource;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    Suggest_RepID: TFloatField;
    Suggest_RepMK_ID: TFloatField;
    Suggest_RepRISKADDRESS: TStringField;
    Suggest_RepINSURANCEAMMOUNT: TFloatField;
    Suggest_RepENDDATE: TDateTimeField;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersADDRESS: TStringField;
    CustomersMOBILEPHONE: TStringField;
    CustomersFAX: TStringField;
    More_ReportID: TFloatField;
    More_ReportFULL_ID: TFloatField;
    More_ReportNAME: TStringField;
    More_ReportAGE: TIntegerField;
    More_ReportEXPERIENCE: TStringField;
    More_ReportHISTORY: TStringField;
    AccesoriesID: TFloatField;
    AccesoriesTYPE: TStringField;
    AccesoriesMAKE: TStringField;
    AccesoriesVALUE: TFloatField;
    AccesoriesHOWCREATED: TStringField;
    AccesoriesFULL_ID: TFloatField;
    MoreThanOneID: TFloatField;
    MoreThanOneNAME2: TStringField;
    MoreThanOneSURNAME: TStringField;
    MoreThanOneFATHERNAME: TStringField;
    MoreThanOneAGE: TIntegerField;
    MoreThanOneEXPERIENCE: TStringField;
    MoreThanOneFULL_ID: TFloatField;
    MoreThanOneHISTORY: TStringField;
    AgentsSource: TDataSource;
    ODSAgents: TOracleDataSet;
    Ins_MotorFullID: TFloatField;
    Ins_MotorFullKLI_ID: TFloatField;
    Ins_MotorFullBANKING_DETAILS: TStringField;
    Ins_MotorFullPROFITID: TFloatField;
    Ins_MotorFullINSUREDMODEL: TStringField;
    Ins_MotorFullINSUREDTYPE: TStringField;
    Ins_MotorFullINSUREDSTATENUM: TStringField;
    Ins_MotorFullINSUREDCOLOR: TStringField;
    Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField;
    Ins_MotorFullINSUREDNUMSEATS: TIntegerField;
    Ins_MotorFullINSUREDENGINENUM: TStringField;
    Ins_MotorFullINSUREDCHASSISNUM: TStringField;
    Ins_MotorFullINSUREDACTUALVALUE: TFloatField;
    Ins_MotorFullTRANSMISSION_TYPE: TStringField;
    Ins_MotorFullPRESENCE_ALARM: TStringField;
    Ins_MotorFullMOTOR_USAGE: TStringField;
    Ins_MotorFullMOTORSTORAGEPLACE: TStringField;
    Ins_MotorFullEXISTINGDAMAGE: TStringField;
    Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField;
    Ins_MotorFullBROKER: TFloatField;
    Ins_MotorFullINSUREDBODY: TStringField;
    Ins_MotorFullTYPEID: TIntegerField;
    Ins_ReportBANKING_DETAILS: TStringField;
    Ins_ReportPROFITID: TFloatField;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
    ODSContractsBLANK_ID: TFloatField;
    ODSContractsSUGG_ID: TFloatField;
    ODSContractsPOLICY_ID: TFloatField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSContractsVALUTE_ID: TFloatField;
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSContractsPOLICY_NUM: TStringField;
    DSContracts: TDataSource;
    OPCOMMON: TOraclePackage;
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    Suggest_RepINSURANCESUM: TFloatField;
    PolicyPOLICYNUM: TStringField;
    ODSContractsAMMOUNT: TFloatField;
    ODSAgentsNAME: TStringField;
    ODSAgentsID: TFloatField;
    Ins_PRepID: TFloatField;
    Ins_PRepNAME: TStringField;
    Ins_PRepADDRESS: TStringField;
    Ins_PRepPHONE: TStringField;
    Ins_PRepBANKING_DETAILS: TStringField;
    Ins_PRepINSUREDMODEL: TStringField;
    Ins_PRepINSUREDTYPE: TStringField;
    Ins_PRepINSUREDSTATENUM: TStringField;
    Ins_PRepINSUREDCOLOR: TStringField;
    Ins_PRepINSUREDOUTPUTYEAR: TIntegerField;
    Ins_PRepINSUREDNUMSEATS: TIntegerField;
    Ins_PRepINSUREDENGINENUM: TStringField;
    Ins_PRepINSUREDCHASSISNUM: TStringField;
    Ins_PRepINSUREDACTUALVALUE: TFloatField;
    Ins_PRepTRANSMISSION_TYPE: TStringField;
    Ins_PRepPRESENCE_ALARM: TStringField;
    Ins_PRepMOTORSTORAGEPLACE: TStringField;
    Ins_PRepEXISTINGDAMAGE: TStringField;
    Ins_PRepINSURANCEGEOGRAPHICALLIMIT: TStringField;
    Ins_PRepINSUREDBODY: TStringField;
    Ins_PRepBROKER: TFloatField;
    CustomersCONTACTPERSON: TStringField;
    Ins_MotorFullCLOSE_PREFIX: TIntegerField;
    procedure Ins_MotorFullApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
     resultID :integer;
    { Public declarations }
     procedure FullRefresh(DataSetName: String);
     Procedure AddMotorInfo(Motor: TMotorFull);
     Procedure UpdateMotorInfo(Motor: TMotorFull);
     Procedure DeleteMotorInfo(id:integer);

  end;

var
  DataModuleFullMotor: TDataModuleFullMotor;

implementation

uses sboapiDataModuleImpl, UInsFullMotorCasco, UInsAppMotor;

{$R *.DFM}

Procedure TDataModuleFullMotor.AddMotorInfo(Motor: TMotorFull);
begin
 with PINS_FULLMOTOR, Motor do
  resultID:=CallIntegerFunction(cs_add_motorinfo, [
                'kli_id',kli_id,
                //'contact_person',contact_person,
                'banking_details',banking_details,
                'profitid',profitid,
                {'profitname',profitname,
                'profitaddress',profitaddress,
                'profit_phone',profit_phone,
                'profit_bankingdetails',profit_bankingdetails, }
                'insuredtype',insuredtype,
                'insuredcolor',insuredcolor,
                'insuredoutputyear',insuredoutputyear,
                'insuredmodel',insuredmodel,
                'insuredstatenum',insuredstatenum,
                'insurednumseats',insurednumseats,
                'insuredenginenum',insuredenginenum,
                'insuredchassisnum',insuredchassisnum,
                'insuredactualvalue',insuredactualvalue,
                'transmission_type',transmission_type,
                'presence_alarm',presence_alarm,
                'motor_usage',motor_usage,
                'motorstorageplace',motorstorageplace,
                'existingdamage',existingdamage,
                'insurancegeographicallimit',insurancegeographicallimit,
                'broker',broker,
                'insuredbody',insuredbody,
                'begindate',begindate,
                'enddate',enddate
           ]);



end;

Procedure TDataModuleFullMotor.UpdateMotorInfo(Motor: TMotorFull);
begin
 with PINS_FULLMOTOR, Motor do
  CallProcedure(  cs_update_motorinfo, [
                'v_id',id,
                'kli_id',kli_id,
                //'contact_person',contact_person,
                'banking_details',banking_details,
                'profitid',profitid,
                {'profitname',profitname,
                'profitaddress',profitaddress,
                'profit_phone',profit_phone,
                'profit_bankingdetails',profit_bankingdetails, }
                'insuredtype',insuredtype,
                'insuredcolor',insuredcolor,
                'insuredoutputyear',insuredoutputyear,
                'insuredmodel',insuredmodel,
                'insuredstatenum',insuredstatenum,
                'insurednumseats',insurednumseats,
                'insuredenginenum',insuredenginenum,
                'insuredchassisnum',insuredchassisnum,
                'insuredactualvalue',insuredactualvalue,
                'transmission_type',transmission_type,
                'presence_alarm',presence_alarm,
                'motor_usage',motor_usage,
                'motorstorageplace',motorstorageplace,
                'existingdamage',existingdamage,
                'insurancegeographicallimit',insurancegeographicallimit,
                'broker',broker,
                'insuredbody',insuredbody
           ]);
end;

Procedure TDataModuleFullMotor.DeleteMotorInfo(id:integer);
begin
     with Ins_MotorFull do
     begin
       Locate('id',id,[]);
       ODSContracts.Close;
       ODSContracts.SetVariable('blankid',id);
       ODSContracts.Open;
       Edit;
       FieldByName('Close_Prefix').AsInteger:=1;
       ODSCOntracts.Edit;
       ODSContracts.FieldByName('Close_prefix').AsInteger:=1;
       if ODSContracts.State in [dsEdit] then ODSContracts.Post;
       if State in [dsEdit] then Post;
     end;
end;
procedure TDataModuleFullMotor.FullRefresh(DataSetName: String);
const
     c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
     i: Word;
begin
     for i :=0 to ComponentCount- 1 do
     if (Components[i] is TOracleDataSet) and (Components[i].Name <> DataSetName) then
     try
        (Components[i] as TOracleDataSet).Close;
        (Components[i] as TOracleDataSet).Open;
     except
         raise Exception.Create(Format(c_err_message, [(Components[i] as TDataSet).Name]));
     end;

end;

procedure TDataModuleFullMotor.Ins_MotorFullApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
   MotorInfo:TMotorFull;

   procedure BuildMotorInfo;
   begin
    with Sender, MotorInfo do
    begin
         id:=FieldByName('ID').AsInteger;
         kli_id:=FieldByName('kli_id').AsInteger;
         //contact_person:=FieldByName('contact_person').AsString;
         banking_details:=FieldByName('banking_details').AsString;
         profitid:=FieldByName('profitid').AsInteger;
         {profitname:=FieldByName('profitname').AsString;
         profitaddress:=FieldBYName('profitaddress').AsString;
         profit_phone:=FieldByName('profit_phone').AsString;
         profit_bankingdetails:=FieldByName('profit_bankingdetails').AsString;}
         insuredtype:=FieldByName('insuredtype').AsString;
         insuredcolor:=FieldByName('insuredcolor').AsString;
         insuredoutputyear:=FieldByName('insuredoutputyear').AsInteger;
         insuredmodel:=FieldByName('insuredmodel').AsString;
         insuredstatenum:=FieldByName('insuredstatenum').AsString;
         insurednumseats:=FieldByName('insurednumseats').AsInteger;
         insuredenginenum:=FieldByName('insuredenginenum').AsString;
         insuredchassisnum:=FieldByName('insuredchassisnum').AsString;
         insuredactualvalue:=FieldByName('insuredactualvalue').AsInteger;
         transmission_type:=FieldByName('transmission_type').AsString;
         presence_alarm:=FieldByName('presence_alarm').AsString;
         motor_usage:=FieldByName('motor_usage').AsString;
         motorstorageplace:=FieldByName('motorstorageplace').AsString;
         existingdamage:=FieldByName('existingdamage').AsString;
         insurancegeographicallimit:=FieldByName('insurancegeographicallimit').AsString;
         broker:=FieldByName('broker').AsInteger;
         insuredbody:=FieldByName('insuredbody').AsString;
         begindate:=FullCascoForm.edBeginDate.DateTime;
         enddate:=FullCascoForm.edEndDate.DateTime;
    end;
   end;
begin
      case Action of
   'I':
     begin

         BuildMotorInfo;
         AddMotorInfo(MotorInfo);
         Applied := True;

     end;
   'E':
      begin
         BuildMotorInfo;
         UpdateMotorInfo(MotorInfo);
         Applied := True;
      end;
      'L','R','C':
         Applied := True;
   else
         Applied := False;

  end;
end;
end.
