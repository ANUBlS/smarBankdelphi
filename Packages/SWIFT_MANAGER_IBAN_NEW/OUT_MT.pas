unit OUT_MT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, DBViewComboBox, Grids, DBGrids, ExtCtrls,
  ActnList, Menus, SearchEdit, ExcelXp, OleServer, Mask,
  CurrencyEdit;

type
  TOUT_FORM = class(TForm)
    SwPopupMenu1: TPopupMenu;
    Mtcreate: TMenuItem;
    swActionList: TActionList;
    CreateMessageBegin: TAction;
    viewpanel: TAction;
    PageControl1: TPageControl;
    Header: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    reciverbic: TSearchEdit;
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
    fincopy: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    FIN: TDBViewComboBox;
    GroupBox5: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    DBViewComboBox1: TDBViewComboBox;
    DBViewComboBox2: TDBViewComboBox;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    MainPanel: TPanel;
    MF20: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    MF20_edit: TEdit;
    MF23B: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    MF23b_edit: TEdit;
    MF21: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    MF26T_edit: TEdit;
    MF32A: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit11_mf32a: TEdit;
    mf32_date: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    mf32a_val: TDBViewComboBox;
    MF33B: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    MF33_edit: TEdit;
    mf33_edit2: TEdit;
    MF50: TPanel;
    MF50_main: TPanel;
    Label20: TLabel;
    CMF50: TComboBox;
    MF50K: TPanel;
    Memo2_MF50: TMemo;
    Edit3_MF50: TSearchEdit;
    MF50A: TPanel;
    Memo1_MF50: TMemo;
    Edit1_MF50: TSearchEdit;
    Edit2_MF50: TSearchEdit;
    Memo2: TMemo;
    MF50D: TPanel;
    Memo3_MF50: TMemo;
    Edit4_MF50: TSearchEdit;
    MF52: TPanel;
    MF52_main: TPanel;
    Label21: TLabel;
    CMF52: TComboBox;
    MF52A: TPanel;
    Edit1_MF52: TEdit;
    Memo1_MF52: TMemo;
    Edit2_MF52: TSearchEdit;
    MF52D: TPanel;
    Edit3_MF52: TEdit;
    Memo2_MF52: TMemo;
    MF53: TPanel;
    MF53_main: TPanel;
    Label22: TLabel;
    CMF53: TComboBox;
    Edit6: TEdit;
    MF53A: TPanel;
    Edit1_MF53: TEdit;
    Memo1_MF53: TMemo;
    Edit2_MF53: TSearchEdit;
    MF53B: TPanel;
    Edit3_MF53: TEdit;
    Edit4_MF53: TEdit;
    DBEdit1: TDBEdit;
    MF53D: TPanel;
    Edit5_MF53: TEdit;
    Memo2_MF53: TMemo;
    MF54: TPanel;
    MF54_main: TPanel;
    Label23: TLabel;
    CMF54: TComboBox;
    MF54A: TPanel;
    Edit1_MF54: TEdit;
    Memo1_MF54: TMemo;
    Edit2_MF54: TSearchEdit;
    MF54B: TPanel;
    Edit4_MF54: TEdit;
    Edit5_MF54: TEdit;
    MF54D: TPanel;
    Edit6_MF54: TEdit;
    Memo2_MF54: TMemo;
    MF55: TPanel;
    MF55_main: TPanel;
    Label24: TLabel;
    CMF55: TComboBox;
    MF55A: TPanel;
    Edit1_MF55: TEdit;
    Memo1_MF55: TMemo;
    Edit2_MF55: TSearchEdit;
    MF55B: TPanel;
    Edit3_MF55: TEdit;
    Edit4_MF55: TEdit;
    MF55D: TPanel;
    Edit5_MF55: TEdit;
    Memo2_MF55: TMemo;
    MF56: TPanel;
    MF56_main: TPanel;
    Label25: TLabel;
    CMF56: TComboBox;
    MF56A: TPanel;
    Edit1_MF56: TEdit;
    Memo1_MF56: TMemo;
    Edit2_MF56: TSearchEdit;
    MF56C: TPanel;
    Edit3_MF56: TEdit;
    MF56D: TPanel;
    Edit4_MF56: TEdit;
    Memo2_MF56: TMemo;
    MF57: TPanel;
    MF57_main: TPanel;
    Label26: TLabel;
    CMF57: TComboBox;
    MF57A: TPanel;
    Edit1_MF57: TEdit;
    Memo1_MF57: TMemo;
    Edit2_MF57: TSearchEdit;
    MF57B: TPanel;
    Edit3_MF57: TEdit;
    Edit4_MF57: TEdit;
    MF57C: TPanel;
    Edit5_MF57: TEdit;
    MF57D: TPanel;
    Edit6_MF57: TEdit;
    Memo2_MF57: TMemo;
    MF70: TPanel;
    Label27: TLabel;
    OF70_RichEdit: TRichEdit;
    MF70_Memo: TMemo;
    MF71A: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1_MF71A: TEdit;
    CBox_MF71A: TComboBox;
    MF71F: TPanel;
    MF71F_main: TPanel;
    CheckBox1: TCheckBox;
    New_MF71F: TButton;
    MF71F_1: TPanel;
    Label30: TLabel;
    Edit1_MF71F: TEdit;
    Edit2_MF71F: TEdit;
    Delete1: TButton;
    MF71F_2: TPanel;
    Label31: TLabel;
    Edit3_MF71F: TEdit;
    Edit4_MF71F: TEdit;
    Delete2: TButton;
    MF71F_3: TPanel;
    Label32: TLabel;
    Edit5_MF71F: TEdit;
    Edit6_MF71F: TEdit;
    Delete3: TButton;
    MF72: TPanel;
    Label34: TLabel;
    Label37: TLabel;
    MF72_memo: TMemo;
    OF72_RichEdit: TRichEdit;
    MF77B: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    MF77_memo: TMemo;
    MF71G: TPanel;
    Label38: TLabel;
    Edit1_MF71G: TEdit;
    Edit2_MF71G: TEdit;
    MF59_59A: TPanel;
    MF59_main: TPanel;
    Label33: TLabel;
    CMF59: TComboBox;
    MF59: TPanel;
    Memo2_MF59: TMemo;
    Edit1_MF59: TEdit;
    MF59A: TPanel;
    Edit3_MF59: TSearchEdit;
    edit2_mf59: TEdit;
    Memo1_MF59: TMemo;
    MF36: TPanel;
    Label39: TLabel;
    Edit1: TEdit;
    ComissionAccs_Panel: TPanel;
    ComissionAccs: TDBLookupComboBox;
    ComissionAccs_Label: TLabel;
    Edit7: TEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    ComboBox1: TComboBox;
    Label42: TLabel;
    procedure FINChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CMF50Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MF50Resize(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure New_MF71FClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure Delete3Click(Sender: TObject);
    procedure MtcreateClick(Sender: TObject);
    procedure CreateMessageBeginExecute(Sender: TObject);
    procedure viewpanelExecute(Sender: TObject);
    procedure CMF50Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CMF50Enter(Sender: TObject);
    procedure reciverbicChange(Sender: TObject);
    procedure MF20_editKeyPress(Sender: TObject; var Key: Char);
    procedure MF26T_editKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF50KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF50KeyPress(Sender: TObject; var Key: Char);
    procedure Memo3_MF50KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF52KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF52KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF53KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF53KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF54KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF54KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF55KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF55KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF56KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF56KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF57KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2_MF57KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1_MF59KeyPress(Sender: TObject; var Key: Char);
    procedure MF70_memoKeyPress(Sender: TObject; var Key: Char);
    procedure MF72_memoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF57Change(Sender: TObject);
    procedure Edit2_MF52KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF53KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF54KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF55KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF56KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF57KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2_MF50Change(Sender: TObject);
    procedure Edit2_MF52Change(Sender: TObject);
    procedure Edit2_MF53Change(Sender: TObject);
    procedure Edit2_MF54Change(Sender: TObject);
    procedure Edit2_MF55Change(Sender: TObject);
    procedure Edit2_MF56Change(Sender: TObject);
    procedure Edit3_MF59Change(Sender: TObject);
    procedure mf32a_valChange(Sender: TObject);
    procedure OF70_RichEditChange(Sender: TObject);
    procedure OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
    procedure OF72_RichEditChange(Sender: TObject);
    procedure OF72_RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OF72_RichEditKeyPress(Sender: TObject; var Key: Char);
    procedure CBox_MF71AChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Edit1_MF50Change(Sender: TObject);
    procedure Edit1_MF50Exit(Sender: TObject);
    procedure Edit3_MF50Exit(Sender: TObject);
    procedure Edit4_MF50Exit(Sender: TObject);
    procedure rKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  OUT_FORM: TOUT_FORM;
   isEmpty,CanClose: boolean;
implementation

uses Unit2, SWIFT_MAINImpl1,SBTranslateProc,sboapiDataModuleimpl;

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

Procedure VisibleMain;
var
i:integer;
 begin
   for i:=0 to OUT_FORM.ComponentCount-1 do begin
   if OUT_FORM.Components[i].ClassType=TPanel then
   with SWDataModule.Visible_main do
   SetVariable('panel_name',(out_form.components[i]).name);
   if SWDataModule.Visible_main.RecordCount>0 then
   (OUT_FORM.Components[i] as TPanel).Visible:=True;

   end;
 end;

Procedure InvisibleAllPanels ;
var
i,j:integer;
begin
  For i:=0 to OUT_FORM.ComponentCount-1 do begin
  if OUT_FORM.Components[i].ClassType=TPanel then
  (OUT_FORM.Components[i] as TPanel).Visible:=False;

end;
For j:=0 to OUT_FORM.ComponentCount-1 do begin
  with   swdatamodule.InvisibleAll do begin
  setvariable('Panelname2', OUT_FORM.Components[j].name);

   close;
   open;
   if swdatamodule.mt_select.RecordCount>0  then
   if (OUT_FORM.Components[j].ClassType = TPanel) then
   begin
   (OUT_FORM.Components[j] as TPanel).Visible :=True ;
   (OUT_FORM.Components[j] as TPanel).Visible :=False;
   end;
     end;
      end;
       end;
 
 Procedure InsertComboBoxItems;
var
i,j:integer;

begin
 WITH swDataModule.ComboItems do begin
  SWDataModule.ComboItems.SQL[1]:= 'and '+ out_form.fin.Text +out_form.fincopy.Text+' is not null'+' order by sw_field';
  //ShowMessage(SWDataModule.ComboItems.sql.text);
 end;
For i:=0 to OUT_FORM.ComponentCount-1 do begin // for 1
    if OUT_FORM.Components[i].Name<>'fincopy' then begin
  If OUT_FORM.Components[i].ClassType=TComboBox then  begin
WITH swDataModule.ComboItems do begin
      setvariable('Comboname', OUT_FORM.Components[i].name);
      close;
      open;
              
//if 1
      for j:=1 to swDataModule.ComboItems.RecordCount+1 do begin // for 2
      if (OUT_FORM.Components[i] as TComboBox).ItemIndex<>0 then begin
              if j=1 then begin
             (OUT_FORM.Components[i] as TComboBox).items.add('');


             end else begin
             if (OUT_FORM.Components[i] as TComboBox).Items[j+2]='' then begin
             (OUT_FORM.Components[i] as TComboBox).items.add(swDataModule.ComboItemsCATEGORY.asstring);
             swDataModule.ComboItems.Next;
                end;
              end;
               end;
    end; //end for 2
   end; //end if 1
  end; //end for 1
 end;
 end;
end;

procedure clearcomboitems;
var
i,j:integer;

begin
 WITH swDataModule.ComboItems do begin
  SWDataModule.ComboItems.SQL[1]:= 'and '+ out_form.fin.Text +out_form.fincopy.Text+' is not null'+' order by sw_field';
  //ShowMessage(SWDataModule.ComboItems.sql.text);
 end;
For i:=0 to OUT_FORM.ComponentCount-1 do begin // for 1
if OUT_FORM.Components[i].Name<>'fincopy' then begin
  If OUT_FORM.Components[i].ClassType=TComboBox then  begin
WITH swDataModule.ComboItems do begin
      setvariable('Comboname', OUT_FORM.Components[i].name);
      close;
      open;
              
//if 1
      for j:=1 to swDataModule.ComboItems.RecordCount+1 do begin // for 2
      if (OUT_FORM.Components[i] as TComboBox).ItemIndex<>0 then begin
              if j=1 then begin
             (OUT_FORM.Components[i] as TComboBox).items.Clear;


             end else begin
             if (OUT_FORM.Components[i] as TComboBox).Items[j+2]<>'' then begin
             (OUT_FORM.Components[i] as TComboBox).items.Clear;
             swDataModule.ComboItems.Next;
                end;
              end;
               end;
    end; //end for 2
   end; //end if 1
  end; //end for 1
end;
 end;
 end;
 
Procedure Selectpanel;
var
mestype:string;
begin

    with OUT_FORM do
  begin
  mestype:=FIN.Text+fincopy.Text;

 if mestype='MT103AZN' then
 begin
 MF77B.visible:=false;
 MF71G.Visible:=false;
 MF57.Visible:=false;
 MF56.Visible:=false;
 MF55.Visible:=false;
 MF54.Visible:=false;
 MF53.Visible:=false;
 MF52.Visible:=false;
 ComissionAccs_Panel.Visible:=false;
 MF36.Visible:=false;
 MF33B.Visible:=false;
 MF21.Visible:=false;
 MF71a.Visible:=True;

end ;

if mestype='MT205AZN' then
 begin
 MF57_main.Visible:=true;
  MF21.Visible:=TRUE;
  MF32A.Visible:=TRUE;
  MF36.Visible:=False;
  ComissionAccs_Panel.Visible:=False;
  //MF52.Visible:=False;
  //MF50.Visible:=TRUE;
  MF53.Visible:=False;
  MF54.Visible:=False;
  MF55.Visible:=False;
  MF56.Visible:=False;
  MF57.Visible:=False;
  MF71G.Visible:=False;
  MF77B.visible:=false;
   MF33B.Visible:=false;
   MF23b.Visible:=false;
   MF71a.Visible:=false;
   MF70.Visible:=false;
   MF59_main.Visible:=false;
 end;
 end;

end;

procedure TOUT_FORM.FINChange(Sender: TObject);
var
sonra :string;
begin
 if fin.Text<>'' then
  begin
 sonra:=fincopy.Text;
 if sonra='AZM' then sonra:='AZN';
 OUT_FORM.Caption:=FIN.Text+sonra;

 if  FIN.Text<>'' then FIN.color:=clWindow;
    MainPanel.Visible:=True;
    MainPanel.Repaint;

   CMF50.Items.Clear;
   //CMF52.Items.Clear;
   CMF53.Items.Clear;
   CMF54.Items.Clear;
   CMF55.Items.Clear;
   CMF56.Items.Clear;
   CMF57.Items.Clear;
   CMF59.Items.Clear;
  end;
  if fincopy.Text='AZN' then
  begin
   mf32a_val.Text:='AZN';
   mf32a_val.Enabled:=False;
  end
   else
   begin
   {SWDataModule.valute.Close;
   SWDataModule.valute.SQL[2]:='where valute<>0';
   SWDataModule.valute.Open;
   end;}
   mf32a_val.Text:='';
   mf32a_val.Enabled:=True;
   end; //--end procedure
 end;

procedure TOUT_FORM.PageControl1Change(Sender: TObject);
begin

{if Fin.text='' then
 begin
 PageControl1.ActivePage:=Header;
 FIN.Color:=clred;
 end ;  }

{ if reciverbic.Text='' then
 begin
   PageControl1.ActivePage:=Header;
   reciverbic.Color:=clred;
 end;  }

  PageControl1.ActivePage:=TabSheet1;
 //if (reciverbic.Text<>'') and   (Fin.text<>'' ) then Selectpanel;
end;

procedure TOUT_FORM.CMF50Change(Sender: TObject);
var
name1,selected1:string;
i,j,k:integer;
begin
//ShowMessage(CMF50.Text);
SWDataModule.aftercomboselect.SQL[2]:= ' and '+ fin.Text +fincopy.Text+' is not null'+' order by sw_field';
 SWDataModule.aftercomboselect.Active:=True;
 SWDataModule.Comboselect.Active:=true;
 SWDataModule.aftercomboselect.Refresh;

 SWDataModule.Comboselect.Refresh;
  name1:=(sender as TComboBox).name;
  if (sender as TComboBox).text<>'' then
  selected1:=(sender as TComboBox).text else selected1:='1';

 with SWDataModule.aftercomboselect do begin
 SetVariable('name',name1);
 SetVariable('selected',selected1);

 close;
 open;
 end;
 //ShowMessage( SWDataModule.aftercomboselect.SQL.Text);


   for j:=1 to (sender as TComboBox).items.count do begin
    for i:=0 to OUT_FORM.ComponentCount-1 do
   begin
    if OUT_FORM.Components[i].ClassType = TPanel then
    if (OUT_FORM.Components[i] as TPanel).name=SWDataModule.aftercomboselectSW_FIELD.AsString then
    begin
    (OUT_FORM.Components[i] as TPanel).Visible:=False;
    end;
      end;
       SWDataModule.aftercomboselect.Next;
      end;

 with SWDataModule.Comboselect do begin
 SetVariable('name',name1);
 SetVariable('selected',selected1);

 close;
 open;
 end;
     //   ShowMessage(SWDataModule.ComboselectSW_FIELD.AsString);
   for k:=0 to OUT_FORM.ComponentCount-1 do
   begin
    if OUT_FORM.Components[k].ClassType = TPanel then
    if (OUT_FORM.Components[k] as TPanel).name=SWDataModule.ComboselectSW_FIELD.AsString then
    begin
    (OUT_FORM.Components[k] as TPanel).Visible:=True;

   end ;
  end;
end;

procedure TOUT_FORM.Button1Click(Sender: TObject);
begin

//ShowMessage((Memo2_MF50.Lines[1]));
// Memo1_MF50.Lines.Add(inttostr(CMF50.Items.Count));
end;

procedure TOUT_FORM.MF50Resize(Sender: TObject);
begin
MF50.AutoSize:=True;
end;

procedure TOUT_FORM.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then New_MF71F.Enabled:=True else
  New_MF71F.Enabled:=False;
end;

procedure TOUT_FORM.New_MF71FClick(Sender: TObject);
begin
if MF71F_1.Visible=False then MF71F_1.Visible:=True else
if MF71F_2.Visible=False then MF71F_2.Visible:=True  else
if MF71F_3.Visible=False then MF71F_3.Visible:=True
end;

procedure TOUT_FORM.DBLookupComboBox2Exit(Sender: TObject);
begin
Edit1_MF50.Text:=DBLookupComboBox2.Text;
Edit3_MF50.Text:=DBLookupComboBox2.Text;
Edit4_MF50.Text:=DBLookupComboBox2.Text;
end;

procedure TOUT_FORM.Delete1Click(Sender: TObject);
begin
MF71F_1.Visible:=False;
end;

procedure TOUT_FORM.Delete2Click(Sender: TObject);
begin
MF71F_2.Visible:=False;
end;

procedure TOUT_FORM.Delete3Click(Sender: TObject);
begin
MF71F_3.Visible:=False;
end;



procedure TOUT_FORM.MtcreateClick(Sender: TObject);
begin
MF72_memo.Clear;
MF72_memo.Text:=OF72_RichEdit.Text;

 createmessagebegin.Execute;
 if CanClose then
 OUT_FORM.Close;

end;

procedure TOUT_FORM.CreateMessageBeginExecute(Sender: TObject);
var
m20,m33,mf331,mf332,m23b,m26t,m32a,m36,m50,m52,m53,m54,m55,m56,v_mf20_reference,
m57,m59,m70,m71a,m71f,m71g,m72,m77b,mf20,mf23b,mf26t,mf27,mf32a,mf36,V_sendertype,v_senderbic,
v_senderlt,v_application,v_fincopy,v_messagetype,v_priority,v_monitoring,v_receivertype,v_receiverbic,mf32a_date,mf32a_curr,
mf50_account,mf50_bic,mf50_nameadress,mf52_account,mf52_bic,mf52_nameadress,mf53_account,
mf53_bic,mf53_namelocation,mf54_account,mf54_bic,mf54_namelocation,mf55_account,mf55_bic,mf55_namelocation,
mf56_account,mf56_bic,mf56_namelocation,mf57_account,mf57_bic,mf57_namelocation,mf59_account,mf59_bic,mf59_nameadress,
status,stat7 ,mf70,mf71f_child,mf71g_child,dolmayan,stat1,stat2,stat3,stat4,stat5,stat6,mf71a,mf72,mf77b,voen,str72:Widestring;
mf32a_amount: Real;
begin
CanClose:=True;

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
           if  Edit11_mf32a.text=''  then
                begin
                 dolmayan:=dolmayan + '  MF32A  mebleq,' ;
                 stat3:='exitfromprosedure';
                 end else  stat3:='nextprosedure';
             if CMF50.Text=''   then
               begin
               dolmayan:=dolmayan + '  MF50,' ;
                   stat4:='nextprosedure';
               //stat4:='exitfromprosedure';
               end else  stat4:='nextprosedure';   /// DD



            if CMF57.Text=''   then
               begin
               dolmayan:=dolmayan + '  MF57,' ;
               stat7:='nextprosedure';
               //stat7:='exitfromprosedure';
               end else  stat7:='nextprosedure';   //


              if CMF59.Text=''   then
              begin
                 dolmayan:=dolmayan + '  MF59,';
                 stat5:='nextprosedure';
                  //stat5:='exitfromprosedure';
               end else  stat5:='nextprosedure';    //

              if Edit1_MF71A.Text=''   then
              begin
                 dolmayan:=dolmayan + '  MF71A,';
                  stat6:='exitfromprosedure';
               end else  stat6:='nextprosedure';



             if ((stat1='nextprosedure') and (stat2='nextprosedure') and (stat3='nextprosedure')
              and (stat4='nextprosedure') and (stat5='nextprosedure') and (stat6='nextprosedure') and (stat7='nextprosedure') and (fincopy.text<>'AZN')) or ((stat1='nextprosedure') and (stat2='nextprosedure') and (stat3='nextprosedure')
              and (stat4='nextprosedure') and (stat5='nextprosedure') and (stat6='nextprosedure') and (fincopy.Text='AZN') )  then





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
mf23b:=MF23b_edit.Text;
mf26t:=MF26T_edit.Text;
//mf32a_date:= MF32A_dt.;
mf32a_curr:= mf32a_val.Text;
mf32a_amount:=strtofloat(edit11_mf32a.Text);
if MF33_edit.Text<>'' then
begin
mf331:=MF33_edit.Text;
mf332:=mf33_edit2.Text;
end;
if edit1.Text<>'' then
mf36:=edit1.Text;
v_mf20_reference:=MF20_edit.Text;
v_sendertype:=sendertype.Text;
v_senderbic:=senderlt.Text;
v_senderlt:=senderlt.Text;
v_application:= Application.Text;
v_fincopy:=fincopy.Text;
v_messagetype:= fin.Text;
v_priority:=priority.Text;
v_monitoring:=monitoring.Text;
v_receivertype:=reciverbic.Text;
v_receiverbic:=reciverbic.text;
if MF20_edit.Text<>'' then m20:=':20:' else m20:='';
if MF23b_edit.Text<>'' then m23b:=':23B:' else m23b:='';
if MF26T_edit.Text<>'' then m26t:=':26T:' else m26t:='';
if Edit11_mf32a.Text<>'' then m32a:=':32A:' else m32a:='';
if MF33_edit.Text<>'' then m33:=':33:' else m33:='';
if edit1.Text<>'' then m36:=':36:' else m36:='';

//----------------------------M50 begin----------
if fincopy.Text<>'AZN' then
         begin

if CMF50.ItemIndex=1 then
 begin
 m50:=':50A:';
 mf50_account:=Edit1_MF50.Text;
 mf50_bic:=Edit2_MF50.Text;
 mf50_nameadress:=Memo1_MF50.Text;
 end;

if CMF50.ItemIndex=2 then
 begin;
 m50:=':50F:';
 mf50_account:=Edit4_MF50.Text;
 mf50_nameadress:=Memo2_MF50.Text;
 end;

if CMF50.ItemIndex=3 then
 begin
 //Memo2.Text:=Memo2_MF50.Lines[0]+#13+'TAXID'+' '+Memo2_MF50.Lines[1]+#13+Memo2_MF50.Lines[2]+#13+Memo2_MF50.Lines[3];
 voen:=trim(copy(Memo2_MF50.Lines[1],7,20));

 m50:=':50K:';
 mf50_account:=Edit3_MF50.Text;
 mf50_nameadress:=Memo2_MF50.Text;
 end;

if CMF50.ItemIndex=0 then
 begin
 m50:='' ;
 mf50_account:='';
 mf50_bic:='';
 mf50_nameadress:='';
 end;

 end
 else

 if CMF50.ItemIndex=1 then
 begin
 Memo2.Text:=Memo2_MF50.Text;
 voen:=trim(Memo2_MF50.Lines[1]);

 m50:=':50K:';
 mf50_account:=Edit3_MF50.Text;
 mf50_nameadress:=Memo2.Text;
  end
  else
  begin
 m50:='' ;
 mf50_account:='';
 mf50_bic:='';
 mf50_nameadress:='';
   end;
 //----------------CHECK MF50 ACCOUNT NUMBER-------------------
  SWDataModule.Chk_AccNo.Close;
 if fincopy.text='AZN' then
 begin

  // showmessage(Edit3_MF50.Text);

 SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit3_MF50.Text)    ;
 //showmessage(Edit4_MF50.Text);
