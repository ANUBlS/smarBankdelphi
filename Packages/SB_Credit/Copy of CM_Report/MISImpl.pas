unit MISImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, NLSLocalizer, CMExcelExport, StdCtrls, CheckLst,
  Evanescence, ComCtrls, ExtCtrls, Buttons, KeyListBox, Mask, DBCtrlsEh,
  DBLookupEh;

resourcestring
  rsErrorValute       = 'ян азы бир валйута сечилм€лидир!';
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
  rsErrorBranch       = 'ян азы бир филиал сечилм€лидир!';
  rsInfScriptStarted  = '»храж башлады';
  rsInfRowsExported   = '%d с€тир ихраж олунду';
  rsInfExportFinished = '»храж гуртарды';

type
  TMISForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LookValute: TEvanescence;
    LookUsrGrp: TEvanescence;
    LookPersonelType: TEvanescence;
    LookBranch: TEvanescence;
    Panel2: TPanel;
    Label1: TLabel;
    Tarix: TDateTimePicker;
    challValute: TButton;
    unchallValute: TButton;
    challUsrGrp: TButton;
    unchallUsrGrp: TButton;
    challBranch: TButton;
    unchallBranch: TButton;
    challPersonalType: TButton;
    unchallPersonalType: TButton;
    MISData: TOracleDataSet;
    MISDataCONTRACTACCNO: TStringField;
    MISDataVAL_NAME: TStringField;
    MISDataNAME: TStringField;
    MISDataDATEOFCONCLUSION: TDateTimeField;
    MISDataDUEDATEFIRSTCONTRACT: TDateTimeField;
    MISDataDUEDATELASTCONTRACT: TDateTimeField;
    MISDataCREDITLINEAMOUNT: TFloatField;
    MISDataANNUALYINTERESTRATE: TFloatField;
    MISDataINTERESTREST: TFloatField;
    MISDataDUEREST: TFloatField;
    MISDataDUEINTERESTREST: TFloatField;
    MISDataREST: TFloatField;
    MISDataPERCENT: TFloatField;
    MISDataDESCRIPTION: TStringField;
    MISDataPLEDGEPRICE: TFloatField;
    MISDataPURPOSEOFCREDIT: TStringField;
    Localizer: TNLSLocalizer;
    MISExporter: TCMExcelExport;
    ValuteDataSet: TOracleDataSet;
    srcValute: TDataSource;
    srcUsrGrp: TDataSource;
    UsrGrpDataSet: TOracleDataSet;
    PersonelTypeDataSet: TOracleDataSet;
    srcPersonelType: TDataSource;
    srcBranch: TDataSource;
    BranchDataSet: TOracleDataSet;
    Panel3: TGroupBox;
    ButtonExport: TBitBtn;
    CloseBtn: TBitBtn;
    SBListBox: TKeyListBox;
    Panel4: TPanel;
    spUP: TSpeedButton;
    spDown: TSpeedButton;
    MISDataID: TFloatField;
    MISDataNUMBEROFCREDIT: TStringField;
    MISDataPLEDGENAME: TStringField;
    MISDataHOLDERNAME: TStringField;
    MISDataREGISTRYNO: TStringField;
    MISDataBOOROWERID: TStringField;
    MISDataADDRESS: TStringField;
    MISDataANYINFOTODISTING: TStringField;
    MISDataREGISTRYAGENCY: TStringField;
    MISDataREGISTRYDATE: TDateTimeField;
    MISDataINSURANCEAMOUNT: TFloatField;
    MISDataINSURANCEAGENCY: TStringField;
    MISDataINSURANCEDATE: TDateTimeField;
    MISDataPHONENUMBER: TStringField;
    MISDataGIVENAMOUNT: TFloatField;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    GroupBox6: TGroupBox;
    CheckBox5: TCheckBox;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    GroupBox7: TGroupBox;
    CheckBox7: TCheckBox;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    CheckBox2: TCheckBox;
    GroupBox10: TGroupBox;
    CheckBox10: TCheckBox;
    DBLookupComboboxEh10: TDBLookupComboboxEh;
    GroupBox8: TGroupBox;
    CheckBox9: TCheckBox;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    Panel11: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel12: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    ChBActCrd: TCheckBox;
    ChBClosCrd: TCheckBox;
    ChBCalcInt: TCheckBox;
    ChBStopInt: TCheckBox;
    SReserves: TOracleDataSet;
    SReservesID: TFloatField;
    SReservesPERCENT: TFloatField;
    SReservesDESCRIPTION: TStringField;
    SReservesFULLDESC: TStringField;
    PReserves: TOracleDataSet;
    PReservesID: TFloatField;
    PReservesPERCENT: TFloatField;
    PReservesDESCRIPTION: TStringField;
    PReservesFULLDESC: TStringField;
    CreditTypes: TOracleDataSet;
    Persons: TOracleDataSet;
    DSSReserves: TDataSource;
    DSPReserves: TDataSource;
    DSCreditTypes: TDataSource;
    DSPersons: TDataSource;
    Pledges: TOracleDataSet;
    DSPledges: TDataSource;
    MISDataDUEPERCENT: TFloatField;
    MISDataINTERESTACCNO: TStringField;
    MISDataRESERVEACCNO: TStringField;
    MISDataDUECONTRACTACCNO: TStringField;
    MISDataDUERESERVEACCNO: TStringField;
    MISDataEKREST: TFloatField;
    MISDataEKGIVENAMOUNT: TFloatField;
    MISDataEKINT: TFloatField;
    MISDataEKDUEREST: TFloatField;
    MISDataEKDUEINT: TFloatField;
    GroupBox2: TGroupBox;
    CheckBoxPayDate: TCheckBox;
    DTPB: TDateTimePicker;
    DTPE: TDateTimePicker;
    GroupBox4: TGroupBox;
    DTPProq: TDateTimePicker;
    EditProq: TEdit;
    Label8: TLabel;
    MISDataANNUALYPENALTYRATE: TFloatField;
    MISDataPENALTYREST: TFloatField;
    MISDataSTOPCALCDATE: TDateTimeField;
    MISDataEKPEN: TFloatField;
    MISDataDUEINTERESTACCNO: TStringField;
    MISDataLASTINTPAYDATE: TDateTimeField;
    MISDataLASTMAINPAYDATE: TDateTimeField;
    MISDataPRINCIPAL: TFloatField;
    MISDataINTEREST: TFloatField;
    MISDataPSNAME: TStringField;
    MISDataDESCRIPTION_1: TStringField;
    MISDataINTCALCMETHOD: TFloatField;
    procedure ButtonExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckAllValuteClick(Sender: TObject);
    procedure UnCheckAllValuteClick(Sender: TObject);
    procedure challBranchClick(Sender: TObject);
    procedure unchallBranchClick(Sender: TObject);
    procedure challUsrGrpClick(Sender: TObject);
    procedure unchallUsrGrpClick(Sender: TObject);
    procedure challPersonalTypeClick(Sender: TObject);
    procedure unchallPersonalTypeClick(Sender: TObject);
    procedure spUPClick(Sender: TObject);
    procedure spDownClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SReservesCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
  private
    function BuildFilterString : String;
  public
  
  end;

