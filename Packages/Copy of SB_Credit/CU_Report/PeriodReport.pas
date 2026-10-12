unit PeriodReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CMExcelExport, Oracle, Db, OracleData, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TPeriodReportForm = class(TForm)
    CreditsDS: TOracleDataSet;
    CM_AK_REPORTS: TOraclePackage;
    DSCurrencys: TDataSource;
    Currencys: TOracleDataSet;
    DSBranches: TDataSource;
    Branches: TOracleDataSet;
    DSUserGroups: TDataSource;
    UserGroups: TOracleDataSet;
    DSPersons: TDataSource;
    Persons: TOracleDataSet;
    DSCategories: TDataSource;
    Categories: TOracleDataSet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    GroupBox2: TGroupBox;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    CheckBox3: TCheckBox;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    CheckBox2: TCheckBox;
    Panel5: TPanel;
    GroupBox7: TGroupBox;
    CheckBox7: TCheckBox;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    GroupBox9: TGroupBox;
    CheckBox8: TCheckBox;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    GroupBox4: TGroupBox;
    BDateP: TDateTimePicker;
    EDateP: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ResultDS: TOracleDataSet;
    Button1: TButton;
    Button2: TButton;
    Kera: TCMExcelExport;
    ResultDSNUMBEROFCREDIT: TWideStringField;
    ResultDSCONTRACTNO: TWideStringField;
    ResultDSINTERESTACCNO: TWideStringField;
    ResultDSDUELOANACCNO: TWideStringField;
    ResultDSDUEINTERESTACCNO: TWideStringField;
    ResultDSPRESACCNO: TWideStringField;
    ResultDSSECRESTACCNO: TWideStringField;
    ResultDSPBMAIN: TFloatField;
    ResultDSPEBMAIN: TFloatField;
    ResultDSPBINT: TFloatField;
    ResultDSPEBINT: TFloatField;
    ResultDSPBDUEMAIN: TFloatField;
    ResultDSPEBDUEMAIN: TFloatField;
    ResultDSPBDUEINT: TFloatField;
    ResultDSPEBDUEINT: TFloatField;
    ResultDSPAYMAIN: TFloatField;
    ResultDSEPAYMAIN: TFloatField;
    ResultDSPAYINT: TFloatField;
    ResultDSEPAYINT: TFloatField;
    ResultDSPAYDUE: TFloatField;
    ResultDSEPAYDUE: TFloatField;
    ResultDSPAYDUEINT: TFloatField;
    ResultDSEPAYDUEINT: TFloatField;
    ResultDSTRANCHEMAIN: TFloatField;
    ResultDSETRANCHEMAIN: TFloatField;
    ResultDSPEMAIN: TFloatField;
    ResultDSEPEMAIN: TFloatField;
    ResultDSPEINT: TFloatField;
    ResultDSEPEINT: TFloatField;
    ResultDSPEDUEMAIN: TFloatField;
    ResultDSEPEDUEMAIN: TFloatField;
    ResultDSPEDUEINT: TFloatField;
    ResultDSEPEDUEINT: TFloatField;
    ResultDSCRDPERIOD: TFloatField;
    ResultDSBALCN: TFloatField;
    ResultDSNAME: TWideStringField;
    ResultDSPERSON: TWideStringField;
    ResultDSPROJECT: TWideStringField;
    ResultDSFILIAL: TWideStringField;
    ResultDSVAL_NAME: TWideStringField;
    ResultDSDATEOFCONCLUSION: TDateTimeField;
    ResultDSDUEDATEFIRSTCONTRACT: TDateTimeField;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ResultDSCREDITID: TFloatField;
    ResultDSANNUALYINTERESTRATE: TFloatField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private 
    procedure PrepareProgress(ProgCnt : Integer; opDesc : String);
    procedure InsertOneRow(PID : Integer; BDate : TDateTime; EDate : TDateTime);
  public
    function BuildFilterString : String;
    procedure ShowMe;
    { Public declarations }
  end;

var
  PeriodReportForm: TPeriodReportForm;

implementation

