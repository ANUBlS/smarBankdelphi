unit editmt103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, DBCtrls, DBViewComboBox, ComCtrls, ExtCtrls, SearchEdit, Mask,
  ActnList, Menus, Db, OracleData;

type
  TMT103 = class(TForm)
    PageControl1: TPageControl;
    Header: TTabSheet;
    GroupBox5: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    MainPanel: TPanel;
    MF20: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    MF20_edit: TDBEdit;
    MF23B: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    MF23b_edit: TDBEdit;
    MF26T: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    MF32A: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    mf32_date: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    mf32a_val: TDBViewComboBox;
    edit11_mf32a: TDBEdit;
    MF33B: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    MF36: TPanel;
    Label39: TLabel;
    MF50: TPanel;
    MF50_main: TPanel;
    Label20: TLabel;
    CMF50: TComboBox;
    MF50K: TPanel;
    Edit3_MF50: TSearchEdit;
    MF50A: TPanel;
    Edit1_MF50: TSearchEdit;
    MF50F: TPanel;
    Edit4_MF50: TSearchEdit;
    MF52: TPanel;
    MF52_main: TPanel;
    Label21: TLabel;
    CMF52: TComboBox;
    MF52A: TPanel;
    MF52D: TPanel;
    MF53: TPanel;
    MF53_main: TPanel;
    Label22: TLabel;
    CMF53: TComboBox;
    MF53A: TPanel;
    Edit2_MF53: TEdit;
    MF53B: TPanel;
    MF53D: TPanel;
    MF54: TPanel;
    MF54_main: TPanel;
    Label23: TLabel;
    CMF54: TComboBox;
    MF54A: TPanel;
    MF54B: TPanel;
    MF54D: TPanel;
    MF55: TPanel;
    MF55_main: TPanel;
    Label24: TLabel;
    CMF55: TComboBox;
    MF55A: TPanel;
    MF55B: TPanel;
    MF55D: TPanel;
    MF56: TPanel;
    MF56_main: TPanel;
    Label25: TLabel;
    CMF56: TComboBox;
    MF56A: TPanel;
    MF56C: TPanel;
    MF56D: TPanel;
    MF57: TPanel;
    MF57_main: TPanel;
    Label26: TLabel;
    CMF57: TComboBox;
    MF57A: TPanel;
    MF57B: TPanel;
    MF57C: TPanel;
    MF57D: TPanel;
    MF70: TPanel;
    Label27: TLabel;
    MF71A: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1_MF71A: TEdit;
    MF71G: TPanel;
    Label38: TLabel;
    Edit1_MF71G: TEdit;
    Edit2_MF71G: TEdit;
    MF72: TPanel;
    Label34: TLabel;
    Label37: TLabel;
    MF77B: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    MF26T_edit: TDBEdit;
    MF33_edit: TDBEdit;
    mf33_edit2: TDBEdit;
    DBEdit_M36: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fincopy: TDBEdit;
    FIN: TDBEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    reciverbic: TSearchEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    sendertype: TComboBox;
    ComboBox2: TComboBox;
    senderlt: TComboBox;
    Application: TComboBox;
    priority: TComboBox;
    monitoring: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    recivertype: TComboBox;
    Edit2_MF50: TSearchEdit;
    Edit2_MF52: TSearchEdit;
    Edit2_MF54: TSearchEdit;
    Edit2_MF55: TSearchEdit;
    Edit2_MF56: TSearchEdit;
    Edit2_MF57: TSearchEdit;
    CBox_MF71A: TComboBox;
    OF72_RichEdit: TRichEdit;
    ActionList1: TActionList;
    CreatMessage: TAction;
    PopupMenu1: TPopupMenu;
    MtCreate: TMenuItem;
    DBEdit3_MF53: TDBEdit;
    Memo2: TMemo;
    MF59_59A: TPanel;
    MF59_main: TPanel;
    Label33: TLabel;
    CMF59: TComboBox;
    MF59: TPanel;
    DBEdit59_account: TDBEdit;
    DBMemo59_nameadress: TDBMemo;
    MF59A: TPanel;
    DBEdit59A_account: TDBEdit;
    OF70_RichEdit: TRichEdit;
    DBMemo59A_nameadress: TDBMemo;
    Edit59A_bic: TSearchEdit;
    DBMemo1_MF50: TDBMemo;
    DBMemo2_MF50: TDBMemo;
    DBMemo3_MF50: TDBMemo;
    DBMemo1_MF52: TDBMemo;
    DBMemo2_MF52: TDBMemo;
    DBEdit1_MF52: TDBEdit;
    DBEdit3_MF52: TDBEdit;
    DBEdit1_MF53: TDBEdit;
    DBMemo1_MF53: TDBMemo;
    DBEdit4_MF53: TDBEdit;
    DBEdit5_MF53: TDBEdit;
    DBMemo2_MF53: TDBMemo;
    DBEdit1_MF54: TDBEdit;
    DBMemo1_MF54: TDBMemo;
    DBEdit4_MF54: TDBEdit;
    DBEdit5_MF54: TDBEdit;
    DBEdit6_MF54: TDBEdit;
    DBMemo2_MF54: TDBMemo;
    DBEdit1_MF55: TDBEdit;
    DBMemo1_MF55: TDBMemo;
    DBEdit3_MF55: TDBEdit;
    DBEdit4_MF55: TDBEdit;
    DBEdit5_MF55: TDBEdit;
    DBMemo2_MF55: TDBMemo;
    DBEdit1_MF56: TDBEdit;
    DBMemo1_MF56: TDBMemo;
    DBEdit3_MF56: TDBEdit;
    DBEdit4_MF56: TDBEdit;
    DBMemo2_MF56: TDBMemo;
    DBEdit1_MF57: TDBEdit;
    DBMemo1_MF57: TDBMemo;
    DBEdit3_MF57: TDBEdit;
    DBEdit4_MF57: TDBEdit;
    DBEdit5_MF57: TDBEdit;
    DBEdit6_MF57: TDBEdit;
    DBMemo2_MF57: TDBMemo;
    DBMF77_memo: TDBMemo;
    ComissionAccs_Panel: TPanel;
    ComissionAccs_Label: TLabel;
    ComissionAccs: TDBLookupComboBox;
    procedure CMF50Change(Sender: TObject);
    procedure CMF52Change(Sender: TObject);
    procedure CMF53Change(Sender: TObject);
    procedure CMF54Change(Sender: TObject);
    procedure CMF55Change(Sender: TObject);
    procedure CMF56Change(Sender: TObject);
    procedure CMF57Change(Sender: TObject);
    procedure CMF59Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure open_edit_form;
    procedure CBox_MF71AChange(Sender: TObject);
    procedure OF72_RichEditChange(Sender: TObject);
    procedure OF72_RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OF72_RichEditKeyPress(Sender: TObject; var Key: Char);
    procedure CreatMessageExecute(Sender: TObject);
    procedure MtCreateClick(Sender: TObject);
    procedure edit11_mf32aKeyPress(Sender: TObject; var Key: Char);
    procedure mf32a_valChange(Sender: TObject);
    procedure reciverbicChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure OF70_RichEditChange(Sender: TObject);
    procedure OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Edit2_MF52KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2_MF50KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2_MF54KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2_MF55KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2_MF56KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2_MF57KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit59A_bicKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1_MF50Change(Sender: TObject);
    procedure Edit3_MF50Change(Sender: TObject);
    procedure DBMemo59_nameadressKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MT103: TMT103;
  isEmpty,CanClose: Boolean;
  temp_text: String;