// showmessage(Edit1_MF50.Text);

end
  else
  case  CMF50.ItemIndex of
  1:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit1_MF50.Text);
  2:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit4_MF50.Text);
  3:  SWDataModule.Chk_AccNo.SetVariable('acc_no',Edit3_MF50.Text);
  end;
  SWDataModule.Chk_AccNo.Open;
{if SWDataModule.Chk_AccNoCUST_TYPE.IsNull then
begin showmessage('MF50 - Hesab nömrəsi düzgün deyil!'); CanClose:=False; Exit; end
else  }
 begin CanClose:=True;
        if CMF50.ItemIndex=3 then
                case SWDataModule.Chk_AccNoCUST_TYPE.AsInteger of
                 1: begin
                    //Memo2.TEXT:=DBMemo2_MF50.Lines[0]+DBMemo2_MF50.Lines[1]+DBMemo2_MF50.Lines[2]+DBMemo2_MF50.Lines[3];
                    voen:='';
                    end;
                end;
 end;
//-----------------------------------------------------------
if CMF52.ItemIndex=1 then
 begin
 m52:=':52A:';
 mf52_account:=Edit1_MF52.Text;
 mf52_bic:=Edit2_MF52.Text;
 mf52_nameadress:=Memo1_MF52.Text;

 end;
