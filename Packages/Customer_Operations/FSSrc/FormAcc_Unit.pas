unit FormAcc_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Mask, DBCtrls, ComCtrls, Db, OracleData,
  SearchEdit;

type
  TFormAccount = class(TForm)
    AccountGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    DBLookupCurr: TDBLookupComboBox;
    DBLookupBalance1: TDBLookupComboBox;
    DBLookupCust: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    SymbolEdit: TEdit;
    LimitEdit: TEdit;
    Twedit: TEdit;
    DBEditAccNo: TEdit;
    DBEditAccName: TEdit;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    DayStartStateGB: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbedit6: TEdit;
    dbedit7: TEdit;
    accid: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    Currency: TOracleDataSet;
    CurrencyData: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccBAL_CN: TStringField;
    BalAccBALNAME: TStringField;
    BalAccData: TDataSource;
    Customers: TOracleDataSet;
    CustomersData: TDataSource;
    BranchesData: TDataSource;
    Branches: TOracleDataSet;
    BranchesID: TFloatField;
    BranchesNAME: TStringField;
    val_code: TSearchEdit;
    bal_cn: TSearchEdit;
    EditCust: TSearchEdit;
    Branchedit: TSearchEdit;
    CustomersID: TFloatField;
    CustomersBYR_NAME: TStringField;
    CustomersPASSPORT: TStringField;
    CustomersBIRTHDATE: TDateTimeField;
    CustomersBIRTHPLACE: TStringField;
    CustomersFAM_STATUS: TIntegerField;
    CustomersADRESS: TStringField;
    CustomersPHONE: TStringField;
    CustomersEMAIL: TStringField;
    CustomersOPENDATE: TDateTimeField;
    CustomersSEX: TIntegerField;
    CustomersUSERID: TIntegerField;
    CustomersPASSP_NUMBER: TIntegerField;
    CustomersADRS_STATE: TStringField;
    CustomersADRS_CITY: TStringField;
    CustomersBIRTH_STATE: TStringField;
    CustomersPHONE_MOB: TStringField;
    CustomersP_ID: TFloatField;
    CurrencyVALUTE: TFloatField;
    CurrencyVALU_NAME: TStringField;
    procedure DBLookupCurrClick(Sender: TObject);
    procedure DBLookupCustClick(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonCommitClick(Sender: TObject);
    procedure val_codeChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure bal_cnChange(Sender: TObject);
    procedure DBLookupBalance1Click(Sender: TObject);
    procedure EditCustChange(Sender: TObject);
    procedure BrancheditChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
//    procedure DBLookupBalance1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAccount: TFormAccount;

implementation
 uses sboapiDataModuleImpl, CO_datamod_impl;
{$R *.DFM}

procedure TFormAccount.DBLookupCurrClick(Sender: TObject);
begin
{with CO_Datamod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+DBLookupCurr.Text+'''';
   Open;
   val_code.Text :=FieldByName('valute').AsString;
 }
end;


procedure TFormAccount.DBLookupCustClick(Sender: TObject);
begin
with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from customers_physical c where byr_name = '+''''+dbedit3.Text+'''';
   Open;
   EditCust.Text :=FieldByName('id').AsString;

end;
    end;
procedure TFormAccount.DBLookupComboBox4Click(Sender: TObject);
begin
with CO_DataMod.Avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from filial c where name = '+''''+dbedit5.Text+'''';
   Open;
   Branchedit.Text :=FieldByName('id').AsString;

end;

end;

procedure TFormAccount.FormActivate(Sender: TObject);
begin
dbedit1.Text :='';
dbedit2.Text :='';
dbedit3.Text :='';
dbedit5.Text :='';
CO_DataMod.Account.Open;
accid.text :=CO_DataMod.Account.fieldbyname('id').asstring ;
DTPOpenDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;

end;

procedure TFormAccount.ButtonCommitClick(Sender: TObject);
var
   DDate :TDateTime;

begin
   DDate :=Trunc(DTPOpenDate.DateTime);

CO_DataMod.Physical_Customer.CallIntegerFunction('open_Account',[
                                                        DBEditAccNo.text,
                                                        val_code.text,
                                                        bal_cn.text,
                                                        Editcust.text,
                                                        Ddate,
                                                        0,
                                                         0,
                                                         Branchedit.text,
                                                        0,
                                                        DBEditAccName.text
                                                        ]);
                                                        Close;

end;



procedure TFormAccount.val_codeChange(Sender: TObject);
begin
Currency.fieldbyname('valute').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('valute').asstring;

end;

procedure TFormAccount.DBEdit1Change(Sender: TObject);
begin
with CO_Datamod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+Dbedit1.Text+'''';
   Open;
   val_code.Text :=FieldByName('valute').AsString;

end;
    end;

procedure TFormAccount.bal_cnChange(Sender: TObject);
begin
BalAcc.fieldbyname('bal_cn').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('bal_cn').asstring;

end;
  
procedure TFormAccount.DBLookupBalance1Click(Sender: TObject);
begin
with CO_DataMod.Avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from bal_spr1 c where balname = '+''''+dbedit2.Text+'''';
   Open;

   bal_cn.Text :=FieldByName('bal_cn').AsString;

end;
     end;
procedure TFormAccount.EditCustChange(Sender: TObject);
begin
CO_DataMod.physical_customers.fieldbyname('id').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;

procedure TFormAccount.BrancheditChange(Sender: TObject);
begin
Branches.fieldbyname('id').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;

procedure TFormAccount.ButtonCancelClick(Sender: TObject);
begin
close;
end;

end.
