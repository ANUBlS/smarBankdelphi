unit GrantUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, DBLookupEh, Mask, DBCtrlsEh, ActnList, ImgList, Buttons,
  StdCtrls, ExtCtrls;

type
  TGrantForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EditAmount: TEdit;
    LblValute: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBEditEh1: TDBEditEh;
    CusiIntacc: TDBLookupComboboxEh;
    BankAcc: TDBLookupComboboxEh;
    SpeedButton2: TSpeedButton;
    ActnAccept: TAction;
    ActnReject: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GrantForm: TGrantForm;
  procedure InitPlugin(S:String);export;

implementation

{$R *.DFM}

uses GrantDatModImpl,CommonDecls;


procedure InitPlugin(S:String);export;
var
  CrdID  :Integer;
  Val_kod  :String;
begin
   CrdID := Get_SelectedCrdID;

   with GrantDataMod do
   begin

      with CustAccounts do
      begin
         if Active then CloseAll;
         SetVariable('CrdID',CrdID);
         Open;
         GrantForm.CusiIntacc.KeyValue :=  FieldByName('ID').AsInteger;
      end;

      with BankAccounts do
      begin
        Open;
         GrantForm.BankAcc.KeyValue :=  FieldByName('ID').AsInteger;
      end;

     with CustInfo do
     begin
        if Active then close;
        setvariable('CrdID',CrdID);
        open;
     end;

     with Avalute do
     begin
       if Active then CloseAll;
       SetVariable('CrdID',CrdID);
       Open;
       Val_kod := FieldByName('Val_Name').AsString;
     end;

   end;
  with GrantForm do
  begin
    LblValute.Caption := Val_kod;
    ShowModal;
  end;
end;

exports
InitPlugin;

procedure TGrantForm.FormCreate(Sender: TObject);
begin
   GrantDataMod := TGrantDataMod.Create(Self);
end;

procedure TGrantForm.FormDestroy(Sender: TObject);
begin
  GrantDataMod.Free;
end;


procedure TGrantForm.ActnAcceptExecute(Sender: TObject);

resourcestring
  rsTransactionsWillProcessed = 'ям€лиййат апарылыр €минсинизми? ...';
var
  CrdID : Integer;
  CustAccID : Integer;
  CommitTr : Boolean;
  P_Amount :Real;

begin
  CrdID := Get_SelectedCrdID;
  CustAccID := BankAcc.ListSource.DataSet.FieldByName('ID').AsInteger;
  P_Amount := StrToFloat(EditAmount.Text);

  with GrantDataMod do
  CM_PAYMENTGRANT.CallProcedure('paymentgrant',[
     'p_CreditID' ,CrdID ,
     'p_account' ,CustAccID,
     'p_grantamount' ,P_Amount ]);

  try

    CommitTr := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    with GrantDataMod do
    CM_PAYMENTGRANT.CallProcedure('commitpaymentgrant',[
       'docommit' , CommitTr
    ]);

  except

    with GrantDataMod do
    CM_PAYMENTGRANT.CallProcedure('commitpaymentgrant',[
       'docommit' , False
    ]);

    raise;

  end;

end;


procedure TGrantForm.ActnRejectExecute(Sender: TObject);
begin
   Close;
end;

procedure TGrantForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TGrantForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

Initialization
 GrantForm := TGrantForm.Create(CommonApplication);
end.
