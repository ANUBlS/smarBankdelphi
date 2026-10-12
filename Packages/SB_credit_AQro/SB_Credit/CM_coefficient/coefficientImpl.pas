unit coefficientImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, CheckLst, Evanescence, ComCtrls, Buttons, ExtCtrls,
  NLSLocalizer, Db, CMExcelExport, OracleData, Oracle, Gauges;

   resourcestring
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
type
  TFrmCoefficient = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox6: TGroupBox;
    CBaValute: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    GroupBox1: TGroupBox;
    LookUsrGrp: TEvanescence;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    CBPersons: TCheckBox;
    LCBPersons: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    LookPersonelType: TEvanescence;
    CheckBox1: TCheckBox;
    PersonTypes: TOracleDataSet;
    DataSrcPersonTypes: TDataSource;
    ExcelExport: TCMExcelExport;
    srcPersonelType: TDataSource;
    PersonelTypeDataSet: TOracleDataSet;
    FilialDataSet: TOracleDataSet;
    srcFilial: TDataSource;
    Main: TOracleDataSet;
    sysdate: TOracleDataSet;
    sysdateTEK_DAT: TDateTimeField;
    NLSLocalizer1: TNLSLocalizer;
    FilialDataSetID: TFloatField;
    FilialDataSetNAME: TStringField;
    active: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    Gauge1: TGauge;
    MainFILIAL: TStringField;
    MainSUMAKREDITIN_MEBSOSTAT: TFloatField;
    MainSUMAHES_TAR_ODESASSOSTAT: TFloatField;
    MainSUMAODENILMISH_ESASSOSTAT: TFloatField;
    MainSUMAARTIQ_ODEMESOSTAT: TFloatField;
    MainSUMAGEC_ESASSOSTAT: TFloatField;
    MainSUMAGEC_ESAS_QALIQSOSTAT: TFloatField;
    MainSUMAGEC_XUSUSI_P_CEKISOSTA: TFloatField;
    MainSUMAGEC_XUSUSI_Q_CEKISOSTA: TFloatField;
    MainSUMAODENISH_NISBETISOSTAT: TFloatField;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    function BuildFilterString : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCoefficient: TFrmCoefficient;
   procedure InitPlugin(s:string);export;
implementation
uses CommonDecls,systemstate,CMOracleApiDataModuleImpl;
{$R *.DFM}
procedure InitPlugin(s:string);export;
begin
   FrmCoefficient.ShowModal;
end;
exports
     InitPlugin;
procedure TFrmCoefficient.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=true then
LookUsrGrp.CheckAll
else
LookUsrGrp.UncheckAll
end;

procedure TFrmCoefficient.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
LookPersonelType.CheckAll
else
LookPersonelType.UncheckAll
end;

procedure TFrmCoefficient.FormCreate(Sender: TObject);
var i:integer;
begin
PersonTypes.open;
FilialDataSet.open;
PersonelTypeDataSet .open;
sysdate .open;
DateTimePicker1.DateTime:=sysdate.fieldbyname('tek_dat').asdatetime;
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
end;

procedure TFrmCoefficient.FormDestroy(Sender: TObject);
begin
PersonTypes.close;
FilialDataSet.close;
PersonelTypeDataSet.close;
sysdate.close;
end;

function TFrmCoefficient.BuildFilterString : String;

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

  end;  // Concat Filter

begin

  Result := '';
ConcatFilter(Result,'p.PERSONALTYPE',CBPersons.Checked,LCBPersons.KeyValue);

end;
function ErrorInCheck(Look: TEvanescence; ErrorMsg: String=''):Boolean;
begin
  Result := True;
  if Look.GetCheckedKeyList.Count = 0 then Result := False;
  if (ErrorMsg <> '') and (not Result)then ShowMessage(ErrorMsg);
end;
procedure TFrmCoefficient.SpeedButton1Click(Sender: TObject);
var
i:integer;
dat : Tdatetime;
  RestsStr,chpayStr: String;
  ADDITIONALPARAMS,FilterStr,CheckStr:String;
begin
dat:=integer(trunc(DateTimePicker1.DateTime));
  FilterStr:='';
  CheckStr := '';
  chpayStr := '';

  if (CheckStr<>'') and (FilterStr<>'') then
  FilterStr := FilterStr+' AND '+CheckStr;

  if (CheckStr<>'') and (FilterStr='') then
  FilterStr := CheckStr;


  FilterStr := FilterStr+ chpayStr;
  if FilterStr<>'' then ADDITIONALPARAMS:=' AND '+FilterStr
  else ADDITIONALPARAMS:='';

  if not ErrorInCheck(LookUsrGrp,rsErrorUsrGrp) then Exit;
  if not ErrorInCheck(LookPersonelType,rsErrorPersonaltype) then Exit;

 
  if (LookUsrGrp.GetCheckedKeyList.Count<>LookUsrGrp.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.USRGROUP in('
                   +LookUsrGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookPersonelType.GetCheckedKeyList.Count<>LookPersonelType.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.CUSTOMERTYPE in('
                   +LookPersonelType.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if RestsStr <> ''  then ADDITIONALPARAMS := ADDITIONALPARAMS+' and '+RestsStr ;

active.open;
with active  do
   while not EOF do
    begin
        OraclePackage1.CallProcedure('procedure_name',[
                                                  'p_id',FieldByName('ID').AsInteger,
                                                  'p_date',dat

                                                 ]);

   Gauge1.Progress:=trunc(i*100/RecordCount);
    i:=i+1;
     Next;
   end ;
  with main do
   begin
         if Active then CloseAll;//ShowMessage( datetostr(dat));
        { SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin //ShowMessage( BuildFilterString);
           FilterStr := ' and '+BuildFilterString;
           SQL[49] := FilterStr;
         end
         else
         SQL[49] :='';
                          }

         // Memo1.Text := SQL.Text;
         open;

  with ExcelExport do
   begin
     Connect;
      ExportDataset(Main,'Purdensal',True,false);

     Disconnect;
   end;

end;


 end;

procedure TFrmCoefficient.SpeedButton2Click(Sender: TObject);
begin
close;
end;

initialization
   FrmCoefficient := TFrmCoefficient.Create(CommonApplication);
end.
