unit newcard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, DBGrids, DBCtrls, Mask,
  DBCtrlsEh, Db, SearchEdit,Variants;

type
  TCustomer_new = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    ComboBox10: TComboBox;
    DateTimePicker3: TDateTimePicker;
    Button5: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    ComboBox6: TComboBox;
    Edit9: TEdit;
    ComboBox7: TComboBox;
    CheckBox1: TCheckBox;
    Edit12: TEdit;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    cardnumber: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DateTimePicker4: TDateTimePicker;
    DBGrid4: TDBGrid;
    ComboBox2: TComboBox;
    Label34: TLabel;
    DBEdit5: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    Edit27: TEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    Edit14: TEdit;
    Memo1: TMemo;
    Edit15: TEdit;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    Edit28: TEdit;
    Label9: TLabel;
    DBEdit17: TDBEdit;
    Label35: TLabel;
    CheckBox2: TCheckBox;
    Label36: TLabel;
    CheckBox3: TCheckBox;
    Edit29: TEdit;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBLookupComboBox6Enter(Sender: TObject);
    procedure DBLookupComboBox6Click(Sender: TObject);
    procedure SearchEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15Change(Sender: TObject);
    procedure Edit15Click(Sender: TObject);
    procedure Edit15DblClick(Sender: TObject);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker8Change(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure ComboBox9Click(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox9Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Customer_new: TCustomer_new;

implementation

uses balans, CARDS_TLB, customers, MAINFORMImpl1, payment, Unit18,
  applicationpas, cfilepas, creditinfopas, dpforms, atmendpos, balhs,
  banksettings, comp, crdtype, datclose, domesticbank, filialaccounts,
  rezform, setac, U9,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TCustomer_new.FormCreate(Sender: TObject);
begin
//ShowMessage(Edit1.text);

         DataMod_CARDS.mushteriler.Open;
        DataMod_CARDS.hesab.Close;
        DataMod_CARDS.hesab.SetVariable('CID', null);
        DataMod_CARDS.hesab.SetVariable('p_AccNO', '%%');
        DataMod_CARDS.hesab.Open  ;

//refresh;
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TCustomer_new.Button4Click(Sender: TObject);
begin
close;
end;

procedure TCustomer_new.FormActivate(Sender: TObject);
var i,Z:integer;
acc:string;
begin

if edit1.Text='NEW' then
begin
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;

DataMod_CARDS.CARDOPERATION.Close;
 DataMod_CARDS.cliencards.Close;
DBGrid5.Enabled:=False;
DataMod_CARDS.COMPANY.Close;
DataMod_CARDS.COMPANY.Open;

Edit33.Visible:=False;




 Button3.Enabled:=False;
 Button5.Enabled:=False;

 DBEdit11.Text:='';
 DBEdit3.Text:='';
 dbedit18.Text:='';
DateTimePicker5.DateTime:=Date;
DateTimePicker8.DateTime:=Date+365;
DateTimePicker6.DateTime:=DateTimePicker8.DateTime;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
ComboBox11.ItemIndex:=0;
ComboBox12.ItemIndex:=0;
ComboBox5.ItemIndex:=0;
ComboBox4.ItemIndex:=0;
//DBLookupComboBox8.KeyValue:=1;
DBLookupComboBox10.KeyValue:=0;
edit14.Text:='';
DBEdit4.Visible:=True;
Edit28.Visible:=False;
//DBLookupComboBox7.Visible:=True;
Edit15.Visible:=True;
Edit16.Visible:=True;
Edit17.Visible:=True;
Edit27.Visible:=True;
Edit18.Visible:=True;
Edit20.Visible:=True;
Edit21.Visible:=True;
Edit19.Visible:=True;
Edit22.Visible:=True;
//DBLookupComboBox8.Visible:=True;
//DBLookupComboBox9.Visible:=True;
DBLookupComboBox10.Visible:=True;
ComboBox5.Visible:=True;
ComboBox4.Visible:=True;
Edit26.Visible:=True;
Edit25.Visible:=True;
Edit24.Visible:=True;
Edit23.Visible:=True;
ComboBox2.Visible:=True;
end;

DataMod_CARDS.clienapp.close;
DataMod_CARDS.clienapp.open;




//DataMod_CARDS.CUSTINFO.Close;
//DataMod_CARDS.CUSTINFO.SetVariable('ACCID',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.CUSTINFO.Open;

//DataMod_CARDS.custaccount.Close;
//DataMod_CARDS.custaccount.SetVariable('kli',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.custaccount.Open;

//DataMod_CARDS.valuta.Close;
//DataMod_CARDS.valuta.SetVariable('valkod',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.valuta.Open;


//DataMod_CARDS.allclientcredits.close;
//DataMod_CARDS.allclientcredits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
//DataMod_CARDS.allclientcredits.Open;


DataMod_CARDS.allclientdepozits.close;
DataMod_CARDS.allclientdepozits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.allclientcredits.Open;



if Edit1.Text='NEW' then
begin
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
Edit9.Text:='';
//Edit11.Text:='';
Edit12.Text:='';
//Edit13.Text:='';


//-------------------
 

 ComboBox2.Visible:=True;
//DBLookupComboBox9.Visible:=False;
 DateTimePicker7.Visible:=True;
 DateTimePicker8.Visible:=True;
DBLookupComboBox10.Visible:=True;
DBLookupComboBox4.Visible:=False;
DBGrid1.Enabled:=False;
DBEDIT1.VISIBLE:=False;
EDIT14.VISIBLE:=True;
DBEDIT2.VISIBLE:=False;
//DBEdit18.Visible:=False;
DBEDIT18.VISIBLE:=True;
DBLookupComboBox6.VISIBLE:=True;
//DBLookupComboBox6.DataSource:=DataMod_CARDS.ClientListSource;
//DBLookupComboBox6.DataField:='RBSNUMBER';




DBLookupComboBox1.VISIBLE:=False;
Edit29.Visible:=False;
DBEDIT4.VISIBLE:=False;
EDIT28.VISIBLE:=True;
//DBLookupComboBox7.VISIBLE:=False;
//COMBOBOX10.VISIBLE:=True;
//DBLookupComboBox3.VISIBLE:=False;
COMBOBOX11.VISIBLE:=true;
DBLookupComboBox2.VISIBLE:=False;
COMBOBOX12.VISIBLE:=True;
Edit25.Visible:=True;
ComboBox4.Visible:=True;
ComboBox6.Visible:=False;
//if  DataMod_CARDS.Clients.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
DBEdit9.Visible:=True;
Edit2.Visible:=False;
Edit3.Visible:=False;
Edit4.Visible:=False;
Edit5.Visible:=False;
Edit6.Visible:=False;
Edit9.Visible:=False;
//Edit10.Visible:=False;
//Edit11.Visible:=False;
Edit12.Visible:=False;
//Edit13.Visible:=False;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
DateTimePicker4.Visible:=False;
EDIT27.Visible:=True;
EDIT17.Visible:=TRUE;
EDIT4.Visible:=False;
EDIT5.Visible:=False;
//if DataMod_CARDS.Clients.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
//Edit2.Text:=DataMod_CARDS.Clients.FieldByName('FNAME').AsString;
//Edit3.Text:=DataMod_CARDS.Clients.FieldByName('LNAME').AsString;
//Edit4.Text:=DataMod_CARDS.Clients.FieldByName('HOMEPHONE').AsString;
//Edit5.Text:=DataMod_CARDS.Clients.FieldByName('WORKPHONE').AsString;
//Edit6.Text:=DataMod_CARDS.Clients.FieldByName('PASSPORT').AsString;
//Edit9.Text:=DataMod_CARDS.Clients.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.Clients.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.Clients.FieldByName('EMBOSSNAME').AsString;
//Edit12.Text:=DataMod_CARDS.Clients.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.Clients.FieldByName('ADDRESS').AsString;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
//DateTimePicker4.DateTime:= DataMod_CARDS.Clients.FieldByName('EXPIRY').AsDATETIME;


//------------------




end;


if Edit1.Text='EDIT' then
begin


 CheckBox1.Enabled:=False;
 CheckBox2.Enabled:=False;
 CheckBox3.Enabled:=False;


 DBDateTimeEditEh4.DataSource:=DataMod_CARDS.ClientListSource;
 DBDateTimeEditEh4.DataField:='BIRTHDAY';


cardnumber.DataSource:=DataMod_CARDS.ClientListSource;
cardnumber.DataField:='CARDNUMBER';


DBLookupComboBox4.DataSource:=DataMod_CARDS.ClientListSource;
DBLookupComboBox4.DataField:='CARDTYPE';
Edit30.Visible:=False;

 DBGrid5.Enabled:=True;
 CheckBox3.Enabled:=False;
 CheckBox2.Enabled:=False;
DataMod_CARDS.CARDOPERATION.Close;
DataMod_CARDS.CARDOPERATION.SetVariable('RBS',DataMod_CARDS.Clients.fieldbyname('RBSNUMBER').ASSTRING) ;
DataMod_CARDS.CARDOPERATION.Open;
 DataMod_CARDS.cliencards.Open;

//ShowMessage(DataMod_CARDS.Clients.fieldbyname('ACCID').AsString);
DataMod_CARDS.cariqaliq2.Close;
DataMod_CARDS.cariqaliq2.SetVariable('acc_id',DataMod_CARDS.Clients.fieldbyname('ACCID').Asinteger);
DataMod_CARDS.cariqaliq2.Open;
//ShowMessage(DataMod_CARDS.cariqaliq2.fieldbyname('ostat').asstring);
Edit33.Visible:=True;
Edit33.Text:=DataMod_CARDS.cariqaliq2.fieldbyname('ostat').asstring;
Edit33.Enabled:=False;

  Edit15.Visible:=False;
  Edit16.Visible:=False;
  Edit18.Visible:=False;

  Edit20.Visible:=False;
  Edit21.Visible:=False;
  Edit19.Visible:=False;
  Edit22.Visible:=False;
  Edit23.Visible:=False;
  combobox5.Visible:=False;



 ComboBox2.Visible:=False;
//DBLookupComboBox9.Visible:=True;
 DateTimePicker7.Visible:=False;
 DateTimePicker8.Visible:=False;
DBLookupComboBox10.Visible:=False;
DBLookupComboBox4.Visible:=True;
DBGrid1.Enabled:=True;
DBEDIT1.VISIBLE:=TRUE;
EDIT14.VISIBLE:=FALSE;
DBEDIT2.VISIBLE:=false;
DBEdit18.Visible:=True;
//DBEDIT18.VISIBLE:=TRUE;
DBLookupComboBox6.VISIBLE:=False;
//DBLookupComboBox6.DataSource:=DataMod_CARDS.ClientListSource;
//DBLookupComboBox6.DataField:='RBSNUMBER';




DBLookupComboBox1.VISIBLE:=TRUE;
DataMod_CARDS.editval.Close;
DataMod_CARDS.editval.SetVariable('RBSNUMBER',DBLookupComboBox1.text);
DataMod_CARDS.editval.Open;
Edit29.Text:=DataMod_CARDS.editval.fieldbyname('VAL_NAME').asstring;
Edit29.Visible:=True;
DBEDIT4.VISIBLE:=TRUE;
EDIT28.VISIBLE:=FALSE;
//DBLookupComboBox7.VISIBLE:=TRUE;
//COMBOBOX10.VISIBLE:=FALSE;
//DBLookupComboBox3.VISIBLE:=TRUE;
COMBOBOX11.VISIBLE:=FALSE;
DBLookupComboBox2.VISIBLE:=TRUE;
COMBOBOX12.VISIBLE:=FALSE;
Edit25.Visible:=False;
ComboBox4.Visible:=false;
ComboBox6.Visible:=True;
if  DataMod_CARDS.Clients.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
DBEdit9.Visible:=False;
Edit2.Visible:=True;
Edit3.Visible:=True;
Edit4.Visible:=True;
Edit5.Visible:=True;
Edit6.Visible:=True;
Edit9.Visible:=True;
//Edit10.Visible:=True;
//Edit11.Visible:=True;
Edit12.Visible:=True;
//Edit13.Visible:=True;

 DataMod_CARDS.cliencards.close;
 DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
DataMod_CARDS.cliencards.Open;
DateTimePicker4.Visible:=True;;
EDIT27.Visible:=False;
EDIT17.Visible:=False;
EDIT4.Visible:=True;
EDIT5.Visible:=True;
if DataMod_CARDS.Clients.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
Edit2.Text:=DataMod_CARDS.Clients.FieldByName('FNAME').AsString;
Edit3.Text:=DataMod_CARDS.Clients.FieldByName('LNAME').AsString;
Edit4.Text:=DataMod_CARDS.Clients.FieldByName('HOMEPHONE').AsString;
Edit5.Text:=DataMod_CARDS.Clients.FieldByName('WORKPHONE').AsString;
Edit6.Text:=DataMod_CARDS.Clients.FieldByName('PASSPORT').AsString;
Edit9.Text:=DataMod_CARDS.Clients.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.Clients.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.Clients.FieldByName('EMBOSSNAME').AsString;
Edit12.Text:=DataMod_CARDS.Clients.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.Clients.FieldByName('ADDRESS').AsString;
 DataMod_CARDS.cliencards.close;
 DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
DataMod_CARDS.cliencards.Open;
DateTimePicker4.DateTime:= DataMod_CARDS.Clients.FieldByName('EXPIRY').AsDATETIME;
end;


end;

procedure TCustomer_new.DBLookupComboBox1Click(Sender: TObject);
//begin

  var
acc: String;
  begin
  //if not (key=#13) then Exit;

  //if searchedit1.Text<>'' then
  begin
  with DataMod_CARDS, HESAB,mushteriler do begin
  //if not (P_Customers.State =dsInsert) then
   SetVariable('CID', null);
   SetVariable('p_AccNO', dblookupcombobox1.Text+'%');
   //if not HESAB then Open else Refresh;
  end;

  if DataMod_CARDS.HESAB.RecordCount>0
   then
   begin
  acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;

  DataMod_CARDS.mushteriler.Locate
   ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

  DataMod_CARDS.HESAB.Locate('ACC',acc, [loCaseInsensitive, loPartialKey]);
   end;
   end;
//DataMod_CARDS.valuta.Close;
//DataMod_CARDS.valuta.SetVariable('valkod',DBLookupComboBox1.text);
//DataMod_CARDS.valuta.Open;

//DataMod_CARDS.cliencards.close;
//DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;

end;

procedure TCustomer_new.Button1Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_client_new']);
Edit1.Text:='NEW';
ComboBox9.Enabled:=False;
if edit1.Text='NEW' then
begin

Edit33.Visible:=False;
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;
 DataMod_CARDS.CARDOPERATION.Close;
 DataMod_CARDS.cliencards.Close;
DBGrid5.Enabled:=False;
DataMod_CARDS.COMPANY.Close;
DataMod_CARDS.COMPANY.Open;

 Button3.Enabled:=False;
 Button5.Enabled:=False;

 DBEdit11.Text:='';
 DBEdit3.Text:='';
 dbedit18.Text:='';
DateTimePicker5.DateTime:=Date;
DateTimePicker8.DateTime:=Date+365;
DateTimePicker6.DateTime:=DateTimePicker8.DateTime;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
ComboBox11.ItemIndex:=0;
ComboBox12.ItemIndex:=0;
ComboBox5.ItemIndex:=0;
ComboBox4.ItemIndex:=0;
//DBLookupComboBox8.KeyValue:=1;
DBLookupComboBox10.KeyValue:=0;
edit14.Text:='';
DBEdit4.Visible:=True;
Edit28.Visible:=False;
//DBLookupComboBox7.Visible:=True;
Edit15.Visible:=True;
Edit16.Visible:=True;
Edit17.Visible:=True;
Edit27.Visible:=True;
Edit18.Visible:=True;
Edit20.Visible:=True;
Edit21.Visible:=True;
Edit19.Visible:=True;
Edit22.Visible:=True;
//DBLookupComboBox8.Visible:=True;
//DBLookupComboBox9.Visible:=True;
DBLookupComboBox10.Visible:=True;
ComboBox5.Visible:=True;
ComboBox4.Visible:=True;
Edit26.Visible:=True;
Edit25.Visible:=True;
Edit24.Visible:=True;
Edit23.Visible:=True;
ComboBox2.Visible:=True;
end;

DataMod_CARDS.clienapp.close;
DataMod_CARDS.clienapp.open;




//DataMod_CARDS.CUSTINFO.Close;
//DataMod_CARDS.CUSTINFO.SetVariable('ACCID',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.CUSTINFO.Open;

//DataMod_CARDS.custaccount.Close;
//DataMod_CARDS.custaccount.SetVariable('kli',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.custaccount.Open;

//DataMod_CARDS.valuta.Close;
//DataMod_CARDS.valuta.SetVariable('valkod',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.valuta.Open;


//DataMod_CARDS.allclientcredits.close;
//DataMod_CARDS.allclientcredits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
//DataMod_CARDS.allclientcredits.Open;


DataMod_CARDS.allclientdepozits.close;
DataMod_CARDS.allclientdepozits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.allclientcredits.Open;



if Edit1.Text='NEW' then
begin
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
Edit9.Text:='';
//Edit11.Text:='';
Edit12.Text:='';
//Edit13.Text:='';


//-------------------
 

 ComboBox2.Visible:=True;
//DBLookupComboBox9.Visible:=False;
 DateTimePicker7.Visible:=True;
 DateTimePicker8.Visible:=True;
DBLookupComboBox10.Visible:=True;
DBLookupComboBox4.Visible:=False;
DBGrid1.Enabled:=False;
DBEDIT1.VISIBLE:=False;
EDIT14.VISIBLE:=True;
DBEDIT2.VISIBLE:=True;
DBEdit18.Visible:=False;
//DBEDIT18.VISIBLE:=False;
DBLookupComboBox6.VISIBLE:=True;
//DBLookupComboBox6.DataSource:=DataMod_CARDS.ClientListSource;
//DBLookupComboBox6.DataField:='RBSNUMBER';




DBLookupComboBox1.VISIBLE:=False;
Edit29.Visible:=False;
DBEDIT4.VISIBLE:=False;
EDIT28.VISIBLE:=True;
//DBLookupComboBox7.VISIBLE:=False;
//COMBOBOX10.VISIBLE:=True;
//DBLookupComboBox3.VISIBLE:=False;
COMBOBOX11.VISIBLE:=true;
DBLookupComboBox2.VISIBLE:=False;
COMBOBOX12.VISIBLE:=True;
Edit25.Visible:=True;
ComboBox4.Visible:=True;
ComboBox6.Visible:=False;
//if  DataMod_CARDS.Clients.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
DBEdit9.Visible:=True;
Edit2.Visible:=False;
Edit3.Visible:=False;
Edit4.Visible:=False;
Edit5.Visible:=False;
Edit6.Visible:=False;
Edit9.Visible:=False;
//Edit10.Visible:=False;
//Edit11.Visible:=False;
Edit12.Visible:=False;
//Edit13.Visible:=False;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
DateTimePicker4.Visible:=False;
EDIT27.Visible:=True;
EDIT17.Visible:=TRUE;
EDIT4.Visible:=False;
EDIT5.Visible:=False;
//if DataMod_CARDS.Clients.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
//Edit2.Text:=DataMod_CARDS.Clients.FieldByName('FNAME').AsString;
//Edit3.Text:=DataMod_CARDS.Clients.FieldByName('LNAME').AsString;
//Edit4.Text:=DataMod_CARDS.Clients.FieldByName('HOMEPHONE').AsString;
//Edit5.Text:=DataMod_CARDS.Clients.FieldByName('WORKPHONE').AsString;
//Edit6.Text:=DataMod_CARDS.Clients.FieldByName('PASSPORT').AsString;
//Edit9.Text:=DataMod_CARDS.Clients.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.Clients.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.Clients.FieldByName('EMBOSSNAME').AsString;
//Edit12.Text:=DataMod_CARDS.Clients.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.Clients.FieldByName('ADDRESS').AsString;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
//DateTimePicker4.DateTime:= DataMod_CARDS.Clients.FieldByName('EXPIRY').AsDATETIME;


//------------------




end;

end;

procedure TCustomer_new.DBGrid1DblClick(Sender: TObject);
begin
//ShowMessage(DataMod_CARDS.allclientcredits.fieldbyname('NUMBEROFCREDIT').asstring);
if  DataMod_CARDS.allclientcredits.RecordCount>0 then
begin
krinfo.CM_ACTIVE.Close;
//DataMod_CARDS.kredits.SetVariable('hesab',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
krinfo.CM_ACTIVE.SetVariable('ids',DataMod_CARDS.allclientcredits.fieldbyname('id').asinteger);
krinfo.CM_ACTIVE.Open;
krinfo.ShowModal;
end;
end;

procedure TCustomer_new.DBGrid2DblClick(Sender: TObject);
begin
if  DataMod_CARDS.allclientdepozits.RecordCount>0 then
begin
DataMod_CARDS.depozit.Close;
DataMod_CARDS.depozit.SetVariable('hesab',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.depozit.SetVariable('aid',DataMod_CARDS.allclientdepozits.fieldbyname('id').asinteger);
DataMod_CARDS.depozit.Open;
dpinfo.ShowModal;
end;
end;

procedure TCustomer_new.Button3Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_client_edit']);
//DataMod_CARDS.CUSTINFO.insert;
//Edit32.Text:='1';
Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.Text:=DataMod_CARDS.cliencards.FieldByName('FNAME').AsString;
Edit3.Text:=DataMod_CARDS.cliencards.FieldByName('LNAME').AsString;
Edit4.Text:=DataMod_CARDS.cliencards.FieldByName('HOMEPHONE').AsString;
Edit5.Text:=DataMod_CARDS.cliencards.FieldByName('WORKPHONE').AsString;
Edit6.Text:=DataMod_CARDS.cliencards.FieldByName('PASSPORT').AsString;
Edit9.Text:=DataMod_CARDS.cliencards.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.cliencards.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.cliencards.FieldByName('EMBOSSNAME').AsString;
Edit12.Text:=DataMod_CARDS.cliencards.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.cliencards.FieldByName('ADDRESS').AsString;
DBDateTimeEditEh4.DataSource:=DataMod_CARDS.clientappsource;
DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.DataSource:=DataMod_CARDS.clientappsource;
cardnumber.DataField:='CARDNUMBER';
DBLookupComboBox4.DataSource:=DataMod_CARDS.clientappsource;
DBLookupComboBox4.DataField:='CARDTYPE';
DBLookupComboBox4.Visible:=False;
Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
Edit30.Visible:=True;

if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.DateTime:= DataMod_CARDS.cliencards.FieldByName('EXPIRY').AsDATETIME;
DBDateTimeEditEh3.DataSource:=DataMod_CARDS.clientcardssource;






ComboBox9.Enabled:=True;
Edit1.Text:='EDIT';


end;

procedure TCustomer_new.DBLookupComboBox6Enter(Sender: TObject);
  var
acc: String;
  begin
 { with DataMod_CARDS, HESAB do begin

   SetVariable('CID', null);
   SetVariable('p_AccNO', dblookupcombobox6.Text+'%');

  end;

    acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;

   DataMod_CARDS.mushteriler.Locate
   ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

   //DataMod_CARDS.HESAB.Locate('ACC_no',acc, [loCaseInsensitive, loPartialKey]);
   Edit14.Text:=DataMod_CARDS.mushteriler.fieldbyname('id').AsString;
   ShowMessage('test');   }
end;

procedure TCustomer_new.DBLookupComboBox6Click(Sender: TObject);
  var
acc: String;
  begin
  with DataMod_CARDS, HESAB do begin

   SetVariable('CID', null);
   SetVariable('p_AccNO', dblookupcombobox6.Text+'%');

  end;

    acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;

   DataMod_CARDS.mushteriler.Locate
   ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

   //DataMod_CARDS.HESAB.Locate('ACC_no',acc, [loCaseInsensitive, loPartialKey]);
   Edit14.Text:=DataMod_CARDS.mushteriler.fieldbyname('id').AsString;
   //ShowMessage('test');
end;

procedure TCustomer_new.SearchEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin

   //SearchEdit1.Text:='';
  //begin
   with DataMod_CARDS, HESAB do begin
  //if not (P_Customers.State =dsInsert) then

   Close;
   SetVariable('CID', null);
   SetVariable('p_AccNO', null);
   Open;
   ShowMessage('ozzun');
   //if not HESAB then Open else Refresh;
  end;
  //end;
end;


end;

procedure TCustomer_new.DBLookupComboBox6KeyPress(Sender: TObject;
  var Key: Char);
 var
acc: String;
  begin
if key=#13 then
begin



  begin
  with DataMod_CARDS, HESAB do begin

   SetVariable('CID', null);
   SetVariable('p_AccNO', dblookupcombobox6.Text+'%');

  end;

  if DataMod_CARDS.HESAB.RecordCount>0
   then
   begin
  acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;

  DataMod_CARDS.mushteriler.Locate
   ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

  DataMod_CARDS.HESAB.Locate('ACC_no',acc, [loCaseInsensitive, loPartialKey]);
   end;
   end;


end;
//SearchEdit1.Text:= DataMod_CARDS.mushteriler.FieldByName('id').asstring;
end;

procedure TCustomer_new.Edit14KeyPress(Sender: TObject; var Key: Char);
var acc:variant;
begin
if key=#13 then
begin  //1

  if Edit14.Text='' then begin  //2
       // ShowMessage('bura girdi 1');
        DataMod_CARDS.hesab.Close;
        DataMod_CARDS.hesab.SetVariable('CID', null);
        DataMod_CARDS.hesab.SetVariable('p_AccNO', '%%');
        DataMod_CARDS.hesab.Open;
       //Memo1.Text :=DataMod_CARDS.hesab.SQL.Text;
//ShowMessage(IntToStr(DataMod_CARDS.hesab.RecordCount));
      //  if DataMod_CARDS.HESAB.RecordCount>0
        //      then
          //       begin //3
            //        acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;
              //
                //    DataMod_CARDS.mushteriler.Locate
                  //  ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

                  // DataMod_CARDS.HESAB.Locate('ACC_no',acc, [loCaseInsensitive, loPartialKey]);
                  //2
                  end else       //1



                  begin //4
                  //ShowMessage('bura girdi');
                  DataMod_CARDS.hesab.Close;
                  DataMod_CARDS.hesab.SetVariable('CID', Edit14.Text);
                  DataMod_CARDS.hesab.SetVariable('p_AccNO', null);
                  DataMod_CARDS.hesab.Open;
                  if DataMod_CARDS.HESAB.RecordCount>0
   then
   begin //5
   //ShowMessage('1 '+IntToStr(DataMod_CARDS.HESAB.RecordCount));
  acc:= DataMod_CARDS.hesab.FieldByName('ACC_NO').asVariant;

  DataMod_CARDS.mushteriler.Locate
   ('ID',DataMod_CARDS.HESAB.Fieldbyname('KLI_ID').AsInteger, [loCaseInsensitive, loPartialKey]);

  DataMod_CARDS.HESAB.Locate('ACC_no',acc, [loCaseInsensitive, loPartialKey]);
   //ShowMessage('2 '+IntToStr(DataMod_CARDS.HESAB.RecordCount));

   end; //5

end; //4
 end;
end;    //1
//ShowMessage(IntToStr(DataMod_CARDS.hesab.RecordCount));
//end;  //1

procedure TCustomer_new.ComboBox11KeyPress(Sender: TObject; var Key: Char);
begin
Key:=#0;
end;

procedure TCustomer_new.Edit15KeyPress(Sender: TObject; var Key: Char);
begin

IF ORD(KEY)>126  THEN KEY:=#0;
IF ORD(KEY)=63 THEN KEY:=#0;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);


end;

procedure TCustomer_new.Edit15Change(Sender: TObject);
begin
//IF ORD(KEY)>126  THEN KEY:=#0;
//IF ORD(KEY)=63 THEN KEY:=#0;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
end;

procedure TCustomer_new.Edit15Click(Sender: TObject);
begin
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
end;

procedure TCustomer_new.Edit15DblClick(Sender: TObject);
begin
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
end;

procedure TCustomer_new.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
IF  not (Key in [#8, '0'..'9']) then key:=#0;
end;

procedure TCustomer_new.DateTimePicker8Change(Sender: TObject);
begin
DateTimePicker6.DateTime:=DateTimePicker8.DateTime;
end;

procedure TCustomer_new.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
KEY:=UpCase(KEY);
IF ORD(KEY)>126  THEN KEY:=#0;
IF ORD(KEY)=63 THEN KEY:=#0;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);




end;

procedure TCustomer_new.ComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
Key:=#0;
end;

procedure TCustomer_new.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
begin
if ComboBox10.Text<>'' then
Edit23.Text:=ComboBox10.Text+'/'+Edit15.Text+'/'+edit16.Text else
Edit23.Text:='/'+Edit15.Text+'/'+edit16.Text
end;
end;

procedure TCustomer_new.Button2Click(Sender: TObject);
var i,z,urg,kr:integer;
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_client_save']);
IF Edit1.Text='NEW' THEN BEGIN

 z:=0;





for i :=0 to Customer_new.ComponentCount-1 do
begin
if Components[i].ClassType= Tedit then
if (Components[i] as Tedit).Color=claqua then

begin


 if (Components[i] as TEdit).Text='' then z:=1;
end;
if Components[i].ClassType= Tcombobox then
if (Customer_new.Components[i] as Tcombobox).Color=claqua then

begin
 if (Customer_new.Components[i] as Tcombobox).text='' then z:=1;
end;

if Components[i].ClassType= TDBLookupComboBox then
if (Customer_new.Components[i] as TDBLookupComboBox).Color=claqua then

begin
 if (Customer_new.Components[i] as TDBLookupComboBox).text='' then z:=1;
end;

end ;

if z=1 then
begin
ShowMessage('Рянэли ханалар там долдурулмалыдыр');
exit;
end;

  if DBEdit18.Text= DataMod_CARDS.CARDTYPES.fieldbyname('CURRENCY').AsString then
begin
DataMod_CARDS.referens.close;
DataMod_CARDS.referens.open;
edit26.Text:= DataMod_CARDS.referens.fieldbyname('refe').asstring;
end else
begin
ShowMessage('Valyuta sehvdir');
exit;
end;

     if CheckBox2.Checked then  urg:=1 else urg:=0;
     if CheckBox3.Checked then  kr:=1 else kr:=0;


 DataMod_CARDS.mainpacket.CallProcedure('new_card',[edit15.text+' '+edit16.text,
                                                   edit15.text,
                                                   edit16.text,
                                                   edit18.text,
                                                   datetostr(DateTimePicker7.DateTime),
                                                   Edit17.Text,
                                                   Edit27.Text,
                                                   Edit20.Text,
                                                   Edit19.Text,
                                                   Edit22.Text,
                                                   ComboBox4.text,
                                                   DBLookupComboBox6.Text,
                                                   DBEdit18.Text,
                                                   DBLookupComboBox10.Text ,
                                                   ComboBox12.text,
                                                   Edit28.Text,
                                                   DateTimePicker5.DateTime,
                                                   DateTimePicker8.DateTime,
                                                   Edit26.Text,
                                                   Edit23.Text,
                                                   ComboBox2.text,
                                                   Edit25.Text,
                                                   1,
                                                   urg,
                                                   Edit21.Text,
                                                   kr,
                                                   Edit14.Text,
                                                   ComboBox11.text,
                                                   ComboBox10.text]);

                                                   edit15.text:='';
                                                   edit16.text:='';
                                                   edit15.text:='';
                                                   edit16.text:='';
                                                   edit18.text:='';

                                                   Edit17.Text:='';
                                                   Edit27.Text:='';
                                                   Edit20.Text:='';
                                                   Edit19.Text:='';
                                                   Edit22.Text:='';
                                                   ComboBox4.text:='';

                                                   DBEdit18.Text:='';

                                                   ComboBox12.text:='';
                                                   Edit28.Text:='';

                                                   Edit26.Text:='';
                                                   Edit23.Text:='';
                                                   ComboBox2.text:='';
                                                   Edit25.Text:='';

                                                   Edit21.Text:='';

                                                   Edit14.Text:='';
                                                   ComboBox11.text:='';
                                                   ComboBox10.text:='';


                                                   ShowMessage('Йени карт ялавя едилди');


END;                                                   

if Edit1.Text='EDIT' then

begin
IF Edit32.Text='1' THEN ComboBox9.Enabled:=True;
IF Edit32.Text='2' THEN
BEGIN
IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=2 THEN
BEGIN

//SUB CARD
END;

IF  ComboBox9.Text='Prolongation' THEN
BEGIN
DataMod_CARDS.mainpacket.CallProcedure('prolongation',[DataMod_CARDS.cliencards.fieldbyname('id').asinteger,DBDateTimeEditEh3.Value]);


//PROLONGATION
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=4 THEN
BEGIN
//REPLACE
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=12 THEN
BEGIN
//PIN ATTEMPTS CLEAR
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=6 THEN
BEGIN
//STATUS CHANGE
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=11 THEN
BEGIN
//RBSNUMBER CHANGE
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=7 THEN
BEGIN
//CONTRACT CLOSE
END;

IF DataMod_CARDS.CARDOPERATION.FieldByName('MESSTYPE').AsInteger=35 THEN
BEGIN
//CARDNAME CHANGE
END;

END;
end;





end;

procedure TCustomer_new.ComboBox2Click(Sender: TObject);
var z: integer;
begin

end;
 procedure SupplCard;
 begin

 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
// ShowMessage('SupplCard');
 end;

  procedure Prolongation;
 begin

 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=False;
Edit2.enabled:=False;
Edit3.Enabled:=False;
Edit4.Enabled:=False;
Edit5.Enabled:=False;
Edit6.Enabled:=False;
Edit9.Enabled:=False;
//Edit10.Enabled:=False;
//Edit11.Enabled:=False;
Edit12.Enabled:=False;
//Edit13.Enabled:=False;
DBDateTimeEditEh4.Enabled:=False;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=False;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=False;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=False;
 end;
 //ShowMessage('Prolongation');
 end;

   procedure ReplaceCard;
 begin
  with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

    procedure CreditLimit;
 begin
 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

      procedure CardStatus;
 begin
 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

       procedure ContractClose;
 begin
 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

        procedure PINClear;
 begin
  with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;


        procedure RBSChange;
 begin
 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

         procedure CardNameChange;
 begin
  with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

          procedure SecurityWordChange;
 begin
  with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

           procedure BlankOrder;
 begin
 with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;

            procedure UpdateCardorBlankOrder;
 begin
  with Customer_new do begin
  Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.enabled:=true;
Edit3.Enabled:=true;
Edit4.Enabled:=true;
Edit5.Enabled:=true;
Edit6.Enabled:=true;
Edit9.Enabled:=true;
//Edit10.Enabled:=true;
//Edit11.Enabled:=true;
Edit12.Enabled:=true;
//Edit13.Enabled:=true;
DBDateTimeEditEh4.Enabled:=true;
//DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.Enabled:=true;
//cardnumber.DataField:='CARDNUMBER';
//DBLookupComboBox4.Enabled:=true;
//DBLookupComboBox4.DataField:='CARDTYPE';
//DBLookupComboBox4.Visible:=False;
//Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
//Edit30.Visible:=True;
  ComboBox6.Enabled:=true;
  CheckBox2.Enabled:=true;
//if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
//if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.Enabled:=true;
DBDateTimeEditEh3.Enabled:=true;
 end;
 end;


procedure TCustomer_new.ComboBox9Click(Sender: TObject);
var i:integer;
begin














if ComboBox9.Text='Suppl.Card' then SupplCard;       //
if ComboBox9.Text='Prolongation' then Prolongation;  //
if ComboBox9.Text='Replace Card' then ReplaceCard;   //
if ComboBox9.Text='Credit Limit' then CreditLimit;   //
if ComboBox9.Text='Card Status' then CardStatus;     //
if ComboBox9.Text='Contract Close' then ContractClose; //
if ComboBox9.Text='PIN Clear' then PINClear;           //
if ComboBox9.Text='RBS Change' then RBSChange;         //
if ComboBox9.Text='CardName Change' then CardNameChange; //
if ComboBox9.Text='Security Word Change' then SecurityWordChange;  //
if ComboBox9.Text='Blank Order' then BlankOrder;   //
if ComboBox9.Text='Update Card or Blank Order' then UpdateCardorBlankOrder;   //
end;

procedure TCustomer_new.ComboBox2Enter(Sender: TObject);
var z:integer;
begin
   ComboBox2.Clear;
   DataMod_CARDS.COMPANY.Open;
   DataMod_CARDS.COMPANY.First;
   if ComboBox2.ItemIndex<>0 then
    begin
FOR z:=0 to DataMod_CARDS.COMPANY.RecordCount do
begin
  IF Z=0 THEN  ComboBox2.Items.add(' ') else
  begin
 ComboBox2.Items.add(DataMod_CARDS.COMPANY.fieldbyname('COMPANY_NAME').asstring);
 DataMod_CARDS.COMPANY.next;
   end;
 end;
     end;
end;

procedure TCustomer_new.ComboBox9Enter(Sender: TObject);
var i:integer;
begin
ComboBox9.Clear;
 DataMod_CARDS.apptype.Close;
 DataMod_CARDS.apptype.Open;
 DataMod_CARDS.apptype.First;

if ComboBox9.ItemIndex<>0 then
  begin
for i:=0 to DataMod_CARDS.apptype.recordcount do
begin
if i=0 then ComboBox9.Items.add(' ') else
begin
ComboBox9.Items.add(DataMod_CARDS.apptype.fieldbyname('TYPE').asstring);
DataMod_CARDS.apptype.next;
end;
end;
  end;
end;

procedure TCustomer_new.FormShow(Sender: TObject);
var i,Z:integer;
acc:string;
begin

if edit1.Text='NEW' then
begin
DataMod_CARDS.COMPANY.Close;
DataMod_CARDS.COMPANY.Open;

 Button3.Enabled:=False;
 Button5.Enabled:=False;

 DBEdit11.Text:='';
 DBEdit3.Text:='';
 dbedit18.Text:='';
DateTimePicker5.DateTime:=Date;
DateTimePicker8.DateTime:=Date+365;
DateTimePicker6.DateTime:=DateTimePicker8.DateTime;
ActivateKeyboardLayout(LoadKeyboardLayout('00000409', 0), 0);
ComboBox11.ItemIndex:=0;
ComboBox12.ItemIndex:=0;
ComboBox5.ItemIndex:=0;
ComboBox4.ItemIndex:=0;
//DBLookupComboBox8.KeyValue:=1;
//DBLookupComboBox10.KeyValue:=0;
edit14.Text:='';
DBEdit4.Visible:=True;
Edit28.Visible:=False;
//DBLookupComboBox7.Visible:=True;
Edit15.Visible:=True;
Edit16.Visible:=True;
Edit17.Visible:=True;
Edit27.Visible:=True;
Edit18.Visible:=True;
Edit20.Visible:=True;
Edit21.Visible:=True;
Edit19.Visible:=True;
Edit22.Visible:=True;
//DBLookupComboBox8.Visible:=True;
//DBLookupComboBox9.Visible:=True;
DBLookupComboBox10.Visible:=True;
ComboBox5.Visible:=True;
ComboBox4.Visible:=True;
Edit26.Visible:=True;
Edit25.Visible:=True;
Edit24.Visible:=True;
Edit23.Visible:=True;
ComboBox2.Visible:=True;
end;

DataMod_CARDS.clienapp.close;
DataMod_CARDS.clienapp.open;




//DataMod_CARDS.CUSTINFO.Close;
//DataMod_CARDS.CUSTINFO.SetVariable('ACCID',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.CUSTINFO.Open;

//DataMod_CARDS.custaccount.Close;
//DataMod_CARDS.custaccount.SetVariable('kli',DataMod_CARDS.Clients.fieldbyname('kli_id').asinteger);
DataMod_CARDS.custaccount.Open;

//DataMod_CARDS.valuta.Close;
//DataMod_CARDS.valuta.SetVariable('valkod',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.valuta.Open;


//DataMod_CARDS.allclientcredits.close;
//DataMod_CARDS.allclientcredits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
//DataMod_CARDS.allclientcredits.Open;


DataMod_CARDS.allclientdepozits.close;
DataMod_CARDS.allclientdepozits.SetVariable('HESAB',DataMod_CARDS.Clients.fieldbyname('rbsnumber').asstring);
DataMod_CARDS.allclientcredits.Open;



if Edit1.Text='NEW' then
begin
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
Edit9.Text:='';
//Edit11.Text:='';
Edit12.Text:='';
//Edit13.Text:='';


//-------------------
 

 ComboBox2.Visible:=True;
//DBLookupComboBox9.Visible:=False;
 DateTimePicker7.Visible:=True;
 DateTimePicker8.Visible:=True;
DBLookupComboBox10.Visible:=True;
DBLookupComboBox4.Visible:=False;
DBGrid1.Enabled:=False;
DBEDIT1.VISIBLE:=False;
EDIT14.VISIBLE:=True;
DBEDIT2.VISIBLE:=True;
DBEdit18.Visible:=False;
//DBEDIT18.VISIBLE:=False;
DBLookupComboBox6.VISIBLE:=True;
//DBLookupComboBox6.DataSource:=DataMod_CARDS.ClientListSource;
//DBLookupComboBox6.DataField:='RBSNUMBER';




DBLookupComboBox1.VISIBLE:=False;
Edit29.Visible:=False;
DBEDIT4.VISIBLE:=False;
EDIT28.VISIBLE:=True;
//DBLookupComboBox7.VISIBLE:=False;
COMBOBOX10.VISIBLE:=True;
//DBLookupComboBox3.VISIBLE:=False;
COMBOBOX11.VISIBLE:=true;
DBLookupComboBox2.VISIBLE:=False;
COMBOBOX12.VISIBLE:=True;
Edit25.Visible:=True;
ComboBox4.Visible:=True;
ComboBox6.Visible:=False;
//if  DataMod_CARDS.Clients.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
DBEdit9.Visible:=True;
Edit2.Visible:=False;
Edit3.Visible:=False;
Edit4.Visible:=False;
Edit5.Visible:=False;
Edit6.Visible:=False;
Edit9.Visible:=False;
//Edit10.Visible:=False;
//Edit11.Visible:=False;
Edit12.Visible:=False;
//Edit13.Visible:=False;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
DateTimePicker4.Visible:=False;
EDIT27.Visible:=True;
EDIT17.Visible:=TRUE;
EDIT4.Visible:=False;
EDIT5.Visible:=False;
//if DataMod_CARDS.Clients.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
//Edit2.Text:=DataMod_CARDS.Clients.FieldByName('FNAME').AsString;
//Edit3.Text:=DataMod_CARDS.Clients.FieldByName('LNAME').AsString;
//Edit4.Text:=DataMod_CARDS.Clients.FieldByName('HOMEPHONE').AsString;
//Edit5.Text:=DataMod_CARDS.Clients.FieldByName('WORKPHONE').AsString;
//Edit6.Text:=DataMod_CARDS.Clients.FieldByName('PASSPORT').AsString;
//Edit9.Text:=DataMod_CARDS.Clients.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.Clients.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.Clients.FieldByName('EMBOSSNAME').AsString;
//Edit12.Text:=DataMod_CARDS.Clients.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.Clients.FieldByName('ADDRESS').AsString;
 //DataMod_CARDS.cliencards.close;
 //DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
//DataMod_CARDS.cliencards.Open;
//DateTimePicker4.DateTime:= DataMod_CARDS.Clients.FieldByName('EXPIRY').AsDATETIME;


//------------------




end;


if Edit1.Text='EDIT' then
begin

DataMod_CARDS.cariqaliq.Close;
DataMod_CARDS.cariqaliq.SetVariable('acc_id',DataMod_CARDS.Clients.fieldbyname('ACCID').asinteger);
DataMod_CARDS.cariqaliq.Open;


 ComboBox2.Visible:=False;
//DBLookupComboBox9.Visible:=True;
 DateTimePicker7.Visible:=False;
 DateTimePicker8.Visible:=False;
DBLookupComboBox10.Visible:=False;
DBLookupComboBox4.Visible:=True;
DBGrid1.Enabled:=True;
DBEDIT1.VISIBLE:=TRUE;
EDIT14.VISIBLE:=FALSE;
DBEDIT2.VISIBLE:=false;
DBEdit18.Visible:=True;
//DBEDIT18.VISIBLE:=TRUE;
DBLookupComboBox6.VISIBLE:=False;
//DBLookupComboBox6.DataSource:=DataMod_CARDS.ClientListSource;
//DBLookupComboBox6.DataField:='RBSNUMBER';




DBLookupComboBox1.VISIBLE:=TRUE;
DataMod_CARDS.editval.Close;
DataMod_CARDS.editval.SetVariable('RBSNUMBER',DBLookupComboBox1.text);
DataMod_CARDS.editval.Open;
Edit29.Text:=DataMod_CARDS.editval.fieldbyname('VAL_NAME').asstring;
Edit29.Visible:=True;
DBEDIT4.VISIBLE:=TRUE;
EDIT28.VISIBLE:=FALSE;
//DBLookupComboBox7.VISIBLE:=TRUE;
COMBOBOX10.VISIBLE:=FALSE;
//DBLookupComboBox3.VISIBLE:=TRUE;
COMBOBOX11.VISIBLE:=FALSE;
DBLookupComboBox2.VISIBLE:=TRUE;
COMBOBOX12.VISIBLE:=FALSE;
Edit25.Visible:=False;
ComboBox4.Visible:=false;
ComboBox6.Visible:=True;
if  DataMod_CARDS.Clients.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
DBEdit9.Visible:=False;
Edit2.Visible:=True;
Edit3.Visible:=True;
Edit4.Visible:=True;
Edit5.Visible:=True;
Edit6.Visible:=True;
Edit9.Visible:=True;
//Edit10.Visible:=True;
//Edit11.Visible:=True;
Edit12.Visible:=True;
//Edit13.Visible:=True;
 DataMod_CARDS.cliencards.close;
 DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
DataMod_CARDS.cliencards.Open;
DateTimePicker4.Visible:=True;;
EDIT27.Visible:=False;
EDIT17.Visible:=False;
EDIT4.Visible:=True;
EDIT5.Visible:=True;
if DataMod_CARDS.Clients.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
Edit2.Text:=DataMod_CARDS.Clients.FieldByName('FNAME').AsString;
Edit3.Text:=DataMod_CARDS.Clients.FieldByName('LNAME').AsString;
Edit4.Text:=DataMod_CARDS.Clients.FieldByName('HOMEPHONE').AsString;
Edit5.Text:=DataMod_CARDS.Clients.FieldByName('WORKPHONE').AsString;
Edit6.Text:=DataMod_CARDS.Clients.FieldByName('PASSPORT').AsString;
Edit9.Text:=DataMod_CARDS.Clients.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.Clients.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.Clients.FieldByName('EMBOSSNAME').AsString;
Edit12.Text:=DataMod_CARDS.Clients.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.Clients.FieldByName('ADDRESS').AsString;
 DataMod_CARDS.cliencards.close;
 DataMod_CARDS.cliencards.SetVariable('numb',DBLookupComboBox1.text);
DataMod_CARDS.cliencards.Open;
DateTimePicker4.DateTime:= DataMod_CARDS.Clients.FieldByName('EXPIRY').AsDATETIME;
end;


end;


procedure TCustomer_new.DBGrid5CellClick(Column: TColumn);
begin
Edit31.Visible:=False;
Edit32.Text:='1';
Button3.Enabled:=True;
Edit2.Text:=DataMod_CARDS.cliencards.FieldByName('FNAME').AsString;
Edit3.Text:=DataMod_CARDS.cliencards.FieldByName('LNAME').AsString;
Edit4.Text:=DataMod_CARDS.cliencards.FieldByName('HOMEPHONE').AsString;
Edit5.Text:=DataMod_CARDS.cliencards.FieldByName('WORKPHONE').AsString;
Edit6.Text:=DataMod_CARDS.cliencards.FieldByName('PASSPORT').AsString;
Edit9.Text:=DataMod_CARDS.cliencards.FieldByName('REFERENCE').AsString;
//Edit10.Text:=DataMod_CARDS.cliencards.FieldByName('SECURITY').AsString;
//Edit11.Text:=DataMod_CARDS.cliencards.FieldByName('EMBOSSNAME').AsString;
Edit12.Text:=DataMod_CARDS.cliencards.FieldByName('CITY').AsString;
//Edit13.Text:=DataMod_CARDS.cliencards.FieldByName('ADDRESS').AsString;
DBDateTimeEditEh4.DataSource:=DataMod_CARDS.clientappsource;
DBDateTimeEditEh4.DataField:='BIRTHDAY';
cardnumber.DataSource:=DataMod_CARDS.clientappsource;
cardnumber.DataField:='CARDNUMBER';
DBLookupComboBox4.DataSource:=DataMod_CARDS.clientappsource;
DBLookupComboBox4.DataField:='CARDTYPE';
DBLookupComboBox4.Visible:=False;
Edit30.Text:=DataMod_CARDS.cliencards.FieldByName('CARDTYPE').AsString;
Edit30.Visible:=True;

if  DataMod_CARDS.cliencards.FieldByName('RESIDENT').AsString='RESIDENT'then ComboBox6.ItemIndex:=0 else ComboBox6.ItemIndex:=1;
if DataMod_CARDS.cliencards.FieldByName('urg').asinteger<>0 then CheckBox2.Checked:=True else CheckBox2.Checked:=false;
DateTimePicker4.DateTime:= DataMod_CARDS.cliencards.FieldByName('EXPIRY').AsDATETIME;
DBDateTimeEditEh3.DataSource:=DataMod_CARDS.clientcardssource;
end;

procedure TCustomer_new.DBGrid6CellClick(Column: TColumn);
begin
Edit31.Visible:=True;
Edit32.Text:='2';
Button3.Enabled:=True;
end;

procedure TCustomer_new.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ComboBox9.Enabled:=False;
end;

procedure TCustomer_new.ComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TCustomer_new.Button5Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_client_archive']);
end;

end.
