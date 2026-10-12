unit formmt103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, SearchEdit, ComCtrls, ExtCtrls, DBViewComboBox,
  Menus, DBCtrlsEh;

type
  TMT103AZN = class(TForm)
    PageControl1: TPageControl;
    Header: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sendertype: TComboBox;
    ComboBox2: TComboBox;
    recivertype: TComboBox;
    senderlt: TComboBox;
    monitoring: TComboBox;
    Application: TComboBox;
    priority: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox5: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    MainPanel: TPanel;
    MF20: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    MF23B: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    MF32A: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    mf32_date: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    mf32a_val: TDBViewComboBox;
    MF50: TPanel;
    MF50_main: TPanel;
    Label20: TLabel;
    MF50K: TPanel;
    Edit3_MF50: TSearchEdit;
    MF70: TPanel;
    Label27: TLabel;
    MF71A: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1_MF71A: TEdit;
    MF72: TPanel;
    Label34: TLabel;
    Label37: TLabel;
    MF71G: TPanel;
    Label38: TLabel;
    Edit1_MF71G: TEdit;
    Edit2_MF71G: TEdit;
    MF59_59A: TPanel;
    MF59_main: TPanel;
    Label33: TLabel;
    CMF59: TComboBox;
    MF59: TPanel;
    MF59A: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit8: TDBEdit;
    PopupMenu1: TPopupMenu;
    Change1: TMenuItem;
    Edit1: TEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBMemo3: TDBMemo;
    reciverbic: TSearchEdit;
    DBEdit12: TDBEdit;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBLookupComboBox3: TDBLookupComboBox;
    OF70_RichEdit: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit1: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Change1Click(Sender: TObject);
    procedure CMF59Change(Sender: TObject);
    procedure reciverbicChange(Sender: TObject);
    procedure Edit3_MF50Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBMemo3KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo4KeyPress(Sender: TObject; var Key: Char);
    procedure OF70_RichEditChange(Sender: TObject);
    procedure OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit3Change(Sender: TObject);
    procedure RichEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MT103AZN: TMT103AZN;
  isEmpty : boolean;
implementation

uses Unit2;

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


procedure TMT103AZN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SWDataModule.sw_out.Cancel;
end;

procedure TMT103AZN.Change1Click(Sender: TObject);
begin
if CMF59.Text='Field - 59A' then
begin
DBMemo5.Text:=RichEdit1.Text;
end;

DBMemo2.Clear;
DBMemo2.Text:=trim(OF70_RichEdit.TEXT);

DBMemo4.Clear;
DBMemo4.Text:=trim(RichEdit3.Text);

SWDataModule.sw_out.Post;
Close;
end;

procedure TMT103AZN.CMF59Change(Sender: TObject);
begin
if CMF59.ItemIndex=1  then
begin
//CMF59.ItemIndex:=1;
MF59.Visible:=True;
MF59A.Visible:=False;
end;
if CMF59.ItemIndex=2  then
begin
//CMF59.ItemIndex:=2;
MF59.Visible:=False;
MF59A.Visible:=True;
end;
end;

procedure TMT103AZN.reciverbicChange(Sender: TObject);
begin
Edit2.Text:= SWDataModule.banks.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.banks.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.banks.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.banks.fieldbyname('country').asstring;
DBEdit1.Text:=reciverbic.Text;
end;

procedure TMT103AZN.Edit3_MF50Change(Sender: TObject);
begin
DBEdit12.Text:=Edit3_MF50.Text;
end;

procedure TMT103AZN.DBLookupComboBox2Click(Sender: TObject);
begin
DBMemo5.Visible:=False;
RichEdit1.Visible:=True;
RichEdit1.Lines[0]:=copy(SWDataModule.banks.fieldbyname('name').asstring,1,35);
RichEdit1.Lines[1]:=SWDataModule.banks.fieldbyname('city').asstring;
end;

procedure TMT103AZN.FormActivate(Sender: TObject);
begin
reciverbic.Text:=DBEdit1.Text;
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
Edit3_MF50.Text:=DBEdit12.Text;
mf32a_val.Text:='AZN';
//MF70_memo silmishem
OF70_RichEdit.Lines[0]:=DBmemo2.Lines[0];
OF70_RichEdit.Lines[1]:=DBmemo2.Lines[1];
OF70_RichEdit.Lines[2]:=DBmemo2.Lines[2];
OF70_RichEdit.Lines[3]:=DBmemo2.Lines[3];

RichEdit3.Lines[0]:=DBMemo4.Lines[0];
RichEdit3.Lines[1]:=DBMemo4.Lines[1];
RichEdit3.Lines[2]:=DBMemo4.Lines[2];
RichEdit3.Lines[3]:=DBMemo4.Lines[3];
RichEdit3.Lines[4]:=DBMemo4.Lines[4];
RichEdit3.Lines[5]:=DBMemo4.Lines[5];


end;

procedure TMT103AZN.PageControl1Change(Sender: TObject);
begin
DBLookupComboBox2.CanFocus;
end;

procedure TMT103AZN.DBLookupComboBox3Enter(Sender: TObject);
begin

//DBEdit1.Text:=reciverbic.Text;
end;