implementation

uses Unit2,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}
function GetRichEditLine(RE : TRichEdit) : string;
 var
   A : array [0..5] of String;
   s: String;
   i : Byte;
   k : integer;
   R :integer;
   l_first :integer;
 begin
   l_first := length(re.Text);
   SendMessage(re.Handle, EM_GETSEL, Longint(@R), 0);
   s:='';
   for i:=0 to re.Lines.Count do
   if trim(re.Lines[i])<>'' then
   s :=s +re.Lines[i];

   k :=1;
   for i :=0 to 3 do
   begin
      if copy(s ,k, 35)<>'' then A[i]:= copy(s ,k, 35);
      k :=k + 35;
   end;

   re.Clear;
   for i :=0 to 3 do
   if A[i] <> '' then
   re.Lines.Add(A[i]);



   if (r=35)  and (l_first>=length(re.Text)) then  R:=r+2
   else
   if (((r-((r div 35)-1)*2) mod 35)=0) and (r<>0) and (l_first>=length(re.Text)) then R:=r+(r div 35)*2;
   SendMessage(RE.Handle, EM_SETSEL,R, R);

 end;

function GetRichEditLine2(RE : TRichEdit) : string;
 var
   A : array [0..5] of String;
   s, s_temp : String;
   i : Byte;
   R :integer;
   l_first :integer;

 begin
   l_first := length(re.Text);
   SendMessage(re.Handle, EM_GETSEL, Longint(@R), 0);
   s:='';
   for i:=0 to re.Lines.Count do
   if trim(re.Lines[i])<>'' then
   begin
      case  i of
      	0: begin s_temp:=re.Lines[i];  if pos('/BNF/',s_temp)>0 then begin delete(s_temp,1,5);  r:=r-5;  end; s :=s +s_temp; end;
         1: begin s_temp:=re.Lines[i];  if pos('//',s_temp)>0 then begin delete(s_temp,1,2);  r:=r-2;  end; s :=s +s_temp; end;
         2: begin s_temp:=re.Lines[i];  if pos('//',s_temp)>0 then begin delete(s_temp,1,2);  r:=r-2;  end; s :=s +s_temp; end;
         3: begin s_temp:=re.Lines[i];  if pos('//',s_temp)>0 then begin delete(s_temp,1,2);  r:=r-2;  end; s :=s +s_temp; end;
         4: begin s_temp:=re.Lines[i];  if pos('//',s_temp)>0 then begin delete(s_temp,1,2);  r:=r-2;  end; s :=s +s_temp; end;
         5: begin s_temp:=re.Lines[i];  if pos('//',s_temp)>0 then begin delete(s_temp,1,2);  r:=r-2;  end; s :=s +s_temp; end;
      end;
   end;

   for i :=0 to 5 do
   begin
      case  i of
      	0: if copy(s ,1, 30)<>''   then begin s_temp:='/BNF/'+copy(s ,1, 30); A[i] :=s_temp; r:=r+5;   end;
         1: if copy(s ,31, 33)<>''  then begin s_temp:='//'+copy(s ,31, 33);   A[i] :=s_temp; r:=r+2;   end;
         2: if copy(s ,64, 33)<>''  then begin s_temp:='//'+copy(s ,64, 33);   A[i] :=s_temp; r:=r+2;   end;
         3: if copy(s ,97, 33)<>''  then begin s_temp:='//'+copy(s ,97, 33);   A[i] :=s_temp; r:=r+2;   end;
         4: if copy(s ,130, 33)<>'' then begin s_temp:='//'+copy(s ,130, 33);  A[i] :=s_temp; r:=r+2;   end;
         5: if copy(s ,163, 27)<>'' then begin s_temp:='//'+copy(s ,163, 27);  A[i] :=s_temp; r:=r+2;   end;
      end;

   end;

   re.Clear;
   for i :=0 to 5 do
   if A[i] <> '' then
   re.Lines.Add(A[i]);


   if (r in [37])  and (l_first>length(re.Text)) then begin R:=r-2; end;
   if (r in [74])  and (l_first>length(re.Text)) then begin R:=r-2; end;
   if (r in [111]) and (l_first>length(re.Text)) then begin R:=r-2; end;
   if (r in [148]) and (l_first>length(re.Text)) then begin R:=r-2; end;
   if (r in [185]) and (l_first>length(re.Text)) then begin R:=r-2; end;

   if (r in [36..38])   and (l_first<=length(re.Text)) then  R:=40;
   if (r in [73..75])   and (l_first<=length(re.Text)) then  R:=77;
   if (r in [110..112]) and (l_first<=length(re.Text)) then  R:=114;
   if (r in [147..149]) and (l_first<=length(re.Text)) then  R:=151;
   if (r in [184..186]) and (l_first<=length(re.Text)) then  R:=188;

   if (l_first>length(re.Text)) and (length(re.Text) in [35..38])   and not(r in [35..38])   then  R:=r+2;
   if (l_first>length(re.Text)) and (length(re.Text) in [72..75])   and not(r in [72..75])   then  R:=r+2;
   if (l_first>length(re.Text)) and (length(re.Text) in [109..112]) and not(r in [109..112]) then  R:=r+2;
   if (l_first>length(re.Text)) and (length(re.Text) in [146..149]) and not(r in [146..149]) then  R:=r+2;
   if (l_first>length(re.Text)) and (length(re.Text) in [183..186]) and not(r in [183..186]) then  R:=r+2;

   SendMessage(RE.Handle, EM_SETSEL,R, R);
 end;


