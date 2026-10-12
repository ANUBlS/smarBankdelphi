unit Data_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,sboapiDataModuleImpl,
  Db, OracleData, Oracle;

type
  TDataMod = class(TDataModule)
    Account_data: TOracleDataSet;
    Account_Source: TDataSource;
    DataSet_View: TOracleDataSet;
    DataSource_View: TDataSource;
    DataSource_BankInfo: TDataSource;
    BankInfo: TOracleDataSet;
    BankM: TOracleDataSet;
    BankM_DataSource: TDataSource;
    AValute: TOracleDataSet;
    TransTypeCode: TOracleDataSet;
    Hox102_out: TOracleDataSet;
    Hox102_DataSource: TDataSource;
    Ins: TOraclePackage;
    ForCHECK: TOracleDataSet;
    HoxMessages_out: TOracleDataSet;
    Mess_out_DataSource: TDataSource;
    BankInfoKOD_B: TFloatField;
    BankInfoBANK: TStringField;
    BankInfoAZ_NAME: TStringField;
    BankInfoKRNO: TFloatField;
    BankInfoINN: TStringField;
    BankInfoSEHER: TStringField;
    BankInfoADRESS: TStringField;
    BankInfoSEDR: TStringField;
    BankInfoBUHALTR: TStringField;
    BankInfoTEL: TStringField;
    BankInfoFAX: TStringField;
    BankInfoSWIFT: TStringField;
    BankInfoTELEX: TStringField;
    BankInfoEMAIL: TStringField;
    BankInfoPOST_IN: TStringField;
    BankInfoKOD_FIL: TIntegerField;
    BankInfoFILIAL: TStringField;
    BankInfoADRES_FIL: TStringField;
    BankInfoTEL_FIL: TStringField;
    BankInfoFAX_FIL: TStringField;
    BankInfoSWIFT_FIL: TStringField;
    BankInfoTELEX_FIL: TStringField;
    BankInfoPOSTIN_FIL: TStringField;
    BankInfoSEHER_FIL: TStringField;
    BankInfoINN_FIL: TStringField;
    BankInfoKRNO_FIL: TFloatField;
    BankInfoSEDRFIL: TStringField;
    BankInfoBUHAL_FIL: TStringField;
    BankInfoKOD_BFIL: TFloatField;
    BankInfoNB: TIntegerField;
    BankInfoVAL_MOV: TFloatField;
    BankInfoLOGO: TBlobField;
    BankInfoLINK: TStringField;
    BankInfoSDV: TFloatField;
    BankInfoSVM: TFloatField;
    BankInfoBF: TFloatField;
    DEL: TOraclePackage;
    Reference: TOraclePackage;
    HoxSw_Proper: TOracleDataSet;
    TransCodeDataSource: TDataSource;
    CHECK_Pack: TOraclePackage;
    HoxMessages_outID: TFloatField;
    HoxMessages_outMT102_ID: TFloatField;
    HoxMessages_outREC_BANK_ID: TFloatField;
    HoxMessages_outREC_BANK_SUB_ACC: TFloatField;
    HoxMessages_outCLIENT_ACC_NO: TStringField;
    HoxMessages_outCLIENT_NAME: TStringField;
    HoxMessages_outCLIENT_CODE: TStringField;
    HoxMessages_outCLIENT_INN: TFloatField;
    HoxMessages_outREMIT_INF: TStringField;
    HoxMessages_outTRANS_COD: TIntegerField;
    HoxMessages_outADD_INF: TStringField;
    HoxMessages_outVAL_DATE: TDateTimeField;
    HoxMessages_outVAL_COD: TIntegerField;
    HoxMessages_outMESS_REFERENCE: TStringField;
    HoxMessages_outAMOUNT: TFloatField;
    HoxMessages_outBNFCOUNT: TIntegerField;
    HoxMessages_outSTATUS: TIntegerField;
    HoxMessages_outVAL_NAME: TStringField;
    ForAll: TOracleDataSet;
    HoxMessages_IN: TOracleDataSet;
    HoxMessages_IN_view: TOracleDataSet;
    Message_in_DataSource: TDataSource;
    HoxMessages_IN_viewID: TFloatField;
    HoxMessages_IN_viewREFERENCE: TStringField;
    HoxMessages_IN_viewVAL_COD: TIntegerField;
    HoxMessages_IN_viewAMOUNT: TFloatField;
    HoxMessages_IN_viewSEN_ACC: TStringField;
    HoxMessages_IN_viewSEN_NAME: TStringField;
    HoxMessages_IN_viewSEN_INN: TFloatField;
    HoxMessages_IN_viewSEN_BANK_ID: TFloatField;
    HoxMessages_IN_viewSEN_BANK_SUBACC: TFloatField;
    HoxMessages_IN_viewREC_BANK_SUBACC: TFloatField;
    HoxMessages_IN_viewREC_BANK_BIK: TStringField;
    HoxMessages_IN_viewREC_CLIENT_ACC: TStringField;
    HoxMessages_IN_viewREC_CLIENT_ACC_ID: TFloatField;
    HoxMessages_IN_viewREC_CLIENT_NAME: TStringField;
    HoxMessages_IN_viewREC_CLIENT_INN: TFloatField;
    HoxMessages_IN_viewREMIT_INF: TStringField;
    HoxMessages_IN_viewTYPECODE: TIntegerField;
    HoxMessages_IN_viewADD_INF: TStringField;
    HoxMessages_IN_viewTRANS_DATE: TDateTimeField;
    HoxMessages_IN_viewSTATUS: TIntegerField;
    HoxMessages_IN_viewVAL_NAME: TStringField;
    HoxMessages_IN_viewNAME: TStringField;
    GetSysDate: TOraclePackage;
    Hox102_outID: TFloatField;
    Hox102_outF_ID: TFloatField;
    Hox102_outOPERCODE: TStringField;
    Hox102_outACC_ID: TFloatField;
    Hox102_outCLIENT_NAME: TStringField;
    Hox102_outCLIENT_CODE: TStringField;
    Hox102_outTRANS_REF: TStringField;
    Hox102_outAMOUNT: TFloatField;
    Hox102_outVAL_ACC: TIntegerField;
    Hox102_outTRANSDATE: TDateTimeField;
    Hox102_outSEND: TIntegerField;
    Hox102_outSTATUS: TIntegerField;
    Hox102_outACC_NO: TStringField;
    Hox102_outNAME: TStringField;
    Hox102_outVAL_NAME: TStringField;
    Hox102_outLAMOUNT: TFloatField;
    procedure Hox102_outAfterScroll(DataSet: TDataSet);
    procedure HoxMessages_outAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation

