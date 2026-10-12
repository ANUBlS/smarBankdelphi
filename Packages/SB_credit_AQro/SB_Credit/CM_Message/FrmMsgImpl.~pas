unit FrmMsgImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, NLSLocalizer, DBCtrls, StdCtrls, CheckLst, Evanescence,
  ComCtrls, Buttons, ExtCtrls, CMExcelExport;
 resourcestring
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
  rsInfScriptStarted  = 'ўесабат алыныр ';
  rsPleaseWait=         '«€щм€т олмаса бир аз эюзл€йин!  ';
  rsInfRowsExported   = '%d с€тир ихраж олунду';
  rsInfExportFinished = '»храж гуртарды';


type
  TFrmMsg = class(TForm)
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
    srcUsrGrp: TDataSource;
    NLSLocalizer1: TNLSLocalizer;
    UsrGrpDataSet: TOracleDataSet;
    PersonelTypeDataSet: TOracleDataSet;
    PersonTypes: TOracleDataSet;
    DataSrcPersonTypes: TDataSource;
    srcPersonelType: TDataSource;
    OracleDataSet1: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField2: TDateTimeField;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2DESCRIPTION: TStringField;
    OracleDataSet2NAME: TStringField;
    OracleDataSet2CREDITLINEAMOUNT: TFloatField;
    OracleDataSet2PERIOD: TFloatField;
    OracleDataSet2NUMBEROFCREDIT: TStringField;
    OracleDataSet2DATEOFCONCLUSION: TDateTimeField;
    OracleDataSet2IN_DESCRIPTION: TStringField;
    OracleDataSet2INSURANCENO: TStringField;
    OracleDataSet2INSURANCEDATE: TDateTimeField;
    ExcelExport: TCMExcelExport;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet1TEK_DAT: TDateTimeField;
    OracleDataSet4: TOracleDataSet;
    OracleDataSet5: TOracleDataSet;
    OracleDataSet6: TOracleDataSet;
    OracleDataSet7: TOracleDataSet;
    OracleDataSet1DD: TFloatField;
    OracleDataSet1DSDesigner: TFloatField;
    OracleDataSet2DSDesigner: TStringField;
    OracleDataSet2DSDesigner2: TDateTimeField;
    OracleDataSet2DSDesigner3: TFloatField;
    OracleDataSet2DSDesigner4: TDateTimeField;
    OracleDataSet2DSDesigner5: TStringField;
    OracleDataSet1DSDesigner2: TStringField;
    OracleDataSet1DSDesigner3: TStringField;
    OracleDataSet1DSDesigner4: TDateTimeField;
    OracleDataSet1DSDesigner5: TFloatField;
    OracleDataSet1DSDesigner6: TDateTimeField;
    OracleDataSet1DSDesigner7: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function BuildFilterString : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMsg: TFrmMsg;

implementation
 uses CommonDecls,systemstate,CMOracleApiDataModuleImpl,Mesage ;
{$R *.DFM}

procedure TFrmMsg.FormCreate(Sender: TObject);
begin
OracleDataSet3.open;
PersonTypes.open;
UsrGrpDataSet.open;
PersonelTypeDataSet.open;
end;

procedure TFrmMsg.FormShow(Sender: TObject);
var i:integer;
begin

 DateTimePicker1.DateTime:=OracleDataSet3.fieldbyname('tek_dat').asdatetime;

  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
end;
function TFrmMsg.BuildFilterString : String;

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

procedure TFrmMsg.SpeedButton1Click(Sender: TObject);
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
  with OracleDataSet1 do
   begin
         if Active then CloseAll;
         SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[25] := FilterStr;
         end
         else
         SQL[25] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[26] := ADDITIONALPARAMS
            else
            SQL[26] :='';

       //  Memo1.Text := SQL.Text;
         open;

    end;

     with OracleDataSet2 do
   begin
         if Active then CloseAll;
        // SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[36] := FilterStr;
         end
         else
         SQL[36] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[37] := ADDITIONALPARAMS
            else
            SQL[37] :='';

         // Memo1.Text := SQL.Text;
         open;
         end;
   with OracleDataSet4 do
   begin
         if Active then CloseAll;
        // SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[27] := FilterStr;
         end
         else
         SQL[27] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[28] := ADDITIONALPARAMS
            else
            SQL[28] :='';

         // Memo1.Text := SQL.Text;
         open;

    end;
    with OracleDataSet5 do
   begin
         if Active then CloseAll;
        // SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[31] := FilterStr;
         end
          else
           SQL[31] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[32] := ADDITIONALPARAMS
            else
            SQL[32] :='';

        //  Memo1.Text := SQL.Text;
         open;

    end;
   //  ShowMessage(ADDITIONALPARAMS);
     with OracleDataSet6 do
   begin
         if Active then CloseAll;
         SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[33] := FilterStr;
         end
         else
         SQL[33] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[34] := ADDITIONALPARAMS
            else
            SQL[34] :='';

        //  Memo1.Text := SQL.Text;
         open;
         end;
   with OracleDataSet7 do
   begin
         if Active then CloseAll;
        // SetVariable('dat',dat);
         if BuildFilterString <> '' then
          begin
           FilterStr := ' and '+BuildFilterString;
           SQL[33] := FilterStr;
         end
         else
         SQL[33] :='';
           if ADDITIONALPARAMS <> '' then
            SQL[34] := ADDITIONALPARAMS
            else
            SQL[34] :='';

         // Memo1.Text := SQL.Text;
         open;

    end;
    LogInformation(rsPleaseWait);
     with ExcelExport do
   begin
     Connect;
           ExportDataset(OracleDataSet7,'ferdi qeza vaxti bitmish',true,false);
           ExportDataset(OracleDataSet6,'ferdi qeza iki aydan az qalmish',true,false);
           ExportDataset(OracleDataSet5,'ferdi qeza',true,false);
           ExportDataset(OracleDataSet1,'iki aydan az qalmish',true,false);
           ExportDataset(OracleDataSet2,'sistem tarixinden kicik',true,false);
           ExportDataset(OracleDataSet4,'Predment',true,false);
     Disconnect;
   end;
      LogInformation(rsInfExportFinished);
end;

procedure TFrmMsg.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
LookPersonelType.CheckAll
else
LookPersonelType.UncheckAll
end;

procedure TFrmMsg.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked=true then
LookUsrGrp.CheckAll
else
LookUsrGrp.UncheckAll
end;

procedure TFrmMsg.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TFrmMsg.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TFrmMsg.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (ord(key))=VK_ESCAPE then
close
end;

end.