procedure TMT103.CMF50Change(Sender: TObject);
begin
case CMF50.ItemIndex of
0:
begin
MF50A.Visible:=False ;
MF50F.Visible:=False;
MF50K.Visible:=False;
end;

1:
begin
MF50A.Visible:=True ;
MF50F.Visible:=False;
MF50K.Visible:=False;
end;
2:
begin
MF50A.Visible:=False ;
MF50F.Visible:=True;
MF50K.Visible:=False;
end;
3:
begin
MF50A.Visible:=False;
MF50F.Visible:=False;
MF50K.Visible:=True;
end;
end;
end;

procedure TMT103.CMF52Change(Sender: TObject);
begin
case CMF52.ItemIndex of
0:
begin
MF52A.Visible:=False;
MF52D.Visible:=False;
end;
1:
begin
MF52A.Visible:=True ;
MF52D.Visible:=False;

end;
2:
begin
MF52A.Visible:=False ;
MF52D.Visible:=True;
end;
end;
end;

procedure TMT103.CMF53Change(Sender: TObject);
begin
case CMF53.ItemIndex of
0:
begin
MF53A.Visible:=False;
MF53B.Visible:=False;
MF53D.Visible:=False;
end;
1:
begin
MF53A.Visible:=True ;
MF53B.Visible:=False;
MF53D.Visible:=False;
end;
2:
begin
MF53A.Visible:=False ;
MF53B.Visible:=True;
MF53D.Visible:=False;
end;
3:
begin
MF53A.Visible:=False ;
MF53B.Visible:=False;
MF53D.Visible:=True;
end;
end;
end;

procedure TMT103.CMF54Change(Sender: TObject);
begin
case CMF54.ItemIndex of
0:
begin
MF54A.Visible:=False;
MF54B.Visible:=False;
MF54D.Visible:=False;
end;
1:
begin
MF54A.Visible:=True ;
MF54B.Visible:=False;
MF54D.Visible:=False;
end;
2:
begin
MF54A.Visible:=False ;
MF54B.Visible:=True;
MF54D.Visible:=False;
end;
3:
begin
MF54A.Visible:=False ;
MF54B.Visible:=False;
MF54D.Visible:=True;
end;
end;
end;

procedure TMT103.CMF55Change(Sender: TObject);
begin
case CMF55.ItemIndex of
0:
begin
MF55A.Visible:=False;
MF55B.Visible:=False;
MF55D.Visible:=False;
end;
1:
begin
MF55A.Visible:=True ;
MF55B.Visible:=False;
MF55D.Visible:=False;
end;
2:
begin
MF55A.Visible:=False ;
MF55B.Visible:=True;
MF55D.Visible:=False;
end;
3:
begin
MF55A.Visible:=False ;
MF55B.Visible:=False;
MF55D.Visible:=True;
end;
end;
end;

procedure TMT103.CMF56Change(Sender: TObject);
begin
case CMF56.ItemIndex of
0:
begin
MF56A.Visible:=False;
MF56C.Visible:=False;
MF56D.Visible:=False;
end;
1:
begin
MF56A.Visible:=True ;
MF56C.Visible:=False;
MF56D.Visible:=False;
end;
2:
begin
MF56A.Visible:=False ;
MF56C.Visible:=True;
MF56D.Visible:=False;
end;
3:
begin
MF56A.Visible:=False ;
MF56C.Visible:=False;
MF56D.Visible:=True;
end;
end;
end;

procedure TMT103.CMF57Change(Sender: TObject);
begin
case CMF57.ItemIndex of
0:
begin
MF57A.Visible:=False;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=False;
end;
1:
begin
MF57A.Visible:=True ;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=False;
end;
2:
begin
MF57A.Visible:=False ;
MF57B.Visible:=True;
MF57C.Visible:=False;
MF57D.Visible:=False;
end;
3:
begin
MF57A.Visible:=False ;
MF57B.Visible:=False;
MF57C.Visible:=True;
MF57D.Visible:=False;
end;
4:
begin
MF57A.Visible:=False ;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=True;
end;


end;
end;

procedure TMT103.CMF59Change(Sender: TObject);
begin
if CMF59.ItemIndex=0  then
begin
MF59.Visible:=False;
MF59A.Visible:=False;
end;

if CMF59.ItemIndex=1  then
begin
MF59.Visible:=True;
MF59A.Visible:=False;
end;

if CMF59.ItemIndex=2  then
begin
MF59.Visible:=False;
MF59A.Visible:=True;
end;
end;

procedure TMT103.FormActivate(Sender: TObject);
begin
SWDataModule.tobic.Close;
SWDataModule.tobic.SetVariable('dbs',DBEdit1.Text);
SWDataModule.tobic.open;

Edit2.Text:= SWDataModule.tobic.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.tobic.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.tobic.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.tobic.fieldbyname('country').asstring;
//reciverbic.OnChange.Execute(sender);
senderlt.Text:=SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
sendertype.Text:='Institution';
ComboBox2.Text:= SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
recivertype.Text:='Institution';
Application.Text:='FIN';
priority.Text:='N';
monitoring.Text:='N';

SWDataModule.sw_out.Edit;
reciverbic.Text:=DBEdit1.Text;
Edit3_MF50.Text:=DBEdit_M36.Text;

{with SWDataModule do
begin
if not DS_SWBanks_MF50.active then DS_SWBanks_MF50.Open;
if not DS_SWBanks_MF52.active then DS_SWBanks_MF52.Open;
if not DS_SWBanks_MF54.active then DS_SWBanks_MF54.Open;
if not DS_SWBanks_MF55.active then DS_SWBanks_MF55.Open;
if not DS_SWBanks_MF56.active then DS_SWBanks_MF56.Open;
if not DS_SWBanks_MF57.active then DS_SWBanks_MF57.Open;
if not DS_SWBanks_MF59.active then DS_SWBanks_MF59.Open;
end;          }

end;

procedure TMT103.open_edit_form;
var
v_MF71G: String;
begin
//--------------------------------  MF32A  begin------------------------
mf32_date.Date:=SWDataModule.sw_outMF32A_DATE.asDateTime;
mf32a_val.Text:=SWDataModule.sw_outMF32A_CURR.asString;
 //--------------------------------  MF50  begin------------------------
if SWDataModule.sw_outM50.AsString=':50A:' then
begin
CMF50.ItemIndex:=1;
MF50A.Visible:=True ;
MF50F.Visible:=False;
MF50K.Visible:=False;
Edit1_MF50.Text:=SWDataModule.sw_outMF50_ACCOUNT.asString;
Edit2_MF50.Text:=SWDataModule.sw_outMF50_BIC.asString;
DBMemo1_MF50.TEXT:=SWDataModule.sw_out.FieldByName('MF50_NAME$ADRESS').asString;
end
         else
