unit LoanBalAccsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, DBCtrls,
  CMDBSearchEdit;

type
  TFormLoanBalance = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LCBLoanBalance: TDBLookupComboboxEh;
    NLSLocalizer1: TNLSLocalizer;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMSearchEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoanBalance: TFormLoanBalance;

implementation

{$R *.DFM}
uses DataModuleConclusion, CreateCMAccountsImpl,sboapiDataModuleImpl;

procedure TFormLoanBalance.BitBtn1Click(Sender: TObject);
var 
    LoanAccno :string;
    BoorowerAccno :string;
    PrResAccno :string;
    PrPurResAccno :string;
    IntAccno :string;
    DueLoanAccno :string;
    SecResAccno :string;
    SecPurResAccno :string;
    DueIntAccno :string;
    OutPledgAccno :string;
    OutOblAccno :string;
    OutLoanAccno :string;
    OutIntAccno :string;
    crdlineoblAccno :string;
    valname :string;
begin
valname:=DataModuleConcl.CurrencysData.FieldByName('VAL_NAME').Asstring ;
//showmessage ( DataModuleConcl.DataSenbol.fieldbyname('kod').asstring);
    with DataModuleConcl,IUPackage do
    begin

        CallProcedure('GenerateCreditAccNumber',['p_bal_cn',BalcnLoan.FieldByName('BAL_CN').AsInteger,
                                                 'p_Filial',Branches.FieldByName('ID').Asinteger,
                                                 'p_CustID',Customer.FieldByName('ID').Asinteger,
                                                 'p_val',{CurrencysData.FieldByName('CURRID').AsInteger}valname,
                                                 'p_MCrdFil',UsrGroups.FieldByName('ID').AsInteger,
                                                 'p_LoanAccno',LoanAccno,
                                                 'p_BoorowerAccno',BoorowerAccno,
                                                 'p_PrResAccno',PrResAccno,
                                                 'p_PrPurResAccno',PrPurResAccno,
                                                 'p_IntAccno',IntAccno,
                                                 'p_DueLoanAccno',DueLoanAccno,
                                                 'p_SecResAccno',SecResAccno,
                                                 'p_SecPurResAccno',SecPurResAccno,
                                                 'p_DueIntAccno',DueIntAccno,
                                                 'p_OutPledgAccno',OutPledgAccno,
                                                 'p_OutOblAccno',OutOblAccno,
                                                 'p_OutLoanAccno',OutLoanAccno,
                                                 'p_OutIntAccno',OutIntAccno,
                                                 'p_crdlineoblAccno',crdlineoblAccno,
                                                 'p_numberofcredit',CreditProps.FieldByName('numberofcredit').asString,
                                                 'p_syenbol',DataModuleConcl.DataSenbol.fieldbyname('kod').asinteger]);

 //  showmessage ( LoanAccno);
    with FormCreateCMAccounts do
    begin
     EditLoanAcc.text := DataModuleConcl.IUPackage.GetParameter(5);
     EditCustAcc.text := DataModuleConcl.IUPackage.GetParameter(6);
     EditResresveAcc.text := DataModuleConcl.IUPackage.GetParameter(7);
     EditPrPurResAcc.text := DataModuleConcl.IUPackage.GetParameter(8);
     EditInterestAcc.text := DataModuleConcl.IUPackage.GetParameter(9);
     EditDueLoanAcc.text := DataModuleConcl.IUPackage.GetParameter(10);
     EditDueReserveAcc.text := DataModuleConcl.IUPackage.GetParameter(11);
     EditSecresAcc.text := DataModuleConcl.IUPackage.GetParameter(12);
     EditDueIntAcc.text := DataModuleConcl.IUPackage.GetParameter(13);
     EditOutPledgAcc.text := DataModuleConcl.IUPackage.GetParameter(14);
     EditOutOblAcc.text := DataModuleConcl.IUPackage.GetParameter(15);
     EditOutLoanAcc.text := DataModuleConcl.IUPackage.GetParameter(16);
     EditOutIntAcc.text := DataModuleConcl.IUPackage.GetParameter(17);
     EditCrdLineoblAcc.text := DataModuleConcl.IUPackage.GetParameter(18);
     ShowModal;
    end ;
    end;
end;

procedure TFormLoanBalance.FormShow(Sender: TObject);
begin
DataModuleConcl.DataSenbol.open  ;
   with DataModuleConcl,BalcnLoan do
        LCBLoanBalance.KeyValue := FieldByName('BAL_CN').AsInteger;
end;

procedure TFormLoanBalance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DataModuleConcl.DataSenbol.close
end;

procedure TFormLoanBalance.CMSearchEdit1Exit(Sender: TObject);
begin
 with Sender as TCMSearchEdit do
  Color := ColorSave;
end;

end.
