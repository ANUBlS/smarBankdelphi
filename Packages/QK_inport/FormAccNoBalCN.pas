unit FormAccNoBalCN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, StdCtrls, XFSCtrls, ExtCtrls, ActnList;

type
  TFormAccNo_BalCN = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XDBGrid1: TXDBGrid;
    EditAcc_no: TEdit;
    EditAcc_name: TEdit;
    XFButton2: TXFButton;
    ActionList_acc: TActionList;
    Action_Src: TAction;
    EditBal_Cn: TEdit;
    Edit_isin: TEdit;
    procedure Action_SrcExecute(Sender: TObject);
    procedure EditAcc_noChange(Sender: TObject);
    procedure EditAcc_nameChange(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XFButton1Click(Sender: TObject);
    procedure EditBal_CnChange(Sender: TObject);
    procedure XDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit_isinChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAccNo_BalCN: TFormAccNo_BalCN;

implementation
 uses QK_İmpotDataMod, FormReport;
{$R *.dfm}

procedure TFormAccNo_BalCN.Action_SrcExecute(Sender: TObject);
begin
with QKİmportDataMod,ODS_ACCOUNT do
 begin
   if EditBal_Cn.Text<>'' then
  SQL[2] :=' and  nvl(upper(bal_cn1 ),0)like upper(''%' +
      EditBal_Cn.Text + '%'')'
      else
   SQL[2] := '';
   if EditAcc_no.Text<>'' then
   SQL[3] :=' and  nvl(upper(acc_no ),0)like upper(''%' +
      EditAcc_no.Text + '%'')'
      else
   SQL[3] := '';

  if EditAcc_name.Text <> '' then
    SQL[4] := ' and nvl(upper(name),0) like upper(''%' +
      EditAcc_name.Text + '%'')'
  else
    SQL[4] := '';

  if Edit_isin.Text <> '' then
    SQL[5] := ' and nvl(upper(old_acc_no),0) like upper(''%' +
     Edit_isin.Text + '%'')'
  else
    SQL[5] := '';


 Refresh;

 end;

end;

procedure TFormAccNo_BalCN.EditAcc_nameChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_ACCOUNT.Active=false then

QKİmportDataMod.ODS_ACCOUNT.open;
Action_Src.Execute;
 if (EditAcc_no.Text='')and( EditAcc_name.Text='')and(EditBal_Cn.Text='')and(Edit_isin.text='') then
 QKİmportDataMod.ODS_ACCOUNT.close;

end;

procedure TFormAccNo_BalCN.EditAcc_noChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_ACCOUNT.Active=false then

QKİmportDataMod.ODS_ACCOUNT.open;
Action_Src.Execute;
 if (EditAcc_no.Text='')and( EditAcc_name.Text='')and(EditBal_Cn.Text='')and(Edit_isin.text='') then
 QKİmportDataMod.ODS_ACCOUNT.close;

end;

procedure TFormAccNo_BalCN.EditBal_CnChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_ACCOUNT.Active=false then

QKİmportDataMod.ODS_ACCOUNT.open;
Action_Src.Execute;
 if (EditAcc_no.Text='')and( EditAcc_name.Text='')and(EditBal_Cn.Text='')and(Edit_isin.text='') then
 QKİmportDataMod.ODS_ACCOUNT.close;

end;

procedure TFormAccNo_BalCN.Edit_isinChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_ACCOUNT.Active=false then

QKİmportDataMod.ODS_ACCOUNT.open;
Action_Src.Execute;
 if (EditAcc_no.Text='')and( EditAcc_name.Text='')and(EditBal_Cn.Text='')and(Edit_isin.text='') then
 QKİmportDataMod.ODS_ACCOUNT.close;
end;

procedure TFormAccNo_BalCN.FormClose(Sender: TObject; var Action: TCloseAction);
begin

QKİmportDataMod.ODS_ACCOUNT.Close;

end;

procedure TFormAccNo_BalCN.FormShow(Sender: TObject);
begin
EditBal_Cn.SetFocus;
end;

procedure TFormAccNo_BalCN.XDBGrid1DblClick(Sender: TObject);
begin
Form_Report.Edit2.Text:=QKİmportDataMod.ODS_ACCOUNT.FieldByName('acc_no').AsString;
Form_Report.Edit4.Text:=QKİmportDataMod.ODS_ACCOUNT.FieldByName('id').AsString;
FormAccNo_BalCN.Close;

end;

procedure TFormAccNo_BalCN.XFButton1Click(Sender: TObject);
begin
Form_Report.Edit2.Text:=QKİmportDataMod.ODS_ACCOUNT.FieldByName('acc_no').AsString;
Form_Report.Edit4.Text:=QKİmportDataMod.ODS_ACCOUNT.FieldByName('id').AsString;
FormAccNo_BalCN.Close;

end;

procedure TFormAccNo_BalCN.XFButton2Click(Sender: TObject);
begin
QKİmportDataMod.ODS_ACCOUNT.open;
Action_Src.Execute;

end;

end.