if SWDataModule.sw_outM50.AsString=':50F:' then
begin
CMF50.ItemIndex:=2;
MF50A.Visible:=False ;
MF50F.Visible:=True;
MF50K.Visible:=False;
Edit4_MF50.Text:=SWDataModule.sw_outMF50_ACCOUNT.asString;
end
         else
 if SWDataModule.sw_outM50.AsString=':50K:' then
begin
CMF50.ItemIndex:=3;
MF50A.Visible:=False ;
MF50F.Visible:=False;
MF50K.Visible:=TRUE;
Edit3_MF50.Text:=SWDataModule.sw_outMF50_ACCOUNT.asString;
end
        else
begin
CMF50.ItemIndex:=0;
MF50A.Visible:=False ;
MF50F.Visible:=False;
MF50K.Visible:=False;
end;
 //--------------------------------  MF52  begin------------------------
if SWDataModule.sw_outM52.AsString=':52A:' then
     begin
CMF52.ItemIndex:=1;
MF52A.Visible:=True ;
MF52D.Visible:=False;
Edit2_MF52.Text:=SWDataModule.sw_outMF52_BIC.asString;
     end
        else
if SWDataModule.sw_outM52.AsString=':52D:' then
     begin
CMF52.ItemIndex:=2;
MF52A.Visible:=False;
MF52D.Visible:=True;
     end
        else
     begin
CMF52.ItemIndex:=0;
MF52A.Visible:=False;
MF52D.Visible:=False;
     end;
//--------------------------------  MF53  begin  ----------------
CMF53.ItemIndex:=2;
CMF53.Enabled:=False;

MF53A.Visible:=False ;
MF53B.Visible:=True;
MF53D.Visible:=False;
SWDataModule.CORR.Close;
SWDataModule.CORR.SetVariable('v',mf32a_val.text);
SWDataModule.CORR.SetVariable('b',reciverbic.text);
SWDataModule.CORR.Open;
//--------------------------------  MF54  begin  --------------------
if SWDataModule.sw_outM54.AsString=':54A:' then
     begin
CMF54.ItemIndex:=1;
MF54A.Visible:=True ;
MF54B.Visible:=False;
MF54D.Visible:=False;
Edit2_MF54.Text:=SWDataModule.sw_outMF54_BIC.asString;
     end
        else
if SWDataModule.sw_outM54.AsString=':54B:' then
     begin
CMF54.ItemIndex:=2;
MF54A.Visible:=False ;
MF54B.Visible:=True;
MF54D.Visible:=False;
     end
        else
if SWDataModule.sw_outM54.AsString=':54D:' then
     begin
CMF54.ItemIndex:=3;
MF54A.Visible:=False ;
MF54B.Visible:=False;
MF54D.Visible:=True;
     end
        else
     begin
CMF54.ItemIndex:=0;
MF54A.Visible:=False;
MF54B.Visible:=False;
MF54D.Visible:=False;
     end;
//--------------------------------  MF55  begin  --------------------
if SWDataModule.sw_outM55.AsString=':55A:' then
     begin
CMF55.ItemIndex:=1;
MF55A.Visible:=True ;
MF55B.Visible:=False;
MF55D.Visible:=False;

Edit2_MF55.Text:=SWDataModule.sw_outMF55_BIC.asString;
     end
        else
if SWDataModule.sw_outM55.AsString=':55B:' then
     begin
CMF55.ItemIndex:=2;
MF55A.Visible:=False ;
MF55B.Visible:=True;
MF55D.Visible:=False;
   end
        else
if SWDataModule.sw_outM55.AsString=':55D:' then
     begin
CMF55.ItemIndex:=3;
MF55A.Visible:=False ;
MF55B.Visible:=False;
MF55D.Visible:=True;
     end
        else
     begin
CMF55.ItemIndex:=0;
MF55A.Visible:=False;
MF55B.Visible:=False;
MF55D.Visible:=False;
     end;
//--------------------------------  MF56  begin  --------------------
if SWDataModule.sw_outM56.AsString=':56A:' then
     begin
CMF56.ItemIndex:=1;
MF56A.Visible:=True ;
MF56C.Visible:=False;
MF56D.Visible:=False;

Edit2_MF56.Text:=SWDataModule.sw_outMF56_BIC.asString;
     end
        else
if SWDataModule.sw_outM56.AsString=':56C:' then
     begin
CMF56.ItemIndex:=2;
MF56A.Visible:=False ;
MF56C.Visible:=True;
MF56D.Visible:=False;

     end
        else
if SWDataModule.sw_outM56.AsString=':56D:' then
     begin
CMF56.ItemIndex:=3;
MF56A.Visible:=False ;
MF56C.Visible:=False;
MF56D.Visible:=True;
     end
        else
     begin
CMF56.ItemIndex:=0;
MF56A.Visible:=False;
MF56C.Visible:=False;
MF56D.Visible:=False;
     end;
//--------------------------------  MF57  begin  --------------------

if SWDataModule.sw_outM57.AsString=':57A:' then
     begin
CMF57.ItemIndex:=1;
MF57A.Visible:=True ;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=False;

Edit2_MF57.Text:=SWDataModule.sw_outMF57_BIC.asString;
     end
        else
if SWDataModule.sw_outM57.AsString=':57B:' then
     begin
CMF57.ItemIndex:=2;
MF57A.Visible:=False ;
MF57B.Visible:=True;
MF57C.Visible:=False;
MF57D.Visible:=False;

     end
        else
if SWDataModule.sw_outM57.AsString=':57C:' then
     begin
CMF57.ItemIndex:=3;
MF57A.Visible:=False ;
MF57B.Visible:=False;
MF57C.Visible:=True;
MF57D.Visible:=False;
    end
        else
if SWDataModule.sw_outM57.AsString=':57D:' then
     begin
CMF57.ItemIndex:=4;
MF57A.Visible:=False ;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=True;
     end
     else
     begin
CMF57.ItemIndex:=0;
MF57A.Visible:=False;
MF57B.Visible:=False;
MF57C.Visible:=False;
MF57D.Visible:=False;
     end;
//--------------------------------  MF59  begin  --------------------
if SWDataModule.sw_outM59.AsString=':59:'  then
begin
CMF59.ItemIndex:=1;
MF59.Visible:=True;
MF59A.Visible:=False;
end
        else
