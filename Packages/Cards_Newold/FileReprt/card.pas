unit card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBLookupEh, CurrencyEdit, StdCtrls, DBCtrlsEh, ComCtrls,
  Grids, DBGrids, Mask, DBCtrls, Oracle, DB, OracleData;

type
  Tcards = class(TForm)
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
    Label34: TLabel;
    Label9: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Edit3: TEdit;
    Edit5: TEdit;
    ComboBox10: TComboBox;
    Button5: TButton;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    CheckBox1: TCheckBox;
    ComboBox9: TComboBox;
    DateTimePicker4: TDateTimePicker;
    DBGrid4: TDBGrid;
    ComboBox2: TComboBox;
    DBEdit5: TDBEdit;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
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
    Edit27: TEdit;
    DBEdit18: TDBEdit;
    Memo1: TMemo;
    Edit15: TEdit;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    Edit28: TEdit;
    DBEdit17: TDBEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit29: TEdit;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    Edit32: TEdit;
    Edit33: TEdit;
    ComboBox1: TComboBox;
    Edit14: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    Button6: TButton;
    DateTimePicker1: TDateTimePicker;
    DBLookupComboBox6: TDBLookupComboboxEh;
    ComboBox8: TComboBox;
    DateTimePicker2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    SIL1: TMenuItem;
    Edit4: TEdit;
    SB_ACA: TOraclePackage;
    clients: TOracleDataSet;
    card: TOracleDataSet;
    aplication: TOracleDataSet;
    acount: TOracleDataSet;
    hesab: TDataSource;
    cardlar: TDataSource;
    app: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cards: Tcards;

implementation

uses Filereportform,sboapiDataModuleImpl,SbTranslateProc;

{$R *.dfm}



procedure Tcards.Button2Click(Sender: TObject);
var i,z,urg,kr:integer;
wt:string;
begin
end;



procedure Tcards.ComboBox9Click(Sender: TObject);
begin

IF  ComboBox9.Text='Suppl.Card' THEN
begin
edit2.Text:='2';

Edit15.Enabled:=True;
Edit16.Enabled:=True;
Edit18.Enabled:=True;
DateTimePicker7.Enabled:=True;
Edit17.Enabled:=True;
Edit27.Enabled:=True;
Edit20.Enabled:=True;
Edit19.Enabled:=True;
Edit22.Enabled:=True;
ComboBox4.Enabled:=True;
DBLookupComboBox6.Enabled:=True;
ComboBox1.Enabled:=True;
ComboBox12.Enabled:=True;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=True;
Edit26.Enabled:=False;
Edit23.Enabled:=True;
ComboBox2.Enabled:=True;
Edit25.Enabled:=True;
Edit21.Enabled:=True;
CheckBox2.Enabled:=True;
Edit14.Enabled:=False;
ComboBox11.Enabled:=True;
ComboBox10.Enabled:=True;
Edit33.Enabled:=False;
 DBLookupComboBox6.Enabled:=False;
 ComboBox5.Enabled:=TRUE;
DateTimePicker8.Enabled:=true;
ComboBox8.Enabled:=True;
end;





IF  ComboBox9.Text='Prolongation' THEN
begin
edit2.Text:='3';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

CheckBox2.Enabled:=true;
ComboBox5.Enabled:=true;
DateTimePicker8.Enabled:=true;
 ComboBox8.Enabled:=True;

DateTimePicker1.DateTime:=DateTimePicker8.DateTime;
end;

IF  ComboBox9.Text='Replace Card' THEN
begin
edit2.Text:='4';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=True;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

ComboBox4.Enabled:=False;
ComboBox5.Enabled:=true;
DateTimePicker8.Enabled:=true;
ComboBox8.Enabled:=True;
DateTimePicker8.Enabled:=False;
end;

IF  ComboBox9.Text='Credit Limit' THEN
begin
edit2.Text:='5';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

ComboBox5.Enabled:=false;

edit28.Enabled:=true;

 ComboBox8.Enabled:=True;
DateTimePicker8.Enabled:=False;

end;


IF  ComboBox9.Text='Card Status' THEN
begin
edit2.Text:='6';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

DateTimePicker8.Enabled:=true;

 ComboBox8.Enabled:=True;
ComboBox12.Enabled:=true;

DateTimePicker8.Enabled:=False;
end;

 IF  ComboBox9.Text='Contract Close' THEN
begin
edit2.Text:='7';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

DateTimePicker8.Enabled:=true;
 ComboBox8.Enabled:=True;
 DateTimePicker8.Enabled:=False;
end;

IF  ComboBox9.Text='PIN Clear' THEN
begin
edit2.Text:='12';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

DateTimePicker8.Enabled:=true;
 ComboBox8.Enabled:=True;
 DateTimePicker8.Enabled:=False;
end;

IF  ComboBox9.Text='RBS Change' THEN
begin
edit2.Text:='11';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;
 ComboBox8.Enabled:=True;
DateTimePicker8.Enabled:=true;
DBLookupComboBox6.Enabled:=true;
DateTimePicker8.Enabled:=False;
end;

IF  ComboBox9.Text='CardName Change' THEN
begin
edit2.Text:='35';

Edit15.Enabled:=True;
Edit16.Enabled:=true;
Edit18.Enabled:=True;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=True;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

ComboBox4.Enabled:=TRUE;
edit23.Enabled:=true;
 ComboBox8.Enabled:=True;

DateTimePicker8.Enabled:=true;
DateTimePicker8.Enabled:=False;
ComboBox4.Enabled:=false;
CheckBox1.Enabled:=true;
end;

IF  ComboBox9.Text='Security Word Change' THEN
begin
edit2.Text:='13';

Edit15.Enabled:=False;
Edit16.Enabled:=False;
Edit18.Enabled:=False;
DateTimePicker7.Enabled:=False;
Edit17.Enabled:=False;
Edit27.Enabled:=False;
Edit20.Enabled:=False;
Edit19.Enabled:=False;
Edit22.Enabled:=False;
ComboBox4.Enabled:=False;
DBLookupComboBox6.Enabled:=False;
ComboBox1.Enabled:=False;
ComboBox12.Enabled:=False;
Edit28.Enabled:=False;
DateTimePicker8.Enabled:=False;
Edit26.Enabled:=False;
Edit23.Enabled:=False;
ComboBox2.Enabled:=False;
Edit25.Enabled:=False;
Edit21.Enabled:=False;
CheckBox2.Enabled:=False;
Edit14.Enabled:=False;
ComboBox11.Enabled:=False;
ComboBox10.Enabled:=False;

edit25.Enabled:=true;


DateTimePicker8.Enabled:=true;
ComboBox8.Enabled:=True;
DateTimePicker8.Enabled:=False;
end;
end;


procedure Tcards.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Tcards.FormShow(Sender: TObject);
begin
//ShowMessage(x);
Edit4.Text:=x;
clients.Close;
clients.SetVariable('cid',strtoint(x));
clients.Open;
acount.Open;
aplication.Open;
card.Open;
end;

end.
