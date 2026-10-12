unit KreditSetImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, DBCtrls,
  Buttons, CMHintBox,DB, DBGridEh;

type
  TFrmKreditSet = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel63: TPanel;
    Label137: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Panel64: TPanel;
    Label139: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel62: TPanel;
    Label135: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Panel65: TPanel;
    Label141: TLabel;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Panel9: TPanel;
    Label14: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Panel18: TPanel;
    Label30: TLabel;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    Panel66: TPanel;
    Label150: TLabel;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    Panel19: TPanel;
    Label2: TLabel;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    Panel33: TPanel;
    Label3: TLabel;
    DBLookupComboboxEh13: TDBLookupComboboxEh;
    Panel21: TPanel;
    Label33: TLabel;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    Panel32: TPanel;
    Label71: TLabel;
    DBLookupComboboxEh10: TDBLookupComboboxEh;
    Panel44: TPanel;
    Label56: TLabel;
    DBLookupComboboxEh25: TDBLookupComboboxEh;
    P1: TPanel;
    Label4: TLabel;
    BranchCBEh: TDBLookupComboboxEh;
    R1: TCheckBox;
    Panel11: TPanel;
    R9: TCheckBox;
    Panel6: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Panel7: TPanel;
    Label7: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Panel8: TPanel;
    Label9: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    R3: TCheckBox;
    R4: TCheckBox;
    R5: TCheckBox;
    Panel12: TPanel;
    Label18: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    R6: TCheckBox;
    Panel13: TPanel;
    Label20: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    R7: TCheckBox;
    Panel69: TPanel;
    Label11: TLabel;
    DBLookupComboboxEh12: TDBLookupComboboxEh;
    Panel10: TPanel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    R10: TCheckBox;
    R11: TCheckBox;
    Panel14: TPanel;
    Label22: TLabel;
    DBNumberEditEh4: TDBNumberEditEh;
    P2: TPanel;
    Label8: TLabel;
    DBLookupComboboxEh14: TDBLookupComboboxEh;
    R2: TCheckBox;
    Label10: TLabel;
    DBNumberEditEh5: TDBNumberEditEh;
    R8: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    DBLookupComboboxEh11: TDBLookupComboboxEh;
    Panel5: TPanel;
    Label12: TLabel;
    DBLookupComboboxEh15: TDBLookupComboboxEh;
    HBConclusion: TCMHintBox;
    Label13: TLabel;
    DBLookupComboboxEh16: TDBLookupComboboxEh;
    F1: TCheckBox;
    F2: TCheckBox;
    F3: TCheckBox;
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure DBLookupComboboxEh3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
  private
    { Private declarations }
       procedure CheckFields;
  public
    { Public declarations }
  end;

var
  FrmKreditSet: TFrmKreditSet;

implementation

{$R *.dfm}
uses Dmretsetitnq, ShecudileImpl;
procedure TFrmKreditSet.DBLookupComboboxEh1Change(Sender: TObject);
begin
if DBLookupComboboxEh1.text<> '' then
begin
   dmrt.creditcatData.close;
   dmrt.creditcatData.SetVariable('vid_sob',dmrt.EstateTypeData.fieldbyname('id').asinteger);
   dmrt.creditcatData.open;
end;end   ;

procedure TFrmKreditSet.DBLookupComboboxEh2Change(Sender: TObject);
begin
   dmrt.DataSetActivities.close;
   dmrt.DataSetActivities.SetVariable('act_id',DBLookupComboboxEh2.keyValue);
   dmrt.DataSetActivities.open;
end;

procedure TFrmKreditSet.DBLookupComboboxEh3Change(Sender: TObject);
begin
   dmrt.ClientCategories.close;
   dmrt.ClientCategories.SetVariable('act_id',DBLookupComboboxEh3.keyValue);
   dmrt.ClientCategories.open;
end;

procedure TFrmKreditSet.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TFrmKreditSet.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=13 then
 FrmKreditSet.Close;
end;

procedure TFrmKreditSet.FormShow(Sender: TObject);
var  i: Word;id :integer;
begin
  with DmRt do
   begin
    id:= PersonLink.FieldByName('id').AsInteger;
    comp.Close  ;
    comp.SetVariable('mehid',id) ;
    comp.open;
   end;
   for i :=0 to ComponentCount- 1 do begin
   if (Components[i].ClassType = TCheckBox) then
  begin
   (Components[i] as TCheckBox).Checked:=true;
    DmRt.comp.Close  ;
    DmRt.comp.sql[3]:='and name ='+''''+ (Components[i] as TCheckBox).Name+'''';
    DmRt.comp.open;
     if DmRt.comp.RecordCount>0 then
   (Components[i] as TCheckBox).Checked:= DmRt.comp.FieldByName('status').AsBoolean;
   end;
   end;
if  DmRt.PersonLinkF1.asinteger=0 then
 f1.Checked:=false
 else
 f1.Checked:=true;