if SWDataModule.sw_outM59.AsString=':59A:'  then
begin
CMF59.ItemIndex:=2;
MF59.Visible:=False;
MF59A.Visible:=True;
Edit59A_bic.Text:=SWDataModule.sw_outMF59_BIC.AsString
end
        else
begin
MF59.Visible:=False;
MF59A.Visible:=False;
end;
//--------------------------------  MF70  begin  --------------------
OF70_RichEdit.Text:=SWDataModule.sw_outMF70.AsString; 
//--------------------------------  MF71A  begin  --------------------
if SWDataModule.sw_outMF71A.AsString='OUR' then
begin CBox_MF71A.ItemIndex:=0; Edit1_MF71A.Text:='OUR' end else
if SWDataModule.sw_outMF71A.AsString='BEN' then
begin CBox_MF71A.ItemIndex:=1; Edit1_MF71A.Text:='BEN' end else
if SWDataModule.sw_outMF71A.AsString='SHA' then
begin CBox_MF71A.ItemIndex:=2; Edit1_MF71A.Text:='SHA' end else
begin CBox_MF71A.ItemIndex:=-1; Edit1_MF71A.Text:='' end;
//--------------------------------  OF71G  begin  --------------------
v_MF71G:=SWDataModule.sw_outMF71G_CHILD.AsString ;
Edit1_MF71G.Text:=copy(v_MF71G,1,LastDelimiter('|',v_MF71G)-1);
Edit2_MF71G.Text:=copy(v_MF71G,LastDelimiter('|',v_MF71G)+1,Length(v_MF71G)-LastDelimiter('|',v_MF71G));

OF72_RichEdit.Text:=SWDataModule.sw_outMF72.AsString;
//--------------------------------------komissiya tutulacaq hesab ----------------
with SWDataModule.DS_AccsForComission do
      begin
        close;
        setVariable('v_acc_no',SWDataModule.sw_outMF50_ACCOUNT.asString);
        Open;
      end;
      ComissionAccs.KeyValue:=SWDataModule.sw_outCOM_ACCID.asInteger;
end;


procedure TMT103.DBLookupComboBox3Click(Sender: TObject);
begin
Edit2.Text:= SWDataModule.banks.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.banks.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.banks.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.banks.fieldbyname('country').asstring;
reciverbic.Text:=DBLookupComboBox3.Text;
end;


procedure TMT103.CBox_MF71AChange(Sender: TObject);
begin
Edit1_MF71A.Text:=CBox_MF71A.Text;
end;

procedure TMT103.OF72_RichEditChange(Sender: TObject);
begin
GetRichEditLine2(OF72_RichEdit);
end;

procedure TMT103.OF72_RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var r: Longint;
begin
   SendMessage((Sender as TRichEdit).Handle, EM_GETSEL, Longint(@R), 0);

   if (r in [0..4]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [1..5]) and (key in [vk_back])  then begin key:=0;  end;
   if (r in [35,72,109,146,183]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [36..38,73..75,110..112,147..149,184..186]) and (key in [vk_delete, vk_back])  then begin key:=0;  end;
   if (r in [39,76,113,150,187]) and (key in [ vk_back])  then begin key:=0;  end;

   if  length(trim((Sender as TRichEdit).Text))=0 then isEmpty:=true else isEmpty :=false;
   if  (length(trim((Sender as TRichEdit).Text))>216) and not(key  in [vk_delete, vk_back]) then key:=0;


end;

procedure TMT103.OF72_RichEditKeyPress(Sender: TObject; var Key: Char);
  var r : Longint;
begin
     if key=#13 then key:=#0;
     SendMessage((Sender as TRichEdit).Handle, EM_GETSEL, Longint(@R), 0);
     if (r in [1..5])  then begin key:=#0;  end;

     if (r in [35..38,72..75,109..112,146..149,183..186])and
     (((Sender as TRichEdit).Text[r-1]='/')or((Sender as TRichEdit).Text[r+1]='/')) then key:=#0;
end;

procedure TMT103.CreatMessageExecute(Sender: TObject);
var
dolmayan,stat1,stat2,stat3,stat4,stat5,stat6,stat7:Widestring;
mf32a_curr,m20,m23b,m26t,m32a,m33,m36,m50,mf50_account,mf50_bic,voen,m52,mf52_bic :Widestring;
mf32a_date: TDateTime;
begin
CanClose:=True;
 TabSheet1.Show;
     if MF23b_edit.Text='' then
      begin
       dolmayan:=dolmayan+' MF23,';
       stat1:='exitfromprosedure';
      end else  stat1:='nextprosedure';
          if mf32a_val.Text='' then
          begin
          dolmayan:=dolmayan + '  MF32A  Valyuta,';
          stat2:='exitfromprosedure';
          end else  stat2:='nextprosedure';
           if mf32a_val.Text=''  then
                begin
                 dolmayan:=dolmayan + '  MF32A  mebleq,' ;
                 stat3:='exitfromprosedure';
                 end else  stat3:='nextprosedure';
             if CMF50.Text=''   then
               begin
               dolmayan:=dolmayan + '  MF50,' ;
               stat4:='exitfromprosedure';
               end else  stat4:='nextprosedure';



             if CMF57.Text=''   then
               begin
               dolmayan:=dolmayan + '  MF57,' ;
               stat7:='exitfromprosedure';
               end else  stat7:='nextprosedure';


              if CMF59.Text=''   then
              begin
                 dolmayan:=dolmayan + '  MF59,';
                  stat5:='exitfromprosedure';
               end else  stat5:='nextprosedure';

              if Edit1_MF71A.Text=''   then
              begin
                 dolmayan:=dolmayan + '  MF71A,';
                  stat6:='exitfromprosedure';
               end else  stat6:='nextprosedure';

             if      (stat1='nextprosedure')
                 and (stat2='nextprosedure')
                 and (stat3='nextprosedure')
                 and (stat4='nextprosedure')
                 and (stat5='nextprosedure')
                 and (stat6='nextprosedure')
                 and (stat7='nextprosedure')
             then
      begin
      SWDataModule.referans.Close;
      SWDataModule.referans.Open;
      with SWDataModule.referans do
      begin
      SetVariable('FORMATS',FIN.text);
      SetVariable('CURRENSY',mf32a_val.text);
      end;

      SWDataModule.referans.Refresh;
      SWDataModule.referans.Close;
      SWDataModule.referans.Open;

MF20_edit.text:=SWDataModule.referansrefe.asstring ;
mf32a_date:= mf32_date.Date;
mf32a_curr:= mf32a_val.Text;

