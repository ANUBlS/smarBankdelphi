unit frmipexpimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,NLSDialogs,
  StdCtrls,NLSLocalizer, Db, OracleData, CMExcelExport, CheckLst, Evanescence, ExtCtrls,
  Buttons, ComCtrls;

  resourcestring
  rsErrorValute       = 'ян азы бир валйута сечилм€лидир!';
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
  rsErrorBranch       = 'ян азы бир филиал сечилм€лидир!';
  rsInfScriptStarted  = '»храж башлады';
  rsPleaseWait=         '«€щм€т олмаса бир аз эюзл€йин!  ';
  rsInfRowsExported   = '%d с€тир ихраж олунду';
  rsInfExportFinished = '»храж гуртарды';

type
  Tfrmipexp = class(TForm)
    ExcelExport: TCMExcelExport;
    unchallValute: TButton;
    Label2: TLabel;
    challValute: TButton;
    Label5: TLabel;
    LookValute: TEvanescence;
    LookBranch: TEvanescence;
    Label4: TLabel;
    unchallUsrGrp: TButton;
    challUsrGrp: TButton;
    Label3: TLabel;
    LookUsrGrp: TEvanescence;
    LookPersonelType: TEvanescence;
    challBranch: TButton;
    unchallBranch: TButton;
    challPersonalType: TButton;
    unchallPersonalType: TButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    CheckListBox3: TCheckListBox;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure challValuteClick(Sender: TObject);
    procedure unchallValuteClick(Sender: TObject);
    procedure challBranchClick(Sender: TObject);
    procedure unchallBranchClick(Sender: TObject);
    procedure challPersonalTypeClick(Sender: TObject);
    procedure unchallPersonalTypeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure unchallUsrGrpClick(Sender: TObject);
    procedure challUsrGrpClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckListBox3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckListBox3ClickCheck(Sender: TObject);
    procedure CheckListBox2ClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmipexp: Tfrmipexp; cm_id:integer;
  procedure InitPlugin(s:string);export;
  
implementation
uses dmipexpImpl,CommonDecls,systemstate;//,CMMainUnitImpl;

{$R *.DFM}
procedure InitPlugin(s:string);export;
begin
   frmipexp.ShowModal;
end;
exports
     InitPlugin;

procedure Tfrmipexp.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    Resize := false
end;

procedure Tfrmipexp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ORD(key) = VK_ESCAPE then close
end;

procedure Tfrmipexp.Button2Click(Sender: TObject);
begin
ShowMessage('jghfg')
end;

procedure Tfrmipexp.FormCreate(Sender: TObject);
var i:integer;
begin
dmipexp := Tdmipexp.create(Self);
 DateTimePicker1.DateTime:=dmipexp.OracleDataSet2.fieldbyname('tek_dat').asdatetime;
 DateTimePicker2.DateTime:=dmipexp.OracleDataSet2.fieldbyname('tek_dat').asdatetime;
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;

end;


procedure Tfrmipexp.CheckListBox1Click(Sender: TObject);
var index:Integer;
begin
index:=CheckListBox1.ItemIndex;

with dmipexp.DataSetKredit, CheckListBox1 do
if Checked[index] then Fields[index].Visible:=true else Fields[index].Visible:=false;
end;



procedure Tfrmipexp.FormShow(Sender: TObject);
begin
{  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
 }
end;

procedure Tfrmipexp.challValuteClick(Sender: TObject);
begin
 LookValute.CheckAll;
end;

procedure Tfrmipexp.unchallValuteClick(Sender: TObject);
begin
  LookValute.UncheckAll;
end;

procedure Tfrmipexp.challBranchClick(Sender: TObject);
begin
LookBranch.CheckAll
end;

procedure Tfrmipexp.unchallBranchClick(Sender: TObject);
begin
 LookBranch.UncheckAll
end;

procedure Tfrmipexp.challPersonalTypeClick(Sender: TObject);
begin
LookPersonelType.CheckAll
end;

procedure Tfrmipexp.unchallPersonalTypeClick(Sender: TObject);
begin
LookPersonelType.UncheckAll
end;
function ErrorInCheck(Look: TEvanescence; ErrorMsg: String=''):Boolean;
begin
  Result := True;
  if Look.GetCheckedKeyList.Count = 0 then Result := False;
  if (ErrorMsg <> '') and (not Result)then ShowMessage(ErrorMsg);