if CMF52.ItemIndex=2 then
 begin
 m52:=':52D:';
 mf52_account:=Edit3_MF52.Text;
 mf52_nameadress:=Memo2_MF52.Text;

 end;
if CMF52.ItemIndex=0 then
 begin
 m52:= '';
 mf52_account:='';
 mf52_bic:='';
 mf52_nameadress:='';
  end;
{if CMF53.ItemIndex=1 then
 begin
 m53:=':53A:';
 mf53_account:=Edit1_MF53.Text;
 mf53_bic:=Edit2_MF53.Text;
 mf53_namelocation:=Memo1_MF53.Text;
 end;
if CMF53.ItemIndex=2 then
 begin
 m53:=':53B:';
 mf53_account:='/'+Edit3_MF53.Text;
 mf53_namelocation:=Edit4_MF53.Text;
 end;
if CMF53.ItemIndex=3 then
 begin
 m53:=':53D:';
 mf53_account:=Edit5_MF53.Text;
 mf53_namelocation:=Memo2_MF53.Text;
 end;
if CMF53.ItemIndex=0 then
 begin
 m53:= '';
 mf53_account:='';
 mf53_namelocation:='';
 end;  }
 if FINCOPY.Text='AZN' then
 begin
  m53:='';
 mf53_account:='';
 end
 else
 begin
 m53:=':53B:';
 mf53_account:=DBEdit1.Text;
 end;