if DBEdit_M36.Text<>'' then
{
v_mf20_reference:=MF20_edit.Text; }
SWDataModule.sw_outSENDERTYPE.AsString:=sendertype.Text;
SWDataModule.sw_outSENDERBIC.AsString:=senderlt.Text;
SWDataModule.sw_outSENDERLT.AsString:=senderlt.Text;
SWDataModule.sw_outAPPLICATION.AsString:=Application.Text;
SWDataModule.sw_outFINCOPY.AsString:=fincopy.Text;
SWDataModule.sw_outMESSAGETYPE.AsString:=fin.Text;
SWDataModule.sw_outPRIORITY.AsString:=priority.Text;
SWDataModule.sw_outMONITORING.AsString:=monitoring.Text;
SWDataModule.sw_outRECEIVERTYPE.asString:=reciverbic.Text;
SWDataModule.sw_outRECEIVERBIC.AsString:=reciverbic.text;
SWDataModule.sw_outMF32A_CURR.ASString:=mf32a_curr;

if MF20_edit.Text<>'' then m20:=':20:' else m20:='';
if MF23b_edit.Text<>'' then m23b:=':23B:' else m23b:='';
if MF26T_edit.Text<>'' then m26t:=':26T:' else m26t:='';
if edit11_mf32a.text<>'' then m32a:=':32A:' else m32a:='';
if MF33_edit.Text<>'' then m33:=':33:' else m33:='';
if DBEdit_M36.Text<>'' then m36:=':36:' else m36:='';

//----------------------------------CMF50 begin-----------------
 if CMF50.ItemIndex=0 then
 begin
 SWDataModule.sw_outM50.AsString:='';
 SWDataModule.sw_outMF50_ACCOUNT.AsString:='';
 SWDataModule.sw_outMF50_BIC.AsString:='';
 SWDataModule.sw_outMF50_NAMEADRESS.AsString:='';
 end
 else
if CMF50.ItemIndex=1 then
 begin
  SWDataModule.sw_outM50.AsString:=':50A:';
  SWDataModule.sw_outMF50_ACCOUNT.AsString:=Edit1_MF50.Text;
  SWDataModule.sw_outMF50_BIC.AsString:=Edit2_MF50.Text;
 end
 else
if CMF50.ItemIndex=2 then
 begin;
  SWDataModule.sw_outM50.AsString:=':50F:';
   SWDataModule.sw_outMF50_ACCOUNT.AsString:=Edit4_MF50.Text;
   SWDataModule.sw_outMF50_BIC.AsString:='';
 end
else
if CMF50.ItemIndex=3 then
 begin
  SWDataModule.sw_outM50.AsString:=':50K:';
  SWDataModule.sw_outMF50_ACCOUNT.AsString:=Edit3_MF50.Text;
  SWDataModule.sw_outMF50_BIC.AsString:='';
 //Memo2.TEXT:=DBMemo2_MF50.Lines[0]+'TAXID'+' '+DBMemo2_MF50.Lines[1]+DBMemo2_MF50.Lines[2]+DBMemo2_MF50.Lines[3];
 SWDataModule.sw_outTax.asString:= trim(copy(DBMemo2_MF50.Lines[1],0,20));
 //trim(copy(DBMemo2_MF50.Lines[1],7,20));
 end;
 //----------------CHECK MF50 ACCOUNT NUMBER-------------------
  SWDataModule.Chk_AccNo.Close;
  case  CMF50.ItemIndex of
  1:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit1_MF50.Text);
  2:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit4_MF50.Text);
  3:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit3_MF50.Text);
  end;
  SWDataModule.Chk_AccNo.Open;

if SWDataModule.Chk_AccNoCUST_TYPE.IsNull then
begin showmessage('MF50 - Hesab nömrəsi düzgün deyil!'); CanClose:=False; Exit; end
else
 begin CanClose:=True;
        if CMF50.ItemIndex=3 then
                case SWDataModule.Chk_AccNoCUST_TYPE.AsInteger of
                 1: begin
                    //Memo2.TEXT:=DBMemo2_MF50.Lines[0]+DBMemo2_MF50.Lines[1]+DBMemo2_MF50.Lines[2]+DBMemo2_MF50.Lines[3];
                    SWDataModule.sw_outTax.asString:='';
                    end;
                end;
 end;

//----------------------------------CMF52 begin-----------------
if CMF52.ItemIndex=1 then
 begin
   SWDataModule.sw_outM52.AsString:=':52A:';
    SWDataModule.sw_outMF52_bic.AsString:=Edit2_MF52.Text;
 end
 else
if CMF52.ItemIndex=2 then
    begin
    SWDataModule.sw_outM52.AsString:=':52D:';
    SWDataModule.sw_outMF52_bic.AsString:='';
    end
  else
 if CMF52.ItemIndex=0 then
 begin
     SWDataModule.sw_outM52.AsString:='';
     SWDataModule.sw_outMF52_ACCOUNT.AsString:='';
     SWDataModule.sw_outMF52_BIC.AsString:='';
     SWDataModule.sw_outMF52_NAMEADRESS.AsString:='';
  end;
 //----------------------------------CMF53 begin-----------------
if CMF53.ItemIndex=1 then
 begin
 SWDataModule.sw_outM53.AsString:=':53A:';
 SWDataModule.sw_outMF53_ACCOUNT.AsString:=DBEdit1_MF53.Text;
 SWDataModule.sw_outMF53_BIC.AsString:= Edit2_MF53.Text;
 end
 else
if CMF53.ItemIndex=2 then
 begin
  SWDataModule.sw_outM53.AsString:=':53B:';
  SWDataModule.sw_outMF53_ACCOUNT.AsString:=DBEdit3_MF53.Text;
   SWDataModule.sw_outMF53_BIC.AsString:= '';
 end
 else
if CMF53.ItemIndex=3 then
        begin
        SWDataModule.sw_outM53.AsString:=':53D:';
         SWDataModule.sw_outMF53_BIC.AsString:= '';
        end
 else
if CMF53.ItemIndex=0 then
 begin
  SWDataModule.sw_outM53.AsString:='';
  SWDataModule.sw_outMF53_ACCOUNT.AsString:='';
  SWDataModule.sw_outMF53_NAMELOCATION.AsString:='';
 end;
 //----------------------------------CMF54 begin-----------------
if CMF54.ItemIndex=1 then
 begin
 SWDataModule.sw_outM54.AsString:=':54A:';
 SWDataModule.sw_outMF54_BIC.AsString:=Edit2_MF54.Text;
 end
 else
