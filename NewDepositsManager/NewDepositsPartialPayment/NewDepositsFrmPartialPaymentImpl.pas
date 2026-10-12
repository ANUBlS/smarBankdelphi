unit NewDepositsFrmPartialPaymentImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  XFSCtrls, XDBCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, Grids, XDBGrids,
  ToolWin, ExtCtrls,  Menus, CMExcelExport, ImgList, ActnList,
  Buttons;

type
  TNewDepositsFrmPartialPayment = class(TForm)
    XFGroupBox1: TXFGroupBox;
    DBEdit1: TDBEdit;
    ActionList1: TActionList;
    ActnAdd: TAction;
    ActnDel: TAction;
    ActnExprt: TAction;
    ImageList1: TImageList;
    ExcelExport: TCMExcelExport;
    PMShowTr: TPopupMenu;
    N1: TMenuItem;
    XDBGrid1: TXDBGrid;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ActnAddExecute(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsFrmPartialPayment: TNewDepositsFrmPartialPayment;
  procedure exportproc(S:string); export;

implementation
{$R *.DFM}

uses NewCommonDeclsImpl,NewDepositsDataModPartialPaymentImpl,NewDepositsFrmPaymentAddImpl,SBTranslateProc,sboapiDataModuleimpl;

procedure exportproc(S:string);export;
var ContID:integer;
begin
 ContID := Get_SelectedContID;
 with NewDepositsDataModPartialPayment.Payments do
 begin
   Close;
   SetVariable('CONTRACTID',ContID);
   Open;
 end;
 with NewDepositsDataModPartialPayment.DepositInfo do
 begin
   Close;
   SetVariable('CONTRACTID',ContID);
   Open;
 end;

 with NewDepositsDataModPartialPayment.DebitAccs do
 begin
   Close;
   SetVariable('CONTRACTID',ContID);
   Open;
 end;
 with NewDepositsDataModPartialPayment.CreditAccs do
 begin
   Close;
   SetVariable('CONTRACTID',ContID);
   Open;
 end;

 with NewDepositsDataModPartialPayment.PercentAccs do
 begin
   Close;
   SetVariable('CONTRACTID',ContID);
   Open;
 end;


 with NewDepositsDataModPartialPayment.Sysdat do
 begin
   Close;
   Open;
 end;
 NewDepositsFrmPartialPayment.ShowModal;
end;
exports
   exportproc;

procedure TNewDepositsFrmPartialPayment.FormCreate(Sender: TObject);
begin
  NewDepositsDataModPartialPayment:=TNewDepositsDataModPartialPayment.Create(Self);
  NewDepositsFrmPaymentAdd        :=TNewDepositsFrmPaymentAdd.create(self);
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmPartialPayment.ActnAddExecute(Sender: TObject);
begin
 // FormPaymentAdd       :=TFormPaymentAdd.Create(Self);
 // FormPaymentAdd.ShowModal
 NewDepositsFrmPaymentAdd.ShowModal;
end;

procedure TNewDepositsFrmPartialPayment.ToolButton9Click(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmPartialPayment.FormDestroy(Sender: TObject);
begin
  NewDepositsDataModPartialPayment.Free;

end;

initialization
        NewDepositsFrmPartialPayment := TNewDepositsFrmPartialPayment.Create(CommonApplication)

end.
