unit m_edit_order___;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Buttons,NLSDialogs,NLSLocalizer, ComCtrls;

type
  Tm_edit_order = class(TForm)
    GroupBox29: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Editn_mon: TEdit;
    Editw_mon: TEdit;
    Editcon: TEdit;
    GroupBox30: TGroupBox;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Editchief: TEdit;
    Edithead: TEdit;
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
    GroupBox33: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    editnumber: TEdit;
    editdate: TDateTimePicker;
    Editval: TEdit;
    GroupBox37: TGroupBox;
    GroupBox6: TGroupBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
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
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    Label11: TLabel;
    Editc_name: TEdit;
    GroupBox23: TGroupBox;
    Label12: TLabel;
    GroupBox24: TGroupBox;
    Label13: TLabel;
    Editc_voin: TEdit;
    editname: TEdit;
    editc_acc: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    km: TLabel;
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Editn_monChange(Sender: TObject);
    procedure Editn_monExit(Sender: TObject);
    procedure Editw_monKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
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
    procedure Editc_voinChange(Sender: TObject);
    procedure Editm_voinChange(Sender: TObject);
    procedure editnumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
     function WithCoin(Ammount :string):string;
    procedure cleaning;
  end;

var
  m_edit_order: Tm_edit_order;

implementation

uses datamodule,CurrencyToHR_Azeri_Impl;

{$R *.DFM}
 procedure Tm_edit_order.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tm_edit_order.WMNCPaint(var message: TWMNCPaint);
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

procedure Tm_edit_order.cleaning;

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
 function Tm_edit_order.WithCoin(Ammount :string):string;
var
  tTrunc :currency;
begin
   tTrunc :=Trunc(StrToCurr(Ammount));
   Delete(Ammount,Pos(CurrToStr(tTrunc),Ammount),Length(CurrToStr(tTrunc))+1);
    if Ammount ='' then Ammount :='00';
   result :=CurrencyToHR_Azeri(tTrunc,0,[0])+' '+'='+' '+Ammount+' г€п';
end;

procedure Tm_edit_order.SpeedButton1Click(Sender: TObject);
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
                                         ]); end;cleaning;
                                         DataModCustOrders.cust_orders.refresh;
                                         DataModCustOrders.search_order.refresh;
                                         m_edit_order.close;
                                           
                                        end; end;

procedure Tm_edit_order.Editn_monChange(Sender: TObject);
begin
if  (Trim(TEdit(Sender).Text)<>'') then
     editw_mon.text :=WithCoin(editn_mon.text);

end;

procedure Tm_edit_order.Editn_monExit(Sender: TObject);
begin
if editn_mon.text<>'' then
  editw_mon.text :=WithCoin(editn_mon.text);

end;

procedure Tm_edit_order.Editw_monKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;


end;

procedure Tm_edit_order.FormActivate(Sender: TObject);
begin
with DataModCustOrders do  begin

Bankm.open;
bank_info.open;
 DataModCustOrders.cust_orders.open;
end;

end;

procedure Tm_edit_order.Editedv_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;}
begin
{  Calc:=
  (strtofloat(Editedv.Text)+
  strtofloat(editedv_f.text)/100);
  Editedv_t.Text:=floattostr(Calc); }
  end;
procedure Tm_edit_order.Editpro_tKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
 Calc:real;}
begin
 { Calc:=
  (strtofloat(Editpro.Text)+
  strtofloat(editpro_p.text)/100);
  Editpro_t.Text:=floattostr(Calc);}
end;


procedure Tm_edit_order.Editedv_tKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.Editpro_tKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.EditedvKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.Editedv_fKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.EditproKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.Editpro_pKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.Editn_monKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tm_edit_order.EditcodeChange(Sender: TObject);
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

procedure Tm_edit_order.Editc_voinChange(Sender: TObject);

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

procedure Tm_edit_order.Editm_voinChange(Sender: TObject);

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



procedure Tm_edit_order.editnumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_ESCAPE then
close;
end;

end.
