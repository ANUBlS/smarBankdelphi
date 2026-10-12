unit UMotorKascoDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDataModkasco = class(TDataModule)
    ODSINSMotorKasco: TOracleDataSet;
    DSMOTORKASCO: TDataSource;
    ODSINSMotorKascoID: TFloatField;
    ODSINSMotorKascoKLI_ID: TFloatField;
    ODSINSMotorKascoNAME: TStringField;
    ODSINSMotorKascoSURNAME: TStringField;
    ODSINSMotorKascoFATHERNAME: TStringField;
    ODSINSMotorKascoHOMEPHONE: TStringField;
    ODSINSMotorKascoWORKPHONE: TStringField;
    ODSINSMotorKascoMOBILPHONE: TStringField;
    ODSINSMotorKascoADDRESS: TStringField;
    ODSINSMotorKascoPROFITNAME: TStringField;
    ODSINSMotorKascoPROFITADDRESS: TStringField;
    ODSINSMotorKascoPROFITPHONE: TStringField;
    ODSINSMotorKascoINSUREDTYPE: TStringField;
    ODSINSMotorKascoINSUREDCOLOR: TStringField;
    ODSINSMotorKascoINSUREDOUTPUTYEAR: TIntegerField;
    ODSINSMotorKascoINSUREDMODEL: TStringField;
    ODSINSMotorKascoINSUREDSTATENUM: TStringField;
    ODSINSMotorKascoUNDERFRAMENUM: TStringField;
    ODSINSMotorKascoINSUREDBANNUM: TStringField;
    ODSINSMotorKascoINSUREDENGINENUM: TStringField;
    ODSINSMotorKascoDRIVEACCESSPIOPLE1: TStringField;
    ODSINSMotorKascoDRIVEACCESSPIOPLE2: TStringField;
    ODSINSMotorKascoDRIVERBIRTHDAY1: TDateTimeField;
    ODSINSMotorKascoDRIVERBIRTHDAY2: TDateTimeField;
    ODSINSMotorKascoDRIVEREXPERIENCE1: TIntegerField;
    ODSINSMotorKascoDRIVEREXPERIENCE2: TIntegerField;
    ODSINSMotorKascoDRIVEINTENDED: TStringField;
    ODSINSMotorKascoDRIVECOST: TFloatField;
    ODSINSMotorKascoINSUREDSUM: TFloatField;
    ODSINSMotorKascoBEGINDATE: TDateTimeField;
    ODSINSMotorKascoENDDATE: TDateTimeField;
    DSCusts: TDataSource;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TStringField;
    ODSMKSuggestion: TOracleDataSet;
    DSMKSuggestion: TDataSource;
    ODSBankinfo: TOracleDataSet;
    DSBankinfo: TDataSource;
    ODSBankinfoBANK: TStringField;
    ODSBankinfoAZ_NAME: TStringField;
    ODSBankinfoSEHER: TStringField;
    ODSBankinfoADRESS: TStringField;
    ODSBankinfoTEL: TStringField;
    ODSBankinfoFAX: TStringField;
    ODSBankinfoEMAIL: TStringField;
    ODSCustsADDRESS: TStringField;
    ODSPolicy: TOracleDataSet;
    ODSPolicyID: TFloatField;
    ODSPolicyMKS_ID: TFloatField;
    ODSPolicyVAL_ID: TFloatField;
    ODSPolicyTHEFT: TFloatField;
    ODSPolicyFIRE: TFloatField;
    ODSPolicyEXPLOSION: TFloatField;
    ODSPolicyTRAFFICACCIDENT: TFloatField;
    ODSPolicyIMPACTANYOBJECT: TFloatField;
    ODSPolicyNATCATASTROPHE: TFloatField;
    DSPolicy: TDataSource;
    ODSAvalute: TOracleDataSet;
    DSAvalute: TDataSource;
    ODSPolicyPOLICYNUM: TStringField;
    ODSINSMotorKascoINSUREDFRANSHIZ: TFloatField;
    ODSMKSuggestionID: TFloatField;
    procedure ODSINSMotorKascoBeforeDelete(DataSet: TDataSet);
    procedure ODSINSMotorKascoBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ODSINSMotorKascoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function CheckFieldsForNull(DataSet : TDataSet):Boolean;
    function CheckFieldsForRequired(DataSet : TDataSet):Boolean;
    procedure RefreshAll;
    { Public declarations }
  end;

var
  DataModkasco: TDataModkasco;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TDataModkasco.ODSINSMotorKascoBeforeDelete(DataSet: TDataSet);
begin
 if  MessageDlg('Secilmish anket pozulacaq', mtWarning, [mbYes, mbCancel], 0) = mrCancel then
   Abort;
end;

function TDataModkasco.CheckFieldsForNull(DataSet : TDataSet):Boolean;
var
  i : Integer;
begin
 Result := false;
  with DataSet do
   for i:=0 to FieldCount-1 do
    if Fields[i].IsNull then Result := true
end;

function TDataModkasco.CheckFieldsForRequired(DataSet : TDataSet):Boolean;
var
  i : Integer;
begin
 Result := true;
  with DataSet do
   for i:=0 to FieldCount-1 do
    if (Fields[i].Required) and (Fields[i].IsNull) then Result := false
end;

procedure TDataModkasco.ODSINSMotorKascoBeforePost(DataSet: TDataSet);
begin
 { if not CheckFieldsForRequired(DataSet) then
     DataSet.Cancel; }
end;

procedure TDataModkasco.RefreshAll;
begin
  ODSINSMotorKasco.refresh;
  ODSCusts.refresh;
  ODSBankinfo.Refresh;
  ODSAvalute.refresh;
end;

procedure TDataModkasco.DataModuleCreate(Sender: TObject);
begin
  ODSAvalute.Open;
  ODSBankinfo.Open;
//  ODSCusts.Open;
//  ODSMKSuggestion.Open;
  ODSINSMotorKasco.Open;
end;

procedure TDataModkasco.ODSINSMotorKascoAfterScroll(DataSet: TDataSet);
begin
  with ODSCusts do begin
    Close;
    SetVariable('KLI_ID',ODSINSMotorKascoKLI_ID.Value);
    Open;
  end;

  with ODSMKSuggestion do begin
    Close;
    SetVariable('MK_ID',ODSINSMotorKascoID.Value);
    Open;
  end; 
end;

end.
