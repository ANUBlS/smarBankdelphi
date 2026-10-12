unit Frmpayment1impl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CMExcelExport, ImgList, Grids, DBGrids, ComCtrls, ToolWin,
  StdCtrls;

type
  TFrmpayment1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    DBInvest: TDBGrid;
    ImageList: TImageList;
    CMExcelExport1: TCMExcelExport;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmpayment1: TFrmpayment1;

implementation

{$R *.dfm}
uses CommanParametrs,sboapiDataModuleImpl,DmPayment1impl,Add_Invest_paymentimpl;
  procedure InitPlugin(s:string);export;
begin

   if s='' then
   begin
   Frmpayment1.ShowModal;
   end;

end;
exports
     InitPlugin;

procedure TFrmpayment1.FormCreate(Sender: TObject);
begin
DmPayment1:=TDmPayment1.Create(self);
Add_Invest_payment:=TAdd_Invest_payment.Create(self);
end;

procedure TFrmpayment1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;
end;
procedure TFrmpayment1.FormShow(Sender: TObject);
begin
DmPayment1.Dscontracts.Close;
DmPayment1.Dscontracts.SetVariable('cid',contactid);
DmPayment1.Dscontracts.Open;

DmPayment1.DsMain.Close;
DmPayment1.DsMain.SetVariable('pcid',contactid);
DmPayment1.DsMain.Open;

Edit1.Text:=DmPayment1.Dscontracts.FieldByName('MUSTERI').AsString;
end;

procedure TFrmpayment1.ToolButton1Click(Sender: TObject);
begin
Add_Invest_payment.ShowModal;
end;

procedure TFrmpayment1.ToolButton3Click(Sender: TObject);
begin
if DBInvest.DataSource.DataSet.RecordCount=0 then
    begin
     ShowMessage('C?dv?ld? m?lumat yoxdu!!!');
    end;

    if MessageDlg('Seçilmiþ s?tir silinsinmi ??',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
 begin
 //ShowMessage(DBInvest.DataSource.DataSet.FieldByName('id').AsString);
DmPayment1.pk_ins_investment.CallIntegerFunction('del_invest_transaction1',[DBInvest.DataSource.DataSet.FieldByName('id').AsInteger]);
DBInvest.DataSource.DataSet.Refresh;
   end;
end;

procedure TFrmpayment1.ToolButton5Click(Sender: TObject);
begin
DmPayment1.DsMain.Close;
DmPayment1.DsMain.SetVariable('pcid',contactid);
DmPayment1.DsMain.Open;
end;

procedure TFrmpayment1.ToolButton7Click(Sender: TObject);
begin
close;
end;

initialization
 Frmpayment1 :=TFrmpayment1.Create(Application);

end.
