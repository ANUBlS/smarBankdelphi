unit UnitOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, ActnList, Db, OracleData, Oracle,
  Mask, XPMan;

type
  TFormOrderInfo = class(TForm)
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
    DBLookupCashInfo: TDBLookupComboBox;
    BrowseCashInfo: TOracleDataSet;
    DataBrowseCashInfo: TDataSource;
    OPCash: TOraclePackage;
    BrowseCashInfoID: TFloatField;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    BrowseCashInfoISSUEDBY: TWideStringField;
    BrowseCashInfoPERSON_DOC: TWideStringField;
    BrowseCashInfoSERIA: TWideStringField;
    BrowseCashInfoDOCNUMBER: TWideStringField;
    BrowseCashInfoFROMWHEN: TWideStringField;
    DSetCustInfo: TOracleDataSet;
    DSetCustInfoID: TIntegerField;
    DSetCustInfoNAME: TWideStringField;
    DSetCustInfoSHORT_NAME: TWideStringField;
    DSetCustInfoCUSTINFO_ID: TFloatField;
    DSetCustInfoSAA: TWideStringField;
    DSetCustInfoPASSER: TWideStringField;
    DSetCustInfoPASPNUM: TWideStringField;
    DSetCustInfoDOC_TYPE: TFloatField;
    DSetCustInfoPASPPLACE: TWideStringField;
    BtnAdd: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DBLookupCashInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EDocNumberChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOrderInfo: TFormOrderInfo;

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
  uTrViewFormImpl, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormOrderInfo.FormActivate(Sender: TObject);
begin
  {
    bitbtn1.Enabled:=true;
    bitbtn2.Enabled:=true;
    bitbtn3.Enabled:=true;
    bitbtn1.Enabled:=co_datamod.dscashinfo.IsEmpty;
    bitbtn2.Enabled:=not co_datamod.dscashinfo.IsEmpty;
    bitbtn3.Enabled:=not co_datamod.dscashinfo.IsEmpty;

    EPersonDoc.Text :=FieldByName('Person_doc').AsString;
    EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
    ESeria.Text :=FieldByName('Seria').AsString;
    EDocNumber.Text :=FieldByName('DocNumber').AsString;
    EFromWhen.Text :=FieldByName('FromWhen').AsString;

  }
end;

procedure TFormOrderInfo.DBLookupCashInfoClick(Sender: TObject);
begin

  with (Sender as TDBLookupComboBox), ListSource, DataSet do
  begin
    EIssuedBy.Text := FieldByName('IssuedBy').AsString;
    EPersonDoc.Text := FieldByName('Person_Doc').AsString;
    EFromWhen.Text := FieldByName('FromWhen').AsString;
    ESeria.Text := FieldByName('Seria').AsString;
    EDocNumber.Text := FieldByName('DocNumber').AsString;
  end;

end;

procedure TFormOrderInfo.EDocNumberChange(Sender: TObject);
begin
  if (EIssuedBy.Text = '') AND (EPersonDoc.Text = '') AND (ESeria.Text = '') AND
    (EFromWhen.Text = '') then
  begin
    DSetCustInfo.Filtered := False;
    DSetCustInfo.Filter := 'paspnum= ''' + EDocNumber.Text + '''';
    DSetCustInfo.Filtered := True;
    EIssuedBy.Text := DSetCustInfo.FieldByName('SAA').AsWideString;
    EPersonDoc.Text := DSetCustInfo.FieldByName('DOC_TYPE').AsWideString;
    ESeria.Text := DSetCustInfo.FieldByName('PASSER').AsWideString;
    EFromWhen.Text := DSetCustInfo.FieldByName('PASPPLACE').AsWideString;
  end;
end;

procedure TFormOrderInfo.FormShow(Sender: TObject);
var
  i: byte;
begin

  if BrowseCashInfo.Active = False then
    BrowseCashInfo.open;
  if DSetCustInfo.Active = False then
    DSetCustInfo.open;

  if BrowseCashInfo.Locate('ID', CO_DataMod.Transactions.FieldByName('ID')
    .AsInteger, [loCaseInsensitive, loPartialKey]) then

    with BrowseCashInfo do
    begin
      EPersonDoc.Text := FieldByName('Person_doc').AsWideString;
      EIssuedBy.Text := FieldByName('IssuedBy').AsWideString;
      ESeria.Text := FieldByName('Seria').AsWideString;
      EDocNumber.Text := FieldByName('DocNumber').AsWideString;
      EFromWhen.Text := FieldByName('FromWhen').AsWideString;
      BtnAdd.Enabled := False;
    end

  else
  begin
    BtnAdd.Enabled := True;
    EPersonDoc.Text := '';
    EIssuedBy.Text := '';
    ESeria.Text := '';
    EDocNumber.Text := '';
    EFromWhen.Text := '';
  end; {
    for i:=0 to  ComponentCount-1 do
    if (Components[i] is TEdit) then
    (Components[i] as TEdit).text :='';

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
  }
end;

procedure TFormOrderInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // form3:=nil;
end;

procedure TFormOrderInfo.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormOrderInfo.BtnAddClick(Sender: TObject);
var
  i: byte;
begin
  OPCash.CallProcedure('add_CashInfo',
    [CO_DataMod.Transactions.FieldByName('ID').AsInteger, EPersonDoc.Text,
    EIssuedBy.Text, ESeria.Text, EDocNumber.Text, EFromWhen.Text]);
  // co_datamod.DSCashInfo.Refresh;

  BrowseCashInfo.Refresh;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TEdit) then
      (Components[i] as TEdit).Text := '';
    close;
end;

procedure TFormOrderInfo.BtnEditClick(Sender: TObject);
begin
  OPCash.CallProcedure('update_CashInfo',
    [CO_DataMod.Transactions.FieldByName('ID').AsInteger, EPersonDoc.Text,
    EIssuedBy.Text, ESeria.Text, EDocNumber.Text, EFromWhen.Text]);
  // co_datamod.DSCashInfo.Refresh;
  BrowseCashInfo.Refresh;
  close;
end;

procedure TFormOrderInfo.BtnDelClick(Sender: TObject);
var
  i: integer;
begin
  OPCash.CallProcedure('delete_CashInfo',
    [CO_DataMod.Transactions.FieldByName('ID').AsInteger]);
  BrowseCashInfo.Refresh;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TEdit) then
      (Components[i] as TEdit).Text := '';
    // co_datamod.DSCashInfo.Refresh;
    close;
end;

end.