if  DmRt.PersonLinkF2.asinteger=0 then
 f2.Checked:=false
 else
 f2.Checked:=true;

 if  DmRt.PersonLinkF3.asinteger=0 then
 f3.Checked:=false
 else
 f3.Checked:=true;
 end;

 procedure TFrmKreditSet.F1Click(Sender: TObject);
begin
if f1.Checked then
DmRt.PersonLinkF1.asinteger:=1
else
DmRt.PersonLinkF1.asinteger:=0;
end;

procedure TFrmKreditSet.F2Click(Sender: TObject);
begin
if f2.Checked then
DmRt.PersonLinkF2.asinteger:=1
else
DmRt.PersonLinkF2.asinteger:=0;
end;

procedure TFrmKreditSet.F3Click(Sender: TObject);
begin
if f3.Checked then
DmRt.PersonLinkF3.asinteger:=1
else
DmRt.PersonLinkF3.asinteger:=0;
end;

procedure TFrmKreditSet.CheckFields;

resourcestring rs_checkfields = '"%s" - sahəsi boşdur!';

procedure ShowMsg(Message :String);
begin
   HBConclusion.ShowMessage(Message);
   Abort;
end;

procedure CheckFieldByName(FieldName :TField);
begin
   if FieldName.IsNull then
      ShowMsg(Format(rs_checkfields,[FieldName.DisplayName]))
end;
 procedure CheckFieldByNames;
begin

 with DmRt,PersonLink do
   begin
   if DBLookupComboboxEh1.text='' then
   begin
   HBConclusion.ShowMessage('Borc alanın tipi (Mülkiyyət növü) sahəsi boşdur !') ;
   abort
   end;
       CheckFieldByName(PersonLinkCREDITACT);
       CheckFieldByName(PersonLinkACTIVITIES);
       CheckFieldByName(PersonLinkCUSTOMERTYPE);
       CheckFieldByName(PersonLinkCREDITTYPE);
       CheckFieldByName(PersonLinkUSRGROUP);

     if DBLookupComboboxEh7.text='' then
   begin
   HBConclusion.ShowMessage('Kreditin verilmə məqsədi sahəsi boşdur !') ;
   abort
   end;
      CheckFieldByName(PersonLinkRESERVEID);
      CheckFieldByName(PersonLinkAUTOPAYMENT);
      CheckFieldByName(PersonLinkAUTOEXPIRE);
      CheckFieldByName(PersonLinkINTCALCMETHOD);
   end;
end;

begin
   CheckFieldByNames;
end;
procedure TFrmKreditSet.SpeedButton1Click(Sender: TObject);
var   i: Word;
      id, ProcName:string;
      PerRate:integer;
begin
 CheckFields;
id:= inttostr(DmRt.PersonLink.FieldByName('id').AsInteger);
 ProcName:=' delete cm_retelview where mehid='+id;
      DmRt.OracleQuery1.sql.text:=ProcName;
      DmRt.OracleQuery1.Execute;
      DmRt.OracleQuery1.sql.text:='commit';
      DmRt.OracleQuery1.Execute;
 for i :=0 to ComponentCount- 1 do
 begin
  if ( Components[i].ClassType = TCheckBox) then
   begin
 //  ShowMessage((Components[i] as TCheckBox).Name);
 {  if  (Components[i] as TCheckBox).Checked=true  then
    begin
     ProcName:=' insert into cm_retelview (mehid,name,status) values ('
      +id+','+''''+ (Components[i] as TCheckBox).Name+''''+','+'''true'''+ ')';
      DmRt.OracleQuery1.sql.text:=ProcName;
      DmRt.OracleQuery1.Execute;
      DmRt.OracleQuery1.sql.text:='commit';
      DmRt.OracleQuery1.Execute;
      end;
    }
   if  (Components[i] as TCheckBox).Checked=false  then
    begin
     ProcName:=' insert into cm_retelview (mehid,name,status) values ('
      +id+','+''''+ (Components[i] as TCheckBox).Name+''''+','+'''false'''+ ')';
      DmRt.OracleQuery1.sql.text:=ProcName;
      DmRt.OracleQuery1.Execute;
      DmRt.OracleQuery1.sql.text:='commit';
      DmRt.OracleQuery1.Execute;
      end;
   end;
 end;

if DBLookupComboboxEh25.KeyValue=1 then
begin
Secudile:=tSecudile.create(self);
Secudile.RGAnnuty.ItemIndex:=dmrt.PersonLinkANUITET.AsInteger;
Secudile.Gdovr.text := inttostr(dmrt.PersonLinkGUZESHT.AsInteger);

case dmrt.PersonLinkPERRATE.AsInteger of
      1 : PerRate := 0;
      3 : PerRate := 1;
      6 : PerRate := 2;
    else
      PerRate := 3;
    end; // Case
Secudile.CmbBoxPeriodRate.ItemIndex := PerRate;
Secudile.ShowModal;

end;
 DmRt.PersonLink.post;
close
end;

procedure TFrmKreditSet.SpeedButton2Click(Sender: TObject);
begin
close
end;

end.
