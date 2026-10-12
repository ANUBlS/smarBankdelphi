unit transaction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TEmeliyyat = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit4: TEdit;
    DBEdit3: TDBEdit;
    GroupBox3: TGroupBox;
    Edit5: TEdit;
    DBEdit1: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    SpeedButton1: TSpeedButton;
    total: TEdit;
    GroupBox6: TGroupBox;
    proper_edit: TEdit;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cleaning;
  end;

var
  Emeliyyat: TEmeliyyat;

implementation

uses datamodule, customers_orders_arest__;

{$R *.DFM}

procedure TEmeliyyat.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
datamodule1.acc_no.setvariable('acc',strtoint(edit4.text));
datamodule1.acc_no.open;
datamodule1.acc_no.refresh;

end;

procedure TEmeliyyat.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
datamodule1.act_no.setvariable('acc',strtoint(edit5.text));
datamodule1.act_no.open;
datamodule1.act_no.refresh;

end;

procedure TEmeliyyat.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
datamodule1.acc_no.setvariable('acc',edit4.text);
datamodule1.acc_no.open;
datamodule1.acc_no.refresh;

end;

procedure TEmeliyyat.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
datamodule1.act_no.setvariable('acc',edit5.text);
datamodule1.act_no.open;
datamodule1.act_no.refresh;

end;

procedure TEmeliyyat.cleaning;

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

procedure TEmeliyyat.SpeedButton1Click(Sender: TObject);
begin
{if MessageDlg('Bu emeliyyat yerine yetirilsin?',mtConfirmation,mbYesNoCancel,0)=mrYes then }
datamodule1.customer_orders.callprocedure('ORDER_TRANS_',[total.text,dbedit3.text,dbedit1.text,proper_edit.text]);
datamodule1.customer_orders.callprocedure('C_TRANS',[]);
Emeliyyat.close;


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

procedure TEmeliyyat.FormActivate(Sender: TObject);
begin

emeliyyat.proper_edit.text :=customers_orders_arest.Editcon.text;

end;     

end.
