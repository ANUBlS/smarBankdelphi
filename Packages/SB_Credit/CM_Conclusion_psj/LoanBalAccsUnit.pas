unit LoanBalAccsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, DBCtrls,
  CMDBSearchEdit, DBGridEh;

type
  TFormLoanBalance = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMSearchEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoanBalance: TFormLoanBalance;

implementation

{$R *.DFM}
uses DataModuleConclusion, CreateCMAccountsImpl,sboapiDataModuleImpl,
  ConclusionMainUnitImpl, Newaccountimpl;

procedure TFormLoanBalance.BitBtn1Click(Sender: TObject);

begin
    with DataModuleConcl,IUPackage do
    begin
        CallProcedure('account_no',['p_custid',Customer.FieldByName('ID').Asinteger,
                                    'p_val',CurrencysData.FieldByName('CURRID').AsInteger,
                                    'p_fil',Branches.FieldByName('ID').Asinteger  ,
                                    'p_analtik',DBLookupComboboxEh1.KeyValue,
                                    'p_note',edit1.Text,
                                    'p_meh',ConclusionForm.DBLookupComboboxEh26.KeyValue,
                                    'p_bdat',ConclusionForm.DBDateTimeEditEh1.Value,
                                    'p_edat', ConclusionForm.DBDateTimeEditEh2.Value
                                                 ]);

    if OracleDataSet1.Active then
     OracleDataSet1.close;
     OracleDataSet1.SetVariable('custid',Customer.FieldByName('ID').Asinteger);
     OracleDataSet1.Open;
     if OracleDataSet1.RecordCount=0 then
     begin
       ShowMessage('Balans hesabları düzgün sazlanılmayıb !');
       exit;
     end;
     ConclusionForm.PageControlMain.ActivePageIndex := 2;
     OracleDataSet1.edit;
 end;
 Newaccount.ShowModal;
end;

procedure TFormLoanBalance.FormShow(Sender: TObject);
begin
{DataModuleConcl.DataSenbol.open  ;
   with DataModuleConcl,BalcnLoan do
        LCBLoanBalance.KeyValue := FieldByName('BAL_CN').AsInteger;   }
 //        DBLookupComboboxEh1.keyvalue:=
//ConclusionForm.DBLookupComboboxEh26.keyvalue   ;
end;

procedure TFormLoanBalance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   with DataModuleConcl do begin
      if OracleDataSet3.Active then
     OracleDataSet3.close;
     OracleDataSet3.SetVariable('custid',Customer.FieldByName('ID').Asinteger);
     OracleDataSet3.Open;
     OracleDataSet3.Session.Commit;
   end;


end;

procedure TFormLoanBalance.FormCreate(Sender: TObject);
begin
Newaccount:=tNewaccount.Create(self);
end;

procedure TFormLoanBalance.CMSearchEdit1Exit(Sender: TObject);
begin
 with Sender as TCMSearchEdit do
  Color := ColorSave;
end;

end.
