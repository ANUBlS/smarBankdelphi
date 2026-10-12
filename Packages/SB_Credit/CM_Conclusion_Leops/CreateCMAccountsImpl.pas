unit CreateCMAccountsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids,  Buttons, StdCtrls, ExtCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Oracle;

type
  TFormCreateCMAccounts = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label43: TLabel;
    Label47: TLabel;
    Label51: TLabel;
    Label55: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EditCustAcc: TEdit;
    EditResresveAcc: TEdit;
    EditInterestAcc: TEdit;
    EditDueLoanAcc: TEdit;
    ChCust: TCheckBox;
    CHPrRes: TCheckBox;
    CHInt: TCheckBox;
    ChDueLoan: TCheckBox;
    EditLoanAcc: TEdit;
    ChLoan: TCheckBox;
    EditPrPurResAcc: TEdit;
    ChPurRes: TCheckBox;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    CM_CREDIT: TOraclePackage;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EditSecresAcc: TEdit;
    ChSecPurRes: TCheckBox;
    CHDueint: TCheckBox;
    EditDueIntAcc: TEdit;
    ChObl: TCheckBox;
    ChOutLoan: TCheckBox;
    ChOutInt: TCheckBox;
    ChCrdLineObl: TCheckBox;
    EditCrdLineoblAcc: TEdit;
    EditOutIntAcc: TEdit;
    EditOutLoanAcc: TEdit;
    EditOutOblAcc: TEdit;
    Label59: TLabel;
    EditDueReserveAcc: TEdit;
    ChSecRes: TCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    edit2: TEdit;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    EditOutPledgAcc: TEdit;
    ChPledg: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);


  private
    CustID :Integer;
    CustName :String;
  public
    { Public declarations }
  end;

var
  FormCreateCMAccounts: TFormCreateCMAccounts;

implementation

uses DataModuleConclusion,ConclusionMainUnitImpl,LoanBalAccsUnit,
   SBTranslateProc,sboapiDataModuleImpl,CommonDecls;

{$R *.DFM}

procedure TFormCreateCMAccounts.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCreateCMAccounts.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;




end.
