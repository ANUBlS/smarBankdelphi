unit Unit6;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons,Oracledata, Grids, DBGrids, Mask,NLSDialogs,NLSLocalizer, DBCtrls,
  Menus, ImgList, ExtCtrls;

type
  TCustomers_orders_arest = class(TForm)
    Panel1: TPanel;
    Customers_orders_arest: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NLSLocalizer1: TNLSLocalizer;
    Label10: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox22: TGroupBox;
    GroupBox23: TGroupBox;
    GroupBox24: TGroupBox;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    GroupBox27: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    GroupBox30: TGroupBox;
    GroupBox31: TGroupBox;
    GroupBox32: TGroupBox;
    GroupBox33: TGroupBox;
    Editvoin: TEdit;
    Editcode: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Edit2: TEdit;
    editdate: TDateTimePicker;
    editval: TComboBox;
    GroupBox34: TGroupBox;
    GroupBox35: TGroupBox;
    GroupBox36: TGroupBox;
    GroupBox37: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Editacc: TEdit;
    Editswift: TEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Comboname: TComboBox;
    Label33: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Arestctrlu1: TMenuItem;
    redakteetmek1: TMenuItem;
    legvetmek1: TMenuItem;
    arxiv1: TMenuItem;
    innDBEdit: TDBEdit;
    nameEdit: TEdit;
    accEdit: TEdit;
    innEdit: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editvalKeyPress(Sender: TObject; var Key: Char);
    procedure EditcodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CombonameChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Rate :array of integer;
    { Public declarations }
    procedure addvalute;
    procedure ComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
  end;

var
  Customers_orders_arest: TCustomers_orders_arest;

implementation

uses CustomersordersImpl1, CustomersordersProj1_TLB, Unit3, Unit4, Unit5,
  Unit7;

{$R *.DFM}

procedure TCustomers_orders_arest.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key :=#0;
end;

procedure TCustomers_orders_arest.Edit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
   Close;
end;

procedure TCustomers_orders_arest.editvalKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['à'..'ÿ','À'..'ß','A'..'Z','à'..'z']) then
    key :=#0;
end;

procedure TCustomers_orders_arest.EditcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key :=#0;
end;

procedure TCustomers_orders_arest.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key=vk_escape then close;
end;

procedure TCustomers_orders_arest.DBGrid1TitleClick(Column: TColumn);
var
titlename:string;
begin
  TitleName :=Column.FieldName;
  with dm.search_acc do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;
end;

procedure TCustomers_orders_arest.DBGrid1CellClick(Column: TColumn);
begin
  nameedit.Text:=dm.search_acc.fieldbyname('name').asstring;
  accedit.Text :=dm.search_acc.fieldbyname('acc_no').asstring;
  innedit.Text :=inndbedit.Text;

end;

procedure TCustomers_orders_arest.CombonameChange(Sender: TObject);
begin
     try
  with dm.Bankm do
   begin
    Close;
     SQL. Clear;
     SQL.Text :='Select * From BankM Where ID= '+IntToStr(Rate[comboname.ItemIndex]);
    Open;
    editcode.Text :=FieldByName('BANKCODE').AsString;
    editvoin.Text :=FieldByName('INN').AsString;
    Editacc.Text :=FieldByName('KRNO').AsString;
    Editswift.Text :=FieldByName('SWIFT').AsString;
   end;
 finally
    with dm.Bankm do
    begin
     Close;
      SQL. Clear;
      SQL.Text :='Select * From BankM ';
     Open;
     refresh;

end;
end;
end;

procedure TCustomers_orders_arest.SpeedButton3Click(Sender: TObject);
begin

  with dm.search_acc do
  if IsEmpty then
    begin
     ShowMessage('Hec bir hesab qeyd olunmayib!');
     Exit;
    end
  else begin

check_arest :=Tcheck_arest.create(self);
check_arest.showmodal;


end;

end;


procedure Tcustomers_orders_arest.addvalute;
var
xxx: integer;
begin
with dm.valute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select * from avalute');
                   Open;
                 end;
           editval.Clear;
                          for xxx:=1 to  dm.valute.RecordCount do begin
                              with editval do
                                  begin
                                       Items.Add(dm.valute.FieldByName('val_name').AsString);
                                  end; {with}
                              Dm.valute.Next;
                     end; {for}


                      end;

 procedure Tcustomers_orders_arest.ComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
var

   rateindex :Integer;
begin
 RateIndex :=0;
 if DataSet. Active=false then DataSet.Open;
  DataSet.First;
   SetLength(Rate,DataSet.RecordCount);
   ComboBox.Items.Clear;
    while not(DataSet.Eof) do
     begin
      ComboBox.Items.Add(DataSet. FieldByName(Field).AsString);
      Rate[RateIndex] :=DataSet. FieldByName(IDfield).AsInteger;
      DataSet.Next;
      Inc(RateIndex);
     end;
      end;




procedure TCustomers_orders_arest.SpeedButton2Click(Sender: TObject);
var
   DDate :TDateTime;
begin
     //DDate :=Trunc(editdate.DateTime);
  if not ((check_arest.CheckBox1.Checked )or (check_arest.CheckBox2.Checked))

  then
    begin
   messagedlg('Tipacc secin!',mterror,[mbok],0);
   SpeedButton3Click(Sender);
   end
   else
   begin





   end;
  
end;

procedure TCustomers_orders_arest.FormActivate(Sender: TObject);
begin

   with dm do  begin

Bankm.open;
//bank_info.open;
addvalute;
{ComboBox(accDataSet,'acc_no',Comboc_acc); }
ComboID(Bankm,'NAME','ID',comboname);
//editdate.DateTime :=customersorders.CallDateFunction('CurrentDate',[]);



end;


end;

end.