end;
procedure Tfrmipexp.BitBtn1Click(Sender: TObject);
var
  i:integer;
  basT,sonT,a:string;
  ADDITIONALPARAMS: String;
  RestsStr,chpayStr: String;
  FilterStr,CheckStr:String;
begin

  basT:=FormatDateTime('dd-mmm-yyyy', Trunc(DateTimePicker1.Date))  ;
  sonT:=FormatDateTime('dd-mmm-yyyy', Trunc(DateTimePicker2.Date))  ;
  a:= 'and OPEN_DAT BETWEEN   ';

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

  if RestsStr <> ''  then ADDITIONALPARAMS := ADDITIONALPARAMS+' and '+RestsStr ;
  LogInformation(rsInfScriptStarted);

  with  dmipexp,DSetUustinfo do begin
     Close;
      SQL[35] := (a+''''+basT+'''and'''+sonT+'''');
      SQL[36] := ADDITIONALPARAMS;
  //   Open;
  end;

   with  dmipexp.DSetCustipinfo do begin
     Close;
      SQL[50] := (a+''''+basT+'''and'''+sonT+'''');
      SQL[51] := ADDITIONALPARAMS;
    // Open;
  end;

   with  dmipexp,DataSetKredit do begin
    Close;
      SQL[11] := ADDITIONALPARAMS;
      SQl[12]:= (a+''''+basT+'''and'''+sonT+'''');
    Open;
  end;

   with  dmipexp,DataSetIP do begin
    Close;
      SQL[59] := ADDITIONALPARAMS;
      SQl[60]:= (a+''''+basT+'''and'''+sonT+'''');
    Open;
  end;
    GroupBox2.Align:=alClient;
    GroupBox2.Visible:=true;
    CheckListBox2.Items.Clear;
with dmipexp.DataSetKredit do
 begin
 // Open;
  for i:=0 to FieldCount-1 do
   begin
     CheckListBox2.Items.Add(Fields[i].DisplayLabel);
     CheckListBox2.Checked[i]:=True;
   end;
 end;
 CheckListBox3.Items.Clear;
with dmipexp.DataSetIP do
 begin
 // Open;
  for i:=0 to FieldCount-1 do
   begin
     CheckListBox3.Items.Add(Fields[i].DisplayLabel);
     CheckListBox3.Checked[i]:=True;
   end;
 end;


end;

procedure Tfrmipexp.unchallUsrGrpClick(Sender: TObject);
begin
LookUsrGrp.UncheckAll
end;

procedure Tfrmipexp.challUsrGrpClick(Sender: TObject);
begin
 LookUsrGrp.CheckAll
end;

procedure Tfrmipexp.BitBtn2Click(Sender: TObject);
begin
//close
end;

procedure Tfrmipexp.FormDestroy(Sender: TObject);
begin
dmipexp.Free
end;

procedure Tfrmipexp.CheckListBox3Click(Sender: TObject);
var index:Integer;
begin

end;

procedure Tfrmipexp.BitBtn3Click(Sender: TObject);
begin
  LogInformation(rsPleaseWait);
  dmipexp.DSetUustinfo.Open;
  dmipexp.DSetCustipinfo.Open;
   with ExcelExport do
   begin
     Connect;
      ExportDataset(dmipexp.DataSetIP,'Ipoteka predmeti barede',True,false);
      ExportDataset(dmipexp.DataSetKredit,'Kredit barede',True,false);
      ExportDataset(dmipexp.DSetCustipinfo,'Borc alan barede diger',True,false);
      ExportDataset(dmipexp.DSetUustinfo,'Borc alan barede',True,false);
     Disconnect;
   end;
     GroupBox2.Visible:=false;
     LogInformation(rsInfExportFinished)
end;

procedure Tfrmipexp.CheckListBox3ClickCheck(Sender: TObject);
var index:Integer;
begin
index:=CheckListBox3.ItemIndex;

with dmipexp.DataSetIP, CheckListBox3 do
if Checked[index] then Fields[index].Visible:=true else Fields[index].Visible:=false;
end;


procedure Tfrmipexp.CheckListBox2ClickCheck(Sender: TObject);
var index:Integer;
begin
index:=CheckListBox2.ItemIndex;

with dmipexp.DataSetKredit, CheckListBox2 do
if Checked[index] then Fields[index].Visible:=true else Fields[index].Visible:=false;
end;

procedure Tfrmipexp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 GroupBox2.Visible:=false;
end;

initialization
   frmipexp := Tfrmipexp.Create(CommonApplication);
end.
end.

