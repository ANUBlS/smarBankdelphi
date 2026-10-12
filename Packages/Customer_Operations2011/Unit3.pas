unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, ActnList, Db, OracleData, Oracle,
  Mask;

type
  TForm3 = class(TForm)
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionUpdate: TAction;
    ActionDelete: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText2: TStaticText;
    EIssuedBy: TEdit;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Panel4: TPanel;
    StaticText3: TStaticText;
    EPersonDoc: TEdit;
    Panel5: TPanel;
    StaticText4: TStaticText;
    EFromWhen: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText5: TStaticText;
    ESeria: TEdit;
    Panel8: TPanel;
    StaticText6: TStaticText;
    EDocNumber: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBLookupCashInfo: TDBLookupComboBox;
    BrowseCashInfo: TOracleDataSet;
    DataBrowseCashInfo: TDataSource;
    OPCash: TOraclePackage;
    BrowseCashInfoISSUEDBY: TStringField;
    BrowseCashInfoID: TFloatField;
    BrowseCashInfoPERSON_DOC: TStringField;
    BrowseCashInfoSERIA: TStringField;
    BrowseCashInfoDOCNUMBER: TStringField;
    BrowseCashInfoFROMWHEN: TStringField;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupCashInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses BookmarkSetup, CO_AccFlags, CO_AccSettings_Unit, CO_BookmarkAddEditunt,
  CO_Choose_unit, CO_datamod_impl, CO_frmWReportImpl, CO_In_Unit,
  CO_Interval_unit, co_memorial, CO_MemorialRep1_unit, co_order_qrep_unit,
  co_Order_Rep_unit, co_properties_unit, co_report_unit, CO_reportUnit,
  co_st_check, CO_Statement_impl, CO_TemplateAddEditUnt, CO_Transact_Unitp,
  CurrencyToHR_Azeri_Impl, CustInfoFormImpl, customer_operations_TLB,
  customers_operation_impl, FormAcc_Unit, MemorialRep, P_AccState_Unit,
  P_AccTransaction_Unit, P_Interval_Unit, Rep_unit, RepR_unit,
  transview_unit, uAccViewFormImpl, UnitBProc, UnitCustProps,
  uTrViewFormImpl,sboapiDataModuleImpl;

{$R *.DFM}

procedure TForm3.BitBtn1Click(Sender: TObject);
var i:byte;
begin
  OPCash.CallProcedure('add_CashInfo',[CO_Datamod.Transactions.FieldByName('ID').AsInteger,EPersonDoc.text,EIssuedBy.text,ESeria.text,EDocNumber.text,EFromWhen.text]);
  //co_datamod.DSCashInfo.Refresh;

 // BrowseCashInfo.Refresh;
    for i:=0 to  ComponentCount-1 do
  if (Components[i] is TEdit) then
    (Components[i] as TEdit).text :='';
  close;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin

   //showmessage(inttostr(CO_Datamod.Transactions.FieldByName('ID').AsInteger));
   OPCash.CallProcedure('update_CashInfo',[CO_Datamod.Transactions.FieldByName('ID').AsInteger,EPersonDoc.text,EIssuedBy.text,ESeria.text,EDocNumber.text,EFromWhen.text]);
   //co_datamod.DSCashInfo.Refresh;
   BrowseCashInfo.Refresh;
   close;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
   i:integer;
begin


   OPCash.CallProcedure('delete_CashInfo',[CO_Datamod.Transactions.FieldByName('ID').AsInteger]);
   BrowseCashInfo.Refresh;
      for i:=0 to  ComponentCount-1 do
  if (Components[i] is TEdit) then
    (Components[i] as TEdit).text :='';
   //co_datamod.DSCashInfo.Refresh;
   close;

end;

procedure TForm3.FormActivate(Sender: TObject);
begin

  //bitbtn1.Enabled:=true;
  // bitbtn2.Enabled:=true;
  // bitbtn3.Enabled:=true;
  // bitbtn1.Enabled:=co_datamod.dscashinfo.IsEmpty;
  //bitbtn2.Enabled:=not co_datamod.dscashinfo.IsEmpty;
  // bitbtn3.Enabled:=not co_datamod.dscashinfo.IsEmpty;



  {
    EPersonDoc.Text :=FieldByName('Person_doc').AsString;
   EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
   ESeria.Text :=FieldByName('Seria').AsString;
   EDocNumber.Text :=FieldByName('DocNumber').AsString;
   EFromWhen.Text :=FieldByName('FromWhen').AsString;

  }
end;

procedure TForm3.DBLookupCashInfoClick(Sender: TObject);
begin

  with (Sender as TDBLookupComboBox), ListSource, DataSet do
  begin
   EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
   EPersonDoc.Text :=FieldByName('Person_Doc').AsString;
   EFromWhen.Text := FieldByName('FromWhen').AsString;
   ESeria.Text :=FieldByName('Seria').AsString;
   EDocNumber.Text :=FieldByName('DocNumber').AsString;
  end;

end;

procedure TForm3.FormShow(Sender: TObject);
 var
 i:byte;
begin
     for i:=0 to  ComponentCount-1 do
     if (Components[i] is TEdit) then
     (Components[i] as TEdit).text :='';

   if browsecashinfo.Active=false then browsecashinfo.open;

  co_datamod.dscashinfo.active:=false;
  co_datamod.dscashinfo.SetVariable(':id',co_datamod.Transactions.fieldbyname('id').asinteger);
  if co_datamod.dscashinfo.Active=false then co_datamod.dscashinfo.Open;
  co_datamod.dscashinfo.refresh;


   browsecashinfo.Refresh;
      if not (co_datamod.dscashinfo.IsEmpty) then
      with co_datamod.dscashinfo do
      begin
   EPersonDoc.Text :=FieldByName('Person_doc').AsString;
   EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
   ESeria.Text :=FieldByName('Seria').AsString;
   EDocNumber.Text :=FieldByName('DocNumber').AsString;
   EFromWhen.Text :=FieldByName('FromWhen').AsString;
     end;



   bitbtn1.Enabled:=co_datamod.dscashinfo.IsEmpty;
   bitbtn2.Enabled:=not co_datamod.dscashinfo.IsEmpty;
   bitbtn3.Enabled:=not co_datamod.dscashinfo.IsEmpty;







end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 //form3:=nil;
end;

end.
