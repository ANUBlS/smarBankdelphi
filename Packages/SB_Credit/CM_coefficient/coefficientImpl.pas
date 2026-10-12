unit coefficientImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, CheckLst, Evanescence, ComCtrls, Buttons, ExtCtrls,
  Db, CMExcelExport, OracleData, Oracle, ComObj, Gauges;

   resourcestring
  rsErrorUsrGrp       = 'Ən azı bir istifadəçi qrupu seçilməlidir!';
  rsErrorPersonaltype = 'Ən azı bir müştəri tipi seçilməlidir!';
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
    sysdate: TOracleDataSet;
    sysdateTEK_DAT: TDateTimeField;
    FilialDataSetID: TFloatField;
    FilialDataSetNAME: TwidestringField;
    active: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    SpeedButton3: TSpeedButton;
    activeNAME: TwidestringField;
    activePORTFEL: TFloatField;
    activeODENILMELIFAIZ: TFloatField;
    activeODENILMISH: TFloatField;
    activeGEC: TFloatField;
    activeGF: TFloatField;
    activeF: TFloatField;
    main: TOracleDataSet;
    activeGECFAIZMEB: TFloatField;
    OracleDataSet1: TOracleDataSet;
    WideStringField1: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    OracleDataSet2: TOracleDataSet;
    WideStringField2: TWideStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    credit: TOracleDataSet;
    Gauge1: TGauge;
    mainNAME: TWideStringField;
    mainPORTFEL: TFloatField;
    mainODENILMELI: TFloatField;
    mainODENILMISH: TFloatField;
    mainARTIQ: TFloatField;
    mainGECES: TFloatField;
    mainGEC: TFloatField;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    function BuildFilterString : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCoefficient: TFrmCoefficient;
  Exl,Sheet: Variant;

procedure InitPlugin(s:string);export;
implementation
uses sbsystem,sboapiDataModuleImpl,SBTranslateProc,CommonDecls;
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
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmCoefficient.FormDestroy(Sender: TObject);
begin
PersonTypes.close;
FilialDataSet.close;
PersonelTypeDataSet.close;
sysdate.close;
active.close;
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


 procedure CreateSheet;
begin
  try
   Exl:=CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;

  procedure DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except

  end;
end;


   procedure ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
   end;
  end;




procedure TFrmCoefficient.SpeedButton1Click(Sender: TObject);
const
number_format_r='#,##0.00%';
var
ss,i:integer;
dat : Tdatetime;
aa:real;
s,l,cell, r,h, j , k ,m ,w :Integer;
bash: string;
  RestsStr,chpayStr: String;
  ADDITIONALPARAMS,FilterStr,CheckStr:String;
  resourcestring
  rsCreditNumber = '%d - № li kredit : ';
