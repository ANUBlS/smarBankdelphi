unit IntPaynentUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ImgList, ActnList, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, NLSLocalizer;

type
  TPaymentForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    GroupBox1: TGroupBox;
    DBEditEh1: TDBEditEh;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DBEditEh2: TDBEditEh;
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DateTimePicker: TDateTimePicker;
    Label1: TLabel;
    AmountEdit: TEdit;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActnAccept: TAction;
    ActnReject: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentForm: TPaymentForm;

implementation

{$R *.DFM}

uses InfoOutIntImpl,CommonDecls,SystemState;

procedure TPaymentForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize :=False;
end;

procedure TPaymentForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(key) = VK_ESCAPE then Close;
end;

procedure TPaymentForm.ActnAcceptExecute(Sender: TObject);
resourcestring rsTr = ' Ямялийатын апарылмасына яминсинизми? ';
                     rsTransactionsWillProcessed = 'Фаизлярин Б.К-дан юдянилмяси ...';
var
  CrdID : Integer;
  CommitTr : Boolean;
  TrAmount :Real;
begin

   TrAmount := StrToFloat(AmountEdit.Text);

if  not MessageDlg(
                   rsTr,
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then Exit;
                    
  with InfOutIntDatMod,CM_RETURN_INT_OB do
  begin
     CrdID := IntPlaceOutBDatSet.FieldByName('CreditID').Asinteger;
     CM_RETURN_INT_OB.CallProcedure('return_int',[
     'p_CreditID' ,CrdID ,
     'p_tramount' ,TrAmount]);
  end;
  try

    CommitTr := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    with InfOutIntDatMod do
    begin
      CM_RETURN_INT_OB.CallProcedure('CommitTr',[
         'DefCommit' , CommitTr
      ]);
      IntPlaceOutBDatSet.Refresh;
    end;
  except

    with InfOutIntDatMod do
    CM_RETURN_INT_OB.CallProcedure('CommitTr',[
       'DefCommit' , False
    ]);

    raise;

  end;

end;

procedure TPaymentForm.ActnRejectExecute(Sender: TObject);
begin
  Close;
end;

procedure TPaymentForm.FormCreate(Sender: TObject);
begin
   DateTimePicker.DateTime := Get_CurrentDate;
end;

end.
