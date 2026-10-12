unit TrCTransactionUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, DBCtrls, Grids, DBGridEh, ExtCtrls, Buttons,
  ImgList;

type
  TCreditCartdsForm = class(TForm)
    Panel1: TPanel;
    DBGridTransactions: TDBGridEh;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusImages: TImageList;
    procedure DBGridTransactionsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCommitTR : Boolean;
  public
    { Public declarations }
  end;

var
  CreditCartdsForm: TCreditCartdsForm;

implementation

{$R *.DFM}
uses TrCreditCDatModImpl,CommonDecls;



procedure TCreditCartdsForm.DBGridTransactionsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
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

procedure TCreditCartdsForm.BitBtn1Click(Sender: TObject);
begin
   with CreditCardDatMod,CM_CARDS do
   begin
      CallProcedure('CommitTranche',[True]);
   end;
   FCommitTR :=True;
end;

procedure TCreditCartdsForm.BitBtn2Click(Sender: TObject);
begin
FCommitTR := False;
   with CreditCardDatMod,CM_CARDS do
   begin
      CallProcedure('CommitTranche',[FCommitTR]);
   end;

end;

procedure TCreditCartdsForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
resourcestring
  SCancelTransactions = 'Əməliyyat aparılmayacaq! Əminsiniz?';
begin
  CanClose := FCommitTR or 
    (MessageDlg(
       SCancelTransactions
      ,mtWarning
      ,[mbYes,mbNo]
      ,0) = mrYes)
end;

procedure TCreditCartdsForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
   
end;

procedure TCreditCartdsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

end.
