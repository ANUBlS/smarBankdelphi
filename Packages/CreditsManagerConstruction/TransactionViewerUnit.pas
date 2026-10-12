unit TransactionViewerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ImgList, OracleData, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  ExtCtrls;

type
  TTransactionviewForm = class(TForm)
    Panel1: TPanel;
    ButtonCommit: TButton;
    ButtonDismis: TButton;
    Panel2: TPanel;
    DBEditEh1: TDBEditEh;
    DBGridTransactions: TDBGridEh;
    Transactions: TOracleDataSet;
    StatusImages: TImageList;
    DataSrcTransactions: TDataSource;
    TransactionsDEBITACCNO: TWideStringField;
    TransactionsDEBITCURRENCY: TWideStringField;
    TransactionsCREDITACCNO: TWideStringField;
    TransactionsCREDITCURRENCY: TWideStringField;
    TransactionsTRDATE: TDateTimeField;
    TransactionsINBALANCECHAR: TWideStringField;
    TransactionsFLAGS: TFloatField;
    TransactionsDEBITAMOUNT: TFloatField;
    TransactionsCREDITAMOUNT: TFloatField;
    TransactionsNATAMOUNT: TFloatField;
    TransactionsTRDESCRIPTION: TWideStringField;
    TransactionsCANPROCESS: TFloatField;
    procedure ButtonCommitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TransactionsCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridTransactionsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
  private
  FCommitTransactions : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransactionviewForm: TTransactionviewForm;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,DatModConstructionImpl, OrderMgrUnit;

procedure TTransactionviewForm.ButtonCommitClick(Sender: TObject);
begin
  FCommitTransactions := True;
  ModalResult := mrOk;
  DatModConstruction.PaySumDataSet.Refresh;
  DatModConstruction.cc_sum_cols_payments.Refresh;
  OrderForm.Edit2.Text:=DatModConstruction.cc_sum_cols_payments.FieldByName('SUM(PAYAMT)').AsString;
  OrderForm.Edit1.Text:=DatModConstruction.Credits.FieldByName('CREDITAMOUNT').AsString;
  OrderForm.Edit3.Text:=FloatToStr(DatModConstruction.Credits.FieldByName('CREDITAMOUNT').AsFloat-DatModConstruction.cc_sum_cols_payments.FieldByName('SUM(PAYAMT)').AsFloat);

end;

procedure TTransactionviewForm.FormCreate(Sender: TObject);
begin
  with Transactions do begin
  if Active then close;
  Open;
  end;
  FCommitTransactions:= False;
end;

procedure TTransactionviewForm.FormDestroy(Sender: TObject);
begin
Transactions.Close;
end;

procedure TTransactionviewForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize :=False;
end;

procedure TTransactionviewForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close;
end;

procedure TTransactionviewForm.TransactionsCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  if not FieldByName('DEBITAMOUNT').IsNull then
    FieldByName('TrAmount').AsFloat := FieldByName('DEBITAMOUNT').AsFloat
  else
    FieldByName('TrAmount').AsFloat := FieldByName('CREDITAMOUNT').AsFloat

end;

procedure TTransactionviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  update
end;

procedure TTransactionviewForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
resourcestring
  SCancelTransactions = 'Əməliyyat aparılmayacaq! Əminsiniz?';
begin
  CanClose := FCommitTransactions or
    (MessageDlg(
       SCancelTransactions
      ,mtWarning
      ,[mbYes,mbNo]
      ,0) = mrYes)

end;

procedure TTransactionviewForm.DBGridTransactionsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
const
  DataColIndex = 1;
begin
 with Sender as TDBGridEh do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      if (DataCol = DataColIndex) then
      begin
       Canvas.Brush.Color := clSilver;
       StatusImages.Draw(Canvas, Rect.Left, Rect.Top, DataSource.DataSet.FieldByName('CANPROCESS').AsInteger , True)
      end                                            
      else
       DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

end.