if CMF54.ItemIndex=2 then
        begin
        SWDataModule.sw_outM54.AsString:=':54B:';
        SWDataModule.sw_outMF54_BIC.AsString:='';
        end
 else
if CMF54.ItemIndex=3 then
        begin
        SWDataModule.sw_outM54.AsString:=':54D:';
        SWDataModule.sw_outMF54_BIC.AsString:='';
        end
 else
if CMF54.ItemIndex=0 then
 begin
 SWDataModule.sw_outM54.AsString:= '';
 SWDataModule.sw_outMF54_ACCOUNT.AsString:='';
 SWDataModule.sw_outMF54_BIC.AsString:='';
  SWDataModule.sw_outMF54_NAMELOCATION.AsString:='';
 end;
 //----------------------------------CMF55 begin-----------------
if CMF55.ItemIndex=1 then
 begin
 SWDataModule.sw_outM55.AsString:=':55A:';
 SWDataModule.sw_outMF55_BIC.AsString:=Edit2_MF55.Text;
 end
 else
if CMF55.ItemIndex=2 then
        begin
        SWDataModule.sw_outM55.AsString:=':55B:';
        SWDataModule.sw_outMF55_BIC.AsString:='';
        end
  else
if CMF55.ItemIndex=3 then
        begin
        SWDataModule.sw_outM55.AsString:=':55D:';
        SWDataModule.sw_outMF55_BIC.AsString:='';
        end
 else
if CMF55.ItemIndex=0 then
 begin
 SWDataModule.sw_outM55.AsString:='';
 SWDataModule.sw_outMF55_ACCOUNT.AsString:='';
 SWDataModule.sw_outMF55_BIC.AsString:='';
  SWDataModule.sw_outMF55_NAMELOCATION.AsString:='';
 end;
 //----------------------------------CMF56 begin-----------------
if CMF56.ItemIndex=1 then
 begin
 SWDataModule.sw_outM56.AsString:=':56A:';
 SWDataModule.sw_outMF56_BIC.AsString:=Edit2_MF56.Text;
 end
 else
if CMF56.ItemIndex=2 then
        begin
        SWDataModule.sw_outM56.AsString:=':56C:';
         SWDataModule.sw_outMF56_BIC.AsString:='';
        end
 else
if CMF56.ItemIndex=3 then
        begin
        SWDataModule.sw_outM56.AsString:=':56D:';
        SWDataModule.sw_outMF56_BIC.AsString:='';
        end
  else
if CMF56.ItemIndex=0 then
 begin
 SWDataModule.sw_outM56.AsString:='';
 SWDataModule.sw_outMF56_ACCOUNT.AsString:='';
 SWDataModule.sw_outMF56_BIC.AsString:='';
  SWDataModule.sw_outMF56_NAMELOCATION.AsString:='';
 end;
 //----------------------------------CMF57 begin-----------------
if CMF57.ItemIndex=1 then
 begin
 SWDataModule.sw_outM57.AsString:=':57A:';
 SWDataModule.sw_outMF57_BIC.AsString:=Edit2_MF57.Text;
 end
 else
if CMF57.ItemIndex=2 then
                begin
                SWDataModule.sw_outM57.AsString:=':57B:';
                 SWDataModule.sw_outMF57_BIC.AsString:='';
                end
  else
if CMF57.ItemIndex=3 then
                begin
                SWDataModule.sw_outM57.AsString:=':57C:';
                 SWDataModule.sw_outMF57_BIC.AsString:='';
                SWDataModule.sw_outMF57_NAMELOCATION.AsString:='';
                end
  else
if CMF57.ItemIndex=4 then
                begin
                SWDataModule.sw_outM57.AsString:=':57D:';
                 SWDataModule.sw_outMF57_BIC.AsString:='';
                 end
  else
if CMF57.ItemIndex=0 then
 begin
  SWDataModule.sw_outM57.AsString:='';
  SWDataModule.sw_outMF57_ACCOUNT.AsString:='';
 SWDataModule.sw_outMF57_BIC.AsString:='';
  SWDataModule.sw_outMF57_NAMELOCATION.AsString:='';
 end;
 //----------------------------------CMF59 begin-----------------
if CMF59.ItemIndex=1 then
                begin
                 SWDataModule.sw_outM59.AsString:=':59:';
                 SWDataModule.sw_outMF59_BIC.AsString:='';
                end
else
if CMF59.ItemIndex=2 then
 begin
  SWDataModule.sw_outM59.AsString:=':59A:';
   SWDataModule.sw_outMF59_BIC.AsString:= Edit59A_bic.Text;
 end
 else
 if CMF59.ItemIndex=0 then
 begin
   SWDataModule.sw_outM59.AsString:= '';
   SWDataModule.sw_outMF59_ACCOUNT.AsString:='';
   SWDataModule.sw_outMF59_BIC.AsString:='';
   SWDataModule.sw_outMF59_NAMEADRESS.AsString:='';
 end;

if OF70_RichEdit.Text<>'' then
begin
   SWDataModule.sw_outM70.AsString:=':70:';
   SWDataModule.sw_outMF70.AsString:=trim(OF70_RichEdit.Text);
end
else SWDataModule.sw_outM70.AsString:='';

if Edit1_MF71A.Text<>'' then
begin
   SWDataModule.sw_outM71A.AsString:=':71A:';
   SWDataModule.sw_outMF71A.AsString:=Edit1_MF71A.Text;
end
else  SWDataModule.sw_outM71A.AsString:='';
{if (Edit1_MF71F.Text<>'') or (Edit3_MF71F.Text<>'') or (Edit5_MF71F.Text<>'')
then
begin
m71f:=':71F:';
mf71f_child:=Edit1_MF71F.Text+'|'+Edit2_MF71F.Text;
end
 else m71f:='';
}
if Edit1_MF71G.Text<>'' then
begin
 SWDataModule.sw_outM71G.AsString:=':71G:';
 SWDataModule.sw_outMF71G_child.AsString:=Edit1_MF71G.Text+'|'+Edit2_MF71G.Text;
end
else  SWDataModule.sw_outM71G.AsString:='';

if OF72_RichEdit.Text<>'' then
 begin
 SWDataModule.sw_outM72.AsString:=':72:';
 SWDataModule.sw_outMF72.AsString:=trim(OF72_RichEdit.Text);
 end
 else  SWDataModule.sw_outM72.AsString:='';

 if DBMF77_memo.Text<>'' then
 SWDataModule.sw_outM77B.AsString:=':77B:';

 SWDataModule.sw_out.Post;

