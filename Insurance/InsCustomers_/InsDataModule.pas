unit InsDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;




type
  TInsDataMod = class(TDataModule)
    DSInsCustomers: TDataSource;
    ODSInsCustomers: TOracleDataSet;
    DSCustomers: TDataSource;
    ODSCustomers: TOracleDataSet;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSInsCustomersID: TIntegerField;
    ODSInsCustomersCUST_ID: TIntegerField;
    ODSInsCustomersNAME: TStringField;
    ODSInsCustomersSURNAME: TStringField;
    ODSInsCustomersFATHERNAME: TStringField;
    ODSInsCustomersHOMEPHONE: TStringField;
    ODSInsCustomersWORKPHONE: TStringField;
    ODSInsCustomersMOBILEPHONE: TStringField;
    ODSInsCustomersFAX: TStringField;
    ODSInsCustomersADDRESS: TStringField;
    ODSAccount: TOracleDataSet;
    ODSAccountID: TFloatField;
    ODSAccountKLI_ID: TFloatField;
    ODSAccountOP_ID: TFloatField;
    ODSAccountACC_NO: TStringField;
    ODSAccountVAL_ACC: TIntegerField;
    ODSAccountNAME: TStringField;
    ODSAccountOPEN_DAT: TDateTimeField;
    ODSAccountCLOSE_DAT: TDateTimeField;
    ODSAccountSTATUS: TFloatField;
    ODSAccountBAL_CN1: TFloatField;
    ODSAccountBAL_CN2: TFloatField;
    ODSAccountBAL_CN3: TFloatField;
    ODSAccountBAL_CN4: TFloatField;
    ODSAccountFILIAL: TIntegerField;
    ODSAccountSIM_OTCET: TFloatField;
    ODSAccountTIPACC: TStringField;
    ODSAccountLIMIT: TFloatField;
    ODSAccountOLD_ACC_NO: TStringField;
    ODSAccountPAIR_ACC: TFloatField;
    ODSAccountINSIDER: TStringField;
    DSAccount: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccBAL_CN: TStringField;
    BalAccBALNAME: TStringField;
    BalAccData: TDataSource;
    Currency: TOracleDataSet;
    CurrencyData: TDataSource;
    Tenostat: TOracleDataSet;
    TenostatOSTAT: TFloatField;
    TenostatPOK_OSTAT: TFloatField;
    TenostatACC_ID: TFloatField;
    DataTenostat: TDataSource;
    PairAccount: TOracleDataSet;
    PairAccountData: TDataSource;
    ODSAccountVAL_NAME: TStringField;
    CurrencyVALUTE: TIntegerField;
    CurrencyVAL_NAME: TStringField;
    CurrencyVALU_NAME: TStringField;
    CurrencyVALU_SHORT: TStringField;
    ODSAccountOWNID: TFloatField;
    ODSContracts: TOracleDataSet;
    DSContracts: TDataSource;
    ODSInsurances: TOracleDataSet;
    DSInsurances: TDataSource;
    ODSInsurancesID: TIntegerField;
    ODSInsurancesNAME: TStringField;
    ODSInsurancesCHANGEGUID: TStringField;
    OPINS: TOraclePackage;
    ODSInsCustomersDATEOFBIRTH: TDateTimeField;
    ODSInsCustomersPLACEOFBIRTH: TStringField;
    ODSInsCustomersAGE: TIntegerField;
    ODSInsCustomersSEX: TIntegerField;
    ODSInsCustomersPASPORTNO: TStringField;
    ODSInsCustomersMS_ID: TIntegerField;
    ODSInsCustomersCITY: TStringField;
    ODSInsCustomersINDEX_: TStringField;
    ODSInsCustomersMAILINGADDRESS: TStringField;
    ODSInsCustomersOCC_ID: TIntegerField;
    ODSInsCustomersED_ID: TIntegerField;
    ODSInsCustomersSTATE: TStringField;
    DSOccupations: TDataSource;
    ODSOccupations: TOracleDataSet;
    ODSEducations: TOracleDataSet;
    DSEducations: TDataSource;
    ODSInsCustomersACT_ID: TIntegerField;
    ODSInsCustomersCONTACTPERSON: TStringField;
    DSActivity: TDataSource;
    ODSActivity: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsNAME: TStringField;
    ODSContractsMAINFORMGUID: TStringField;
    ODSContractsCHANGEGUID: TStringField;
    ODSContractsSUGGESTIONGUID: TStringField;
    ODSContractsPOLICYGUID: TStringField;
    ODSContractsTABLENAME: TStringField;
    ODSAcc_types: TOracleDataSet;
    DSAcc_types: TDataSource;
    ODSBal_cn: TOracleDataSet;
    DSBal_cn: TDataSource;
    ODSAcc_typesID: TFloatField;
    ODSAcc_typesNAME: TStringField;
    ODSBal_cnDICT_ID: TFloatField;
    ODSBal_cnBAL_CN: TFloatField;
    ODSLoanAccLists: TOracleDataSet;
    DSLoanAccLists: TDataSource;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSCurrAccList: TOracleDataSet;
    DSCurrAccList: TDataSource;
    ODSLoanAccListsID: TFloatField;
    ODSLoanAccListsACC_NO: TStringField;
    ODSLoanAccListsBAL_CN1: TFloatField;
    ODSCurrAccListID: TFloatField;
    ODSCurrAccListACC_NO: TStringField;
    ODSCurrAccListBAL_CN1: TFloatField;
    ODSCurrAccListNAME: TStringField;
    ODSLoanAccListsNAME: TStringField;
    OPCOMMON: TOraclePackage;
    ODSContractsPOLICY_NUM: TStringField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsSUGGESTION: TStringField;
    ODSPayPlan: TOracleDataSet;
    DSPayPlan: TDataSource;
    ODSContractsAMMOUNT: TFloatField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSAgents: TOracleDataSet;
    DSAgents: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    DSBeneficiary: TDataSource;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    ODSAgentsID: TFloatField;
    ODSAgentsNAME: TStringField;
    ODSAgentsSURNAME: TStringField;
    ODSAgentsFATHERNAME: TStringField;
    ODSInsCustomersCONTACTPERSONPHONE: TStringField;
    ODSPayPlanID: TFloatField;
    ODSPayPlanPAY_DATE: TDateTimeField;
    ODSPayPlanAMMOUNT: TFloatField;
    ODSPayPlanSTATUS: TIntegerField;
    ODSPayPlanINS_ID: TFloatField;
    ODSPayPlanISPAYED: TStringField;
    ODSStates: TOracleDataSet;
    ODSTariffs: TOracleDataSet;
    DSStates: TDataSource;
    DSTariffs: TDataSource;
    ODSBankm: TOracleDataSet;
    DSBankm: TDataSource;
    ODSBankmID: TFloatField;
    ODSBankmKRNO: TFloatField;
    ODSBankmNAME: TStringField;
    ODSBankmINN: TStringField;
    ODSBankmSWIFT: TStringField;
    ODSBankmSUBKRNO: TStringField;
    ODSStatesID: TFloatField;
    ODSStatesNAME: TStringField;
    ODSAccountOSTAT: TFloatField;
    ODSAccountPOK_OSTAT: TFloatField;
    ODSBankmBANKCODE: TStringField;
    Sysdat: TOracleDataSet;
    SysdatTEK_DAT: TDateTimeField;
    ODSTarifStates: TOracleDataSet;
    ODSTarifStatesID: TFloatField;
    ODSTarifStatesBANK_ID: TFloatField;
    ODSTarifStatesSTATE_ID: TFloatField;
    DSTarifStates: TDataSource;
    ODSReportSymbols: TOracleDataSet;
    DSReportSymbols: TDataSource;
    ODSMonths: TOracleDataSet;
    DSMonths: TDataSource;
    ODSFranshiza: TOracleDataSet;
    DSFranshiza: TDataSource;
    ODSFranshizaID: TFloatField;
    ODSFranshizaMONTH_ID: TFloatField;
    ODSFranshizaAMMOUNT: TFloatField;
    ODSTariffsID: TFloatField;
    ODSTariffsFRANSHIZ_ID: TFloatField;
    ODSTariffsAMMOUNT: TFloatField;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    ODSTarifStatesStates: TStringField;
    ODSBranches: TOracleDataSet;
    ODSBranchesID: TFloatField;
    ODSBranchesNAME: TStringField;
    DSBranches: TDataSource;
    ODSInsCustomersCLOSE_PREFIX: TIntegerField;
    ODSContractsVAL_NAME: TStringField;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsTYPE_ID: TFloatField;
    ODSInsCustomersINSURED_TYPEID: TIntegerField;
    ODSInsurancesLOAN_BAL_CN: TFloatField;
    ODSInsurancesCURR_BAL_CN: TFloatField;
    ODSReleaseDate: TOracleDataSet;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField2: TFloatField;
    DSReleaseDate: TDataSource;
    ODSReportSymbolsID: TFloatField;
    ODSReportSymbolsNAME: TStringField;
    DSCustTypes: TDataSource;
    ODSCustTypes: TOracleDataSet;
    ODSPolicyNums: TOracleDataSet;
    DSPolicyNums: TDataSource;
    ODSInsurancesPROFIT_ACC_ID: TFloatField;
    ODSAccList: TOracleDataSet;
    DSAccList: TDataSource;
    ODSInsurancesAcc_list: TStringField;
    ODSPolicyNumsID: TIntegerField;
    ODSPolicyNumsNAME: TStringField;
    ODSPolicyNumsTYPEID: TFloatField;
    ODSPolicyNumsCOUNTS: TFloatField;
    ODSPolicyNumsFORMAT: TStringField;
    ODSPolicyNumsPREFIX: TStringField;
    ODSCustTypesID: TIntegerField;
    ODSCustTypesNAME: TStringField;
    procedure ODSCustomersAfterFetchRecord(Sender: TOracleDataSet;
      FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
    procedure ODSInsCustomersBeforeDelete(DataSet: TDataSet);
    procedure ODSAccountCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ODSAccountAfterFetchRecord(Sender: TOracleDataSet;
      FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
    procedure ODSAccountBeforeDelete(DataSet: TDataSet);
    procedure ODSInsCustomersAfterScroll(DataSet: TDataSet);
    procedure ODSContractsAfterScroll(DataSet: TDataSet);
    procedure ODSBal_cnBeforeInsert(DataSet: TDataSet);
    procedure ODSContractsCalcFields(DataSet: TDataSet);
    procedure ODSPayPlanCalcFields(DataSet: TDataSet);
    procedure SaveData;
    procedure RedoData;
    procedure ODSTariffsAfterPost(DataSet: TDataSet);
    procedure ODSBeneficiaryBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }

  public
    function GetSysDate():TDate;
    procedure SetFullForm();
    procedure UnSetFullForm();
    procedure RefreshAll;
    procedure RefreshContractRec;
    procedure RefreshContracts;
    procedure CloseOpenContracts;    
    { Public declarations }
  end;

const
  Condition  = 'and ic.KLI_ID = :KLI_ID ';
  ContractsSQL = ' SELECT ic.rowid, ic.ID , ic.kli_id, ic.loanacc_id, ic.curracc_id,'+
                 ' ii.NAME, ii.mainformguid, ii.changeguid,'+
                 ' ii.suggestionguid, ii.policyguid, ii.mainformname AS tablename, ic.policy_num,'+
                 ' trunc(ic.ins_date) as ins_date, ic.begin_date, ic.end_date, '+
                 ' av.val_name, ic.inssumm, ic.tariff, ic.ammount, ic.franshiz, ic.state, ic.type_id '+
                 ' FROM ins_contracts ic, ins_insurances ii, avalute av'+
                 ' WHERE ii.ID = ic.type_id'+
                 ' %s'+
                 ' and close_prefix=0'+
                 ' and ic.valute_id = av.valute(+) ';
var
  InsDataMod: TInsDataMod;
  ContractsFullForm : Boolean = True;
implementation
uses  sboapiDataModuleImpl, InsCustomersFormImpl;
{$R *.DFM}




procedure TInsDataMod.SetFullForm();
var fid : integer;
begin

  with InsCustomersForm do
    gbCustomers.Visible := False;


  with ODSContracts do begin
    fid := FieldByName('id').asInteger;
    close;
    DeleteVariables;
    SQL.Text := format(ContractsSQL, [' ']);
    Open;
    Locate('ID', fid, []);
  end;

  ContractsFullForm := True;
end;

procedure TInsDataMod.UnSetFullForm();
var fid : integer;
begin
  with InsCustomersForm do
    gbCustomers.Visible := True;

  with ODSContracts do begin
    ODSInsCustomers.Locate('ID', FieldByName('KLI_ID').asInteger, []);
    fid := FieldByName('id').asInteger;
    close;
    SQL.Text := format(ContractsSQL, [Condition]);

    DeclareVariable('KLI_ID', otInteger);
    SetVariable('KLI_ID', ODSInsCustomers.FieldByName('id').asFloat);
    Open;
    Locate('ID', fid, []);
  end;

   ContractsFullForm := False;
end;

procedure TInsDataMod.ODSCustomersAfterFetchRecord(Sender: TOracleDataSet;
  FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
const
  FetchRecLimit = 50;
begin
  with Sender do
  if RecordCount = FetchRecLimit then
  Action := afPause
end;

procedure TInsDataMod.ODSInsCustomersBeforeDelete(DataSet: TDataSet);
begin
   if   MessageDlg('Secilmish anket pozulacaq', mtWarning, [mbYes, mbCancel], 0) = mrCancel then
   Abort;
end;




procedure TInsDataMod.ODSAccountCalcFields(DataSet: TDataSet);
begin
  Currency.Locate('VALUTE',ODSAccountVAL_ACC.value, []);
  ODSAccountVAL_NAME.Value :=  CurrencyVAL_NAME.Value;

end;

procedure TInsDataMod.DataModuleCreate(Sender: TObject);
begin
  Currency.Open;
  ODSAccount.Open;
  BalAcc.Open;
  PairAccount.Open;
  ODSInsurances.Open;
  Tenostat.Open;
  ODSInsCustomers.Open;
  ODSCustomers.Open;
  ODSOccupations.Open;
  ODSActivity.Open;
  ODSEducations.open;
  ODSCustTypes.Open;
  UnSetFullForm;  
end;

procedure TInsDataMod.ODSAccountAfterFetchRecord(Sender: TOracleDataSet;
  FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
begin
 if Sender.RecordCount = 50 then
  Action :=  afPause;
end;

function TInsDataMod.GetSysDate():TDate;
begin
 if Assigned( sboapiDataModule ) then
 with sboapiDataModule do
    Result := SBOperationDay.CallDateFunction('get_date', []);
end;


procedure TInsDataMod.ODSAccountBeforeDelete(DataSet: TDataSet);
begin
   if   MessageDlg('Secilmish anket pozulacaq', mtWarning, [mbYes, mbCancel], 0) = mrCancel then
   Abort;
end;

procedure TInsDataMod.RefreshAll;
begin
  screen.Cursor := crHourGlass;
  try
   ODSInsCustomers.Refresh;
   ODSCustomers.Refresh;
   BalAcc.Refresh;
   Currency.Refresh;
   Tenostat.Refresh;
   PairAccount.Refresh;
   ODSAccount.Refresh;
   ODSInsurances.Refresh;
   ODSOccupations.Refresh;
   ODSEducations.Refresh;
  finally
   Screen.Cursor := crDefault 
  end;
end;

procedure TInsDataMod.ODSInsCustomersAfterScroll(DataSet: TDataSet);
begin

 if ContractsFullForm then exit;

 with ODSContracts do
 begin
   Close;
   SetVariable('kli_id', Dataset.FieldByName('id').asFloat);
   Open;
 end;

end;

procedure TInsDataMod.RefreshContractRec;
begin
  with ODSContracts do
     RefreshRecord;
end;


procedure TInsDataMod.CloseOpenContracts;
begin
  with ODSContracts do begin
     Close;Open
  end;
end;

procedure TInsDataMod.RefreshContracts;
begin
  with ODSContracts do
     Refresh;
end;

procedure TInsDataMod.ODSContractsAfterScroll(DataSet: TDataSet);
var
  img : TBitmap;
begin
 with  ODSAccount do
 begin
   Close;
   SetVariable('ownid', Dataset.FieldByName('id').asFloat);
   Open;
 end;

 with ODSContracts do
   InsCustomersForm.aCommit.Enabled := (FieldByName('state').asInteger in [0, 2, 4]);
end;

procedure TInsDataMod.ODSBal_cnBeforeInsert(DataSet: TDataSet);
begin
  with InsDataMod do
   if ODSAcc_types.State in [dsEdit, dsInsert] then begin
    ODSAcc_types.Post;
    ODSAcc_types.RefreshRecord;
  end;
end;

procedure TInsDataMod.ODSContractsCalcFields(DataSet: TDataSet);
begin
{ if DataSet.FieldByName('sugg_id').asFloat > 0 then
   DataSet.FieldByName('SUGGESTION').asString := 'Вар'
 else
   DataSet.FieldByName('SUGGESTION').asString := 'Йохдур'}
end;

procedure TInsDataMod.ODSPayPlanCalcFields(DataSet: TDataSet);
begin
 with DataSet do
   if FieldByName('STATUS').asInteger > 0 then
      FieldByName('ISPAYED').asString := 'Юдянилиб'
   else FieldByName('ISPAYED').asString := '---------'
end;

procedure TInsDataMod.SaveData;
begin
  with sboapiDataModule do
    SBSession.Commit;
end;

procedure TInsDataMod.RedoData;
begin
  with sboapiDataModule do
    SBSession.Rollback;
end;

procedure TInsDataMod.ODSTariffsAfterPost(DataSet: TDataSet);
begin
  (DataSet as TOracleDataSet).RefreshRecord; 
end;

procedure TInsDataMod.ODSBeneficiaryBeforeDelete(DataSet: TDataSet);
begin
  if (DataSet as TOracleDataSet).FieldByName('ID').AsFloat = -1 then
  MessageDlg('Bu yazini pozmaq qadagandir!', mtConfirmation, [mbOK], 0);
end;

end.
