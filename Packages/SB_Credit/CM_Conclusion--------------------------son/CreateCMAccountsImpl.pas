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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnOkClick(Sender: TObject);
//    procedure BitBtnCustClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TFormCreateCMAccounts.FormCreate(Sender: TObject);
begin
   SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormCreateCMAccounts.BitBtnOkClick(Sender: TObject);
resourcestring
   rscracc ='Seçilmiş hesablar yaradılacaq Əminsiniz ?';
var
    LoanAccIDv :integer;
    BoorowerAccIDv :integer;
    PrResAccIDv :integer;
    PrPurResAccIDv :integer;
    IntAccIDv: integer;
    DueLoanAccIDv :integer;
    SecResAccIDv :integer;
    SecPurResAccIDv :integer;
    DueIntAccIDv : integer;
    OutPledgAccIDv :integer;
    OutOblAccIDv : integer;
    OutLoanAccIDv :integer;
    OutIntAccIDv :integer;
    crdlineoblAccIDv :integer;
     IPrResAccIDv :integer;
    IPrPurResAccIDv :integer;

    LoanAccID:Integer;
    BoorowerAccID :integer;
    PrResAccID :integer;
    PrPurResAccID :integer;
    IntAccID: integer;
    DueLoanAccID :integer;
    SecResAccID :integer;
    SecPurResAccID :integer;
    DueIntAccID : integer;
    OutPledgAccID :integer;
    OutOblAccID : integer;
    OutLoanAccID :integer;
    OutIntAccID :integer;
    crdlineoblAccID :integer;

    IPrResAccID :integer;
    IPrPurResAccID :integer;


