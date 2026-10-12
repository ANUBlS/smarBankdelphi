unit MFDataModule;
                                                                                                               
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TMainFDataModule = class(TDataModule)
    ViewGroup: TOracleDataSet;
    DViewGroup: TDataSource;
    DViewWares: TDataSource;
    ViewWares: TOracleDataSet;
    OPViewWares: TOraclePackage;
    ExcelPreviewCurrent: TOracleDataSet;
    ODSWaresID: TOracleDataSet;
    ODSDepartments: TOracleDataSet;
    ODSTakeDepartmentID: TOracleDataSet;
    ODSTakeGroupID: TOracleDataSet;
    ODSMODERN: TOracleDataSet;
    ODSREPAIR: TOracleDataSet;
    ODSMODERNID: TFloatField;
    ODSMODERNGROUPSID: TFloatField;
    ODSMODERNMODERN_NUM: TFloatField;
    ODSMODERNMODERN_SUMMA: TFloatField;
    ODSMODERNMODERN_DATE: TDateTimeField;
    ODSREPAIRID: TFloatField;
    ODSREPAIRGROUPSID: TFloatField;
    ODSREPAIRREPAIR_NUM: TFloatField;
    ODSREPAIRREPAIR_SUMMA: TFloatField;
    ODSREPAIRREPAIR_DATE: TDateTimeField;
    ExcelPreviewCopyOff: TOracleDataSet;
    M1: TOracleDataSet;
    R1: TOracleDataSet;
    ExcelPreviewCurrentModern_date: TDateField;
    ExcelPreviewCurrentModern_num: TIntegerField;
    ExcelPreviewCurrentModern_summa: TIntegerField;
    ExcelPreviewCurrentRepair_date: TDateField;
    ExcelPreviewCurrentRepair_num: TIntegerField;
    ExcelPreviewCurrentRepair_summa: TIntegerField;
    ExcelPreviewGroups: TOracleDataSet;
    ODSTransaction: TOracleDataSet;
    OPTranzaction: TOraclePackage;
    ViewWaresModern_num: TIntegerField;
    ViewWaresModern_summa: TIntegerField;
    ViewWaresModern_date: TDateField;
    ViewWaresRepair_num: TIntegerField;
    ViewWaresRepair_summa: TIntegerField;
    ViewWaresRepair_date: TDateField;
    ViewWaresID: TFloatField;
    ViewWaresGROUPSID: TFloatField;
    ViewWaresNAME: TStringField;
    ViewWaresINVENTAR: TStringField;
    ViewWaresINVENTAR_DATE: TDateTimeField;
    ViewWaresFIRST_PRICE: TFloatField;
    ViewWaresBALANCE_PRICE: TFloatField;
    ViewWaresIN_DATE: TDateTimeField;
    ViewWaresIN_NUM: TFloatField;
    ViewWaresAMORT: TFloatField;
    ViewWaresPRODUCER_PLANE: TStringField;
    ViewWaresFXM: TFloatField;
    ViewWaresSECTOR_COD: TFloatField;
    ViewWaresCLOSE_FORMAT: TFloatField;
    ViewWaresREMAINDER: TFloatField;
    ViewWaresALLAMORT: TFloatField;
    ViewWaresTAXAMORT: TFloatField;
    ViewWaresALLTAXAMORT: TFloatField;
    ODSTaxPercents: TOracleDataSet;
    DSTaxPercents: TDataSource;
    ODSTraffics: TOracleDataSet;
    ViewGroupID: TFloatField;
    ViewGroupNAME: TStringField;
    ViewGroupAMORT: TFloatField;
    ViewGroupTAXAMORT: TFloatField;
    ViewGroupMAIN_ACCOUNT: TFloatField;
    ViewGroupEXP_ACCOUNT: TFloatField;
    ViewGroupAMORT_ACCOUNT: TFloatField;
    ViewGroupSALE_ACCOUNT: TFloatField;
    ViewWaresAMORT_DATE: TDateTimeField;
    ViewWaresTAX: TFloatField;
    ExcelPreviewCurrentID: TFloatField;
    ExcelPreviewCurrentINVENTAR_DATE: TDateTimeField;
    ExcelPreviewCurrentINVENTAR: TStringField;
    ExcelPreviewCurrentNAME: TStringField;
    ExcelPreviewCurrentIN_DATE: TDateTimeField;
    ExcelPreviewCurrentIN_NUM: TFloatField;
    ExcelPreviewCurrentFIRST_PRICE: TFloatField;
    ExcelPreviewCurrentPRODUCER_PLANE: TStringField;
    ExcelPreviewCurrentAMORT: TFloatField;
    ExcelPreviewCurrentALLAMORT: TFloatField;
    ODSTaxPercentsID: TFloatField;
    ODSTaxPercentsINVENTAR_DATE: TDateTimeField;
    ODSTaxPercentsINVENTAR: TStringField;
    ODSTaxPercentsNAME: TStringField;
    ODSTaxPercentsIN_DATE: TDateTimeField;
    ODSTaxPercentsIN_NUM: TFloatField;
    ODSTaxPercentsFIRST_PRICE: TFloatField;
    ODSTaxPercentsPRODUCER_PLANE: TStringField;
    ODSTaxPercentsAMORT: TFloatField;
    ODSTaxPercentsALLAMORT: TFloatField;
    ODSTaxPercentsTAX: TFloatField;
    ODSTaxPercentsTAXAMORT: TFloatField;
    ODSTaxPercentsALLTAXAMORT: TFloatField;
    ODSTaxPercentsREMAINDER: TFloatField;
    ExcelPreviewCurrentAMORT_DATE: TDateTimeField;
    ExcelPreviewCopyOffID: TFloatField;
    ExcelPreviewCopyOffINVENTAR_DATE: TDateTimeField;
    ExcelPreviewCopyOffINVENTAR: TStringField;
    ExcelPreviewCopyOffNAME: TStringField;
    ExcelPreviewCopyOffIN_DATE: TDateTimeField;
    ExcelPreviewCopyOffIN_NUM: TFloatField;
    ExcelPreviewCopyOffFIRST_PRICE: TFloatField;
    ExcelPreviewCopyOffPRODUCER_PLANE: TStringField;
    ExcelPreviewCopyOffAMORT: TFloatField;
    ExcelPreviewCopyOffAMORT_DATE: TDateTimeField;
    ExcelPreviewCopyOffALLAMORT: TFloatField;
    ExcelPreviewCopyOffMODERN_DATE: TDateTimeField;
    ExcelPreviewCopyOffMODERN_NUM: TFloatField;
    ExcelPreviewCopyOffMODERN_SUMMA: TFloatField;
    ExcelPreviewCopyOffREPAIR_DATE: TDateTimeField;
    ExcelPreviewCopyOffREPAIR_NUM: TFloatField;
    ExcelPreviewCopyOffREPAIR_SUMMA: TFloatField;
    ExcelPreviewCopyOffOUT_DATE: TDateTimeField;
    ExcelPreviewCopyOffOUT_NUM: TFloatField;
    ExcelPreviewCopyOffCAUSE_OUT: TStringField;
    ExcelPreviewGroupsID: TFloatField;
    ExcelPreviewGroupsMAXGNAME: TStringField;
    ExcelPreviewGroupsMAXGAMORT: TFloatField;
    ExcelPreviewGroupsSUMWFIRST_PRICE: TFloatField;
    ExcelPreviewGroupsSUMWBALANCE_PRICE: TFloatField;
    ExcelPreviewGroupsSUMWALLAMORT: TFloatField;
    ODSDepartmentsPrint: TOracleDataSet;
    ODSDepartmentsPrintID: TFloatField;
    ODSDepartmentsPrintGROUPSID: TFloatField;
    ODSDepartmentsPrintNAME: TStringField;
    ODSDepartmentsPrintINVENTAR: TStringField;
    ODSDepartmentsPrintINVENTAR_DATE: TDateTimeField;
    ODSDepartmentsPrintFIRST_PRICE: TFloatField;
    ODSDepartmentsPrintBALANCE_PRICE: TFloatField;
    ODSDepartmentsPrintAMORT: TFloatField;
    ODSDepartmentsPrintPRODUCER_PLANE: TStringField;
    ODSDepartmentsPrintSECTOR_COD: TFloatField;
    ODSDepartmentsPrintREMAINDER: TFloatField;
    ODSDepartmentsPrintALLAMORT: TFloatField;
    ODSDepartmentsPrintAMORT_DATE: TDateTimeField;
    ODSDepartmentsPrintGroupName: TStringField;
    ODSBankInfo: TOracleDataSet;
    ODSGroupFilter: TOracleDataSet;
    DSSumModWares: TDataSource;
    ODSSumModWares: TOracleDataSet;
    ODSSumModWaresGROUPSID: TFloatField;
    ODSSumModWaresMODERN_SUMMA: TFloatField;
    ODSSumRepair: TOracleDataSet;
    ODSSumRepairGROUPSID: TFloatField;
    ODSSumRepairREPAIR_SUMMA: TFloatField;
    DSSumRepair: TDataSource;
    ODSSumWares: TOracleDataSet;
    DSSumWares: TDataSource;
    ODSSumWaresGROUPSID: TFloatField;
    ODSSumWaresFPRICE: TFloatField;
    ODSSumWaresBPRICE: TFloatField;
    ODSSumWaresALLAMORT: TFloatField;
    ODSSumWaresREMAINDER: TFloatField;
    ODSBankInfoFULLBANKNAME: TStringField;
    ODSDepartmentsPrintFormattedDate: TStringField;
    ODSTrafficsID: TFloatField;
    ODSTrafficsGROUPSID: TFloatField;
    ODSTrafficsNAME: TStringField;
    ODSTrafficsINVENRTAR: TStringField;
    ODSTrafficsINVENTAR_DATE: TDateTimeField;
    ODSTrafficsFIRST_PRICE: TFloatField;
    ODSTrafficsBALANCE_PRICE: TFloatField;
    ODSTrafficsALLAMORT: TFloatField;
    ODSTrafficsREMAINDER: TFloatField;
    ODSTrafficsAMORT: TFloatField;
    ODSTrafficsAMORT_DATE: TDateTimeField;
    ODSTrafficsFormattedDate: TStringField;
    ODSWClose: TOracleDataSet;
    ODSWCloseID: TFloatField;
    ODSWCloseGROUPSID: TFloatField;
    ODSWCloseNAME: TStringField;
    ODSWCloseINVENTAR: TStringField;
    ODSWCloseINVENTAR_DATE: TDateTimeField;
    ODSWCloseFIRST_PRICE: TFloatField;
    ODSWCloseBALANCE_PRICE: TFloatField;
    ODSWCloseIN_DATE: TDateTimeField;
    ODSWCloseIN_NUM: TFloatField;
    ODSWCloseAMORT: TFloatField;
    ODSWClosePRODUCER_PLANE: TStringField;
    ODSWCloseFXM: TFloatField;
    ODSWCloseSECTOR_COD: TFloatField;
    ODSWCloseCLOSE_FORMAT: TFloatField;
    ODSWCloseREMAINDER: TFloatField;
    ODSWCloseALLAMORT: TFloatField;
    ODSWCloseTAXAMORT: TFloatField;
    ODSWCloseALLTAXAMORT: TFloatField;
    ODSTaxPercentsTAXPERCENTPRICE: TFloatField;
    ODSDifferenceReport: TOracleDataSet;
    ODSGetErroneousWares: TOracleDataSet;
    ODSDifferenceReportID: TFloatField;
    ODSDifferenceReportMAINACC: TFloatField;
    ODSDifferenceReportBALCN: TFloatField;
    ODSDifferenceReportNAME: TStringField;
    ODSDifferenceReportALLAMORT: TFloatField;
    ODSDifferenceReportALLTAXAMORT: TFloatField;
    ODSAccounts: TOracleDataSet;
    ODSAccountsID: TFloatField;
    ODSAccountsACC_NO: TStringField;
    ODSTransactionID: TFloatField;
    ODSTransactionNAME: TStringField;
    ODSTransactionMAIN_ACCOUNT: TFloatField;
    ODSTransactionEXP_ACCOUNT: TFloatField;
    ODSTransactionAMORT_ACCOUNT: TFloatField;
    ODSTransactionSALE_ACCOUNT: TFloatField;
    ODSTransactionREST: TFloatField;
    ViewWaresTAXPERCENTPRICE: TFloatField;
    ViewGroupRecordNo: TStringField;
    ViewWaresRecordNo: TStringField;
    ViewGroupMAINACCNO: TStringField;
    ViewGroupDEBTACCNO: TStringField;
    ViewGroupCREDITACCNO: TStringField;
    ViewGroupSALEACCNO: TStringField;
    procedure ODSTrafficsCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ODSDepartmentsPrintCalcFields(DataSet: TDataSet);
    procedure DViewWaresDataChange(Sender: TObject; Field: TField);
    procedure ViewGroupRecordNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ViewWaresRecordNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  MainFDataModule: TMainFDataModule;

