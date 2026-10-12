unit edit_arxiv_cust_order__;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, DBCtrls, StdCtrls, ComCtrls;

type
  Tedit_arxiv_cust_order = class(TForm)
    GroupBox33: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    editnumber: TEdit;
    editdate: TDateTimePicker;
    Editval: TEdit;
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
    GroupBox30: TGroupBox;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Editchief: TEdit;
    Edithead: TEdit;
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
    GroupBox37: TGroupBox;
    GroupBox6: TGroupBox;
    Edit1: TEdit;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    Label11: TLabel;
    Editc_name: TEdit;
    GroupBox23: TGroupBox;
    Label12: TLabel;
    GroupBox24: TGroupBox;
    Label13: TLabel;
    Editc_voin: TEdit;
    GroupBox5: TGroupBox;
    closedate: TDateTimePicker;
    editname: TEdit;
    editc_acc: TEdit;
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure FormActivate(Sender: TObject);
    procedure Editn_monKeyPress(Sender: TObject; var Key: Char);
    procedure editnameKeyPress(Sender: TObject; var Key: Char);
    procedure EditcodeKeyPress(Sender: TObject; var Key: Char);
    procedure EditvoinKeyPress(Sender: TObject; var Key: Char);
    procedure EditaccKeyPress(Sender: TObject; var Key: Char);
    procedure EditswiftKeyPress(Sender: TObject; var Key: Char);
    procedure Editc_nameKeyPress(Sender: TObject; var Key: Char);
    procedure editc_accKeyPress(Sender: TObject; var Key: Char);
    procedure Editc_voinKeyPress(Sender: TObject; var Key: Char);
    procedure Editm_nameKeyPress(Sender: TObject; var Key: Char);
    procedure Editm_accKeyPress(Sender: TObject; var Key: Char);
    procedure Editm_voinKeyPress(Sender: TObject; var Key: Char);
    procedure Editw_monKeyPress(Sender: TObject; var Key: Char);
    procedure EditconKeyPress(Sender: TObject; var Key: Char);
    procedure EditedvKeyPress(Sender: TObject; var Key: Char);
    procedure EditproKeyPress(Sender: TObject; var Key: Char);
    procedure Editedv_fKeyPress(Sender: TObject; var Key: Char);
    procedure Editpro_pKeyPress(Sender: TObject; var Key: Char);
    procedure Editedv_tKeyPress(Sender: TObject; var Key: Char);
    procedure Editpro_tKeyPress(Sender: TObject; var Key: Char);
    procedure EditchiefKeyPress(Sender: TObject; var Key: Char);
    procedure EditheadKeyPress(Sender: TObject; var Key: Char);
    procedure editnumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditvalKeyPress(Sender: TObject; var Key: Char);
    procedure editdateKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  edit_arxiv_cust_order: Tedit_arxiv_cust_order;

implementation

uses datamodule;

{$R *.DFM}


procedure Tedit_arxiv_cust_order.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tedit_arxiv_cust_order.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Архив сярянжам';
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

procedure Tedit_arxiv_cust_order.FormActivate(Sender: TObject);
begin
with DataModCustOrders do  begin

Bankm.open;
bank_info.open;
end;
 end;

procedure Tedit_arxiv_cust_order.Editn_monKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.editnameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;


end;

procedure Tedit_arxiv_cust_order.EditcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditvoinKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditaccKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditswiftKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editc_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.editc_accKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editc_voinKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editm_nameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editm_accKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editm_voinKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editw_monKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditconKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditedvKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditproKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editedv_fKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editpro_pKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editedv_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Editpro_tKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditchiefKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditheadKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.editnumberKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.EditvalKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.editdateKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure Tedit_arxiv_cust_order.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

end.