begin
  if MessageDlg(
            rscracc,
            mtConfirmation ,
            [mbYes,mbNo],
            0
  ) = mrYes then
  begin

  with CM_CREDIT ,DataModuleConcl do
  begin 
    CallProcedure('AddCreditAccounts', [

              {'p_Cust',}Customer.FieldByName('ID').AsInteger,
              {'p_val ',}CurrencysData.FieldByName('CURRID').AsInteger,
              {'p_CheckLoan',}ChLoan.checked,
              {'p_LoanAccno',}EditLoanAcc.text,
              {'p_CheckBoor',}ChCust.checked,
              {'p_BoorowerAccno',}EditCustAcc.text,
              {'p_CheckPrRes',}CHPrRes.checked,
              {'p_PrResAccno' ,}EditResresveAcc.text,
              {'p_CheckPurRes',}ChPurRes.checked,
              {'p_PrPurResAccno',}EditPrPurResAcc.text,
              {'p_checkInt',}ChInt.checked,
              {'p_IntAccno',}EditInterestAcc.text,
              {'p_CheckDueloan',}ChDueLoan.Checked,
              {'p_DueLoanAccno',}EditDueLoanAcc.text,
              {'p_checkSecRes',}ChSecRes.checked,
              {'p_SecResAccno',}EditDueReserveAcc.text,
              {'p_CheckSecPurRes',}ChSecPurRes.checked,
              {'p_SecPurResAccno',}EditSecresAcc.text,
              {'p_checkdueint',}CHDueint.checked,
              {'p_DueIntAccno',}EditDueIntAcc.text,
              {'p_CheckOutPledg',}ChPledg.checked,
              {'p_OutPledgAccno',}EditOutPledgAcc.Text,
              {'p_CheckOblAccno',}ChObl.checked,
              {'p_OutOblAccno',}EditOutOblAcc.Text,
              {'p_CheckOutLoan',}ChOutLoan.checked,
              {'p_OutLoanAccno',}EditOutLoanAcc.Text,
              {'p_CheckOutInt',}ChOutInt.checked,
              {'p_OutIntAccno',}EditOutIntAcc.Text,
              {'p_Checkcrdlineobl',}ChCrdLineObl.checked,
              {'p_crdlineoblAccno',}EditCrdLineoblAcc.Text,

              { p_ICheckPrRes }CheckBox1.checked,
              { p_IPrResAccno }edit1.text,
              {p_ICheckPurRes }CheckBox2.checked,
              {p_IPrPurResAccno}edit2.text ,

              {'p_LoanAccID' ,}LoanAccIDv,
              {'p_BoorowerAccID',}BoorowerAccIDv,
              {'p_PrResAccID' ,}PrResAccIDv,
              {'p_PrPurResAccID',}PrPurResAccIDv ,
              {'p_IntAccID',}IntAccIDv,
              {'p_DueLoanAccID',}DueLoanAccIDv,
              {'p_SecResAccID',}SecResAccIDv,
              {'p_SecPurResAccID',}SecPurResAccIDv,
              {'p_DueIntAccID',}DueIntAccIDv,
              {'p_OutPledgAccID' ,}OutPledgAccIDv,
              {'p_OutOblAccID' ,}OutOblAccIDv,
              {'p_OutLoanAccID' ,}OutLoanAccIDv,
              {'p_OutIntAccID' ,}OutIntAccIDv,
              {'p_crdlineoblAccID',} crdlineoblAccIDv,
              CreditProps.FieldByName('numberofcredit').asString,
              {p_IPrResAccID} IPrResAccIDv ,
              {p_IPrPurResAccID} IPrPurResAccIDv]);

    LoanAccID:= GetParameter(34);
    BoorowerAccID := GetParameter(35);
    PrResAccID := GetParameter(36);
    PrPurResAccID := GetParameter(37);
    IntAccID:= GetParameter(38);
    DueLoanAccID := GetParameter(39);
    SecResAccID := GetParameter(40);
    SecPurResAccID := GetParameter(41);
    DueIntAccID := GetParameter(42);
    OutPledgAccID := GetParameter(43);
    OutOblAccID := GetParameter(44);
    OutLoanAccID := GetParameter(45);
    OutIntAccID := GetParameter(46);
    crdlineoblAccID := GetParameter(47);

    IPrResAccID:= GetParameter(49);
    IPrPurResAccID:= GetParameter(50);

    LoanAccs.RefResh;
    PReserveAccs.Refresh;
    CustAccs.Refresh;
    PercentAccounts.Refresh;
    Interests.Refresh;
    DueInterests.Refresh;
    DueLoanAccs.Refresh;
    SReserveAccs.Refresh;
   // EditDueInterestAcc.Refresh;
   // OUTCollatralAccs.Refresh;
    OUTObligationAccs.Refresh;
    OUTInterestAccs.Refresh;
    CrdLineoblAccs.Refresh;
    IPReserveAccs.Refresh;
    ISReserveAccs.Refresh;

  {  with ConclusionForm do begin
    if LoanAccID <> 0 then
    DBLookupComboboxEh6.DataSource.DataSet.FieldByName('LOANACCID').AsInteger:=LoanAccID;
    if BOOROWERACCID <> 0 then
    DBLookupComboboxEh11.DataSource.DataSet.FieldByName('BOOROWERACCID').AsInteger:=BOOROWERACCID;
    if PrResAccID <> 0 then
    DBLookupComboboxEh24.DataSource.DataSet.FieldByName('PRIMARYRESERVEACCID').AsInteger:=PrResAccID;
    if PrPurResAccID <> 0 then
    DBLookupComboboxEh12.DataSource.DataSet.FieldByName('PRIMARYPURRESERVEACCID').AsInteger:=PrPurResAccID;
    if IntAccID <> 0 then
    DBLookupComboboxEh1.DataSource.DataSet.FieldByName('INTERESTACCID').AsInteger:=IntAccID;
    if DUELOANACCID <> 0 then
    DBLookupComboboxEh14.DataSource.DataSet.FieldByName('DUELOANACCID').AsInteger:=DUELOANACCID;
    if SecResAccID <> 0 then
    DBLookupComboboxEh15.DataSource.DataSet.FieldByName('SECONDARYRESERVEACCID').AsInteger:=SecResAccID;
    if SecPurResAccID <> 0 then
    DBLookupComboboxEh23.DataSource.DataSet.FieldByName('SECONDARYPURRESERVEACCID').AsInteger:=SecPurResAccID;
    if DueIntAccID <> 0 then
    DBLookupComboboxEh16.DataSource.DataSet.FieldByName('DUEINTERESTACCID').AsInteger:=DueIntAccID;
    if OutPledgAccID <> 0 then
    DBLookupComboboxEh17.DataSource.DataSet.FieldByName('OUTCOLLATERALACCID').AsInteger:=OutPledgAccID ;
    if OutOblAccID<>0 then
    DBLookupComboboxEh18.DataSource.DataSet.FieldByName('OUTGUARANTEEACCID').AsInteger:=OutOblAccID;
    if OUTLOANACCID <> 0 then
    DBLookupComboboxEh22.DataSource.DataSet.FieldByName('OUTLOANACCID').AsInteger:=OUTLOANACCID;
    if OutIntAccID <> 0 then
    DBLookupComboboxEh21.DataSource.DataSet.FieldByName('OUTINTERESTACCID').AsInteger:=OutIntAccID;
    if crdlineoblAccID <>0 then
    DBLookupComboboxEh20.DataSource.DataSet.FieldByName('CRDLINEOBLACCID').AsInteger:=crdlineoblAccID;

   if IPrResAccID <> 0 then
    DBLookupComboboxEh39.DataSource.DataSet.FieldByName('iprimaryreserveaccid').AsInteger:=IPrResAccID;

    if IPrPurResAccID <> 0 then
    DBLookupComboboxEh40.DataSource.DataSet.FieldByName('isecondaryreserveaccid').AsInteger:=IPrPurResAccID;
    end;

    if CustID <> 0 then begin
       Customer.Refresh;
       ConclusionForm.DBLookupComboboxEh19.DataSource.DataSet.FieldByName('BOOROWERID').AsInteger := CustID;
   end;    }

  end;

end;

end;

procedure TFormCreateCMAccounts.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;



{procedure TFormCreateCMAccounts.BitBtnCustClick(Sender: TObject);
begin
   LoadPlugin(CommonApplication,'CM_Customer.bpl','');
   with frmCustomer do
   begin
     CustID := CustomerID;
     CustName := CustomerName;
   end;
   EdCustname.Text := CustName;
end;  }

procedure TFormCreateCMAccounts.FormShow(Sender: TObject);
begin
{   with ConclusionForm do
   begin
     BitBtnCust.Visible:= (VarToStr(DBLookupComboboxEh19.KeyValue) = '');
     EdCustname.Text := DBLookupComboboxEh19.Text;
   end; }
end;

end.
