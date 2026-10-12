unit P_CO_Account_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, NLSLocalizer, StdCtrls, SearchEdit, Mask, DBCtrls,
  ComCtrls;

type
  TP_CO_Account_Form = class(TForm)
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
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    buyerid: TEdit;
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
    Label12: TLabel;
    DBText8: TDBText;
    DBLookupCurr: TDBLookupComboBox;
    DBLookupCust: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupBalance1: TDBLookupComboBox;
    EditBall: TEdit;
    EditAcc: TEdit;
    EditCust: TEdit;
    EditFil: TEdit;
    EditValute: TEdit;
    DBEditLimit: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    EditAccName: TEdit;
    DBEdit5: TDBEdit;
    symboledit_: TEdit;
    NLSLocalizer2: TNLSLocalizer;
    DayStartStateGB: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbedit6: TEdit;
    dbedit7: TEdit;
    custid: TDBEdit;
    NLSLocalizer3: TNLSLocalizer;
    AccountFlagsGB: TGroupBox;
    Button3: TButton;
    CurrencyVALUTE: TFloatField;
    CurrencyVALU_NAME: TStringField;
    dbrepsymb: TDBLookupComboBox;
    tipacc: TEdit;
    procedure DBLookupCustClick(Sender: TObject);
    procedure bal_cnChange(Sender: TObject);
    procedure EditCustChange(Sender: TObject);
    procedure BrancheditChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure DBEditAccNoKeyPress(Sender: TObject; var Key: Char);
    procedure val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCurrKeyPress(Sender: TObject; var Key: Char);
    procedure bal_cnKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupBalance1KeyPress(Sender: TObject; var Key: Char);
    procedure EditCustKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCustKeyPress(Sender: TObject; var Key: Char);
    procedure DTPOpenDateKeyPress(Sender: TObject; var Key: Char);
    procedure TweditKeyPress(Sender: TObject; var Key: Char);
    procedure SymbolEditKeyPress(Sender: TObject; var Key: Char);
    procedure LimitEditKeyPress(Sender: TObject; var Key: Char);
    procedure BrancheditKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditAccNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure EditValuteChange(Sender: TObject);
    procedure DBLookupCurrClick(Sender: TObject);
    procedure EditBallChange(Sender: TObject);
    procedure DBLookupBalance1Click(Sender: TObject);
    procedure EditFilChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure EditAccKeyPress(Sender: TObject; var Key: Char);
    procedure EditValuteKeyPress(Sender: TObject; var Key: Char);
    procedure EditBallKeyPress(Sender: TObject; var Key: Char);
    procedure EditFilKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCommitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  //  procedure EditCustChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P_CO_Account_Form: TP_CO_Account_Form;

implementation
  Uses sboapiDataModuleImpl, P_Datamod_Unit, P_AccFlags;
{$R *.DFM}

procedure TP_CO_Account_Form.DBLookupCustClick(Sender: TObject);
begin
  EditCust.Text := IntToStr(DBLookupCust.ListSource.DataSet.FieldByName('ID').AsInTeger);

end;

procedure TP_CO_Account_Form.bal_cnChange(Sender: TObject);
begin
BalAcc.fieldbyname('bal_cn').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('bal_cn').asstring;

end;

procedure TP_CO_Account_Form.EditCustChange(Sender: TObject);
begin
   if (EditCust.Text<>'') then begin
   DBLookupCust.KeyValue := StrToInt((Sender as TEdit).Text);
//    EditAccName.Text := DBLookupCust.ListSource.DataSet.FIeldByName('Name').AsString;
 end else begin
   EditAccName.Text :='';
   DBLookupCust.KeyValue := null;
   end;

end;

procedure TP_CO_Account_Form.BrancheditChange(Sender: TObject);
begin
Branches.fieldbyname('id').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;

procedure TP_CO_Account_Form.ButtonCancelClick(Sender: TObject);
begin
close;
end;

procedure TP_CO_Account_Form.DBEditAccNoKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.val_codeKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBLookupCurrKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.bal_cnKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBLookupBalance1KeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.EditCustKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBLookupCustKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DTPOpenDateKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.TweditKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.SymbolEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.LimitEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.BrancheditKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBLookupComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBEditAccNameKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.EditValuteChange(Sender: TObject);
begin
 if  (Sender as TEdit).Text <>''  then
    DBLookupCurr.KeyValue := StrToInt((Sender as TEdit).Text)
    else DBLookupCurr.KeyValue :=null;

end;

