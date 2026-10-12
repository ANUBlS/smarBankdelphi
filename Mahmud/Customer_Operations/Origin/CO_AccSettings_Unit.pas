unit CO_AccSettings_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, NLSLocalizer, StdCtrls, Mask, DBCtrls, ComCtrls;

type
  TCO_AccSettings = class(TForm)
    AccountGB: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    DBLookupCurr: TDBLookupComboBox;
    DBLookupCust: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupBalance1: TDBLookupComboBox;
    EditBall: TEdit;
    EditCust: TEdit;
    EditFil: TEdit;
    EditValute: TEdit;
    DBEditLimit: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    symboledit: TEdit;
    DBEdit5: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    NLSLocalizer1: TNLSLocalizer;
    Currency: TOracleDataSet;
    CurrencyVALUTE: TFloatField;
    CurrencyVALU_NAME: TStringField;
    CurrencyData: TDataSource;
    Customers: TOracleDataSet;
    CustomersData: TDataSource;
    Branch: TOracleDataSet;
    Branchdata: TDataSource;
    BalAccData: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccBAL_CN: TStringField;
    BalAccBALNAME: TStringField;
    procedure EditValuteChange(Sender: TObject);
    procedure DBLookupCurrClick(Sender: TObject);
    procedure EditBallChange(Sender: TObject);
    procedure DBLookupBalance1Click(Sender: TObject);
    procedure EditCustChange(Sender: TObject);
    procedure DBLookupCustClick(Sender: TObject);
    procedure EditFilChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditValuteKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCurrKeyPress(Sender: TObject; var Key: Char);
    procedure EditBallKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupBalance1KeyPress(Sender: TObject; var Key: Char);
    procedure EditCustKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCustKeyPress(Sender: TObject; var Key: Char);
    procedure DTPOpenDateKeyPress(Sender: TObject; var Key: Char);
    procedure symboleditKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditLimitKeyPress(Sender: TObject; var Key: Char);
    procedure EditFilKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_AccSettings: TCO_AccSettings;

implementation
  USes CO_datamod_impl,sboapiDataModuleImpl;
{$R *.DFM}

procedure TCO_AccSettings.EditValuteChange(Sender: TObject);
begin
 if  (Sender as TEdit).Text <>''  then
    DBLookupCurr.KeyValue := StrToInt((Sender as TEdit).Text)
    else DBLookupCurr.KeyValue :=null;

end;

procedure TCO_AccSettings.DBLookupCurrClick(Sender: TObject);
begin
   EditValute.Text := IntToStr(DBLookupCurr.ListSource.DataSet.FieldByName('VALUTE').AsInTeger);

end;

procedure TCO_AccSettings.EditBallChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then
   DBLookupBalance1.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupBalance1.KeyValue := null;

end;

procedure TCO_AccSettings.DBLookupBalance1Click(Sender: TObject);
begin
  EditBall.Text := IntToStr(DBLookupBalance1.ListSource.DataSet.FieldByName('BAL_CN').AsInTeger);

end;

procedure TCO_AccSettings.EditCustChange(Sender: TObject);
begin
   if (EditCust.Text<>'') then begin
   DBLookupCust.KeyValue := StrToInt((Sender as TEdit).Text);
//    EditAccName.Text := DBLookupCust.ListSource.DataSet.FIeldByName('Name').AsString;
 end else begin

   DBLookupCust.KeyValue := null;
   end;

end;

procedure TCO_AccSettings.DBLookupCustClick(Sender: TObject);
begin
  EditCust.Text := IntToStr(DBLookupCust.ListSource.DataSet.FieldByName('ID').AsInTeger);

end;

procedure TCO_AccSettings.EditFilChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then 
   DBLookupComboBox4.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupComboBox4.KeyValue:=null;

end;

procedure TCO_AccSettings.DBLookupComboBox4Click(Sender: TObject);
begin
  EditFil.Text := IntToStr(DBLookupComboBox4.ListSource.DataSet.FieldByName('ID').AsInTeger);

end;

procedure TCO_AccSettings.Button1Click(Sender: TObject);

var
   DDate :TDateTime;

begin
   DDate :=Trunc(DTPOpenDate.DateTime);

CO_DataMod.OPackage.CallProcedure('ins_acc_settings',[
                                                        Editvalute.text,
                                                        dbedit1.text,
                                                        Editball.text,
                                                        dbedit2.text,
                                                        Editcust.text,
                                                        dbedit3.text,
                                                        Ddate,
                                                        0,
                                                        SymbolEdit.text,
                                                        DBEditLimit.text,
                                                        Editfil.text,
                                                        dbedit5.text
                                                        ]);
                                                        CO_DataMod.AccSettings.Close;
                                                        CO_DataMod.AccSettings.Open;
                                                        CO_DataMod.Account.refresh;

   close;
end;




procedure TCO_AccSettings.EditValuteKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.DBLookupCurrKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.EditBallKeyPress(Sender: TObject; var Key: Char);
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

procedure TCO_AccSettings.DBLookupBalance1KeyPress(Sender: TObject;
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

procedure TCO_AccSettings.EditCustKeyPress(Sender: TObject; var Key: Char);
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

procedure TCO_AccSettings.DBLookupCustKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.DTPOpenDateKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.symboleditKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.DBEditLimitKeyPress(Sender: TObject;
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

procedure TCO_AccSettings.EditFilKeyPress(Sender: TObject; var Key: Char);
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

procedure TCO_AccSettings.DBLookupComboBox4KeyPress(Sender: TObject;
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

procedure TCO_AccSettings.Button1KeyPress(Sender: TObject; var Key: Char);
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

procedure TCO_AccSettings.FormActivate(Sender: TObject);
begin
Dbedit1.Text :='';
Dbedit2.Text :='';
Dbedit3.Text :='';
Dbedit5.Text :='';
CO_DataMod.Sysdat.Open;
CO_DataMod.AccSettings.Open;
DTPOpenDate.Date :=CO_DataMod.Sysdat.fieldbyname('tek_dat').asdatetime;
Editvalute.text := CO_DataMod.AccSettings.fieldbyname('val_code').asstring;
dbedit1.text := CO_DataMod.AccSettings.fieldbyname('val_name').asstring;
Editball.text := CO_DataMod.AccSettings.fieldbyname('bal_cn1').asstring;
dbedit2.text := CO_DataMod.AccSettings.fieldbyname('bal_name').asstring;
editcust.text := CO_DataMod.AccSettings.fieldbyname('cust_id').asstring;
dbedit3.text := CO_DataMod.AccSettings.fieldbyname('cust_name').asstring;
//DTPOpenDate.date :=Datamod_Buyers.CC_Settings.fieldbyname('open_date').asdatetime);
symboledit.text :=CO_DataMod.AccSettings.fieldbyname('acc_symbol').asstring;
DBEditLimit.text :=CO_DataMod.AccSettings.fieldbyname('limit').asstring;
Editfil.text :=CO_DataMod.AccSettings.fieldbyname('branch_id').asstring;
dbedit5.text :=CO_DataMod.AccSettings.fieldbyname('branch_name').asstring;

end;

end.