if CMF54.ItemIndex=1 then
 begin
 m54:=':54A:';
 mf54_account:=Edit1_MF54.Text;
 mf54_bic:=Edit2_MF54.Text;
 mf54_namelocation:=Memo1_MF54.Text;
 end;
if CMF54.ItemIndex=2 then
 begin
 m54:=':54B:';
 mf54_account:=Edit4_MF54.Text;
 mf53_namelocation:=Edit5_MF54.Text;
 end;
if CMF54.ItemIndex=3 then
 begin
 m54:=':54D:';
 mf54_account:=Edit6_MF54.Text;
 mf54_namelocation:=Memo2_MF54.Text;
 end;
if CMF54.ItemIndex=0 then
 begin
 m54:= '';
 mf54_account:='';
 mf54_bic:='';
 mf54_namelocation:=''
 end;

if CMF55.ItemIndex=1 then
 begin
 m55:=':55A:';
 mf55_account:=Edit1_MF55.Text;
 mf55_bic:=Edit2_MF55.Text;
 mf55_namelocation:=Memo1_MF55.Text;
 end;
if CMF55.ItemIndex=2 then
 begin
 m55:=':55B:';
 mf55_account:=Edit3_MF55.Text;
 mf55_namelocation:=Edit4_MF55.Text;
 end;
