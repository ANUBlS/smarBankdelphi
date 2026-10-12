unit PaymentMgrUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBViewComboBox, SearchEdit, ComCtrls, Buttons;

type
  TPaymentAddForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DTPOpDate: TDateTimePicker;
    EditPayAmt: TEdit;
    GroupBox1: TGroupBox;
    SearchEdit1: TSearchEdit;
    DBViewComboBox1: TDBViewComboBox;
    Edit1: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBViewComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
  function TrDelayed_Show(AOwner : TComponent) : Boolean;
    { Public declarations }
  end;

var
  PaymentAddForm: TPaymentAddForm;

implementation

{$R *.DFM}
uses OrderMgrUnit,TransactionViewerUnit,DatModConstructionImpl;


function TPaymentAddForm.TrDelayed_Show(AOwner : TComponent) : Boolean;
begin
  with TTransactionviewForm.Create(AOwner) do
  try
    Result := ShowModal = mrOk;
    Update;
  finally
    Release
  end;
end;


procedure TPaymentAddForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize:= False;
end;

procedure TPaymentAddForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close;
  if ord(Key) = VK_RETURN then
  BitBtn1Click(sender);
end;

procedure TPaymentAddForm.FormCreate(Sender: TObject);
begin
   SearchEdit1.Text := OrderForm.Cash.FieldbyName('acc_no').asString;
   DBViewComboBox1.Text := DatModConstruction.Description.FieldByName('NAME').AsString;
   Edit1.Text := DatModConstruction.Description.FieldByName('CODE').AsString;
   EditPayAmt.Text := FloatToStr(OrderForm.PayData.FieldByName('MainAmt').AsFloat);
   DTPOpDate.DateTime := OrderForm.SysDat.FieldByName('TEK_DAT').AsDateTime;
end;

procedure TPaymentAddForm.DBViewComboBox1Change(Sender: TObject);
begin
Edit1.Text := DatModConstruction.Description.FieldByName('CODE').AsString;
end;

procedure TPaymentAddForm.BitBtn1Click(Sender: TObject);
var CommitPayment :Boolean;
    TrDate :TDateTime;
    sum :real;
    desc: string;
    code: integer;
begin
sum :=StrToFloat(EditPayAmt.text) ;
   TrDate := integer(Trunc(DTPOpDate.dateTime));
   desc:=DBViewComboBox1.Text;
   code:=strtoint(Edit1.Text);
   with DatModConstruction, sbcm_construction do
        CallProcedure('PaymentTracttransactions',[
      'p_contractid',Credits.Fieldbyname('ID').AsInteger,
      'p_dat',TrDate,
      'p_desc',desc,
      'p_code',code,
      'p_flatamt',sum,
      'p_showtr', TRUE,
      'p_DebitAccID',OrderForm.Cash.FieldByName('ID').AsInteger]);


      try

    CommitPayment := TrDelayed_Show(Self);

    Update;

    with DatModConstruction,sbcm_construction do
    CallProcedure('commitdelayedtransactions',[
       'DoCommit' , CommitPayment
    ]);


    if CommitPayment then
    Self.ModalResult := mrOk;
    Self.Update;
    OrderForm.Payments.Refresh;
     
  except

    with DatModConstruction ,sbcm_construction do
    CallProcedure('commitdelayedtransactions',[
       'DoCommit' , False
    ]);

    raise;

  end;





    end;



end.
