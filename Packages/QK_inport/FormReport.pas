unit FormReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls, Grids, XDBGrids;

type
  TForm_Report = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFPanel3: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    RadBH: TXFRadioButton;
    RadSH: TXFRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    XDBGrid1: TXDBGrid;
    XFButton3: TXFButton;
    XFButton4: TXFButton;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure RadBHClick(Sender: TObject);
    procedure RadSHClick(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure XFButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

uses Income_Form, FormAccNoBalCN, FormBal_CN,QK_İmpotDataMod;

{$R *.dfm}

procedure TForm_Report.FormClose(Sender: TObject; var Action: TCloseAction);
begin
XFLabel4.Caption:='';
QKİmportDataMod.ODS_QK_Import.Refresh;
end;

procedure TForm_Report.FormShow(Sender: TObject);
begin
RadBH.Checked:=true;
end;

procedure TForm_Report.RadBHClick(Sender: TObject);
begin
if RadBH.Checked=true then
XFLabel2.Caption:='Balans Hesabı';
if RadSH.Checked=false then
begin
edit2.Clear;
edit4.Clear;
XFLabel4.Caption:='';
end;
end;

procedure TForm_Report.RadSHClick(Sender: TObject);
begin
if RadSH.Checked=true then
XFLabel2.Caption:='Sub Hesabı';
if RadBH.Checked=false then
begin
edit2.Clear;
edit4.Clear;
XFLabel4.Caption:='';
end;
end;

procedure TForm_Report.XFButton1Click(Sender: TObject);
var
b,c_income_acc_id,
c_b_s_status,c_balcn_accno_id:integer;
begin


   if trim(Edit3.Text)='' then
   begin
     XFLabel4.Caption:='Gəlir hesabı seçilməyib  !';
     exit;
 end;
  if RadBH.Checked=true then
  if trim(Edit4.Text)='' then
   begin
     XFLabel4.Caption:='Balans hesabı seçilməyib  !';
     exit;
 end;
  if RadSH.Checked=true then
  if trim(Edit4.Text)='' then
   begin
     XFLabel4.Caption:='Sub hesab seçilməyib  !';
     exit;
   end;



 c_income_acc_id :=strtoint(Edit3.Text);
 if RadBH.Checked=true then
  c_b_s_status:=0 else
  c_b_s_status:=1;
  c_balcn_accno_id:=strtoint(edit4.Text);

  if RadBH.Checked=true then
  begin
  if edit3.Text=edit4.Text then
  begin
   XFLabel4.Caption:='Gəlir və balans hesabını eyni seçmisiniz   !';
    exit;
  end;
  end;
  if RadSH.Checked=true then
  begin
  if edit3.Text=edit4.Text then
  begin
    XFLabel4.Caption:='Gəlir və sub hesabını eyni seçmisiniz   !';

    exit;
  end;
  end;

  if RadBH.Checked=true then
  begin
  if (Edit4.Text <> '') then
  begin
  b:= QKİmportDataMod.qk_accsettings.CallIntegerFunction('Add_QK_Acc_settings_yoxlama',['c_balcn_accno_id',Edit4.Text]);
  // showmessage(inttostr(b));
   if b<>-1 then begin XFLabel4.Caption:=' Bu balans hesabı atrıq sazlanıb  !';
   Exit;end;
  end;
  end;
   if RadSH.Checked=true then
  begin
  if (Edit4.Text <> '') then
  begin
  b:= QKİmportDataMod.qk_accsettings.CallIntegerFunction('Add_QK_Acc_settings_yoxlama',['c_balcn_accno_id',Edit4.Text]);
  // showmessage(inttostr(b));
   if b<>-1 then begin XFLabel4.Caption:=' Hesab artıq sazlanıb !';
   Exit;end;
  end;
  end;

     begin
     QKİmportDataMod.qk_accsettings.CallProcedure('add_acc_settings',
     [c_income_acc_id,
      c_b_s_status,
      c_balcn_accno_id]);
     end;
     edit1.Clear;
     edit2.Clear;
     edit3.Clear;
     edit4.Clear;
     XFLabel4.Caption:=' Sazlama uğurla yerinə yetrildi  !';
     QKİmportDataMod.ODS_QK_ACC_SETTINGS.close;
     QKİmportDataMod.ODS_QK_ACC_SETTINGS.open;
end;





procedure TForm_Report.XFButton2Click(Sender: TObject);

begin
 if MessageDlg(Format('        Silinsinmi  ?', ['c_id']), mtConfirmation, mbYesNoCancel,
    0) = mrYes then
  begin
    QKİmportDataMod.qk_accsettings.CallProcedure('del_QK_Acc_settings',
           [QKİmportDataMod.ODS_QK_ACC_SETTINGS .FieldByName('id').AsInteger]);
    QKİmportDataMod.ODS_QK_ACC_SETTINGS.Refresh;
end;
end;

procedure TForm_Report.XFButton3Click(Sender: TObject);
begin
IncomeForm:=TIncomeForm.create(self);
XFLabel4.Caption:='';
IncomeForm.showModal ;
end;

procedure TForm_Report.XFButton4Click(Sender: TObject);
begin
if RadBH.Checked=true then
 begin
 FormBalCN:=tFormBalCN.create(self);
 FormBalCN.ShowModal;
 end;
 if RadSH.Checked=true then
 begin
FormAccNo_BalCN:=TFormAccNo_BalCN.create(self) ;
FormAccNo_BalCN.ShowModal;
end;

XFLabel4.Caption:='';
end;


end.