if CMF55.ItemIndex=3 then
 begin
 m55:=':55D:';
 mf55_account:=Edit5_MF55.Text;
 mf55_namelocation:=Memo2_MF55.Text;
 end;
if CMF55.ItemIndex=0 then
 begin
 m55:= '';
 mf55_account:='';
 mf55_bic:='';
 mf55_namelocation:='';
 end;

if CMF56.ItemIndex=1 then
 begin
 m56:=':56A:';
 mf56_account:=Edit1_MF56.Text;
 mf56_bic:=Edit2_MF56.Text;
 mf56_namelocation:=Memo1_MF56.Text;
 end;
if CMF56.ItemIndex=2 then
 begin
 m56:=':56C:';
 mf56_account:=Edit3_MF56.Text;
 end;
if CMF56.ItemIndex=3 then
 begin
 m56:=':56D:';
 mf56_account:=Edit4_MF56.Text;
 mf56_namelocation:=Memo2_MF56.Text;
 end;
if CMF56.ItemIndex=0 then
 begin
 m56:= '';
 mf56_account:='';
 mf56_bic:='';
 mf56_namelocation:='';
 end;

if CMF57.ItemIndex=1 then
 begin
 m57:=':57A:';
 mf57_account:=Edit1_MF57.Text;
 mf57_bic:=Edit2_MF57.Text;
 mf57_namelocation:=Memo1_MF57.Text;
 end;
if CMF57.ItemIndex=2 then
 begin
 m57:=':57B:';
 mf57_account:=Edit3_MF57.Text;
 mf57_namelocation:=Edit4_MF57.Text;
 end;
if CMF57.ItemIndex=3 then
 begin
 m57:=':57C:';
 mf57_account:=Edit5_MF57.Text;
 end;
if CMF57.ItemIndex=4 then
 begin
 m57:=':57D:';
 mf57_account:=Edit6_MF57.Text;
 mf57_namelocation:=Memo2_MF57.Text
 end;
if CMF57.ItemIndex=0 then
 begin
 m57:= '';
 mf57_account:='';
 mf57_bic:='';
 mf57_namelocation:='';
 end;

if CMF59.ItemIndex=1 then
 begin
 m59:=':59:';
 mf59_account:=Edit1_MF59.Text;
 mf59_nameadress:=Memo2_MF59.Text;
 end;
