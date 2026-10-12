unit frmAddCapitalizeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, ExtCtrls, CMCurrencyEdit, Mask, DBCtrlsEh, ComCtrls, ActnList,
  NLSLocalizer;

type
  TfrmAddCapitalize = class(TForm)
    Panel2: TPanel;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    StaticText2: TStaticText;
    DBEditEh3: TDBEditEh;
    Panel5: TPanel;
    StaticText1: TStaticText;
    DBEditEh4: TDBEditEh;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    StaticText5: TStaticText;
    DBEditEh2: TDBEditEh;
    Panel7: TPanel;
    StaticText6: TStaticText;
    DBEditEh5: TDBEditEh;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdCapital: TCMCurrencyEdit;
    DTPCapital: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    NLSLocalizer1: TNLSLocalizer;
    ActionList1: TActionList;
    ActnTrans: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActnTransExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ActnTransUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddCapitalize: TfrmAddCapitalize;

implementation

{$R *.DFM}
uses frmCapitalizeImpl,CommonDeclsImpl;

procedure TfrmAddCapitalize.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    Resize := False
end;

procedure TfrmAddCapitalize.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close
end;

procedure TfrmAddCapitalize.ActnTransExecute(Sender: TObject);

resourcestring
  rsTransactionsWillProcessed = 'Депозитин кариталлашдырылмасы ...';
var
    CommitCapitalize :Boolean;

begin

    with frmCapitalize,sbcm_payment do
     CallProcedure('Capitalization',['ContractID',Get_SelectedContID,
                                    'HDate',Get_BankDate,
                                    'Total',EdCapital.Value,
                                    'UseTransactions',True]);

    try
    CommitCapitalize := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    frmCapitalize.SBCM_PAYMENT.CallProcedure('CommitWithDrawMoney',[
       'DoCommit',CommitCapitalize
    ]);

    if CommitCapitalize then
    Self.ModalResult := mrOk;
    Self.Update;
  except


    frmCapitalize.SBCM_PAYMENT.CallProcedure('CommitWithDrawMoney',['DoCommit',
        False
    ]);

    raise;

  end;


end;

procedure TfrmAddCapitalize.Button2Click(Sender: TObject);
begin
   Close
end;

procedure TfrmAddCapitalize.ActnTransUpdate(Sender: TObject);
begin
   with (Sender as TAction) do
         Enabled := EdCapital.Value > 0
end;

procedure TfrmAddCapitalize.FormShow(Sender: TObject);
begin
   DTPCapital.DateTime := Get_BankDate;
   EdCapital.Value := 0;
end;

end.
