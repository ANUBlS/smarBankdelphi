unit frmApplyMoneyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, Grids, DBGridEh, ComCtrls, ToolWin, ActnList,
  CMExcelExport, ImgList, StdCtrls, Mask, DBCtrls, ExtCtrls, Menus,
  DBGridEhGrouping, GridsEh;

type
  TFrmApplyMoney = class(TForm)
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    DBEdit2: TDBEdit;
    StaticText2: TStaticText;
    ImageList1: TImageList;
    ExcelExport: TCMExcelExport;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StatusBar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    ActnAdd: TAction;
    ActnDel: TAction;
    ActnExport: TAction;
    PMShowTr: TPopupMenu;
    N1: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActnAddExecute(Sender: TObject);
    procedure ActnDelExecute(Sender: TObject);
    procedure ActnExportExecute(Sender: TObject);
    procedure ActnDelUpdate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
     CanRefReshDeposit :Boolean;
  end;

var
  FrmApplyMoney: TFrmApplyMoney;

  procedure exportproc(S :String);export;

implementation

{$R *.DFM}

uses DMApplyMoneyImpl,frmAddMoneyImpl,CommonDeclsImpl;

procedure exportproc(S :String);export;
var ContractID,
    CustAccID,CustID:Integer;

begin

   FrmApplyMoney.Caption := Get_SelectedContNo+' nömrəli müqavilənin yatrımları';
   ContractID := Get_SelectedContID;
   with DMApplyMoney do
   begin
       with Tranches do
       begin
          SetVariable('ContractID',ContractID);
          Open;
       end;

       with DepositInfo do
       begin
          SetVariable('ContractID',ContractID);
          Open;
          CustID := FieldByName('CustomerID').AsInteger;
       end;

       with CustAcc do
       begin
          SetVariable('ContractID',ContractID);
          Open;
          CustAccID := FieldByName('ClientACCID').AsInteger;
       end;
       with DebitAccs do
       begin
        if not Active then
      //    SetVariable('ContractID',CustID);
          Open;
        if Locate('ID',CustAccID,[]) then
        frmAddMoney.AccountListCB.KeyValue := CustAccID;
       end;

       with ODSSbcm_desc do
       begin
        if not Active then Open;
       end;


      FrmApplyMoney.ShowModal;
   end;
end;

exports
  exportproc;

procedure TFrmApplyMoney.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TFrmApplyMoney.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close;
end;

procedure TFrmApplyMoney.FormCreate(Sender: TObject);
begin
   DMApplyMoney := TDMApplyMoney.Create(Self);
   frmAddMoney := TfrmAddMoney.Create(Self);
end;

procedure TFrmApplyMoney.FormDestroy(Sender: TObject);
begin
   frmAddMoney.Free;
   DMApplyMoney.Free;
end;

procedure TFrmApplyMoney.ToolButton7Click(Sender: TObject);
begin
   Close
end;

procedure TFrmApplyMoney.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if CanRefReshDeposit then
      RefreshWithSavely(True);
    with DMApplyMoney do
    begin
       Tranches.CloseAll;
      // DebitAccs.CloseAll;
       DepositInfo.CloseAll;
       CustAcc.CloseAll;
       DebitAccs.CloseAll;
       ODSSbcm_desc.CloseAll;
    end;  
end;

procedure TFrmApplyMoney.ActnAddExecute(Sender: TObject);
begin
   if frmAddMoney.ShowModal = mrOk then
   begin
      CanRefReshDeposit := True;
      DMApplyMoney.Tranches.Refresh;
   end;

end;

procedure TFrmApplyMoney.ActnDelExecute(Sender: TObject);
begin

    if MessageDlg('Silinməsinə əminsiniz?',
             mtConfirmation, [mbYes, mbNo], 0) = mrNo
    then Exit;

    with DMApplyMoney,Tranches,sbcm_tranches do begin
         CallProcedure('DeleteDepositMoney',['P_DepMoneyID',FieldByName('ID').AsInteger]);
          refresh;
         end;

end;

procedure TFrmApplyMoney.ActnExportExecute(Sender: TObject);
begin
   with ExcelExport do
   begin
      Connect;
      ExportDataset(DMApplyMoney.Tranches,'Depozit yatırımları',True,false);
      Disconnect;
   end;

end;

procedure TFrmApplyMoney.ActnDelUpdate(Sender: TObject);
begin
   with (Sender as TAction) do
        Enabled := DMApplyMoney.Tranches.RecordCount > 0;
end;

procedure TFrmApplyMoney.N1Click(Sender: TObject);
var TrID :String;
begin
   TrID := IntToStr(DMApplyMoney.Tranches.FieldByname('TrID').AsInteger);
   LoadPlugin('SBDM_TransactionViewer.bpl',TrID);
end;


initialization
   FrmApplyMoney := TFrmApplyMoney.Create(CommonApplication);

end.