if CMF59.ItemIndex=2 then
 begin
 m59:=':59A:';
 mf59_account:=Edit2_MF59.Text;
 mf59_bic:= Edit3_MF59.Text;
 mf59_nameadress:=Memo1_MF59.Text;
 end;
if CMF59.ItemIndex=0 then
 begin
 m59:= '';
 mf59_account:='';
 mf59_nameadress:='';
 end;
if OF70_RichEdit.Text<>'' then
begin
m70:=':70:';
mf70:=trim(OF70_RichEdit.Text);
end
else m70:='';
if Edit1_MF71A.Text<>'' then
begin
m71a:=':71A:';
mf71a:=Edit1_MF71A.Text;
end
else m71a:='';
if (Edit1_MF71F.Text<>'') or (Edit3_MF71F.Text<>'') or (Edit5_MF71F.Text<>'')
then
begin
m71f:=':71F:';
mf71f_child:=Edit1_MF71F.Text+'|'+Edit2_MF71F.Text;
end
 else m71f:='';

if Edit1_MF71G.Text<>'' then
begin
m71g:=':71G:';
mf71g_child:=Edit1_MF71G.Text+'|'+Edit2_MF71G.Text;
end
else m71g:='';

if MF72_memo.Text<>'' then
 begin
 m72:=':72:';
 mf72:=trim(OF72_RichEdit.Text);
 end
 else m72:='';

IF MF77_memo.Text<>'' THEN
begin
M77B:=':77B:';
mf77b:=MF77_memo.Text;
end;
//showmessage(inttostr(ComissionAccs.KeyValue));
{SWDataModule.sw_in_insert.CallProcedure ('insert_out',[  mf20,v_mf20_reference,mf23b,mf26t,mf27,mf32a,mf36,v_sendertype,v_senderbic,
                                                         v_senderlt,v_application,v_fincopy,v_messagetype,v_priority,
                                                         v_monitoring,v_receivertype,v_receiverbic,strtodate(datetostr(mf32_date.Date)),mf32a_curr,
                                                         mf32a_amount,mf50_account,mf50_bic,mf50_nameadress,
                                                         mf52_account,mf52_bic,mf52_nameadress,mf53_account,
                                                         mf53_bic,mf53_namelocation,mf54_account,mf54_bic,
                                                         mf54_namelocation,mf55_account,mf55_bic,mf55_namelocation,
                                                         mf56_account,mf56_bic,mf56_namelocation,mf57_account,
                                                         mf57_bic,mf57_namelocation,mf59_account,mf59_bic,mf59_nameadress,
                                                         status ,mf71f_child,mf71g_child,m20, m23b, m26t, m32a,
                                                         m36,m50,m52,m53,m54,m55,m56,m57,m59,m70,mf70,m71a,m71f,m71g,m72,
                                                         m77b,3,mf71a,mf72,mf77b,voen,DBViewComboBox1.text,ComissionAccs.KeyValue
                                                             ]);     }

            if v_messagetype='MT103' then     begin

    SWDataModule.sw_in_insert.CallProcedure('savetransaction',[ datetostr(mf32_date.Date),
                                              v_mf20_reference,
                                              mf50_account,
                                              v_receiverbic,
                                              edit2.Text,
                                              mf59_account,
                                              mf59_nameadress,
                                              v_fincopy,
                                              OF70_RichEdit.Text,
                                              OF72_RichEdit.Text,
                                              mf32a_amount,
                                              0,
                                              1,
                                              mf50_nameadress,
                                              mf59_nameadress ,
                                              edit3.Text,
                                              v_receiverbic,
                                              mf50_nameadress,
                                              mf59_nameadress,
                                             'AZN']  );
            end else

            begin
               SWDataModule.sw_in_insert.CallProcedure('saving205',[ datetostr(mf32_date.Date),
                                                                        reciverbic.Text,
                                                                        v_mf20_reference,
                                                                        MF26T_edit.Text,
                                                                        mf32a_amount,
                                                                         mf50_nameadress,
                                                                         mf59_nameadress,
                                                                         OF70_RichEdit.Text,
                                                                         edit2.Text,
                                                                         v_sendertype,
                                                                         fincopy.Text,
                                                                         25
                                                                                            ]  );
            end;
SWDataModule.sw_out.Open;
SWDataModule.sw_out.Refresh;
SWDataModule.sw_out_2.Open;
SWDataModule.sw_out_2.Refresh;
SWDataModule.sw_out3.Open;
SWDataModule.sw_out3.Refresh;
                   end else  begin
                          ShowMessage(' '+dolmayan+ ' Xanalar doldurulmayıb!') ;
                         CanClose:=False;
                         end;





end;

procedure TOUT_FORM.viewpanelExecute(Sender: TObject);
var
i:integer;

begin
//ShowMessage(fin.Text );
    with SWDataModule.OracleDataSet1 do
    close;
    SWDataModule.OracleDataSet1.sql.Clear;
    SWDataModule.OracleDataSet1.sql.Add('select * from sw_fields where sw_main_field=''00'' and '+fin.text+' is not null');
//SWDataModule.OracleDataSet1.sql[2]:=(' and '+ fin.Text +' is not null');
  showmessage(SWDataModule.OracleDataSet1.SQL.Text);
with SWDataModule.OracleDataSet1 do
begin

Open;
end;
for i:=0 to OUT_FORM.ComponentCount-1 do begin
  if (OUT_FORM.Components[i].ClassType)=TPanel then
  if (Out_form.Components[i] as Tpanel).Name= SWDataModule.OracleDataSet2SW_FIELD.asstring
  then (OUT_FORM.Components[i] as TPanel).Visible:=True;

 end;
end;

procedure TOUT_FORM.CMF50Click(Sender: TObject);
begin
InsertComboBoxItems;
end;

procedure TOUT_FORM.FormActivate(Sender: TObject);
var a : integer;
begin
PageControl1.ActivePage:=Header;
senderlt.Text:=SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
sendertype.Text:='Institution';
ComboBox2.Text:= SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
recivertype.Text:='Institution';
Application.Text:='FIN';
priority.Text:='N';
monitoring.Text:='N';
mf32_date.DateTime:=date;
SWDataModule.MT.Open;


fincopy.itemindex:=1;

fin.ItemIndex:=0;
fincopy.OnChange:=finchange;
mf32a_val.Text:='AZN';
   mf32a_val.Enabled:=False;