implementation

{$R *.DFM}
uses  sboapiDataModuleImpl, UntMainFacilitiesImpl;

//Procedure CreateModul;
//begin
 // MainFDataModule:=TMainFDataModule.Create(nil);
//end;

//Procedure DestroyModul;
//begin
 //MainFDataModule.Free;
//end;



procedure TMainFDataModule.ODSTrafficsCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('FormattedDate').AsString :=FormatDateTime('dd-mmm-yyyy',FieldByName('Amort_Date').AsDateTime);
end;

procedure TMainFDataModule.DataModuleDestroy(Sender: TObject);
var
  CompCount :word;
begin
 for CompCount :=0 to ComponentCount-1 do
  if(Components[CompCount] is TOracleDataSet) then
   (Components[CompCount] as TOracleDataSet).CloseAll;  
end;

procedure TMainFDataModule.ODSDepartmentsPrintCalcFields(
  DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('FormattedDate').AsString :=FormatDateTime('dd-mmm-yyyy',FieldByName('Inventar_Date').AsDateTime);
end;

procedure TMainFDataModule.DViewWaresDataChange(Sender: TObject;
  Field: TField);
begin
  with (Sender as TDataSource).DataSet,MainFacilities do
  begin
   ActionUpdate.Enabled := not IsEmpty;
   ActionTakeOff.Enabled := not IsEmpty;
   ActionTraffic.Enabled := not IsEmpty;
   ActionInventarCard.Enabled := not IsEmpty;
   ActDelete.Enabled := IsEmpty;
  end;
end;

procedure TMainFDataModule.ViewGroupRecordNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text :=IntToStr(ViewGroup.RecNo);
end;

procedure TMainFDataModule.ViewWaresRecordNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text :=IntToStr(ViewWares.RecNo);
end;

end.