var
  MISForm: TMISForm;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl,CommonDecls, SystemState;


function TMISForm.BuildFilterString : String;

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
        S :=S + 'and ' + Temp;
    end;
    
  end;
begin
  Result := '';
  ConcatFilter(Result,'H.RESERVEID',CheckBox5.Checked,DBLookupComboboxEh5.KeyValue);
  ConcatFilter(Result,'H.DUERESERVEID',CheckBox2.Checked,DBLookupComboboxEh2.KeyValue);
  ConcatFilter(Result,'P.PERSONALTYPE',CheckBox7.Checked,DBLookupComboboxEh7.KeyValue);
  ConcatFilter(Result,'G.pledgeid',CheckBox10.Checked,DBLookupComboboxEh10.KeyValue);
  ConcatFilter(Result,'P.credittype',CheckBox9.Checked,DBLookupComboboxEh9.KeyValue);
end;



function ErrorInCheck(Look: TEvanescence; ErrorMsg: String=''):Boolean;
begin
  Result := True;
  if Look.GetCheckedKeyList.Count = 0 then Result := False;
  if (ErrorMsg <> '') and (not Result)then ShowMessage(ErrorMsg);
end;

procedure TMISForm.ButtonExportClick(Sender: TObject);
var
  sd,MISSQL: String;
  DATETABLE: String;
  ADDITIONALPARAMS: String;
  MAINSQL: String;
  chpayStr,SORTBY: String;
  FilterStr,CheckStr,CheckStr1:String;
  ProgMain :real;

  //SortByList: TStringList;
