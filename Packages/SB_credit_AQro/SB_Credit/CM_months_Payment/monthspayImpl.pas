unit monthspayImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMExcelExport, Db, OracleData, NLSLocalizer, StdCtrls, CheckLst,
  Evanescence, ComCtrls, Buttons, ExtCtrls, Gauges, Oracle;

type
  TFrmMonthsPay = class(TForm)
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    GroupBox1: TGroupBox;
    LookFilGrp: TEvanescence;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    LookVAlGrp: TEvanescence;
    CheckBox1: TCheckBox;
    NLSLocalizer1: TNLSLocalizer;
    FilialDataSet: TOracleDataSet;
    FilialDataSetID: TFloatField;
    FilialDataSetNAME: TStringField;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    ExcelExport: TCMExcelExport;
    srcFilial: TDataSource;
    sysdate: TOracleDataSet;
    Main: TOracleDataSet;
    MainNAME: TStringField;
    MainCELBEDEN: TStringField;
    MainDATEOFCONCLUSION: TDateTimeField;
    MainDUEDATEFIRSTCONTRACT: TDateTimeField;
    MainSAHEBOLUSU: TStringField;
    MainODDAT: TDateTimeField;
    MainVAL_NAME: TStringField;
    Mainayliqodenish: TFloatField;
    MainVERILMISH: TFloatField;
    MainODENILMISH: TFloatField;
    MainREST: TFloatField;
    MainSTAFKA: TStringField;
    MainCARIHES: TStringField;
    MainCARIHQ: TFloatField;
    MainDUEREST: TFloatField;
    MainCARIAYD_OD: TFloatField;
    MainCEMI_OD: TFloatField;
    MainGECGUN: TFloatField;
    MainGECFAIZ: TFloatField;
    MainCARIHES_FAIZ: TFloatField;
    MainFULL_FAIZ: TFloatField;
    MainGET_GEC_FAIZGUN: TFloatField;
    MainROWNUM: TFloatField;
    Mainumumigecgun: TIntegerField;
    credit: TOracleDataSet;
    Gauge1: TGauge;
    OraclePackage1: TOraclePackage;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MainCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMonthsPay: TFrmMonthsPay;

procedure InitPlugin(s:string);export;
implementation
uses CommonDecls,systemstate,CMOracleApiDataModuleImpl,ComObj;
{$R *.DFM}
procedure InitPlugin(s:string);export;
begin
   FrmMonthsPay.ShowModal;
end;
exports
     InitPlugin;


procedure TFrmMonthsPay.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=true then
LookFilGrp.CheckAll
else
LookFilGrp.UncheckAll
end;

procedure TFrmMonthsPay.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
LookVAlGrp.CheckAll
else
LookVAlGrp.UncheckAll
end;

procedure TFrmMonthsPay.FormCreate(Sender: TObject);
var
i:integer;
begin
sysdate.open;
FilialDataSet.open;
OracleDataSet1.open;
DateTimePicker1.DateTime:=sysdate.fieldbyname('tek_dat').asdatetime;
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
end;
procedure TFrmMonthsPay.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TFrmMonthsPay.SpeedButton1Click(Sender: TObject);
var
 sysdat :Tdatetime;
  RestsStr,chpayStr: String;
 ADDITIONALPARAMS,FilterStr,CheckStr:String;
 i:integer;
begin
  sysdat:=integer(trunc(DateTimePicker1.DateTime));
  //ShowMessage(datetostr(sysdat-1));exit;
if (LookFilGrp.GetCheckedKeyList.Count<>LookFilGrp.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' where p.branchid in('
                   +LookFilGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookVAlGrp.GetCheckedKeyList.Count<>LookVAlGrp.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' and p.currency in('
                   +LookVAlGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;
//                   showmessage(ADDITIONALPARAMS) ;exit;
 with credit  do
   begin
         if Active then CloseAll;
          // SetVariable('dat',sysdat);
              if ADDITIONALPARAMS <> '' then
            SQL[3] := ADDITIONALPARAMS
            else
            SQL[3] :='';
         open;
  end;
//credit.first;
Gauge1.Visible:=true;
i:=1;
with credit  do
  while not EOF do
    begin
        OraclePackage1.CallProcedure('monthspayreport',[
                                                  'p_id',FieldByName('ID').AsInteger,
                                                  'p_bdate',sysdat

                                                 ]);
     Gauge1.Progress:=trunc(i*100/RecordCount);
    i:=i+1;
     Next;
    end ;
 with Main  do
   begin
         if Active then CloseAll;
         SetVariable('dat',sysdat);
         open;
  end;
    with ExcelExport do
   begin
     Connect;
      ExportDataset(Main,'Purdensal',True,false);

     Disconnect;
   end;
   Gauge1.Visible:=false;
end;

procedure TFrmMonthsPay.SpeedButton2Click(Sender: TObject);
begin
close
end;

procedure TFrmMonthsPay.MainCalcFields(DataSet: TDataSet);
begin
if   main.fieldbyname('GECGUN').asinteger> main.fieldbyname('GET_GEC_FAIZGUN').asinteger then
main.fieldbyname('umumigecgun').asinteger:= main.fieldbyname('GECGUN').asinteger
else
main.fieldbyname('umumigecgun').asinteger:=  main.fieldbyname('GET_GEC_FAIZGUN').asinteger;
end;

initialization
 FrmMonthsPay := TFrmMonthsPay.Create(CommonApplication);
end.