{MainPanel.visible:=True;
FIN.Text:='MT103';
MF20.Visible:=True;
MF23B.Visible:=True;
MF26T.Visible:=True;
MF32A.Visible:=True;
MF33B.Visible:=True;
MF50.Visible:=True;
MF50_main.Visible:=True;
MF52.Visible:=True;
MF52_main.Visible:=True;
MF53.Visible:=True;
MF54_main.Visible:=True;
MF55.Visible:=True;
MF55_main.Visible:=True;
MF56.Visible:=True;
MF56_main.Visible:=True;
MF57.Visible:=True;
MF57_main.Visible:=True;
MF59.Visible:=True;
MF59_main.Visible:=True;
MF70.Visible:=True;
MF71A.Visible:=True;
MF71F_main.Visible:=True;
MF71G.Visible:=True;
MF72.Visible:=True;
MF77B.Visible:=True; }


end;

procedure TOUT_FORM.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TOUT_FORM.CMF50Enter(Sender: TObject);
begin
if (Sender as TComboBox).Items.Count=0 then
InsertComboBoxItems;

end;

procedure TOUT_FORM.reciverbicChange(Sender: TObject);
begin
Edit2.Text:= SWDataModule.banks.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.banks.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.banks.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.banks.fieldbyname('country').asstring;
if reciverbic.Text='' then
 begin
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
 end;
end;

procedure TOUT_FORM.MF20_editKeyPress(Sender: TObject; var Key: Char);
var
len:string;
begin
 len:=MF20_edit.Text;
  if (Length(len)=16) and (key<>#8) then Key:=#0;

  end;

procedure TOUT_FORM.MF26T_editKeyPress(Sender: TObject; var Key: Char);
begin
//if Length(MF26T_edit.Text)=3 then key:=null;
end;

procedure TOUT_FORM.Memo1_MF50KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;

begin

if (Sender as TMemo).CaretPos.y>3 then key:=#0;


 key := UpCase(Key);
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
  if length(s)>0 then
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;



end;

procedure TOUT_FORM.Memo2_MF50KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo3_MF50KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF52KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF52KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF53KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF53KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF54KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF54KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF55KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF55KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF56KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF56KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF57KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo2_MF57KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  (Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.Memo1_MF59KeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  //(Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;
end;

procedure TOUT_FORM.MF70_memoKeyPress(Sender: TObject; var Key: Char);
var
  i,n,k,CPosY :integer;
  s:string;
begin
  key := UpCase(Key);
  if (key=#13) or (key=#8) then exit;
  CPosY:=(Sender as TMemo).CaretPos.y;
  s:=(Sender as TMemo).text;
//  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  if length(s)>0 then
  if ((s[length(s)]=#13) or (s[length(s)]=#10)) then delete(s,length(s),1);
  //(Sender as TMemo).text:=s;
  if Length((Sender as TMemo).Lines[CPosY])>=35 then
  begin
    if CPosY<3 then
    begin
      if CPosY<(Sender as TMemo).lines.Count-1 then
      begin
        n:=0;
        for i:=0 to (Sender as TMemo).lines.count-1 do
        begin
          k:=Length((Sender as TMemo).Lines[i]);
          n:=n+k;
          if k<35 then break;
          n:=n+2;
        end;
        (Sender as TMemo).selstart:=n;
        (Sender as TMemo).sellength:=0;
      end else
      begin
        (Sender as TMemo).lines.Add(key);
        key:=#0;
      end;
    end else
    key:=#0;
  end;

end;


procedure TOUT_FORM.MF72_memoKeyPress(Sender: TObject; var Key: Char);

var
  i,n,k,CPosY :integer;
  s:string;
begin
end;


procedure TOUT_FORM.Edit2_MF57Change(Sender: TObject);
begin
if (Edit2_MF57.Text='') or (Edit2_MF57.Color=clred) then
begin
Memo1_mf57.Lines[0]:= '';
Memo1_mf57.Lines[1]:= '';
end
else
begin
Memo1_MF57.Clear;
Memo1_MF57.Lines.add( SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF57.Lines.add( SWDataModule.banks.fieldbyname('city').asstring);
end;

//Memo1_MF57.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
//Memo1_MF57.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
//Memo1_MF57.Lines[2]:= SWDataModule.banks.fieldbyname('address').asstring;
//Memo1_MF57.Lines[3]:= SWDataModule.banks.fieldbyname('country').asstring;
end;

procedure TOUT_FORM.Edit2_MF52KeyPress(Sender: TObject; var Key: Char);
begin
{if Key=#13 then
begin
Memo1_mf52.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_mf52.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF52.Text='') or (Edit2_MF52.Color=clred) then
begin
Memo1_mf52.Lines[0]:= '';
Memo1_mf52.Lines[1]:= '';
end;
end;   }
end;

procedure TOUT_FORM.Edit2_MF53KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
Memo1_MF53.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_MF53.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF53.Text='') or (Edit2_MF53.Color=clred) then
begin
Memo1_mf53.Lines[0]:= '';
Memo1_mf53.Lines[1]:= '';
end;
end;  }

end;

procedure TOUT_FORM.Edit2_MF54KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
Memo1_MF54.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_MF54.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF54.Text='') or (Edit2_MF54.Color=clred) then
begin
Memo1_mf54.Lines[0]:= '';
Memo1_mf54.Lines[1]:= '';
end;
end;}
end;

procedure TOUT_FORM.Edit2_MF55KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
Memo1_MF55.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_MF55.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF55.Text='') or (Edit2_MF55.Color=clred) then
begin
Memo1_mf55.Lines[0]:= '';
Memo1_mf55.Lines[1]:= '';
end;
end;
}
end;

procedure TOUT_FORM.Edit2_MF56KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
Memo1_MF56.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_MF56.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF56.Text='') or (Edit2_MF56.Color=clred) then
begin
Memo1_mf56.Lines[0]:= '';
Memo1_mf56.Lines[1]:= '';
end;
end;  }
end;

procedure TOUT_FORM.Edit2_MF57KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
Memo1_MF57.Lines[0]:= SWDataModule.banks.fieldbyname('name').asstring;
Memo1_MF57.Lines[1]:= SWDataModule.banks.fieldbyname('city').asstring;
if (Edit2_MF57.Text='') or (Edit2_MF57.Color=clred) then
begin
Memo1_mf57.Lines[0]:= '';
Memo1_mf57.Lines[1]:= '';
end;
end;   }
end;