procedure TP_CO_Account_Form.DBLookupCurrClick(Sender: TObject);
begin
   EditValute.Text := IntToStr(DBLookupCurr.ListSource.DataSet.FieldByName('VALUTE').AsInTeger);

end;

procedure TP_CO_Account_Form.EditBallChange(Sender: TObject);
begin
   if  (Sender as TEdit).Text <>''  then
   DBLookupBalance1.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupBalance1.KeyValue := null;

end;

procedure TP_CO_Account_Form.DBLookupBalance1Click(Sender: TObject);
begin
  EditBall.Text := IntToStr(DBLookupBalance1.ListSource.DataSet.FieldByName('BAL_CN').AsInTeger);

end;

procedure TP_CO_Account_Form.EditFilChange(Sender: TObject);
begin
 if  (Sender as TEdit).Text <>''  then 
   DBLookupComboBox4.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupComboBox4.KeyValue:=null;

end;

procedure TP_CO_Account_Form.DBLookupComboBox4Click(Sender: TObject);
begin
 EditFil.Text := IntToStr(DBLookupComboBox4.ListSource.DataSet.FieldByName('ID').AsInTeger);

end;

procedure TP_CO_Account_Form.EditAccKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
  end;

end;

procedure TP_CO_Account_Form.EditValuteKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
  end;

end;

procedure TP_CO_Account_Form.EditBallKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
  end;

end;

procedure TP_CO_Account_Form.EditFilKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;

end;

procedure TP_CO_Account_Form.ButtonCommitClick(Sender: TObject);

var
   DDate :TDateTime;

begin
   DDate :=Trunc(DTPOpenDate.DateTime);
     if EditAcc.text ='' then begin
                                                        Showmessage('ўесабын адыны дахил един!');
  end;   if EditAcc.text <>'' then begin


                                                        begin
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallIntegerFunction('open_Account',[
                                                        Editacc.text,
                                                        Editvalute.text,
                                                        Editball.text,
                                                        Editcust.text,
                                                        Ddate,
                                                        DBEditLimit.Text,
                                                        dbrepsymb.keyvalue,
                                                        EditFil.text,
                                                        tipacc.text,

                                                        EditAccName.text,
                                                        custid.text]);
                                                       P_DataModuleFS.Account.Close;
                                                       P_DataModuleFS.Account.Open;
                                                        Close;

end;
    end;


end;

procedure TP_CO_Account_Form.FormActivate(Sender: TObject);
begin
Editvalute.Text :='0';
Dbedit1.Text :='';
Dbedit2.Text :='';
Dbedit3.Text :='';
Dbedit5.Text :='';
P_DataModuleFS.Sysdat.Open;
P_DataModuleFS.AccSettings.Open;
DTPOpenDate.Date :=P_DataModuleFS.Sysdat.fieldbyname('tek_dat').asdatetime;
Editvalute.text := P_DataModuleFS.AccSettings.fieldbyname('val_code').asstring;
dbedit1.text := P_DataModuleFS.AccSettings.fieldbyname('val_name').asstring;
Editball.text := P_DataModuleFS.AccSettings.fieldbyname('bal_cn1').asstring;
dbedit2.text := P_DataModuleFS.AccSettings.fieldbyname('bal_name').asstring;
editcust.text := P_DataModuleFS.P_Customers.fieldbyname('id').asstring;
dbedit3.text := P_DataModuleFS.AccSettings.fieldbyname('cust_name').asstring;
//DTPOpenDate.date :=Datamod_Buyers.CC_Settings.fieldbyname('open_date').asdatetime);
DBEditLimit.text :=P_DataModuleFS.AccSettings.fieldbyname('limit').asstring;
Editfil.text :=P_DataModuleFS.AccSettings.fieldbyname('branch_id').asstring;
dbedit5.text :=P_DataModuleFS.AccSettings.fieldbyname('branch_name').asstring;
EditAccName.text :=P_DataModuleFS.P_Customers.fieldbyname('cust_name').asstring;
end;

procedure TP_CO_Account_Form.Button3Click(Sender: TObject);
begin
 AccFlags :=TAccFlags.Create(Self);
 //P_DataModuleFS.AccFlags.Open;
 //P_DataModuleFS.AccFlag.Open;
 try

  with AccFlags, P_DataModuleFS.AccFlag do

  if (ShowModal = mrOk) then // and (State in [dsInsert, dsEdit]) then
    //FieldByName('Tipacc').AsString :=FlagMap;
    tipacc.text := FlagMap;

 finally
  if Assigned(AccFlags) then
   AccFlags.Release;
 end;

end;

end.