begin
    if active.Active then
       active.close;
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
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.branchid in('
                   +LookUsrGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookPersonelType.GetCheckedKeyList.Count<>LookPersonelType.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.CUSTOMERTYPE in('
                   +LookPersonelType.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if RestsStr <> ''  then ADDITIONALPARAMS := ADDITIONALPARAMS+' and '+RestsStr ;
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
  Gauge1.Visible:=true;
  ss:=1;
  LogInformation('İxrac Başladı');
with credit  do
  while not EOF do
    begin
       try
       begin
        Gauge1.Progress:=trunc(ss*100/credit.RecordCount);
        ss:=ss+1;
        OraclePackage1.CallProcedure('insinfof1',[
                                                  'p_id',FieldByName('ID').AsInteger,
                                                  'p_bdate',dat ,
                                                  'p_edate',dat
                                                 ]);

       end;
      except
    on E:Exception do
    LogError(Format(rsCreditNumber,[FieldByName('ID').AsInteger]) + E.Message);
   end;
     Next;
      CommonApplication.ProcessMessages;
    end ;

    active.open;
    CreateSheet;

 try
   Gauge1.Visible:=false;
     Sheet.Range['A1:A60000'].ColumnWidth:=8;
     Sheet.Range['B1:B60000'].ColumnWidth:=18;
     Sheet.Range['C1:C60000'].ColumnWidth:=25;
     Sheet.Range['D1:D60000'].ColumnWidth:=25;
     Sheet.Range['E1:E60000'].ColumnWidth:=25;
     Sheet.Range['F1:F60000'].ColumnWidth:=25;
     Sheet.Range['G1:G60000'].ColumnWidth:=35;

     Sheet.Range['H1:H60000'].ColumnWidth:=35;
     Sheet.Range['H1:H60000'].NumberFormat:=number_format_r;
     Sheet.Range['I1:I60000'].ColumnWidth:=25;
     Sheet.Range['I1:I60000'].NumberFormat:=number_format_r;
     
   Sheet.Cells[2,5]:='TuranBank ASC-də % borcu üzrə ödəniş əmsalı';
   Sheet.Cells[2,5].Font.Name:='Azl Sans Serif';
   Sheet.Cells[2,5].Font.Bold :=true;
   Sheet.Cells[2,5].Font.size :=22;
/////////////////////////////////////////////////////////////////////////////
       k:=5; i:=0;

          sheet.Cells[i+k+1,1]:='Sıra №';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlack;


          sheet.Cells[i+k+1,2]:='Filial';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlack;


          sheet.Cells[i+k+1,3]:='Kredit portfel';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlack;


          sheet.Cells[i+k+1,4]:='Hesabat tarixinə ödənilməli faiz borcu';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,4].WrapText := true;

          sheet.Cells[i+k+1,5]:='Hesabat tarixinə ödənilmiş faiz borcu';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,5].WrapText := true;

          sheet.Cells[i+k+1,6]:='Gecikdirilmiş faiz borcu';
          Sheet.Cells[i+k+1,6].Font.Bold :=true;
          Sheet.Cells[i+k+1,6].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,6].WrapText := true;

          sheet.Cells[i+k+1,7]:='Gecikdirilmiş faiz borcu üzrə qlıq məbləğ';
          Sheet.Cells[i+k+1,7].Font.Bold :=true;
          Sheet.Cells[i+k+1,7].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,7].WrapText := true;

          sheet.Cells[i+k+1,8]:='Gecikdirilmiş faiz borcu üzrə qlıq məbləğin kreditin portfelinde xüsusi çəkisi sütun7/sütun3';
          Sheet.Cells[i+k+1,8].Font.Bold :=true;
          Sheet.Cells[i+k+1,8].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,8].WrapText := true;


          sheet.Cells[i+k+1,9]:='Ödənilmiş faiz(% nisbətilə sütun5.sütun4)';
          Sheet.Cells[i+k+1,9].Font.Bold :=true;
          Sheet.Cells[i+k+1,9].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,9].WrapText := true;

            ShowSheet;
          j:=0;
         for i:=1 to active.RecordCount do begin
        j:=j+1;
        Sheet.Cells[i+k+1,1]:=j;

        Sheet.Cells[i+k+1,2]:=active.FieldByName('Name').AsString;

        Sheet.Cells[i+k+1,3]:=active.FieldByName('PORTFEL').Asfloat;


        Sheet.Cells[i+k+1,4]:=active.FieldByName('ODENILMELIFAIZ').Asfloat;

        Sheet.Cells[i+k+1,5]:=active.FieldByName('ODENILMISH').Asfloat;

        Sheet.Cells[i+k+1,6]:=active.FieldByName('GECFAIZMEB').Asfloat;

         Sheet.Cells[i+k+1,7]:=active.FieldByName('GEC').Asfloat;

          Sheet.Cells[i+k+1,8]:=active.FieldByName('GF').Asfloat ;

         Sheet.Cells[i+k+1,9]:=active.FieldByName('F').Asfloat;

     //   Exl.Range['A'+Inttostr(i+k+1)+':I'+Inttostr(i+k+1)].Select;
     //   Exl.Selection.Interior.ColorIndex := 8;

     active.Next;

     end;

          w:=active.RecordCount ;
          Sheet.Cells[w+k+2,1]:='Yekun cem';
          Sheet.Cells[w+k+2,1].Font.Name:='Azl Sans Serif';
          Sheet.Cells[w+k+2,1].Font.Bold :=true;
          Sheet.Cells[w+k+2,1].Font.Color:=clred;

          Sheet.Cells[w+k+2,3].Font.Color:=clred;
          Sheet.Cells[w+k+2,3]:='=SUM(C7:C'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,3].Font.Color:=clred;


          Sheet.Cells[w+k+2,4].Font.Color:=clred;
          Sheet.Cells[w+k+2,4]:='=SUM(D7:D'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,4].Font.Color:=clred;

          Sheet.Cells[w+k+2,5].Font.Color:=clred;
          Sheet.Cells[w+k+2,5]:='=SUM(E7:E'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,5].Font.Color:=clred;

          Sheet.Cells[w+k+2,6].Font.Color:=clred;
          Sheet.Cells[w+k+2,6]:='=SUM(F7:F'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,6].Font.Color:=clred;

          Sheet.Cells[w+k+2,7].Font.Color:=clred;
          Sheet.Cells[w+k+2,7]:='=SUM(G7:G'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,7].Font.Color:=clred;

          Sheet.Cells[w+k+2,8].Font.Color:=clred;
          Sheet.Cells[w+k+2,8]:='=G'+inttostr(w+7)+'/'+'C'+inttostr(w+7);
          Sheet.Cells[w+k+2,8].Font.Color:=clred;

          Sheet.Cells[w+k+2,9].Font.Color:=clred;
          Sheet.Cells[w+k+2,9]:='=E'+inttostr(w+7)+'/'+'D'+inttostr(w+7);
          Sheet.Cells[w+k+2,9].Font.Color:=clred;




             bash:=inttostr(k+1);


          // ShowMessage(inttostr(m)); exit;
      Exl.Range['A'+bash+':I'+inttostr(m+k+1)].select;
      Sheet.Range['A'+bash+':I'+inttostr(m+k+1)].Borders.Color:=clBlack;
       
        //exit;
    active.Session.Commit;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
  active.EnableControls;

       end;

 end;

