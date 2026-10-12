unit UnitForm_Scoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, DB, OracleData, Grids, XDBGrids, ExtCtrls,
  DBGridEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TForm_Scoring = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFPanel3: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    XFLabel5: TXFLabel;
    XDBGrid1: TXDBGrid;
    ods_sc_risk: TOracleDataSet;
    ods_corafi: TOracleDataSet;
    ods_mehsul: TOracleDataSet;
    ods_catdirilma: TOracleDataSet;
    ods_emeliyat: TOracleDataSet;
    OracleDataSet6: TOracleDataSet;
    dsrc_sc_risk: TDataSource;
    dsrc_corafi: TDataSource;
    dsrc_mehsul: TDataSource;
    dsrc_catdirilma: TDataSource;
    dsrc_emeliyat: TDataSource;
    DataSource6: TDataSource;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    DBLookupComboboxEh_risk: TDBLookupComboboxEh;
    DBLookupComboboxEh_mehsul: TDBLookupComboboxEh;
    DBLookupComboboxEh_corafi: TDBLookupComboboxEh;
    DBLookupComboboxEh_catdirilma: TDBLookupComboboxEh;
    DBLookupComboboxEh_emeliyyat: TDBLookupComboboxEh;
    XFLabel7: TXFLabel;
    Edit_pin: TEdit;
    OracleDataSet6PINKOD: TWideStringField;
    OracleDataSet6RESULT: TWideStringField;
    OracleDataSet6RISK: TFloatField;
    OracleDataSet6RISK_NAME: TWideStringField;
    OracleDataSet6CORAFI_NAME: TWideStringField;
    OracleDataSet6MEHSUL_NAME: TWideStringField;
    OracleDataSet6CATDIRILMA_NAME: TWideStringField;
    OracleDataSet6EMELIYYAT_NAME: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Scoring: TForm_Scoring;

implementation
  uses sboapiDataModuleImpl, UnitDataModPCustService;
{$R *.dfm}

procedure TForm_Scoring.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit_pin.Clear;
DBLookupComboboxEh_risk.KeyValue:=-1;
DBLookupComboboxEh_mehsul.KeyValue:=-1;
DBLookupComboboxEh_corafi.KeyValue:=-1;
DBLookupComboboxEh_catdirilma.KeyValue:=-1;
DBLookupComboboxEh_emeliyyat.KeyValue:=-1;


end;

procedure TForm_Scoring.FormCreate(Sender: TObject);
begin
ods_sc_risk.Open;
ods_corafi.Open;
ods_mehsul.Open;
ods_catdirilma.Open;
ods_emeliyat.Open;
end;

procedure TForm_Scoring.XFButton1Click(Sender: TObject);
var
DummyAction: TCloseAction;
risk:integer;
corafi:integer;
mehsul:integer;
cadirilma:integer;
emeliyyat:integer;
 begin
   if  DBLookupComboboxEh_risk.KeyValue<>-1 then
       risk := ods_sc_risk.FieldByName('ID').AsInteger
       else
   risk :=0;

   if  DBLookupComboboxEh_corafi.KeyValue<>-1 then
       corafi := ods_corafi.FieldByName('ID').AsInteger
       else
   corafi :=0;

   if  DBLookupComboboxEh_catdirilma.KeyValue<>-1 then
       cadirilma := ods_catdirilma.FieldByName('ID').AsInteger
       else
   cadirilma :=0;

   if  DBLookupComboboxEh_mehsul.KeyValue<>-1 then
       mehsul := ods_mehsul.FieldByName('ID').AsInteger
       else
   mehsul :=0;

   if  DBLookupComboboxEh_emeliyyat.KeyValue<>-1 then
       emeliyyat := ods_emeliyat.FieldByName('ID').AsInteger
       else
   emeliyyat :=0;
         if Edit_pin.Text='' then
       begin
         showmessage('Pinkodu daxil edin ')  ;
         exit;
       end
       else
       DataModPCustService.PG_PCustService.CallProcedure('insert_cust_scoring_chek',
       [ edit_pin.Text, risk ,corafi ,mehsul,cadirilma,emeliyyat]);

       with   oracledataset6   do
       begin
         close;
       SetVariable('v_pin',edit_pin.Text);
         open;
       end;



  DummyAction := caNone;
  FormClose(Self, DummyAction);

end;

procedure TForm_Scoring.XFButton2Click(Sender: TObject);
var
DummyAction: TCloseAction;
begin
  DummyAction := caNone;
  FormClose(Self, DummyAction);
  with   oracledataset6   do
       begin
         close;
       SetVariable('v_pin','');
         open;
       end;
  Form_Scoring.Close;
end;

end.
