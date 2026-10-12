unit ScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle,math;

type
  TScheduleDataModule = class(TDataModule)
    DataSrcScheduleData: TDataSource;
    ScheduleData: TOracleDataSet;
    BoorowerInfo: TOracleDataSet;
    DSBoorowerInfo: TDataSource;
    ScheduleDataID: TFloatField;
    ScheduleDataCREDITID: TFloatField;
    ScheduleDataPAYMENTDATE: TDateTimeField;
    ScheduleDataPRINCIPAL: TFloatField;
    ScheduleDataINTEREST: TFloatField;
    ScheduleDataSeqNo: TIntegerField;
    CreditInfo: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField5: TFloatField;
    DataSrcCreditInfo: TDataSource;
    CM_SCHEDULE: TOraclePackage;
    ScheduleDataTOTALPAY: TFloatField;
    ExportData: TOracleDataSet;
    ExportDataPAYMENTDATE: TDateTimeField;
    ExportDataPRINCIPAL: TFloatField;
    ExportDataINTEREST: TFloatField;
    ScheduleDataREST: TFloatField;
    ExportDataREST: TFloatField;
    BoorowerInfoCUSTACCNO: TWideStringField;
    BoorowerInfoLOANACCNO: TWideStringField;
    BankInfo: TOracleDataSet;
    CreditInfoREST: TFloatField;
    FilialInfods: TDataSource;
    FilialInfo: TOracleDataSet;
    FilialInfoNAME: TWideStringField;
    FilialInfoID: TFloatField;
    CreditInfoBRANCHID: TFloatField;
    HeadOfficeID: TOracleDataSet;
    HeadOfficeIDMINID: TFloatField;
    CreditInfoVAL_NAME: TWideStringField;
    adm: TOraclePackage;
    BoorowerInfoNAME: TWideStringField;
    CreditInfoANNUALBANKRATE: TFloatField;
    CreditInfoANNUALYPENALTYRATE: TFloatField;
    CreditInfoENDDAT: TDateTimeField;
    CreditInfoINTCALCMETHOD: TFloatField;
    CreditInfoNUMBEROFCREDIT: TWideStringField;
    CreditInfoKOMISION: TFloatField;
    CreditInfoFIFD: TFloatField;
    ScheduleDataCREATE_TYPE: TWideStringField;
    BankInfoBANK: TWideStringField;
    BankInfoLOGO: TBlobField;
    BankInfoAZ_NAME: TWideStringField;
    BankInfoKOD_FIL: TIntegerField;
    BankInfoSEDRFIL: TWideStringField;
    BankInfoLINK: TWideStringField;
    BoorowerInfoGUZESH_DOVR: TWideStringField;
    CreditInfoCREDITLINEAMOUNT: TFloatField;
    CreditInfoCREDITLINEAMOUNT_VAL: TWideStringField;
    CreditInfoCERIME: TWideStringField;
    BankInfoFAX_FIL: TWideStringField;
    CreditInfoPERIOD_AY: TWideStringField;
    CreditInfoPERIOD: TFloatField;
    BoorowerInfoADDRESS: TWideStringField;
    BoorowerInfoPASS: TWideStringField;
    BoorowerInfoPHONE_M: TWideStringField;
    BoorowerInfoKMID: TWideStringField;
    CreditInfoANNUALYINTERESTRATE1: TFloatField;
    BoorowerInfoVAL_NAME: TWideStringField;
    procedure ScheduleDataSeqNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ScheduleDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure ScheduleDataCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScheduleDataModule: TScheduleDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

procedure TScheduleDataModule.ScheduleDataSeqNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntToStr(Sender.DataSet.RecNo);
end;

procedure TScheduleDataModule.ScheduleDataApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
  ID, CreditID : Integer;
  PayDate : TDateTime;
  Principial, Interest : Real;
  v_type :string;
begin
  Applied := True;
  with Sender do
  begin
    ID := FieldByName('ID').AsInteger;
    CreditID := FieldByName('CreditID').AsInteger;
    PayDate := FieldByName('PaymentDate').AsDateTime;
    Principial := FieldByName('PRINCIPAL').AsFloat;
    Interest := FieldByName('Interest').AsFloat;
    v_type:='Manual';
    end;
//  LogInformation('Apply Record');
  case Action of
    'I','U' :
       with  CM_SCHEDULE do   begin
       ID :=
       CallIntegerFunction('PaymentSchedule_AddEdit',[
         'p_ID' , ID ,
         'p_CreditID' , CreditID ,
         'p_PayDate' , PayDate ,
         'p_Principial' , Principial ,
         'p_Interest' , Interest
        // 'p_create_type',v_type
       ]);  end;
    'D' :
       with  CM_SCHEDULE do
       CallProcedure('PaymentSchedule_Delete',['p_ID',ID]);
  else
    Applied := False;
  end; // Case



end;

procedure TScheduleDataModule.ScheduleDataCalcFields(DataSet: TDataSet);
var
v_a,v_b,v_c:Double;
v_x :Double ;
begin
  with DataSet do
  begin
  v_a:=FieldByName('PRINCIPAL').AsFloat;
  v_b:=FieldByName('INTEREST').AsFloat;
  v_c:=v_a+v_b;

  //v_x:=RoundTo(v_c,-2);

  FieldByName('TOTALPAY').AsFloat:= v_c;

  end;




end;

procedure TScheduleDataModule.DataModuleCreate(Sender: TObject);
begin
//   FilialInfo.open;
end;

end.