procedure TFrmCoefficient.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TFrmCoefficient.SpeedButton3Click(Sender: TObject);
const
number_format_r='#,##0.00%';
var
ss,i:integer;
dat : Tdatetime;
aa:real;
s,l,cell, r,h, j , k ,m ,w :Integer;
bash: string;
  RestsStr,chpayStr: String;
  ADDITIONALPARAMS,FilterStr,CheckStr:String;
  resourcestring
  rsCreditNumber = '%d - № li kredit : ';
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
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.branchid in('
                   +LookUsrGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookPersonelType.GetCheckedKeyList.Count<>LookPersonelType.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND p.CUSTOMERTYPE in('
                   +LookPersonelType.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if RestsStr <> ''  then ADDITIONALPARAMS := ADDITIONALPARAMS+' and '+RestsStr ;

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
  if main.Active then
     main.close;

  Gauge1.Visible:=true;
  ss:=1;
  LogInformation('İxrac Başladı');
with credit  do
  while not EOF do
    begin
       try
       begin
        Gauge1.Progress:=trunc(ss*100/credit.RecordCount);
        ss:=ss+1;
        OraclePackage1.CallProcedure('insinfof1',[
                                                  'p_id',FieldByName('ID').AsInteger,
                                                  'p_bdate',dat ,
                                                  'p_edate',dat
                                                 ]);

       end;
      except
    on E:Exception do
    LogError(Format(rsCreditNumber,[FieldByName('ID').AsInteger]) + E.Message);
   end;
     Next;
      CommonApplication.ProcessMessages;
    end ;
   //  ShowMessage(inttostr(ss));
main.open;
    CreateSheet;

 try
    Gauge1.Visible:=false;
     Sheet.Range['A1:A60000'].ColumnWidth:=8;
     Sheet.Range['B1:B60000'].ColumnWidth:=18;
     Sheet.Range['C1:C60000'].ColumnWidth:=20;
   //  Sheet.Range['C7:C60000'].NumberFormat ;

     Sheet.Range['D1:D60000'].ColumnWidth:=20;
     Sheet.Range['E1:E60000'].ColumnWidth:=20;
     Sheet.Range['F1:F60000'].ColumnWidth:=20;
     Sheet.Range['G1:G60000'].ColumnWidth:=20;

     Sheet.Range['H1:H60000'].ColumnWidth:=20;
     Sheet.Range['I1:I60000'].ColumnWidth:=20;
     Sheet.Range['I1:I60000'].NumberFormat:= number_format_r ;

      Sheet.Range['J1:J60000'].ColumnWidth:=20;
      Sheet.Range['J1:J60000'].NumberFormat:= number_format_r ;
      Sheet.Range['K1:K60000'].ColumnWidth:=25;
      Sheet.Range['K1:K60000'].NumberFormat:= number_format_r ;

   Sheet.Cells[2,5]:='TuranBank ASC-də əsas borc üzrə ödəniş əmsalı';
   Sheet.Cells[2,5].Font.Bold :=true;
   Sheet.Cells[2,5].Font.Color:=clBlue;
   Sheet.Cells[2,5].Font.size :=22;
/////////////////////////////////////////////////////////////////////////////
          sheet.Cells[3,2]:='Hesabat tarixi';
          Sheet.Cells[3,2].Font.Bold :=true;
          Sheet.Cells[3,2].Font.Color:=clBlack;

          sheet.Cells[3,3]:=dat;

          sheet.Cells[4,2]:='Kreditin valyutası ';
          Sheet.Cells[4,2].Font.Bold :=true;
          Sheet.Cells[4,2].Font.Color:=clBlack;

          sheet.Cells[4,3]:= 'Manatla';

       k:=5; i:=0;
          sheet.Cells[i+k+1,1]:='Sıra №';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlack;


          sheet.Cells[i+k+1,2]:='Filial';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlack;


          sheet.Cells[i+k+1,3]:='Kredit portfeli';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlack;


          sheet.Cells[i+k+1,4]:='Hesabat tarixində ödənilməli əsas borc';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,4].WrapText := true;

          sheet.Cells[i+k+1,5]:='Hesabat tarixində ödənilmiş əsas borc';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,5].WrapText := true;

          sheet.Cells[i+k+1,6]:='Əsas borc üzrə artıq ödəmə';
          Sheet.Cells[i+k+1,6].Font.Bold :=true;
          Sheet.Cells[i+k+1,6].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,6].WrapText := true;

          sheet.Cells[i+k+1,7]:='Geikdirilmiş əsas borc';
          Sheet.Cells[i+k+1,7].Font.Bold :=true;
          Sheet.Cells[i+k+1,7].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,7].WrapText := true;

          sheet.Cells[i+k+1,8]:='Gecikdirilmiş əsas borc üzrə qalıq məbləği';
          Sheet.Cells[i+k+1,8].Font.Bold :=true;
          Sheet.Cells[i+k+1,8].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,8].WrapText := true;


          sheet.Cells[i+k+1,9]:='Gecikdirilmiş əsas borcun kredit portfelinə nisbəti % lə)';
          Sheet.Cells[i+k+1,9].Font.Bold :=true;
          Sheet.Cells[i+k+1,9].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,9].WrapText := true;

          sheet.Cells[i+k+1,10]:='Gecikdirilmiş əsas borc üzrə qalıq məbləğin kreditin portfelinə nisbəti % lə)';
          Sheet.Cells[i+k+1,10].Font.Bold :=true;
          Sheet.Cells[i+k+1,10].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,10].WrapText := true;

          
          sheet.Cells[i+k+1,11]:='Ödəniş faizi (% nisbəti ilə)';
          Sheet.Cells[i+k+1,11].Font.Bold :=true;
          Sheet.Cells[i+k+1,11].Font.Color:=clBlack;
          Sheet.Cells[i+k+1,11].WrapText := true;
            ShowSheet;
          j:=0;
         for i:=1 to main.RecordCount do begin
        j:=j+1;

        Sheet.Cells[i+k+1,1]:=j;

        Sheet.Cells[i+k+1,2]:=main.FieldByName('Name').AsString;


        Sheet.Cells[i+k+1,3]:=main.FieldByName('PORTFEL').Asfloat;

        //Sheet.Cells[i+k+1,4].Font.Bold :=true;
        Sheet.Cells[i+k+1,4]:=main.FieldByName('ODENILMELI').Asfloat;

      //  Sheet.Cells[i+k+1,5].Font.Bold :=true;
        Sheet.Cells[i+k+1,5]:=main.FieldByName('ODENILMISH').Asfloat;

       //   Sheet.Cells[i+k+1,6].Font.Bold :=true;
        Sheet.Cells[i+k+1,6]:=main.FieldByName('ARTIQ').Asfloat;


      //  Sheet.Cells[i+k+1,7].Font.Bold :=true;
        Sheet.Cells[i+k+1,7]:=  main.FieldByName('GECES').Asfloat;


      //  Sheet.Cells[i+k+1,9].Font.Bold :=true;
        Sheet.Cells[i+k+1,9]:='=G'+inttostr(j+6)+'/'+ 'C'+inttostr(j+6);

      ///   Sheet.Cells[i+k+1,8].Font.Bold :=true;
        Sheet.Cells[i+k+1,8]:=main.FieldByName('GEC').Asfloat;

       //  s:=trunc(main.FieldByName('GEC').Asfloat/main.FieldByName('PORTFEL').Asfloat*100);
        Sheet.Cells[i+k+1,10].Font.Bold :=true;
        Sheet.Cells[i+k+1,10]:='=H'+inttostr(j+6)+'/'+ 'C'+inttostr(j+6);

    //   Sheet.Cells[i+k+1,11].Font.Bold :=true;
       Sheet.Cells[i+k+1,11]:='=(E'+inttostr(j+6)+'-'+ 'F'+inttostr(j+6)+')/'+ 'D'+inttostr(j+6);

       //  =(E7-F7)/D7

     //   Exl.Range['B'+Inttostr(i+k+1)+':C'+Inttostr(i+k+1)].Select;
     //   Exl.Selection.Interior.ColorIndex := 8;
          Sheet.Cells[i+k+1,12]:=  main.FieldByName('GECES').Asfloat;
     main.Next;

     end;


          w:=main.RecordCount ;
          Sheet.Cells[w+k+2,1]:='Yekun cem';
          Sheet.Cells[w+k+2,1].Font.Bold :=true;

          Sheet.Cells[w+k+2,3]:='=SUM(C7:C'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,3].Font.Bold :=true;


          Sheet.Cells[w+k+2,4]:='=SUM(D7:D'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,4].Font.Bold :=true;

          Sheet.Cells[w+k+2,5]:='=SUM(E7:E'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,5].Font.Bold :=true;

          Sheet.Cells[w+k+2,6]:='=SUM(F7:F'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,6].Font.Bold :=true;

          Sheet.Cells[w+k+2,7]:='=SUM(G7:G'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,7].Font.Bold :=true;

          Sheet.Cells[w+k+2,8]:='=SUM(H7:H'+inttostr(w+6)+')';
          Sheet.Cells[w+k+2,8].Font.Bold :=true;

          Sheet.Cells[w+k+2,9]:='=G'+inttostr(w+7)+'/C'+inttostr(w+7);
          Sheet.Cells[w+k+2,9].Font.Bold :=true;

          Sheet.Cells[w+k+2,10]:='=H'+inttostr(w+7)+'/C'+inttostr(w+7);
          Sheet.Cells[w+k+2,10].Font.Bold :=true;

          Sheet.Cells[w+k+2,11]:='=(E'+inttostr(w+7)+'-F'+inttostr(w+7)+')/D'+inttostr(w+7);
          Sheet.Cells[w+k+2,11].Font.Bold :=true;


               bash:=inttostr(k+1);


          // ShowMessage(inttostr(m)); exit;
      Exl.Range['A'+bash+':K'+inttostr(w+k+1)].select;
      Sheet.Range['A'+bash+':K'+inttostr(w+k+1)].Borders.Color:=clBlack;
       
        //exit;
 main.Session.Commit;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
  active.EnableControls;

       end;

 end;



initialization
   FrmCoefficient := TFrmCoefficient.Create(Application);
end.
