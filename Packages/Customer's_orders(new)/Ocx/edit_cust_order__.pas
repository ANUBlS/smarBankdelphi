unit edit_cust_order__;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons,Oracledata, NLSDialogs,Grids, DBGrids, Mask, DBCtrls,
  NLSLocalizer;

type
  Tedit_cust_order = class(TForm)
    GroupBox30: TGroupBox;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Editchief: TEdit;
    Edithead: TEdit;
    GroupBox29: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Editn_mon: TEdit;
    Editw_mon: TEdit;
    Editcon: TEdit;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    Label11: TLabel;
    Editc_name: TEdit;
    GroupBox23: TGroupBox;
    Label12: TLabel;
    GroupBox24: TGroupBox;
    Label13: TLabel;
    Editc_voin: TEdit;
    GroupBox33: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    editnumber: TEdit;
    editdate: TDateTimePicker;
    GroupBox37: TGroupBox;
    GroupBox6: TGroupBox;
    Edit1: TEdit;
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
    Editpro_t: TEdit;
    Editpro_p: TEdit;
    Editpro: TEdit;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    Label14: TLabel;
    Editm_name: TEdit;
    GroupBox27: TGroupBox;
    Label15: TLabel;
    Editm_acc: TEdit;
    GroupBox28: TGroupBox;
    Editm_voin: TEdit;
    editname: TEdit;
    editc_acc: TEdit;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    editval: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    km: TLabel;
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Editn_monExit(Sender: TObject);
    procedure Editn_monChange(Sender: TObject);
    procedure Editc_voinChange(Sender: TObject);
    procedure Editm_voinChange(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
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
    procedure Editn_monKeyPress(Sender: TObject; var Key: Char);
    procedure EditcodeChange(Sender: TObject);
    procedure editc_accChange(Sender: TObject);
    procedure editnumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Rate :array of integer;
    isUpdate :boolean;

    procedure  ComboBox(DataSet: TOracleDataSet; Field: String; ComboBox: TComboBox);
    procedure ComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
    function WithCoin(Ammount :string):string;

   procedure cleaning;end;


var
  edit_cust_order: Tedit_cust_order;

implementation
 uses datamodule,CurrencyToHR_Azeri_Impl, arest_check;
{$R *.DFM}

 procedure Tedit_cust_order.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tedit_cust_order.WMNCPaint(var message: TWMNCPaint);
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

procedure Tedit_cust_order.Button3Click(Sender: TObject);
begin
DataModCustOrders.serach_cust.setvariable('cust',strtoint(edit1.text));
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;


end;

procedure Tedit_cust_order.cleaning;

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


procedure Tedit_cust_order.ComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
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
     end;  end;





procedure  Tedit_cust_order.ComboBox(DataSet: TOracleDataSet; Field: String; ComboBox: TComboBox);
begin
if dataset.active=false then
 dataset.open;
 dataset.first;
 combobox.items.clear;
 while not (dataset.eof) do  begin
  combobox.items.add(dataset.fieldbyname(field).asstring);
dataset.next;
   end;  end;

procedure Tedit_cust_order.SpeedButton1Click(Sender: TObject);
var
   DDate :TDateTime;

begin
   DDate :=Trunc(editdate.DateTime);
    begin
    if MessageDlg('—€р€нжамда етдийиниз д€йишикликл€р г€бул едилсин?',mtConfirmation,mbYesNoCancel,0)=mrYes then
     begin
      with DataModCustOrders.customer_orders,DataModCustOrders.cust_orders do
                 CallProcedure('update_cust_order',[

                ddate
               ,Editnumber.text
                ,DBCode.text
                ,DBName.text
                ,dbinn.text
                ,dbcoracc.text
                ,dbswift.text
                ,editval.text
                ,editname.text
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
                                         ]); end;cleaning; DataModCustOrders.search_order.refresh;
                                          DataModCustOrders.cust_orders.refresh;
                                         edit_cust_order.close;
                                                 end; end;
{procedure Tedit_cust_order.addvalute;
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
                                  end;
                              DataModCustOrders.valute.Next;
                       end;

    end;
                 }
function Tedit_cust_order.WithCoin(Ammount :string):string;
var
  tTrunc :currency;
begin
   tTrunc :=Trunc(StrToCurr(Ammount));
   Delete(Ammount,Pos(CurrToStr(tTrunc),Ammount),Length(CurrToStr(tTrunc))+1);
    if Ammount ='' then Ammount :='00';
   result :=CurrencyToHR_Azeri(tTrunc,0,[0])+' '+'='+' '+Ammount+' г€п';
end;






procedure Tedit_cust_order.FormActivate(Sender: TObject);
begin

with DataModCustOrders do  begin
Bankm.open;
bank_info.open;

DataModCustOrders.search_order.open;
    DataModCustOrders.cust_orders.open;
      end;
end;






procedure Tedit_cust_order.Button1Click(Sender: TObject);
begin
check_arest :=Tcheck_arest.create(self);
check_arest.showmodal;
end;

procedure Tedit_cust_order.Editn_monExit(Sender: TObject);
begin
if editn_mon.text<>'' then
  editw_mon.text :=WithCoin(editn_mon.text);
end;

procedure Tedit_cust_order.Editn_monChange(Sender: TObject);
begin
if  (Trim(TEdit(Sender).Text)<>'') then
     editw_mon.text :=WithCoin(editn_mon.text);


end;

procedure Tedit_cust_order.Editc_voinChange(Sender: TObject);

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


procedure Tedit_cust_order.Editm_voinChange(Sender: TObject);
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


procedure Tedit_cust_order.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if edit1.text <>'' then
DataModCustOrders.serach_cust.setvariable('cust',strtoint(edit1.text));
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;
 DataModCustOrders.order.setvariable('order_s',edit1.text);
DataModCustOrders.order.open;
DataModCustOrders.order.refresh;
DataModCustOrders.search_acc.setvariable('acc',DataModCustOrders.serach_cust.fieldbyname('id').asinteger);
  DataModCustOrders.search_acc.open;
   DataModCustOrders.search_acc.refresh;
 }