{$R *.DFM}


uses sboapiDataModuleImpl, CommonDecls, MISProgressFormImpl, sbsystem, SBTranslateProc;

procedure TPeriodReportForm.PrepareProgress;
begin
  with MISProgressForm , ProgressShower do
  begin
    Position := 0;
    Max := ProgCnt;
    Step := 1;
    Caption := opDesc;
  end;
  MISProgressForm.Show;
end;

procedure TPeriodReportForm.InsertOneRow;
resourcestring
  rsCreditNumber = '%d - № li kredit : ';
begin
  with CM_AK_REPORTS do
  try
    CallProcedure('insinfod',[
    'p_ID', pID ,
    'p_bDate', bDate ,
    'p_eDate', eDate
    ]);
  except
    on E:Exception do
    LogError(Format(rsCreditNumber,[pid]) + E.Message);
  end;
end;

function TPeriodReportForm.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + 'AND ' + Temp;
    end;
    
  end;
begin
  Result := '';
  ConcatFilter(Result,'CURRENCY',CheckBox1.Checked,DBLookupComboboxEh1.KeyValue);
  ConcatFilter(Result,'BRANCHID',CheckBox2.Checked,DBLookupComboboxEh2.KeyValue);
  ConcatFilter(Result,'USRGROUP',CheckBox3.Checked,DBLookupComboboxEh3.KeyValue);
  ConcatFilter(Result,'PERSONALTYPE',CheckBox7.Checked,DBLookupComboboxEh7.KeyValue);
  ConcatFilter(Result,'CUSTOMERTYPE',CheckBox8.Checked,DBLookupComboboxEh8.KeyValue);
  //LogInformation(Result);
end;

procedure TPeriodReportForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TPeriodReportForm.ShowMe;
begin
  Currencys.Open;
  Branches.Open;
  Persons.Open;
  Categories.Open;
  UserGroups.Open;
  ShowModal;
end;

procedure TPeriodReportForm.Button1Click(Sender: TObject);
resourcestring
  rsProgressCaption = '                 Hesabat alınır.Gözləyin.   .....';
var
  cs,S          : String;
  CrdID      : Integer;
    EDATE, HDATE: TDateTime;
begin
   HDATE:=DateTimePicker1.DateTime;
   EDATE:=DateTimePicker2.DateTime;
S:='';
{cs := 'and  (partitionkey=0 or DUEDATEFIRSTCONTRACT >= '''+
          FormatDateTime('dd-MMM-yyyy',BDateP.Date)+''')';    }
  if  BuildFilterString <>'' then
    S := 'and '+BuildFilterString;
if S<>'' then cs:=S;
  CreditsDS.SQL[2] := cs;
  with CreditsDS  do begin
     Session.Commit;
     if Active then CloseAll;
       ClearVariables;
       SetVariable('HDATE',HDATE);
       SetVariable('EDATE',EDATE);
       Open;
     First;
     PrepareProgress(RecordCount,rsProgressCaption);
     While not Eof do begin
       CrdID := FieldByName('ID').AsInteger;
       InsertOneRow(CrdID, Integer(Trunc(BDateP.DateTime)), Integer(Trunc(EDateP.DateTime)));
       MISProgressForm.ProgressShower.Position := RecNo;
       Next;
       CommonApplication.ProcessMessages;
     end;
     MISProgressForm.Close; 

  end;
  
  with ResultDS do begin
    if not Active then
      Open
    else
      Refresh;
  end;
  LogInformation(IntToStr(ResultDS.RecordCount));

  with Kera do begin
     Connect;
     ExportDataset(ResultDS, 'SD1',True);
     Disconnect;
  end;

end;

procedure TPeriodReportForm.FormCreate(Sender: TObject);
begin
  MISProgressForm := TMISProgressForm.Create(Self);
  BDateP.DateTime := Get_CurrentDate;
  EDateP.DateTime := Get_CurrentDate;
  DateTimePicker1.DateTime := Get_CurrentDate;
  DateTimePicker2.DateTime := Get_CurrentDate;
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
