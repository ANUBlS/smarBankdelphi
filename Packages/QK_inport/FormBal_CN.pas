unit FormBal_CN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, Grids, XDBGrids, StdCtrls, ActnList;

type
  TFormBalCN = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XDBGrid1: TXDBGrid;
    Edit_BalCn: TEdit;
    Edit_BalName: TEdit;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    ActionList_BalCN: TActionList;
    Action_Src: TAction;
    procedure Action_SrcExecute(Sender: TObject);
    procedure Edit_BalCnChange(Sender: TObject);
    procedure Edit_BalNameChange(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBalCN: TFormBalCN;

implementation
 uses QK_İmpotDataMod, FormReport;
{$R *.dfm}

procedure TFormBalCN.Action_SrcExecute(Sender: TObject);
begin
with QKİmportDataMod,ODS_BAL_SPR1 do
 begin

   if Edit_BalCn.Text<>'' then
   SQL[3] :=' and  BAL_CN like (''%' +
      Edit_BalCn.Text + '%'')'
      else
   SQL[3] := '';

  if Edit_BalName.Text <> '' then
    SQL[4] := ' and nvl(upper(BALNAME),0) like upper(''%' +
      Edit_BalName.Text + '%'')'
  else
    SQL[4] := '';


 Refresh;

 end;
end;

procedure TFormBalCN.Edit_BalCnChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_BAL_SPR1.Active=false then

QKİmportDataMod.ODS_BAL_SPR1.open;
Action_Src.Execute;
 if (Edit_BalCn.Text='')and( Edit_BalName.Text='') then
 QKİmportDataMod.ODS_BAL_SPR1.close;

end;

procedure TFormBalCN.Edit_BalNameChange(Sender: TObject);
begin
if QKİmportDataMod.ODS_BAL_SPR1.Active=false then

QKİmportDataMod.ODS_BAL_SPR1.open;
Action_Src.Execute;
 if (Edit_BalCn.Text='')and( Edit_BalName.Text='') then
 QKİmportDataMod.ODS_BAL_SPR1.close;
end;

procedure TFormBalCN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 QKİmportDataMod.ODS_BAL_SPR1.close;
end;

procedure TFormBalCN.FormShow(Sender: TObject);
begin
Edit_BalCn.SetFocus;

end;

procedure TFormBalCN.XDBGrid1DblClick(Sender: TObject);
begin
Form_Report.Edit2.Text:=QKİmportDataMod.ODS_BAL_SPR1.FieldByName('Bal_cn').AsString;
Form_Report.Edit4.Text:=QKİmportDataMod.ODS_BAL_SPR1.FieldByName('Bal_cn').AsString;
FormBalCN.Close;

end;

procedure TFormBalCN.XFButton1Click(Sender: TObject);
begin
Form_Report.Edit2.Text:=QKİmportDataMod.ODS_BAL_SPR1.FieldByName('Bal_cn').AsString;
Form_Report.Edit4.Text:=QKİmportDataMod.ODS_BAL_SPR1.FieldByName('Bal_cn').AsString;
FormBalCN.Close;
end;

procedure TFormBalCN.XFButton2Click(Sender: TObject);
begin
QKİmportDataMod.ODS_BAL_SPR1.open;
Action_Src.Execute;
end;

end.
