unit customers_orders_arest__;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons,Oracledata, Grids, DBGrids, Mask,NLSDialogs,NLSLocalizer, DBCtrls,
  Menus, ImgList;

type
  Tcustomers_orders_arest = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox4: TGroupBox;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    DBEdit3: TDBEdit;
    GroupBox6: TGroupBox;
    Edit1: TEdit;
    GroupBox8: TGroupBox;
    DBEdit4: TDBEdit;
    GroupBox38: TGroupBox;
    GroupBox37: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    GroupBox33: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    editnumber: TEdit;
    editdate: TDateTimePicker;
    GroupBox9: TGroupBox;
    GroupBox11: TGroupBox;
    Label2: TLabel;
    DBname: TDBEdit;
    GroupBox12: TGroupBox;
    Label1: TLabel;
    DBcode: TDBEdit;
    GroupBox13: TGroupBox;
    Label3: TLabel;
    DBinn: TDBEdit;
    GroupBox14: TGroupBox;
    Label4: TLabel;
    DBCorAcc: TDBEdit;
    GroupBox15: TGroupBox;
    Label5: TLabel;
    DBswift: TDBEdit;
    GroupBox10: TGroupBox;
    GroupBox16: TGroupBox;
    Label6: TLabel;
    comboname: TComboBox;
    GroupBox17: TGroupBox;
    Label7: TLabel;
    Editcode: TEdit;
    GroupBox18: TGroupBox;
    Label8: TLabel;
    Editvoin: TEdit;
    GroupBox19: TGroupBox;
    Label9: TLabel;
    Editacc: TEdit;
    GroupBox20: TGroupBox;
    Label10: TLabel;
    Editswift: TEdit;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    Label11: TLabel;
    Editc_name: TEdit;
    GroupBox23: TGroupBox;
    Label12: TLabel;
    GroupBox24: TGroupBox;
    Label13: TLabel;
    Editc_voin: TEdit;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    Label14: TLabel;
    Editm_name: TEdit;
    GroupBox27: TGroupBox;
    Label15: TLabel;
    Editm_acc: TEdit;
    GroupBox28: TGroupBox;
    Label16: TLabel;
    Editm_voin: TEdit;
    GroupBox29: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Editn_mon: TEdit;
    Editw_mon: TEdit;
    Editcon: TEdit;
    GroupBox32: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Editedv: TEdit;
    Editedv_f: TEdit;
    Editedv_t: TEdit;
    GroupBox30: TGroupBox;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Editchief: TEdit;
    Edithead: TEdit;
    GroupBox7: TGroupBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton8: TSpeedButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox31: TGroupBox;
    DBGrid2: TDBGrid;
    editc_acc: TEdit;
    editpro: TEdit;
    Editpro_p: TEdit;
    Editpro_t: TEdit;
    editval: TComboBox;
    db_arest: TPopupMenu;
    arest: TMenuItem;
    db_order: TPopupMenu;
    edit: TMenuItem;
    Legvetmek1: TMenuItem;
    Arxiv1: TMenuItem;
    NLSLocalizer1: TNLSLocalizer;
    ImageList: TImageList;
    km: TLabel;
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure combonameChange(Sender: TObject);
    
    procedure FormActivate(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Editn_monExit(Sender: TObject);
    procedure Editn_monChange(Sender: TObject);
    procedure Editn_monKeyPress(Sender: TObject; var Key: Char);
    procedure Editc_voinChange(Sender: TObject);
    procedure Editm_voinChange(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure EditcodeKeyPress(Sender: TObject; var Key: Char);
    procedure EditvoinKeyPress(Sender: TObject; var Key: Char);
    procedure EditaccKeyPress(Sender: TObject; var Key: Char);
    procedure EditswiftKeyPress(Sender: TObject; var Key: Char);
    procedure Editw_monKeyPress(Sender: TObject; var Key: Char);
    procedure Editedv_tKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Editpro_tKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Editedv_tKeyPress(Sender: TObject; var Key: Char);
    procedure Editpro_tKeyPress(Sender: TObject; var Key: Char);
    procedure EditedvKeyPress(Sender: TObject; var Key: Char);
    procedure Editedv_fKeyPress(Sender: TObject; var Key: Char);
    procedure EditproKeyPress(Sender: TObject; var Key: Char);
    procedure Editpro_pKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editnumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure EditcodeChange(Sender: TObject);
    procedure editvalKeyPress(Sender: TObject; var Key: Char);
    procedure editClick(Sender: TObject);
    procedure Legvetmek1Click(Sender: TObject);
    procedure Arxiv1Click(Sender: TObject);
    procedure arestClick(Sender: TObject);
    procedure arestDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure editDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure Legvetmek1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Arxiv1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure combonameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Rate :array of integer;
    isUpdate :boolean;

    procedure  ComboBox(DataSet: TOracleDataSet; Field: String; ComboBox: TComboBox);
    procedure ComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
    function WithCoin(Ammount :string):string;
   procedure cleaning;
   procedure addvalute;end;


var
  customers_orders_arest: Tcustomers_orders_arest;

implementation
 uses datamodule,CurrencyToHR_Azeri_Impl, arest_check, s_arxiv, transaction;
{$R *.DFM}

 procedure Tcustomers_orders_arest.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tcustomers_orders_arest.WMNCPaint(var message: TWMNCPaint);
const Capt = '—€р€нжам';
var dc : hDc;
begin
inherited;
Caption:='';
dc := GetWindowDC(Handle);
        SetBkMode(dc,Transparent);
        SetTextColor(dc,clWhite);
        SelectObject(dc, Font.Handle);
        TextOut(dc, 23,6,Capt,Length(Capt));
end;


procedure Tcustomers_orders_arest.Button3Click(Sender: TObject);
begin
DataModCustOrders.serach_cust.setvariable('cust',strtoint(edit1.text));
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;


end;

procedure Tcustomers_orders_arest.cleaning;

var
  CompCount: word;
begin
 for CompCount :=0 to ComponentCount-1 do
  if(Components[CompCount] is TEdit) then
     (Components[CompCount] as TEdit).Text :=''
  else
   if(Components[CompCount] is TComboBox) then
      (Components[CompCount] as TComboBox).Text :=''


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




procedure  Tcustomers_orders_arest.ComboBox(DataSet: TOracleDataSet; Field: String; ComboBox: TComboBox);
begin
if dataset.active=false then
 dataset.open;
 dataset.first;
 combobox.items.clear;
 while not (dataset.eof) do  begin
  combobox.items.add(dataset.fieldbyname(field).asstring);
dataset.next;
   end; end;

procedure Tcustomers_orders_arest.SpeedButton1Click(Sender: TObject);
begin
try
  emeliyyat :=Temeliyyat.Create(self);
  emeliyyat.Showmodal;
 finally
  emeliyyat.Release;
    end;
end;
procedure Tcustomers_orders_arest.addvalute;
var
xxx: integer;
begin
with DataModCustOrders.valute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select * from avalute');
                   Open;
                 end;
           editval.Clear;
                          for xxx:=1 to  DataModCustOrders.valute.RecordCount do begin
                              with editval do
                                  begin
                                       Items.Add(DataModCustOrders.valute.FieldByName('val_name').AsString);
                                  end; {with}
                              DataModCustOrders.valute.Next;
                       end; {for}

    end;

procedure Tcustomers_orders_arest.SpeedButton2Click(Sender: TObject);
var
   DDate :TDateTime;

begin
   DDate :=Trunc(editdate.DateTime);

   {if isUpdate =false then }
  begin
    if MessageDlg('Ѕу с€р€нжамда етдийиниз д€йишилликл€р г€бул едилсин?',mtConfirmation,mbYesNoCancel,0)=mrYes then
    { if edit1.text ='' then MessageDlg('Voin є daxil edin!',mtConfirmation,[mbok],0)
     else

     }
     with DataModCustOrders.customer_orders do  begin
                 CallProcedure('update_cust_order',[
                ddate
               ,Editnumber.text
                ,DBCode.text
                ,DBName.text
                ,dbinn.text
                ,dbcoracc.text
                ,dbswift.text
                ,editval.text
                ,comboname.text
                ,editcode.text
                ,editvoin.text
                ,editswift.text
                ,editacc.text
                ,editc_name.text
                ,editc_acc.text
                ,editc_voin.text
                ,editm_name.text
                ,editm_acc.text
                ,editm_voin.text
                ,editn_mon.text
                ,editw_mon.text
                ,editcon.text
                ,editedv.text
                ,editedv_f.text
                ,editedv_t.text
                ,editpro.text
                ,editpro_t.text
                ,editpro_p.text
                ,editchief.text
                ,edithead.text
                ,edit1.text
                                         ]);

                                             DataModCustOrders.cust_id.refresh;
                                            DataModCustOrders.search_acc.refresh;
                             end;     end;  end;
function Tcustomers_orders_arest.WithCoin(Ammount :string):string;
var
  tTrunc :currency;
begin
   tTrunc :=Trunc(StrToCurr(Ammount));
   Delete(Ammount,Pos(CurrToStr(tTrunc),Ammount),Length(CurrToStr(tTrunc))+1);
    if Ammount ='' then Ammount :='00';
   result :=CurrencyToHR_Azeri(tTrunc,0,[0])+' '+'='+' '+Ammount+' г€п';
end;






procedure Tcustomers_orders_arest.SpeedButton4Click(Sender: TObject);
var
    v_pnum: String;
    v_id:integer;
begin
with DataModCustOrders.cust_id do
  if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else begin
 v_id :=DataModCustOrders.cust_id.fieldbyname('id').asinteger;
 v_pnum :=DataModCustOrders.cust_id.FieldByName('PNUM').AsString;
 if MessageDlg(Format('є%s с€р€нжам силинсин?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.cust_id,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_order',[v_id]);
   Refresh; end;
   DataModCustOrders.cust_id.refresh;
end;   end;


procedure Tcustomers_orders_arest.SpeedButton6Click(Sender: TObject);
begin
with DataModCustOrders.cust_id,customers_orders_arest do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin

try
  send_arxiv :=Tsend_arxiv.Create(self);
  send_arxiv.Showmodal;
 finally
  send_arxiv.Release;

  end;
   end;  end;

procedure Tcustomers_orders_arest.combonameChange(Sender: TObject);

begin

 try
  with DataModCustOrders.Bankm do
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
    with DataModCustOrders.Bankm do
    begin
     Close;
      SQL. Clear;
      SQL.Text :='Select * From BankM ';
     Open;
     refresh;

end;
end;

end;

{procedure Tcustomers_orders_arest.Comboc_accChange(Sender: TObject);

begin
with DataModCustOrders.accdataset do
begin
 Close;
    SQL.Clear;
    SQL.Text :='Select AC.*,C.Inn From Account AC,Customers C Where AC.kli_ID =C.ID and AC.acc_no= '+''''+Comboc_acc.Text+'''';
   Open;
   editc_name.Text :=FieldByName('NAME').AsString;
   Editc_voin.Text :=FieldByName('INN').AsString;
end;
end;
      }

procedure Tcustomers_orders_arest.FormActivate(Sender: TObject);
begin

with DataModCustOrders do  begin

Bankm.open;
bank_info.open;
addvalute;
{ComboBox(accDataSet,'acc_no',Comboc_acc); }
ComboID(Bankm,'NAME','ID',comboname);
editdate.DateTime :=customer_orders.CallDateFunction('Currentdate',[]);


end; end;


procedure Tcustomers_orders_arest.DBGrid2TitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with DataModCustOrders.cust_id do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;  end;


procedure Tcustomers_orders_arest.DBGrid1TitleClick(Column: TColumn);
var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with DataModCustOrders.search_acc do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;

end;


procedure Tcustomers_orders_arest.Editn_monExit(Sender: TObject);
begin
if editn_mon.text<>'' then
  editw_mon.text :=WithCoin(editn_mon.text);
end;

procedure Tcustomers_orders_arest.Editn_monChange(Sender: TObject);
begin
if  (Trim(TEdit(Sender).Text)<>'') then
     editw_mon.text :=WithCoin(editn_mon.text);


end;

procedure Tcustomers_orders_arest.Editn_monKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
end;

procedure Tcustomers_orders_arest.Editc_voinChange(Sender: TObject);

var
   LenStr:word;
   Str :string;
begin
   LenStr :=Length((Sender as TEdit).text);
   Str :=(Sender as TEdit).text;
 if LenStr>10 then
   begin
    ShowMessage('јнжаг 10 р€г€м дахил етм€к олар!');
    Delete(str,11,LenStr-10);
    (Sender as TEdit).text :=Str;
   end;
end;


procedure Tcustomers_orders_arest.Editm_voinChange(Sender: TObject);
var
   LenStr:word;
   Str :string;
begin
   LenStr :=Length((Sender as TEdit).text);
   Str :=(Sender as TEdit).text;
 if LenStr>10 then
   begin
    ShowMessage('јнжаг 10 р€г€м дахил етм€к олар!');
    Delete(str,11,LenStr-10);
    (Sender as TEdit).text :=Str;
   end;
end;


procedure Tcustomers_orders_arest.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
end;

procedure Tcustomers_orders_arest.SpeedButton8Click(Sender: TObject);
begin

                                             customers_orders_arest.comboname.text:='';
                                             customers_orders_arest.editcode.text :='';
                                             customers_orders_arest.editvoin.text :='';
                                             customers_orders_arest.editacc.text :='';
                                             customers_orders_arest.editswift.text :='';
                                             customers_orders_arest.editc_name.text :='';
                                             customers_orders_arest.editc_acc.text :='';
                                             customers_orders_arest.editc_voin.text :='';
                                             customers_orders_arest.editm_name.text :='';
                                             customers_orders_arest.editm_acc.text :='';
                                             customers_orders_arest.editm_voin.text :='';
                                             customers_orders_arest.editn_mon.text :='';
                                             customers_orders_arest.editw_mon.text:='';
                                             customers_orders_arest.editcon.text :='';
                                             customers_orders_arest.editedv.text :='';
                                             customers_orders_arest.editedv_f.text :='';
                                             customers_orders_arest.editedv_t.text :='';
                                             customers_orders_arest.editpro.text :='';
                                             customers_orders_arest.editpro_p.text :='';
                                             customers_orders_arest.editpro_t.text :='';
                                             customers_orders_arest.editchief.text :='';
                                             customers_orders_arest.edithead.Text :='';
                                             customers_orders_arest.editnumber.text :='';
                                             customers_orders_arest.editval.text :='';

end;

procedure Tcustomers_orders_arest.SpeedButton9Click(Sender: TObject);
var
   DDate :TDateTime;

begin
  SpeedButton10.Click;
  DDate :=Trunc(editdate.DateTime);

   {if isUpdate =false then }


  if  not ((check_arest.CheckBox1.Checked )  or  (check_arest.CheckBox2.Checked))
  then
  begin

   SpeedButton10Click(Sender);
  // messagedlg('Arest tipi secin!',mterror,[mbok],0);

  end
  else

    with DataModCustOrders.customer_orders do  begin

                 CallProcedure('accept_order',[
                ddate
               ,Editnumber.text
                ,DBCode.text
                ,DBName.text
                ,dbinn.text
                ,dbcoracc.text
                ,dbswift.text
                ,editval.text
                ,comboname.text
                ,editcode.text
                ,editvoin.text
                ,editswift.text
                ,editacc.text
                ,editc_name.text
                ,editc_acc.text
                ,editc_voin.text
                ,editm_name.text
                ,editm_acc.text
                ,editm_voin.text
                ,editn_mon.text
                ,editw_mon.text
                ,editcon.text
                ,editedv.text
                ,editedv_f.text
                ,editedv_t.text
                ,editpro.text
                ,editpro_t.text
                ,editpro_p.text
                ,editchief.text
                ,edithead.text
                ,dbedit1.text
                ,edit1.text
                                         ]);


                                             DataModCustOrders.cust_id.refresh;
                                            DataModCustOrders.search_acc.refresh;




                                            try

  {emeliyyat :=Temeliyyat.Create(self);
  emeliyyat.Showmodal;
   }
 finally
  {emeliyyat.Release;}
    end;


                                    //        end; end;

                                end;

                        end;



procedure Tcustomers_orders_arest.SpeedButton10Click(Sender: TObject);
begin
with DataModCustOrders.search_acc do
  if IsEmpty then
    begin
     ShowMessage('Hec bir hesab qeyd olunmayib!');
     Exit;
    end
  else begin

check_arest :=Tcheck_arest.create(self);
check_arest.showmodal;


end; end;

procedure Tcustomers_orders_arest.EditcodeKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.EditvoinKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.EditaccKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.EditswiftKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.Editw_monKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.Editedv_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;}
begin
{  Calc:=
  (strtofloat(Editedv.Text)+
  strtofloat(editedv_f.text)/100);
  Editedv_t.Text:=floattostr(Calc);}
  end;




procedure Tcustomers_orders_arest.Editpro_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;    }
begin
{  Calc:=
  (strtofloat(Editpro.Text)+
  strtofloat(editpro_p.text)/100);
  Editpro_t.Text:=floattostr(Calc);  }

end;




procedure Tcustomers_orders_arest.Editedv_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.Editpro_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.EditedvKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.Editedv_fKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.EditproKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.Editpro_pKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.DBGrid1CellClick(Column: TColumn);
begin
customers_orders_arest.editc_name.text :=DataModCustOrders.search_acc.fieldbyname('name').asstring;
customers_orders_arest.editc_acc.text :=DataModCustOrders.search_acc.fieldbyname('acc_no').asstring;
customers_orders_arest.editc_voin.text :=customers_orders_arest.edit1.text;

end;



procedure Tcustomers_orders_arest.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
   Close;
end;

procedure Tcustomers_orders_arest.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;
end;

procedure Tcustomers_orders_arest.editnumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
   Close;
end;

procedure Tcustomers_orders_arest.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_escape then close;
end;

procedure Tcustomers_orders_arest.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_escape then close;
end;

procedure Tcustomers_orders_arest.DBGrid2CellClick(Column: TColumn);
begin
  with DataModCustOrders.cust_id,customers_orders_arest do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else
   begin
   editc_acc.text :=FieldByName('c_acc').AsString;
    Editc_name.text :=FieldByName('c_name').AsString;
    Editc_voin.text :=FieldByName('c_inn').AsString;

    comboname.text :=FieldByName('b_name').AsString;
    editcode.text :=FieldByName('b_code').AsString;
    Editvoin.text :=FieldByName('b_inn').AsString;
    EditAcc.text :=FieldByName('b_acc').AsString;
    EditSwift.text :=FieldByName('b_swift').AsString;

    Editm_name.text :=FieldByName('m_name').AsString;
    Editm_acc.text :=FieldByName('m_acc').AsString;
    Editm_voin.text :=FieldByName('m_inn').AsString;

    Editn_mon.text :=FieldByName('n_mon').AsString;
    Editw_mon.text :=FieldByName('w_mon').AsString;
    Editcon.Text :=FieldByName('content').AsString;
    Editedv.text :=FieldByName('edv').AsString;
    Editedv_f.text :=FieldByName('edv_f').AsString;
    editedv_t.text :=FieldByName('edv_c').AsString;
    editpro.text :=FieldByName('pro').AsString;
    editpro_p.text :=FieldByName('pro_f').AsString;
    editpro_t.text :=FieldByName('pro_c').AsString;
    editnumber.text :=FieldByName('pnum').AsString;
    editval.text :=FieldByName('val').AsString;
    editdate.DateTime :=FieldByName('ddate').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;


end;
        end;
procedure Tcustomers_orders_arest.EditcodeChange(Sender: TObject);
begin
with DataModCustOrders.Bankm do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from bankm c where bankcode= '+''''+editcode.Text+'''';
   Open;
   editvoin.Text :=FieldByName('inn').AsString;
   editacc.Text :=FieldByName('krno').AsString;
   editswift.text :=fieldbyname('swift').asstring;
   comboname.text :=fieldbyname('name').asstring;

   //---------------------------//
   if editcode.text<>'' then
     km.Font.color :=clblue
       else
        km.font.color :=clred;
  end;
end;

procedure Tcustomers_orders_arest.editvalKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tcustomers_orders_arest.editClick(Sender: TObject);
begin
{form1.isUpdate :=true;}
  with DataModCustOrders.cust_id,customers_orders_arest do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else
   begin
   editc_acc.text :=FieldByName('c_acc').AsString;
    Editc_name.text :=FieldByName('c_name').AsString;
    Editc_voin.text :=FieldByName('c_inn').AsString;

    comboname.text :=FieldByName('b_name').AsString;
    editcode.text :=FieldByName('b_code').AsString;
    Editvoin.text :=FieldByName('b_inn').AsString;
    EditAcc.text :=FieldByName('b_acc').AsString;
    EditSwift.text :=FieldByName('b_swift').AsString;

    Editm_name.text :=FieldByName('m_name').AsString;
    Editm_acc.text :=FieldByName('m_acc').AsString;
    Editm_voin.text :=FieldByName('m_inn').AsString;

    Editn_mon.text :=FieldByName('n_mon').AsString;
    Editw_mon.text :=FieldByName('w_mon').AsString;
    Editcon.Text :=FieldByName('content').AsString;
    Editedv.text :=FieldByName('edv').AsString;
    Editedv_f.text :=FieldByName('edv_f').AsString;
    editedv_t.text :=FieldByName('edv_c').AsString;
    editpro.text :=FieldByName('pro').AsString;
    editpro_p.text :=FieldByName('pro_f').AsString;
    editpro_t.text :=FieldByName('pro_c').AsString;
    editnumber.text :=FieldByName('pnum').AsString;
    editval.text :=FieldByName('val').AsString;
    editdate.DateTime :=FieldByName('ddate').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;

     end;

end;


procedure Tcustomers_orders_arest.Legvetmek1Click(Sender: TObject);
var
    v_pnum: String;
    v_id:integer;
begin
with DataModCustOrders.cust_id do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin
 v_id :=DataModCustOrders.cust_id.fieldbyname('id').asinteger;
 v_pnum :=DataModCustOrders.cust_id.FieldByName('PNUM').AsString;
 if MessageDlg(Format('є%s с€р€нжам  силинсин?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.cust_id,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_order',[v_id]);
   Refresh; end;

end;   end;



procedure Tcustomers_orders_arest.Arxiv1Click(Sender: TObject);
begin
with DataModCustOrders.cust_id,customers_orders_arest do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin

try
  send_arxiv :=Tsend_arxiv.Create(self);
  send_arxiv.Showmodal;
 finally
  send_arxiv.Release;

  end;
   end;  end;

   procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;

      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;  end;


procedure Tcustomers_orders_arest.arestClick(Sender: TObject);
begin
with DataModCustOrders.search_acc do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin

check_arest :=Tcheck_arest.create(self);
check_arest.showmodal;


end; end;

procedure Tcustomers_orders_arest.arestDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders_arest.editDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders_arest.Legvetmek1DrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders_arest.Arxiv1DrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders_arest.combonameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;

end.