end;

procedure Tedit_cust_order.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
end;

procedure Tedit_cust_order.SpeedButton8Click(Sender: TObject);
begin
DataModCustOrders.serach_cust.setvariable('cust',strtoint(edit1.text));
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;
end;

procedure Tedit_cust_order.SpeedButton9Click(Sender: TObject);
begin
{DataModCustOrders.or.setvariable('order_s',edit1.text);
DataModCustOrders.order.open;
DataModCustOrders.order.refresh;
DataModCustOrders.search_acc.setvariable('acc',DataModCustOrders.serach_cust.fieldbyname('id').asinteger);
  DataModCustOrders.search_acc.open;
   DataModCustOrders.search_acc.refresh;
 }
end;

procedure Tedit_cust_order.SpeedButton10Click(Sender: TObject);
begin
check_arest :=Tcheck_arest.create(self);
check_arest.showmodal;

end;

procedure Tedit_cust_order.Editw_monKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;


end;

procedure Tedit_cust_order.Editedv_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;}
begin
{  Calc:=
  (strtofloat(Editedv.Text)+
  strtofloat(editedv_f.text)/100);
  Editedv_t.Text:=floattostr(Calc);}
  end;



procedure Tedit_cust_order.Editpro_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;}
begin
{  Calc:=
  (strtofloat(Editpro.Text)+
  strtofloat(editpro_p.text)/100);
  Editpro_t.Text:=floattostr(Calc);}
end;

procedure Tedit_cust_order.Editedv_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.Editpro_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.EditedvKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.Editedv_fKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.EditproKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.Editpro_pKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.Editn_monKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_cust_order.EditcodeChange(Sender: TObject);
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
   editname.text :=fieldbyname('name').asstring;

 
  end;

end;

procedure Tedit_cust_order.editc_accChange(Sender: TObject);
begin
with DataModCustOrders.account do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='select * from account  where acc_no= '+''''+editc_acc.Text+'''';
   Open;
   editc_name.Text :=FieldByName('name').AsString;



end;
  end;
procedure Tedit_cust_order.editnumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_ESCAPE then
close;
end;

end.
