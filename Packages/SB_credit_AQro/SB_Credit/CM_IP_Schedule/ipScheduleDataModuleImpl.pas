unit ipScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

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
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField5: TFloatField;
    DataSrcCreditInfo: TDataSource;
    BoorowerInfoNAME: TStringField;
    CM_SCHEDULE: TOraclePackage;
    ScheduleDataTOTALPAY: TFloatField;
    ScheduleDataTOTALPAYIP: TFloatField;
    CreditInfoANNUALBANKRATE: TFloatField;
    Exportdata: TOracleDataSet;
    ExportdataPAYMENTDATE: TDateTimeField;
    ExportdataPRINCIPAL: TFloatField;
    ExportdataINTEREST: TFloatField;
    ExportdataTotal: TFloatField;
    IPInfo: TOracleDataSet;
    IPInfoBANKOPENDATE: TDateTimeField;
    IPInfoBANKCLOSEDATE: TDateTimeField;
    ScheduleDataIPINTEREST: TFloatField;
    IPInfoDatSrc: TDataSource;
    CreditInfoNEWFINANCEAMOUNT: TFloatField;
    ExportdataIPINTEREST: TFloatField;
    CreditInfoREST: TFloatField;
    procedure ScheduleDataSeqNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ScheduleDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure ScheduleDataCalcFields(DataSet: TDataSet);
    procedure ExportdataCalcFields(DataSet: TDataSet);
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
  CMOracleAPIDataModuleImpl;

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
  Principial, Interest,PrincipialIP, InterestBank : Real;
begin
  Applied := True;
  with Sender do
  begin
    ID := FieldByName('ID').AsInteger;
    CreditID := FieldByName('CreditID').AsInteger;
    PayDate := FieldByName('PaymentDate').AsDateTime;
    Principial := FieldByName('PRINCIPAL').AsFloat;
    Interest := FieldByName('Interest').AsFloat;
    InterestBank := FieldByName('IPInterest').AsFloat;
  end;
//  LogInformation('Apply Record');
  case Action of
    'I','U' :
       with  CM_SCHEDULE do
       ID :=
       CallIntegerFunction('PaymentSchedule_AddEdit',[
         'p_ID' , ID ,
         'p_CreditID' , CreditID ,
         'p_PayDate' , PayDate ,
         'p_Principial' , Principial ,
         'p_Interest' , Interest,
         'InterestBank',InterestBank
       ]);
    'D' :
       with  CM_SCHEDULE do
       CallProcedure('PaymentSchedule_Delete',['p_ID',ID]);
  else
    Applied := False;
  end; // Case

end;

procedure TScheduleDataModule.ScheduleDataCalcFields(DataSet: TDataSet);
begin
  with DataSet do  begin
  FieldByName('TOTALPAY').AsFloat := FieldByName('PRINCIPAL').AsFloat + FieldByName('INTEREST').AsFloat;
  FieldByName('TOTALPAYIP').AsFloat := FieldByName('PRINCIPAL').AsFloat + FieldByName('IPINTEREST').AsFloat;
  end;
end;

procedure TScheduleDataModule.ExportdataCalcFields(DataSet: TDataSet);
begin
  with DataSet do  begin
  FieldByName('TOTAL').AsFloat := FieldByName('PRINCIPAL').AsFloat + FieldByName('INTEREST').AsFloat;
  end;

end;

end.