uses Swift_Unit;

{$R *.DFM}

procedure TDataMod.Hox102_outAfterScroll(DataSet: TDataSet);
begin
  swift_form.BrowseGrid.SelectedRows.Clear;
  Swift_Form.ToolButton11.Enabled:=not DataSet.IsEmpty;
  Swift_Form.AcceptButton.Enabled:=not DataSet.IsEmpty;
  Swift_Form.AcceptButton.Enabled:=DataMod.Hox102_out.FieldByName('status').AsInteger=0;

  Swift_Form.ToolButton9.Enabled:= not DataSet.IsEmpty;
  Swift_Form.ToolButton2.Enabled:= not DataSet.IsEmpty;
  Swift_Form.ToolButton4.Enabled:=not DataSet.IsEmpty;
  Swift_Form.MessAcceptButton.Enabled:=not DataSet.IsEmpty;

end;
{select
                   h.*,
                   a.acc_no,
                   v.val_name,
                   h.amount/k.ostat
from
	   hox102_out h,
	   account a,
	   avalute v,
	   operkurs k
where
                   h.acc_id = a.id and
                   v.valute=h.val_acc and
                  ((h.val_acc=k.val_kod)and(k.dat=h.transdate))
order by h.id
}
procedure TDataMod.HoxMessages_outAfterScroll(DataSet: TDataSet);
begin
  Swift_Form.ToolButton4.Enabled:=not DataSet.IsEmpty;
  Swift_Form.MessAcceptButton.Enabled:=not DataSet.IsEmpty;
  Swift_Form.MessAcceptButton.Enabled:=DataMod.HoxMessages_out.FieldByName('status').AsInteger=0;
end;

end.
