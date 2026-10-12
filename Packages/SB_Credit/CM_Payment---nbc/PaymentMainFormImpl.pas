unit PaymentMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGridEh,
  ComCtrls, ImgList, ToolWin, ActnList, CMExcelExport;

type
  TPaymentForm = class(TForm)
    Localizer: TNLSLocalizer;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    PaymentGrid: TDBGridEh;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ActnPaymentAdd: TAction;
    ActnPaymentDel: TAction;
    ActnExcel: TAction;
    ActnClose: TAction;
    ExcelExporter: TCMExcelExport;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ActnCloseExecute(Sender: TObject);
    procedure ActnPaymentAddExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActnExcelExecute(Sender: TObject);
    procedure ActnPaymentDelExecute(Sender: TObject);
    procedure ActnPaymentDelUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowPayment;
    procedure EexcutePayment(CreditID :integer);
  end;

var
  PaymentForm: TPaymentForm;

procedure InitPlugin(S : String);export;

procedure ExportPayment(CrdID :integer);export;
  
implementation

{$R *.DFM}

uses
  CommonDecls, PaymentDataModuleImpl, PaymentAddFormImpl,systemstate;

var
  RefreshBeforeClose : Boolean;  

procedure TPaymentForm.FormCreate(Sender: TObject);
begin
  PaymentDataModule := TPaymentDataModule.Create(Self);
  PaymentAddForm := TPaymentAddForm.Create(Self);
end;

procedure TPaymentForm.FormDestroy(Sender: TObject);
begin
  PaymentAddForm.Free;
  PaymentDataModule.Free;
end;

procedure ExportPayment(CrdID :integer);export;
begin
   PaymentForm.EexcutePayment(CrdID)
end;

exports
     ExportPayment;


procedure TPaymentForm.EexcutePayment(CreditID :integer);
resourcestring
  rsPaymentCaption = '%s - є ли кредитин юд€нилм€си .';
var
  CrdNo : String;
  CustID : Integer;
  CustAccID : Integer;
begin
//  CreditID := Get_SelectedCrdID;
  CrdNo :=  PaymentDataModule.cm_utils.callStringFunction('get_creditno',[CreditID]);;
  PaymentForm.Localizer.Caption := Format(rsPaymentCaption,[CrdNo]);
  RefreshBeforeClose := False;

  with PaymentDataModule do
  begin

    with PaymentInfo do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with PortfInfo do
    begin
      SetVariable('CreditID',CreditID);
      Open;
      CustID := FieldByName('BOOROWERID').AsInteger
    end;

    with CustAccount do
    begin
      SetVariable('CreditID',CreditID);
      Open;
      CustAccID := FieldByName('BOOROWERACCID').AsInteger;
    end;




    with PaymentAccounts do
    begin
      SetVariable('KLI_ID',CustID);
      Open;
      if Locate('AccID',CustAccID,[]) then
        PaymentAddForm.DBLookupComboboxEhCustAcc.KeyValue := CustAccID;
    end;


    with DueIntRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with DueRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with IntRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with LoanRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;



  end;

  with PaymentAddForm do
        crdid := CreditID; 
  PaymentForm.ShowModal;

end;




procedure TPaymentForm.ShowPayment;
resourcestring
  rsPaymentCaption = '%s - є ли кредитин юд€нилм€си .';
var
  CreditID : Integer;
  CrdNo : String;
  CustID : Integer;
  CustAccID : Integer;
begin
  CreditID := Get_SelectedCrdID;
  CrdNo := Get_SelectedCrdNo;
  Localizer.Caption := Format(rsPaymentCaption,[CrdNo]);
  RefreshBeforeClose := False;

  with PaymentDataModule do
  begin

    with PaymentInfo do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

   with PortfInfo do
    begin
      SetVariable('CreditID',CreditID);
      Open;
      CustID := FieldByName('BOOROWERID').AsInteger
    end;

    with CustAccount do
    begin
      SetVariable('CreditID',CreditID);
      Open;
      CustAccID := FieldByName('BOOROWERACCID').AsInteger;
    end;


    with PaymentAccounts do
    begin
      SetVariable('KLI_ID',CustID);
      Open;
      if Locate('AccID',CustAccID,[]) then
        PaymentAddForm.DBLookupComboboxEhCustAcc.KeyValue := CustAccID;
    end;


    with DueIntRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with DueRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with IntRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;

    with LoanRest do
    begin
      SetVariable('CreditID',CreditID);
      Open;
    end;  

  end;

    with PaymentAddForm do
        crdid := CreditID;
  ShowModal;


end;

procedure TPaymentForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TPaymentForm.ActnCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TPaymentForm.ActnPaymentAddExecute(Sender: TObject);
var
  Temp : Integer;
begin
  if PaymentAddForm.ShowModal = mrOk then
  begin
    RefreshBeforeClose := True;
    with PaymentDataModule do
    begin
      Temp := PaymentAccounts.FieldByName('ACCID').AsInteger;
      PaymentAccounts.Refresh;
      if not PaymentAccounts.Locate('ACCID', Temp, []) then
        PaymentAddForm.DBLookupComboboxEhCustAcc.KeyValue := Null;
    end;
    PaymentGrid.DataSource.DataSet.Refresh;
  end;
end;

procedure TPaymentForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close;
end;

procedure InitPlugin(S : String);export;
begin
  PaymentForm.ShowPayment;
end;

exports
  InitPlugin;
  
procedure TPaymentForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with PaymentDataModule do
  begin
    with PaymentInfo do
      Close;
    with PortfInfo do
      Close;
    with CustAccount do
      Close;
    with PaymentAccounts do
      Close;
    with PeniyaPayAccounts do
      Close;
    with DueIntRest do
      Close;
    with DueRest do
      Close;
    with IntRest do
      Close;
    with LoanRest do
      Close;
  end;
  
  //if RefreshBeforeClose then
  //  SafeRefresh(True,rmLocateAfterRefresh);
end;

procedure TPaymentForm.ActnExcelExecute(Sender: TObject);
begin
  with ExcelExporter do
  begin
    Connect;
    ExportDataset(PaymentDataModule.PaymentInfo,'Payment',True,false);
    Disconnect;
  end;
end;

procedure TPaymentForm.ActnPaymentDelExecute(Sender: TObject);
resourcestring
  rsConfirmPaymentDelete = '—ечилмиш юд€м€ л€ьв олунажаг!яминсиниз?';

var
  PaymentID : Integer;
  Temp : Integer;
begin

  if MessageDlg(
       rsConfirmPaymentDelete,
       mtConfirmation,
       [mbYes,mbNo],
       0) <> mrYes
     then   Exit;

  with PaymentDataModule do
  begin

    PaymentID := PaymentInfo.FieldByName('ID').AsInteger;

    with CM_PAYMENT do
    CallProcedure('Payment_Delete',[
      'p_PaymentID',PaymentID
    ]);

    PaymentInfo.Refresh;

    Temp := PaymentAccounts.FieldByName('ACCID').AsInteger;
    PaymentAccounts.Refresh;
    if not PaymentAccounts.Locate('ACCID', Temp, []) then
    PaymentAddForm.DBLookupComboboxEhCustAcc.KeyValue := Null;
    
    RefreshBeforeClose := True;

  end;

end;

procedure TPaymentForm.ActnPaymentDelUpdate(Sender: TObject);
begin
  with PaymentDataModule.PaymentInfo do
  (Sender as TAction).Enabled := Active and (RecordCount > 0);
end;

initialization
  PaymentForm := TPaymentForm.Create(CommonApplication);

end.
