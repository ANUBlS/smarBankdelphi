unit frmsubbarderoimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, Grids, XDBGrids, ExtCtrls;

type
  Tfrmsubbardero = class(TForm)
    XFPanel1: TXFPanel;
    XFGroupBox1: TXFGroupBox;
    XDBGrid1: TXDBGrid;
    XFButton4: TXFButton;
    XFButton5: TXFButton;
    XFButton3: TXFButton;
    XFPanel2: TXFPanel;
    XFButton2: TXFButton;
    procedure XFButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsubbardero: Tfrmsubbardero;

implementation
uses frmaddloss_BarderoImpl,DMreinsuranceImpl,CommanParametrs, FrmreinsuranceImpl,sboapiDataModuleImpl,
  frmaddsub_barderoimpl;

{$R *.dfm}

procedure Tfrmsubbardero.FormCreate(Sender: TObject);
begin
frmaddsub_bardero:=Tfrmaddsub_bardero.create(self);
end;

procedure Tfrmsubbardero.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;
end;

procedure Tfrmsubbardero.FormShow(Sender: TObject);
begin
DMreinsurance.DSMainSubBardero.Close;
DMreinsurance.DSMainSubBardero.SetVariable('pcid',contactid);
DMreinsurance.DSMainSubBardero.SetVariable('Pdep_id',commandepid);
DMreinsurance.DSMainSubBardero.Open;
end;

procedure Tfrmsubbardero.XFButton2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmsubbardero.XFButton4Click(Sender: TObject);
begin
{with DMreinsurance,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['DELETBARDERO_LOSS']);
 end;}
if
XDBGrid1.DataSource.DataSet.RecordCount=0
then
begin
showmessage('Məlumat Yoxdu');
exit;
end;
if  XDBGrid1.DataSource.DataSet.FieldByName('STATUS').AsFloat <>0
then
begin
  showmessage('Diqqət!Yalniz redaktə rejimində olan bardero məlumatin silmək olar! ');
  exit;
end;

if MessageDlg('Seçilmiş Təkrarsığortaçının ləğv olunmasına əminsinizmi?!',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
 begin
With DMreinsurance,ins_common do
begin
 // CallProcedure('del_reins',[Frmreinsurance.XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger]);
  XDBGrid1.DataSource.DataSet.Delete;
 end;
   frmsubbardero.XDBGrid1.DataSource.DataSet.Refresh;
end;

end;

procedure Tfrmsubbardero.XFButton5Click(Sender: TObject);
begin
{with DMreinsurance,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['ADDBARDERO_LOSS']);
 end; }
DMreinsurance.dsTekrar_s_say.Close;
DMreinsurance.dsTekrar_s_say.SetVariable('p_id',contactid);
DMreinsurance.dsTekrar_s_say.open;
if DMreinsurance.dsTekrar_s_say.FieldByName('say').AsInteger=0 then
begin
  showmessage('Diqqət!Bu zərərə aid olan müqavilə heç bir təkrarsoğortaçıya aid deyil.Subroqasiya barderosu yığıla bilməz.');
  exit;
end;
   //showmessage(IntToStr(5));
//showmessage(IntToStr(commandepid));
DMreinsurance.ds_odenmislerin_sayi.close;
DMreinsurance.ds_odenmislerin_sayi.SetVariable('p_id',commandepid);
DMreinsurance.ds_odenmislerin_sayi.open;

if DMreinsurance.ds_odenmislerin_sayi.FieldByName('say').AsInteger=0  then
begin
  showmessage('Diqqət!Seçilmiş Zərər ödənməyib.Subroqasiya barderosu yığıla bilməz.');
  exit;
end;
opetion:='ins';
frmaddsub_bardero.showmodal;
end;

end.