begin

  FilterStr:='';
  CheckStr := '';
  chpayStr := '';
  FilterStr := BuildFilterString;
  ProgMain := StrToFloat(EditProq.Text);

  if ChBActCrd.checked and  not ChBClosCrd.checked
  then CheckStr:=' (p.partitionkey=0) ';

  if ChBClosCrd.checked and  not ChBActCrd.checked
  then CheckStr:=' (p.partitionkey=1) ';

  if ChBClosCrd.checked and  ChBActCrd.checked
  then CheckStr:=' ((p.partitionkey=0) or (p.partitionkey=1))';

  if ChBCalcInt.checked and not ChBStopInt.checked
  then CheckStr1:=' (h.stopcalcdate is null)  ';

  if ChBStopInt.checked and not ChBCalcInt.checked
  then CheckStr1:=' (h.stopcalcdate is not null ) ';

  if ChBStopInt.checked and ChBCalcInt.checked
  then CheckStr1:=' ((h.stopcalcdate is not null)  or (h.stopcalcdate is  null))  ';

  if (checkStr1<>'') and (checkStr='') then
  checkStr:= checkStr1;

  if (checkStr1<>'')and( checkStr<>'')   then
  checkStr:=checkStr+' and '+ checkStr1;


  if (CheckStr<>'') and (FilterStr<>'') then
  FilterStr := FilterStr+' AND '+CheckStr;

  if (CheckStr<>'') and (FilterStr='') then
  FilterStr := CheckStr;

  if CheckBoxPayDate.Checked then
  chpayStr := ' and p.duedatefirstcontract between '''+ FormatDateTime('dd-MMM-yyyy',DTPB.Date)+''' and '''+ FormatDateTime('dd-MMM-yyyy',DTPE.Date)+'''' ;

  FilterStr := FilterStr+ chpayStr;
  if FilterStr<>'' then ADDITIONALPARAMS:=' AND '+FilterStr
  else ADDITIONALPARAMS:='';

  sd:=' and o.dat= '''+ FormatDateTime('dd-MMM-yyyy',tarix.Date)+'''';


  ADDITIONALPARAMS := ADDITIONALPARAMS+sd   +#13#10;

  SORTBY := SBListBox.GetCheckedKeyList.CommaText;

  if not ErrorInCheck(LookValute,rsErrorValute) then Exit;
  if not ErrorInCheck(LookUsrGrp,rsErrorUsrGrp) then Exit;
  if not ErrorInCheck(LookPersonelType,rsErrorPersonaltype) then Exit;
  if not ErrorInCheck(LookBranch,rsErrorBranch) then Exit;

  if (LookValute.GetCheckedKeyList.Count<>LookValute.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.CURRENCY in('
                   +LookValute.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookUsrGrp.GetCheckedKeyList.Count<>LookUsrGrp.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.USRGROUP in('
                   +LookUsrGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookPersonelType.GetCheckedKeyList.Count<>LookPersonelType.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.CUSTOMERTYPE in('
                   +LookPersonelType.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookBranch.GetCheckedKeyList.Count<>LookBranch.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.BRANCHID in('
                   +LookBranch.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  with   MISData do begin
  CloseAll;
 // SQL.Text:=SQL.Text+ ADDITIONALPARAMS;
  SQL[172] := ADDITIONALPARAMS;
 // SetVariable('PROG',progmain);
  SetVariable('hdat',integer(trunc(Tarix.DateTime)));
  SetVariable('pdat',integer(trunc(DTPProq.DateTime)));
  //SetVariable('PprogDat',integer(trunc(DTPProq.DateTime)));
  LogInformation(rsInfScriptStarted);
  //Memo1.Text :=MISData.SQL.Text;
  MISData.Open;
  end;
  LogInformation(Format(rsInfRowsExported,[MISData.recordCount]));
  with MISExporter do
  begin
    Connect;
    ExportDataset(MISData,'MIS',True);
    Disconnect;
  end;  
  MISData.CloseAll;
  LogInformation(rsInfExportFinished);
end;

procedure TMISForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
  Tarix.Date := Get_CurrentDate;
  DTPB.Date := Get_CurrentDate;
  DTPE.Date := Get_CurrentDate;
  DTPProq.Date := Get_CurrentDate;
  for i:=0 to 2 do
    SBListBox.Checked[i] := True
end;

procedure TMISForm.CheckAllValuteClick(Sender: TObject);
begin
  LookValute.CheckAll;
end;

procedure TMISForm.UnCheckAllValuteClick(Sender: TObject);
begin
  LookValute.UncheckAll;
end;

procedure TMISForm.challBranchClick(Sender: TObject);
begin
  LookBranch.CheckAll
end;

procedure TMISForm.unchallBranchClick(Sender: TObject);
begin
  LookBranch.UncheckAll
end;

procedure TMISForm.challUsrGrpClick(Sender: TObject);
begin
  LookUsrGrp.CheckAll
end;

procedure TMISForm.unchallUsrGrpClick(Sender: TObject);
begin
  LookUsrGrp.UncheckAll
end;

procedure TMISForm.challPersonalTypeClick(Sender: TObject);
begin
  LookPersonelType.CheckAll
end;

procedure TMISForm.unchallPersonalTypeClick(Sender: TObject);
begin
  LookPersonelType.UncheckAll
end;

procedure TMISForm.spUPClick(Sender: TObject);
var
  IDX : Integer;
begin
  IDX := SBListBox.ItemIndex;
  with SbListBox,Items do
  if  IDX > 0  then
  begin
    Move(IDX,IDX - 1);
    Keys.Move(IDX,IDX - 1);
    //FFieldList.Exchange(IDX,IDX - 1);
    if IDX >= 1 then
    ItemIndex := IDX - 1;
  end;
end;

procedure TMISForm.spDownClick(Sender: TObject);
var
  IDX : Integer;
begin
  IDX := SBListBox.ItemIndex;
  with SbListBox,Items do
  if  (IDX <> - 1) and (IDX < Items.Count - 1) then
  begin
    Move(IDX,IDX + 1);
    Keys.Move(IDX,IDX + 1);
    //FFieldList.Exchange(IDX,IDX - 1);
    if IDX <= Items.Count - 1 then
    ItemIndex := IDX + 1;
  end;
end;

procedure TMISForm.FormCreate(Sender: TObject);
begin
    SReserves.Open;
    Pledges.Open;
    PReserves.Open;
    CreditTypes.Open;
    Persons.Open;
end;

procedure TMISForm.SReservesCalcFields(DataSet: TDataSet);
begin
   with DataSet do
   FieldByName('FULLDESC').AsString :=
        FieldByName('PERCENT').AsString + '% - ' + FieldByName('DESCRIPTION').AsString;

end;


procedure TMISForm.FormDestroy(Sender: TObject);
begin
     SReserves.CloseAll;
    Pledges.CloseAll;
    PReserves.CloseAll;
    CreditTypes.CloseAll;
    Persons.CloseAll;

end;

end.