SWDataModule.sw_out.Open;
SWDataModule.sw_out.Refresh;
SWDataModule.sw_out_2.Open;
SWDataModule.sw_out_2.Refresh;
SWDataModule.sw_out3.Open;
SWDataModule.sw_out3.Refresh;
                   end
                     else
                     begin
                          ShowMessage(' '+dolmayan+ ' Xanalar doldurulmayıb!') ;
                         CanClose:=False;
                         end;

end;

procedure TMT103.MtCreateClick(Sender: TObject);
begin
CreatMessage.Execute;
 if CanClose then
 MT103.Close;
end;

procedure TMT103.edit11_mf32aKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
    key :=#0;
end;

procedure TMT103.mf32a_valChange(Sender: TObject);
begin
SWDataModule.CORR.Close;
SWDataModule.CORR.SetVariable('v',mf32a_val.text);
SWDataModule.CORR.SetVariable('b',reciverbic.text);
SWDataModule.CORR.Open;
end;

procedure TMT103.reciverbicChange(Sender: TObject);
begin
Edit2.Text:= SWDataModule.banks.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.banks.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.banks.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.banks.fieldbyname('country').asstring;
end;

procedure TMT103.TabSheet1Show(Sender: TObject);
begin
open_edit_form;
end;

procedure TMT103.OF70_RichEditChange(Sender: TObject);
begin
GetRichEditLine(OF70_RichEdit);
end;

procedure TMT103.OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if  (length(trim((Sender as TRichEdit).Text))>147) and not(key  in [vk_delete, vk_back]) then key:=0;
end;

procedure TMT103.OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then key:=#0;
end;

procedure TMT103.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=False;
end;

procedure TMT103.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TMT103.Edit2_MF52KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF52.Text='') or (Edit2_MF52.Color=clred) then
DBMemo1_mf52.Clear
else
begin
DBMemo1_mf52.Clear;
DBMemo1_mf52.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_mf52.Lines.add(SWDataModule.banksCITY.AsString);
end;
SWDataModule.sw_outMF52_NAMEADRESS.asString:=DBMemo1_mf52.Text;
end;

procedure TMT103.Edit2_MF50KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF50.Text='') or (Edit2_MF50.Color=clred) then
DBMemo1_mf50.Clear
else
begin
DBMemo1_mf50.Clear;
DBMemo1_mf50.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_mf50.Lines.add(SWDataModule.banksCity.AsString);
end;
SWDataModule.sw_outMF50_NAMEADRESS.asString:=DBMemo1_mf50.Text;
end;

procedure TMT103.Edit2_MF54KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF54.Text='') or (Edit2_MF54.Color=clred) then
DBMemo1_MF54.Clear
else
begin
DBMemo1_MF54.Clear;
DBMemo1_MF54.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_MF54.Lines.add(SWDataModule.banksCITY.AsString);
end;
SWDataModule.sw_outMF54_NAMELOCATION.asString:=DBMemo1_mf54.Text;
end;

procedure TMT103.Edit2_MF55KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF55.Text='') or (Edit2_MF55.Color=clred) then
DBMemo1_mf55.Clear
else
begin
DBMemo1_mf55.Clear;
DBMemo1_mf55.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_mf55.Lines.add(SWDataModule.banksCITY.AsString);
end;
SWDataModule.sw_outMF55_NAMELOCATION.asString:=DBMemo1_mf55.Text;
end;

procedure TMT103.Edit2_MF56KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF56.Text='') or (Edit2_MF56.Color=clred) then
DBMemo1_MF56.Clear
else
begin
DBMemo1_MF56.Clear;
DBMemo1_MF56.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_MF56.Lines.add(SWDataModule.banksCITY.AsString);
end;
SWDataModule.sw_outMF56_NAMELOCATION.asString:=DBMemo1_mf56.Text;
end;

procedure TMT103.Edit2_MF57KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit2_MF57.Text='') or (Edit2_MF57.Color=clred) then
DBMemo1_mf57.Clear
else
begin
DBMemo1_mf57.Clear;
DBMemo1_mf57.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo1_mf57.Lines.add(SWDataModule.banksCITY.AsString);
end;
SWDataModule.sw_outMF57_NAMELOCATION.asString:=DBMemo1_mf57.Text;
end;

procedure TMT103.Edit59A_bicKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Edit59A_bic.Text='') or (Edit59A_bic.Color=clred) then
DBMemo59A_nameadress.Clear
else
begin
DBMemo59A_nameadress.Clear;
DBMemo59A_nameadress.Lines.add(SWDataModule.banksNAME.AsString);
DBMemo59A_nameadress.Lines.add(SWDataModule.banksNAME.AsString);
end;
SWDataModule.sw_outMF59_NAMEADRESS.asString:=DBMemo59A_nameadress.Text;
end;

procedure TMT103.Edit1_MF50Change(Sender: TObject);
begin
//if NOT (((Sender as TEdit).Text='') or ((Sender as TEdit).Color=clred)) then
//begin

  if FINCOPY.Text='AZN'
   then
     begin
     SWDataModule.DS_AccsForComission.Close;
     end
   else
    begin
    with SWDataModule.DS_AccsForComission do
      begin
        close;
        setVariable('v_acc_no',(Sender as TEdit).Text);
        Open;
      end;
    end;

//end;


end;

procedure TMT103.Edit3_MF50Change(Sender: TObject);
begin

if NOT (((Sender as TEdit).Text='') or ((Sender as TEdit).Color=clred)) then
 begin

  if FINCOPY.Text='AZN'
   then
     begin
     SWDataModule.DS_AccsForComission.Close;
     end
   else
    begin
    with SWDataModule.DS_AccsForComission do
      begin
        close;
        setVariable('v_acc_no',(Sender as TEdit).Text);
        Open;
      end;
    end;
 end;
end;

procedure TMT103.DBMemo59_nameadressKeyPress(Sender: TObject;
  var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;

begin

if (Sender as TDBMemo).CaretPos.y>3 then key:=#0;


 key := UpCase(Key);
  CPosY:=(Sender as TDBMemo).CaretPos.y;
  s:=(Sender as TDBMemo).text;
  if length(s)>0 then
  (Sender as TDBMemo).text:=s;
  if Length((Sender as TDBMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TDBMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TDBMemo).lines.count-1 do
        begin
          k:=Length((Sender as TDBMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TDBMemo).selstart:=n;
        (Sender as TDBMemo).sellength:=0;
      end else
      begin
        (Sender as TDBMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;



end;

end.
