unit FrmImImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMExcelExport, DBCtrls, StdCtrls, ExtCtrls, Db, OracleData, CheckLst,
  Evanescence, ComCtrls, Buttons, NLSLocalizer;

 resourcestring
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
  rsInfScriptStarted  = 'ўесабат алыныр ';
  rsPleaseWait=         '«€щм€т олмаса бир аз эюзл€йин!  ';
  rsInfRowsExported   = '%d с€тир ихраж олунду';
  rsInfExportFinished = '»храж гуртарды';


type
  TFrmIm = class(TForm)
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    CBaValute: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CBPersons: TCheckBox;
    LCBPersons: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    ExcelExport: TCMExcelExport;
    LookUsrGrp: TEvanescence;
    LookPersonelType: TEvanescence;
    UsrGrpDataSet: TOracleDataSet;
    srcUsrGrp: TDataSource;
    srcPersonelType: TDataSource;
    PersonelTypeDataSet: TOracleDataSet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    PersonTypes: TOracleDataSet;
    DataSrcPersonTypes: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Main: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1TEK_DAT: TDateTimeField;
    NLSLocalizer1: TNLSLocalizer;
    MainNUMBEROFCREDIT: TStringField;
    MainANNUALYINTERESTRATE: TFloatField;
    MainREST: TFloatField;
    MainINTERESTREST: TFloatField;
    MainDUEREST: TFloatField;
    MainDUEINTERESTREST: TFloatField;
    MainSSUDA: TStringField;
    MainFAIZHES: TStringField;
    MainGECSSUDA: TStringField;
    MainGECFAIZHES: TStringField;
    MainNAME: TStringField;
    MainDATEOFCONCLUSION: TDateTimeField;
    MainDUEDATEFIRSTCONTRACT: TDateTimeField;
    MainNEWFINANCEAMOUNT: TFloatField;
    MainCREDITLINEAMOUNT: TFloatField;
    MainIpotekapridmentinindri: TFloatField;
    MainDSDesigner: TStringField;
    MainDESCRIPTION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
  function BuildFilterString : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIm: TFrmIm;
 procedure InitPlugin(s:string);export;

implementation

{$R *.DFM}

uses CommonDecls,systemstate,CMOracleApiDataModuleImpl;

procedure InitPlugin(s:string);export;
begin
   FrmIm.ShowModal;
end;
exports
     InitPlugin;

procedure TFrmIm.FormCreate(Sender: TObject);
var i:integer;
begin
OracleDataSet1.open;
PersonTypes.open;
UsrGrpDataSet.open;
PersonelTypeDataSet.open;
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;

end;

procedure TFrmIm.FormShow(Sender: TObject);
var i:integer;
begin

 DateTimePicker1.DateTime:=OracleDataSet1.fieldbyname('tek_dat').asdatetime;


end;

procedure TFrmIm.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
LookPersonelType.CheckAll
else
LookPersonelType.UncheckAll
end;

procedure TFrmIm.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=true then
LookUsrGrp.CheckAll
else
LookUsrGrp.UncheckAll
end;
function TFrmIm.BuildFilterString : String;

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

procedure TFrmIm.SpeedButton1Click(Sender: TObject);
var
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
  LogInformation(rsInfScriptStarted);

//  ShowMessage(ADDITIONALPARAMS);
  with main do
   begin
         if Active then CloseAll;
         SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[14] := FilterStr;
         end
         else
         SQL[14] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[15] := ADDITIONALPARAMS
            else
            SQL[15] :='';

         // Memo1.Text := SQL.Text;
         open;
          LogInformation(rsPleaseWait);
    end;
     with ExcelExport do
   begin
     Connect;
      ExportDataset(Main,'IM Hesabati',True,false);

     Disconnect;
   end;
      LogInformation(rsInfExportFinished);
end;

procedure TFrmIm.FormDestroy(Sender: TObject);
begin
OracleDataSet1.close;
PersonTypes.close;
UsrGrpDataSet.close;
PersonelTypeDataSet.close;
end;

procedure TFrmIm.SpeedButton2Click(Sender: TObject);
begin
close
end;

procedure TFrmIm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=true
end;

initialization
   FrmIm := TFrmIm.Create(CommonApplication);
end.