procedure TMT103AZN.DBLookupComboBox3Click(Sender: TObject);
begin
Edit2.Text:= SWDataModule.banks.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.banks.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.banks.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.banks.fieldbyname('country').asstring;
end;

procedure TMT103AZN.DBMemo3KeyPress(Sender: TObject; var Key: Char);
{var
  i,n,k,CPosY :integer;
  s:string;

begin



 if (Length(DBMemo1.text)>145) and (key<>#8)
  then
  begin
  key:=#0;
  end;


if (Sender as TDBMemo).CaretPos.y>3 then key:=#0;


 key := UpCase(Key);
  //if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TDBMemo).CaretPos.y;
  s:=(Sender as TDBMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  //if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
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

   }
   var
  i,n,k,CPosY :integer;
  a,s,t:string;

begin


 if (Length((Sender as TDBMemo).text)>145) and (key<>#8)
  then
  begin
  key:=#0;
  end;

if ((Sender as TDBMemo).CaretPos.y>3) and (key=#8) then key:=#0;


 key := UpCase(Key);
  //if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TDBMemo).CaretPos.y;
  s:=(Sender as TDBMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  //if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TDBMemo).text:=s;
  if (Length((Sender as TDBMemo).Lines[CPosY])>=35) then
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

procedure TMT103AZN.DBMemo4KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;

begin
if (Sender as TDBMemo).CaretPos.y>5 then key:=#0;


 key := UpCase(Key);

  CPosY:=(Sender as TDBMemo).CaretPos.y;
  s:=(Sender as TDBMemo).text;

  if length(s)>0 then

  (Sender as TDBMemo).text:=s;

  if CPosY<>0 then
  begin
  //------------------------------------------------------
  if Length((Sender as TDBMemo).Lines[CPosY])>=33 then
  begin
    if CPosY<5 then
    begin
      if CPosY<(Sender as TDBMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TDBMemo).lines.count-1 do
        begin
          k:=Length((Sender as TDBMemo).Lines[i]);
          n:=n+k;
          if k<33 then break;
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

  //----------------------------------
  end else
  if  CPosY<>5 then
  begin
     if Length((Sender as TDBMemo).Lines[CPosY])>=30 then
  begin
    if CPosY<5 then
    begin
      if CPosY<(Sender as TDBMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TDBMemo).lines.count-1 do
        begin
          k:=Length((Sender as TDBMemo).Lines[i]);
          n:=n+k;
          if k<30 then break;
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

//------------------------------------------------

    if  CPosY=5 then
  begin
     if Length((Sender as TDBMemo).Lines[CPosY])>=27 then
  begin
    if CPosY<5 then
    begin
      if CPosY<(Sender as TDBMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TDBMemo).lines.count-1 do
        begin
          k:=Length((Sender as TDBMemo).Lines[i]);
          n:=n+k;
          if k<27 then break;
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

//----------------------------------------------



end;




procedure TMT103AZN.OF70_RichEditChange(Sender: TObject);
begin
GetRichEditLine(OF70_RichEdit);
end;



procedure TMT103AZN.OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  length(trim((Sender as TRichEdit).Text))>148 then key:=0;
end;

procedure TMT103AZN.OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then key:=#0;
end;

procedure TMT103AZN.RichEdit3Change(Sender: TObject);
begin
	GetRichEditLine2(RichEdit3);
end;

procedure TMT103AZN.RichEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
     var r :integer;
begin
   SendMessage(RichEdit3.Handle, EM_GETSEL, Longint(@R), 0);

   if (r in [0..4]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [1..5]) and (key in [vk_back])  then begin key:=0;  end;
   if (r in [35,72,109,146,183]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [36..38,73..75,110..112,147..149,184..186]) and (key in [vk_delete, vk_back])  then begin key:=0;  end;
   if (r in [39,76,113,150,187]) and (key in [ vk_back])  then begin key:=0;  end;

   if  length(trim((Sender as TRichEdit).Text))=0 then isEmpty:=true else isEmpty :=false;
   if  (length(trim((Sender as TRichEdit).Text))>216) and not(key  in [vk_delete, vk_back]) then key:=0;

end;

procedure TMT103AZN.RichEdit3KeyPress(Sender: TObject; var Key: Char);
var r: integer;
begin
     if key=#13 then key:=#0;
     SendMessage(RichEdit3.Handle, EM_GETSEL, Longint(@R), 0);
     if (r in [1..5])  then begin key:=#0;  end;

     if (r in [35..38,72..75,109..112,146..149,183..186])and
     ((RichEdit3.Text[r-1]='/')or(RichEdit3.Text[r+1]='/')) then key:=#0;

end;

procedure TMT103AZN.TabSheet1Show(Sender: TObject);
begin
if SWDataModule.sw_outM59.AsString=':59:'  then
begin
CMF59.ItemIndex:=1;
MF59.Visible:=True;
MF59A.Visible:=False;
end;
if SWDataModule.sw_outM59.AsString=':59A:' then
begin
CMF59.ItemIndex:=2;
MF59.Visible:=False;
MF59A.Visible:=True;
//RichEdit1.Text:=DBMemo5.Text;
DBLookupComboBox2.CanFocus;

end;
end;

procedure TMT103AZN.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
    key :=#0;
end;

end.
