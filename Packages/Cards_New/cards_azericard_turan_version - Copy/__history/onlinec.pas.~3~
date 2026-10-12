unit onlinec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ImgList, ComCtrls, ToolWin, PluginToolBar,
  Unitclient2, StdCtrls;

type
  TOnline = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Online: TOnline;

implementation

uses Unit18;

{$R *.dfm}

procedure TOnline.Button1Click(Sender: TObject);
var k:integer;
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_madd']);

//   DataMod_CARDS.Clients.Insert;
  //Customer_new.Edit1.Text:='NEW';
  //Customer_new.ShowModal;
  //Customer_new.Caption:='  NEW CARD';
  clients2:=Tclients2.Create(self);




  clients2.Caption:='ONLINE';
  clients2.edit1.Text:='ONLINE' ;

 clients2.ComboBox9.Clear;
 DataMod_CARDS.apptype.Close;
 DataMod_CARDS.apptype.Open;
 DataMod_CARDS.apptype.First;


for k:=0 to DataMod_CARDS.apptype.recordcount do
begin
if k=0 then clients2.ComboBox9.Items.add(' ') else
begin
clients2.ComboBox9.Items.add(DataMod_CARDS.apptype.fieldbyname('TYPE').asstring);
DataMod_CARDS.apptype.next;
end;
end;



  if clients2.edit1.Text='ONLINE' then
begin
        {clients2.DBGrid6.DataSource.DataSet.Close;
        clients2.Button3.Enabled:=TRue;
        clients2.DBGrid5.DataSource.DataSet.Close;  }


clients2.DBEdit3.Text:='';
clients2.Edit15.Text:=DataMod_CARDS.Online_Cards.fieldbyname('FNAME').asstring;
clients2.edit15.Visible:=TRUE;
clients2.Edit16.Text:=DataMod_CARDS.Online_Cards.fieldbyname('LNAME').asstring;
clients2.edit16.Visible:=TRUE;
clients2.Edit18.Text:=DataMod_CARDS.Online_Cards.fieldbyname('PASSPORT').asstring;
clients2.edit18.Visible:=TRUE;
//clients2.DateTimePicker7.DateTime:=DataMod_CARDS.Online_Cards.fieldbyname('BIRTHDAY').asdatetime;
clients2.DateTimePicker7.Visible:=true;
clients2.Edit17.Text:=DataMod_CARDS.Online_Cards.fieldbyname('HOMEPHONE').asstring;
clients2.edit17.Visible:=TRUE;
clients2.Edit27.Text:=DataMod_CARDS.Online_Cards.fieldbyname('WORKPHONE').asstring;
clients2.edit27.Visible:=TRUE;
clients2.Edit20.Text:=DataMod_CARDS.Online_Cards.fieldbyname('COUNTRY').asstring;
clients2.edit20.Visible:=TRUE;
clients2.Edit19.Text:=DataMod_CARDS.Online_Cards.fieldbyname('CITY').asstring;
clients2.edit19.Visible:=TRUE;
clients2.Edit22.Text:=DataMod_CARDS.Online_Cards.fieldbyname('ADDRESS').asstring;
clients2.edit22.Visible:=TRUE;
clients2.ComboBox4.Text:=DataMod_CARDS.Online_Cards.fieldbyname('RESIDENT').asstring;
clients2.ComboBox4.visible:=true;
clients2.ComboBox1.Text:=DataMod_CARDS.Online_Cards.fieldbyname('CARDTYPE').asstring;
clients2.ComboBox1.visible:=true;
//clients2.ComboBox12.Text:=DataMod_CARDS.Online_Cards.fieldbyname('CARDSTATUS').asstring;
clients2.ComboBox12.visible:=true;
//clients2.Edit28.Text:=DataMod_CARDS.Online_Cards.fieldbyname('CREDIT_LIM').asstring;
clients2.edit28.Visible:=TRUE;
//clients2.DateTimePicker5.DateTime:=DataMod_CARDS.Online_Cards.fieldbyname('DATEOPEN').asdatetime;
//clients2.DateTimePicker6.DateTime:=DataMod_CARDS.Online_Cards.fieldbyname('EXPIRY').asdatetime;
//clients2.DateTimePicker8.DateTime:=DataMod_CARDS.Clients.fieldbyname('EXPIRY').asdatetime;
//clients2.Edit26.Text:=DataMod_CARDS.Online_Cards.fieldbyname('REFERENCE').asstring;
clients2.edit26.Visible:=TRUE;
//clients2.Edit23.Text:=DataMod_CARDS.Online_Cards.fieldbyname('EMBOSSNAME').asstring;
clients2.edit23.Visible:=TRUE;
//clients2.ComboBox2.Text:=DataMod_CARDS.Clients.fieldbyname('COMPANY').asstring;
clients2.ComboBox2.visible:=true;
clients2.Edit25.Text:=DataMod_CARDS.Online_Cards.fieldbyname('SECURITY').asstring;
clients2.edit25.Visible:=TRUE;
clients2.Edit21.Text:=DataMod_CARDS.Online_Cards.fieldbyname('currency').asstring;
clients2.edit21.Visible:=TRUE;
clients2.CheckBox2.Checked:=False;
//Edit14.Text:=DataMod_CARDS.Clients.fieldbyname('').asstring;
//clients2.ComboBox11.Text:=DataMod_CARDS.Online_Cards.fieldbyname('TYPES').asstring;
clients2.ComboBox11.visible:=true;
clients2.ComboBox10.Text:=DataMod_CARDS.Online_Cards.fieldbyname('TITUL').asstring;
clients2.ComboBox10.visible:=true;
//clients2. Edit24.Text:=DataMod_CARDS.Online_Cards.fieldbyname('CARDNUMBER').asstring;
clients2.Edit24.Visible:=true;


{
clients2.Edit15.Enabled:=False;
clients2.Edit16.Enabled:=False;
clients2.Edit18.Enabled:=False;
clients2.DateTimePicker7.Enabled:=False;
clients2.Edit17.Enabled:=False;
clients2.Edit27.Enabled:=False;
clients2.Edit20.Enabled:=False;
clients2.Edit19.Enabled:=False;
clients2.Edit22.Enabled:=False;
clients2.ComboBox4.Enabled:=False;
clients2.DBLookupComboBox6.Enabled:=False;
clients2.ComboBox1.Enabled:=False;
clients2.ComboBox12.Enabled:=False;
clients2.Edit28.Enabled:=False;
clients2.DateTimePicker8.Enabled:=False;
clients2.Edit26.Enabled:=False;
clients2.Edit23.Enabled:=False;
clients2.ComboBox2.Enabled:=False;
clients2.Edit25.Enabled:=False;
clients2.Edit21.Enabled:=False;
clients2.CheckBox2.Enabled:=False;
clients2.Edit14.Enabled:=False;
clients2.ComboBox11.Enabled:=False;
clients2.ComboBox10.Enabled:=False;
clients2.ComboBox9.Enabled:=false;
clients2.DBGrid1.Enabled:=true;
clients2.dbgrid2.Enabled:=true;
clients2.DBGrid5.Enabled:=true;
clients2.dbgrid6.Enabled:=true;
clients2.ComboBox8.Enabled:=False;
clients2.ComboBox5.Enabled:=False;
clients2.DBEdit17.Visible:=True;
clients2.Edit33.Visible:=False;    }
end;
   clients2.ShowModal;

end;

end.