procedure TOUT_FORM.Edit2_MF50Change(Sender: TObject);
begin
if (Edit2_MF50.Text='') or (Edit2_MF50.Color=clred) then
Memo1_mf50.Clear
else
begin
Memo1_mf50.Clear;
Memo1_mf50.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_mf50.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;

end;

procedure TOUT_FORM.Edit2_MF52Change(Sender: TObject);
begin
if (Edit2_MF52.Text='') or (Edit2_MF52.Color=clred) then
begin
Memo1_mf52.Lines[0]:= '';
Memo1_mf52.Lines[1]:= '';
end
else
begin
Memo1_mf52.Clear;
Memo1_mf52.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_mf52.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;
end;

procedure TOUT_FORM.Edit2_MF53Change(Sender: TObject);
begin
if (Edit2_MF53.Text='') or (Edit2_MF53.Color=clred) then
begin
Memo1_mf53.Lines[0]:= '';
Memo1_mf53.Lines[1]:= '';
end
else
begin
Memo1_MF53.Clear;
Memo1_MF53.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF53.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;
end;

procedure TOUT_FORM.Edit2_MF54Change(Sender: TObject);
begin
if (Edit2_MF54.Text='') or (Edit2_MF54.Color=clred) then
begin
Memo1_mf54.Lines[0]:= '';
Memo1_mf54.Lines[1]:= '';
end
else
begin
Memo1_MF54.Clear;
Memo1_MF54.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF54.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;

end;

procedure TOUT_FORM.Edit2_MF55Change(Sender: TObject);
begin
if (Edit2_MF55.Text='') or (Edit2_MF55.Color=clred) then
begin
Memo1_mf55.Lines[0]:= '';
Memo1_mf55.Lines[1]:= '';
end
else
begin
Memo1_MF55.Clear;
Memo1_MF55.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF55.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;
end;

procedure TOUT_FORM.Edit2_MF56Change(Sender: TObject);
begin
if (Edit2_MF56.Text='') or (Edit2_MF56.Color=clred) then
begin
Memo1_mf56.Lines[0]:= '';
Memo1_mf56.Lines[1]:= '';
end
else
begin
Memo1_MF56.Clear;
Memo1_MF56.Lines.Add( SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF56.Lines.add( SWDataModule.banks.fieldbyname('city').asstring);
end;
end;

procedure TOUT_FORM.Edit3_MF59Change(Sender: TObject);
begin
if (Edit3_MF59.Text='') or (Edit3_MF59.Color=clred) then
Memo1_mf59.Clear
else
begin
Memo1_MF59.Clear;
Memo1_MF59.Lines.add(SWDataModule.banks.fieldbyname('name').asstring);
Memo1_MF59.Lines.add(SWDataModule.banks.fieldbyname('city').asstring);
end;

end;

procedure TOUT_FORM.mf32a_valChange(Sender: TObject);
begin
SWDataModule.CORR.Close;
SWDataModule.CORR.SetVariable('v',mf32a_val.text);
SWDataModule.CORR.SetVariable('b',reciverbic.text);
SWDataModule.CORR.Open;
end;

procedure TOUT_FORM.OF70_RichEditChange(Sender: TObject);
begin
GetRichEditLine(OF70_RichEdit);
end;

procedure TOUT_FORM.OF70_RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if  (length(trim((Sender as TRichEdit).Text))>147) and not(key  in [vk_delete, vk_back]) then key:=0;
end;

procedure TOUT_FORM.OF70_RichEditKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then key:=#0;
end;

procedure TOUT_FORM.OF72_RichEditChange(Sender: TObject);
begin
	GetRichEditLine2(OF72_RichEdit);
end;

procedure TOUT_FORM.OF72_RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var r: Longint;
begin
   SendMessage(OF72_RichEdit.Handle, EM_GETSEL, Longint(@R), 0);

   if (r in [0..4]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [1..5]) and (key in [vk_back])  then begin key:=0;  end;
   if (r in [35,72,109,146,183]) and (key in [vk_delete])  then begin key:=0;  end;
   if (r in [36..38,73..75,110..112,147..149,184..186]) and (key in [vk_delete, vk_back])  then begin key:=0;  end;
   if (r in [39,76,113,150,187]) and (key in [ vk_back])  then begin key:=0;  end;

   if  length(trim((Sender as TRichEdit).Text))=0 then isEmpty:=true else isEmpty :=false;
   if  (length(trim((Sender as TRichEdit).Text))>216) and not(key  in [vk_delete, vk_back]) then key:=0;

end;

procedure TOUT_FORM.OF72_RichEditKeyPress(Sender: TObject; var Key: Char);
  var r : Longint;
begin
     if key=#13 then key:=#0;
     SendMessage(OF72_RichEdit.Handle, EM_GETSEL, Longint(@R), 0);
     if (r in [1..5])  then begin key:=#0;  end;

     if (r in [35..38,72..75,109..112,146..149,183..186])and
     ((OF72_RichEdit.Text[r-1]='/')or(OF72_RichEdit.Text[r+1]='/')) then key:=#0;

end;

procedure TOUT_FORM.CBox_MF71AChange(Sender: TObject);
begin
Edit1_MF71A.Text:=CBox_MF71A.Text;
end;

procedure TOUT_FORM.TabSheet1Show(Sender: TObject);
begin
if FINCOPY.Text='AZN' then
begin
CBox_MF71A.Enabled:=False;
CBox_MF71A.ItemIndex:=0;
end
else
begin
CBox_MF71A.Enabled:=True;
CBox_MF71A.ItemIndex:=0;
end;
MainPanel.AutoSize:=False;
MainPanel.AutoSize:=True;


end;

procedure TOUT_FORM.Edit1_MF50Change(Sender: TObject);
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

procedure TOUT_FORM.Edit1_MF50Exit(Sender: TObject);
begin
if ((Sender as TEdit).Color=clred) then (Sender as TEdit).Clear;
end;

procedure TOUT_FORM.Edit3_MF50Exit(Sender: TObject);
begin
if ((Sender as TEdit).Color=clred) then (Sender as TEdit).Clear;
end;

procedure TOUT_FORM.Edit4_MF50Exit(Sender: TObject);
begin
if ((Sender as TEdit).Color=clred) then (Sender as TEdit).Clear;
end;

procedure TOUT_FORM.Edit7Enter(Sender: TObject);
begin
with SWDataModule.DS_AccsForComission do
      begin
        close;
        setVariable('v_acc_no',edit7.Text);
        Open;
      end;
end;

procedure TOUT_FORM.rKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
    key :=#0;
end;

end.
