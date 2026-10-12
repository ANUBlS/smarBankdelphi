unit Contractimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CMDBSearchEdit, Buttons, ComCtrls, DBCtrls, Mask, DBCtrlsEh,
  DBLookupEh, ExtCtrls, Db, OracleData, CMHintBox, NLSLocalizer;

type
  TFrmContract = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BranchCBEh: TDBLookupComboboxEh;
    Panel3: TPanel;
    StaticText2: TStaticText;
    DBEdit8: TDBEdit;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    Panel2: TPanel;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText19: TStaticText;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    DBEdit6: TDBEdit;
    StaticText17: TStaticText;
    GroupBox5: TGroupBox;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    DBEdit4: TDBEdit;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    GroupBox6: TGroupBox;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    HBConclusion: TCMHintBox;
    DBEdit5: TDBEdit;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh5: TDBNumberEditEh;
    DBNumberEditEh6: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    DBLookupComboBox1: TDBLookupComboBox;
    StaticText13: TStaticText;
    StaticText18: TStaticText;
    StaticText10: TStaticText;
    StaticText12: TStaticText;
    StaticText11: TStaticText;
    StaticText9: TStaticText;
    StaticText7: TStaticText;
    StaticText16: TStaticText;
    DBEditEh3: TDBEditEh;
    Edit7: TEdit;
    StaticText1: TStaticText;
    EditFlatCode: TEdit;
    EditPrice1: TEdit;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText8: TStaticText;
    GroupBox3: TGroupBox;
    SpeedButton2: TSpeedButton;
    CMSearchEditLoacAccs: TCMSearchEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBNumberEditEh7: TDBNumberEditEh;
    StaticText22: TStaticText;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEh6KeyValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboboxEh6Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DTPCloseDateChange(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
   procedure CheckFields;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContract: TFrmContract;

implementation
 uses DatModConstimpl, FlatsMgrIMPL, UnitData,sboapiDataModuleImpl,
  UnitAccBuyers, cc_BuyersPr_TLB, cc_BuyersImpl, RepContImpl;
{$R *.DFM}

procedure TFrmContract.BitBtn2Click(Sender: TObject);
begin
close;
end;
procedure TFrmContract.CheckFields;
begin
 if DBEdit8.text='' then
   begin
   HBConclusion.ShowMessage('Ìöãàâèëÿíèí ¹ sahÿsi boødur !') ;
   abort
   end;
if Edit6.text='' then
   begin
   HBConclusion.ShowMessage('Ìöãàâèëÿíèí äÿéÿðè sahÿsi boødur !') ;
   abort
   end;
 if CMSearchEditLoacAccs.text='' then
   begin
   HBConclusion.ShowMessage('Ìöãàâèëÿíèí äÿéÿðè sahÿsi boødur !') ;
   abort
   end;
   end;
procedure TFrmContract.BitBtn1Click(Sender: TObject);
var

  CustomerID    :  integer;
  op_id         :  integer;
  accno         :  string;
  CurrencyID    :  integer;
  name          :  string;
  open_dat      :  tdatetime;
  balcn         :  integer;
  ownid         :  integer;
  AccID         :  integer;
begin


        DatModConstr.Accounts.close;
        DatModConstr.Accounts.SetVariable('BID',DBLookupComboboxEh6.keyvalue);
        DatModConstr.Accounts.Open;
   if not DatModConstr.cc_settings.active  then DatModConstr.cc_settings.open;




  AccID :=DatModConstr.CreditPurpose.FieldByName('ACCID').AsInteger;

  if DatModConstr.CreditPurpose.State=dsInsert then
  begin
            accno:=DatModConstr.CC_GENERAL.CallStringFunction('GenerateAccountNumber',['CustomerID',strtoint(DBEdit1.Text)]);
            CustomerID:=DatModConstr.cc_settings.FieldByName('ACCCUST').AsInteger;
            CurrencyID:=DatModConstr.cc_settings.FieldByName('ACCCUR').AsInteger;
            name:=DBLookupComboboxEh6.Text;
            open_dat:=Integer(Trunc(DatModConstr.SBOP.CallDateFunction('get_date',[])));
            balcn:=DatModConstr.cc_settings.FieldByName('ACCBALCN').AsInteger;
            ownid:=DatModConstr.CreditPurpose.FieldByName('BUYER').AsInteger;

   AccID := DatModConstr.CC_GENERAL.CallIntegerFunction('add_account',[
   'p_CustID', customerid,
   'p_AccNo', accno,
   'p_Curr', currencyid,
   'p_Name', name,
   'p_OpenDate', open_dat,
   'p_BalCn', balcn,
   'p_OwnID', ownid]);
    DatModConstr.Accounts.Refresh;
   end;

   with DatModConstr,CreditPurpose do  begin
         //if State = (dsINSERT) then begin
         FieldByName('AccID').AsInteger := AccID;
         FieldByName('CONTAMOUNT').asfloat:= FieldByName('restt').AsFloat;
         FieldByName('opendate').AsDateTime := trunc(DTPOpenDate.DateTime);
         FieldByName('note').AsInteger:=DBLookupComboBox1.KeyValue;
         //end;
        Post;

   end;

    DataMod_Buyers.ODSBuyers.Refresh;
    if not Assigned(DatModConstr) then DatModConstr:= TDatModConstr.Create(Self);
       DatModConstr.cc_bookmarkDataSet.Close;
       DatModConstr.cc_bookmarkDataSet.SetVariable('Flatcode', EditFlatCode.Text );
       DatModConstr.cc_bookmarkDataSet.Open;
       DatModConstr.Templates.Close;
       DatModConstr.Templates.Open;
       RepCont:=TRepCont.Create(self);
       RepCont.ShowModal;

   FrmContract.Close;

end;

{
var
  //DDate :TDateTime;
  CustomerID    :  integer;
  op_id         :  integer;
  accno         :  string;
  CurrencyID    :  integer;
  name          :  string;
  open_dat      :  tdatetime;
  balcn         :  integer;
  ownid         :  integer;
  AccID         :  integer;
begin

  if not DatModConstruction.cc_settings.active  then DatModConstruction.cc_settings.open;

  //DDate :=Trunc(DatModConstruction.SBOP.CallDateFunction('get_date',[]));
  AccID :=DatModConstruction.CreditPurpose.FieldByName('ACCID').AsInteger;
  if DatModConstruction.CreditPurpose.State=dsInsert then
  begin
        CustomerID:=DatModConstruction.cc_settings.FieldByName('ACCCUST').AsInteger;
        CurrencyID:=DatModConstruction.cc_settings.FieldByName('ACCCUR').AsInteger;
        name:=DBLookupComboboxEh6.Text;
        open_dat:=Integer(Trunc(DatModConstruction.SBOP.CallDateFunction('get_date',[])));
        balcn:=DatModConstruction.cc_settings.FieldByName('ACCBALCN').AsInteger;
        ownid:=DatModConstruction.CreditPurpose.FieldByName('BUYER').AsInteger;
        accno:=DatModConstruction.sbcm_construction.CallStringFunction('GenerateAccountNumber',['CustomerID',strtoint(DBEdit1.Text)]);

               AccID := DatModConstruction.sbcm_construction.CallIntegerFunction('add_account',[
               'p_CustID', customerid,
               'p_AccNo', accno,
               'p_Curr', currencyid,
               'p_Name', name,
               'p_OpenDate', open_dat,
               'p_BalCn', balcn,
               'p_OwnID', ownid]);
                DatModConstruction.Accounts.Refresh;
   end;

   with DatModConstruction,CreditPurpose do
   begin

         FieldByName('AccID').AsInteger := AccID;
         FieldByName('CONTAMOUNT').asfloat:= FieldByName('restt').AsFloat;
         FieldByName('opendate').AsDateTime := trunc(DTPOpenDate.DateTime);
         FieldByName('note').AsInteger:=DBLookupComboBox1.KeyValue;
         Post;
         DatModConstruction.Credits.Refresh;
   end;

   DatModConstruction.Credits.Locate('CONTNUM', AddEditContractForm.DBEditContNum.Text, []);
   AddEditContractForm.Close;

}


procedure TFrmContract.BitBtn3Click(Sender: TObject);
begin
  if not Assigned(FlatsMgrForm) then FlatsMgrForm:= TFlatsMgrForm.Create(Self);
  FlatsMgrForm.ShowModal;
  FlatsMgrForm.flat.Open;
FlatsMgrForm.building.Open;
FlatsMgrForm.companie.Open;
end;

procedure TFrmContract.FormActivate(Sender: TObject);
begin

DatModConstr.Customers.Refresh;
DBLookupComboboxEh2.Text:=DBLookupComboboxEh2.ListSource.DataSet.FieldByName('NAME').AsString;
Edit7.Text:=DatModConstr.CreditPurpose.FieldByName('PeriodContracts').AsString;
DBLookupComboBox1.KeyValue:=DatModConstr.CreditPurpose.FieldByName('note').AsString;

BranchCBEh.KeyValue := 0;
DBLookupComboboxEh5.KeyValue := 0;
end;

procedure TFrmContract.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:= false
end;

procedure TFrmContract.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
  end
end;

procedure TFrmContract.FormShow(Sender: TObject);
begin
 FrmContract.DBEdit1.text:= DataMod_Buyers.ODSBuyers.fieldbyname('id').asstring;
DBLookupComboboxEh6.keyvalue := DataMod_Buyers.ODSBuyers.fieldbyname('id').asstring;

end;

procedure TFrmContract.DBLookupComboboxEh6KeyValueChanged(Sender: TObject);
begin
  with (Sender as TDBLookupComboboxEh) do
  if DataSource.DataSet.Active then
   UpdateData;
end;

procedure TFrmContract.DTPCloseDateChange(Sender: TObject);
begin
   with DatModConstr,CreditPurpose do  begin

         FieldByName('opendate').AsDateTime := trunc(DTPOpenDate.DateTime);
         FieldByName('expdate').AsDateTime := trunc(DTPCloseDate.DateTime);


      // DatModConstruction.Credits.Refresh;
   end;
    Edit7.Text:=DBEditEh3.Text;
end;

procedure TFrmContract.Edit7Change(Sender: TObject);
var
mon : integer;
begin
mon := strtoint(edit7.text);
FrmContract.DTPCloseDate.DateTime:=DatModConstr.CC_GENERAL.CallDateFunction('GetFindExpdate',['odat',DTPOpenDate.DateTime,'mon',mon]);
 with DatModConstr,CreditPurpose do  begin

         FieldByName('opendate').AsDateTime := trunc(DTPOpenDate.DateTime);
         FieldByName('expdate').AsDateTime := trunc(DTPCloseDate.DateTime);


      // DatModConstruction.Credits.Refresh;
   end;
end;

procedure TFrmContract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DataMod_Buyers.ODSBuyers.Locate('ID',DBEdit1.Text,[]);
//FrmContract :=TFrmContract.Create(nil);
//DatModConstruction :=TDatModConstruction.Create(nil);

end;

procedure TFrmContract.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close
end;

procedure TFrmContract.DBLookupComboboxEh6Change(Sender: TObject);
begin
        DatModConstr.Accounts.close;
        DatModConstr.Accounts.SetVariable('BID',DBLookupComboboxEh6.keyvalue);
       // DatModConstruction.Accounts.SetVariable('BID',DataMod_Buyers.ODSBuyers.fieldbyname('id').asstring);
        DatModConstr.Accounts.Open;

end;

procedure TFrmContract.SpeedButton2Click(Sender: TObject);
begin
try
   FormAccBuyers :=TFormAccBuyers.Create(self);
     FormAccBuyers.Showmodal;
       finally
        FormAccBuyers.Release;
        end;
end;

end.
