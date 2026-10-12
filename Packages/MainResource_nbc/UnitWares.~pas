unit UnitWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, NLSLocalizer;

type
  TFormUpdWares = class(TForm)
    PanelMain: TPanel;
    GBoxPublic: TGroupBox;
    Edit_Wares_Name: TEdit;
    GroupBoxFXM: TGroupBox;
    CBoxFXM: TComboBox;
    GroupBoxSector: TGroupBox;
    Edit_Keeping_Sec: TEdit;
    GroupBoxInvDate: TGroupBox;
    DTP_Inv_Date: TDateTimePicker;
    GroupBoxAmortDate: TGroupBox;
    DTP_Amort_Date: TDateTimePicker;
    GroupBoxNB: TGroupBox;
    Label_First_Price: TLabel;
    Label_Balance_Price: TLabel;
    Label_All_Amort: TLabel;
    Label_Amort: TLabel;
    Edit_First_Price: TEdit;
    Edit_Balance_Price: TEdit;
    Edit_All_Amort: TEdit;
    Edit_Amort: TEdit;
    GroupBoxNL: TGroupBox;
    Label_Tax_First_Price: TLabel;
    Label_Tax_Balance_Price: TLabel;
    LabelTax_All_Amort: TLabel;
    LabelTax_Amort: TLabel;
    Edit_Tax_First_Price: TEdit;
    Edit_Tax_Balance_Price: TEdit;
    Edit_Tax_All_Amort: TEdit;
    Edit_Tax_Amort: TEdit;
    BtnOk: TBitBtn;
    NLSLocalizer: TNLSLocalizer;
    GroupBoxInv_No: TGroupBox;
    Edit_Inv_No: TEdit;
    GroupBox1: TGroupBox;
    Edit_User: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit_First_PriceKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Balance_PriceChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Edit_All_AmortChange(Sender: TObject);
    procedure Edit_Wares_NameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdWares: TFormUpdWares;

implementation

uses UnitData;

{$R *.DFM}

procedure TFormUpdWares.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ORD(Key) =VK_ESCAPE) then Close;
end;

procedure TFormUpdWares.FormActivate(Sender: TObject);
begin
 with DataModWares.OdsWares do begin
  DTP_Amort_Date.DateTime := FieldByName('amort_date').AsDateTime;
  DTP_Inv_Date.DateTime   := FieldByName('inventar_date').AsDateTime;

  Edit_Wares_Name.Text    := FieldByName('wares_name').AsString;
  Edit_First_Price.Text   := FieldByName('First_Price').AsString;
  Edit_Balance_Price.Text := FieldByName('Remainder').AsString;
  Edit_All_Amort.Text     := FieldByName('All_Amort').AsString;
  Edit_Amort.Text         := FieldByName('Amort').AsString;

  Edit_Tax_First_Price.Text   := FieldByName('Tax_First_Price').AsString;
  Edit_Tax_Balance_Price.Text := FieldByName('Tax_Remainder').AsString;
  Edit_Tax_All_Amort.Text     := FieldByName('Tax_All_Amort').AsString;
  Edit_Tax_Amort.Text         := FieldByName('Tax_Amort').AsString;

   CBoxFXM.Text := FieldByName('FXM').AsString;
   Edit_Keeping_Sec.Text := fieldbyname('keeping_sec').AsString;
   Edit_Inv_No.Text  := fieldbyname('inventar_no').AsString;
   Edit_User.Text   :=  fieldbyname('user_name').AsString;
 end;
end;

procedure TFormUpdWares.Edit_First_PriceKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',',','.',#8]) then
   Key :=#0
end;

procedure TFormUpdWares.Edit_Balance_PriceChange(Sender: TObject);
begin
if (Edit_First_Price.Text<>'')
       and (Edit_Balance_Price.Text<>'')
          and (StrToFloat(Edit_Balance_Price.Text) -
                    StrToFloat(Edit_First_Price.Text)<=0) then
               Edit_All_Amort.Text:=
                     FloatToStr(StrToFloat(Edit_First_Price.Text)
                 -StrToFloat(Edit_Balance_Price.Text))
                else
         Edit_All_Amort.Text:='';
end;

procedure TFormUpdWares.BtnOkClick(Sender: TObject);
var
   v_wares_name        :string;
   v_wares_id          :real;
   v_inventar_date     :TDateTime;
   v_first_price       :real;
   v_remainder         :real;
   v_amort             :real;
   v_all_amort         :real;
   v_tax_first_price   :real;
   v_tax_remainder     :real;
   v_tax_amort         :real;
   v_tax_all_amort     :real;
   v_amort_date        :TDateTime;
   v_fxm               :real;
   v_keeping_sec       :string;
   v_inventar_no       :string;
   v_user_name         :string;

begin

if (Edit_Wares_Name.Text<>'') and (Edit_All_Amort.Text<>'')
   and (Edit_Amort.Text<>'') and (Edit_Balance_Price.Text<>'')
   and (Edit_First_Price.Text<>'') and (Edit_Tax_All_Amort.Text<>'')
   and (Edit_Tax_Amort.Text<>'') and (Edit_Tax_Balance_Price.Text<>'')
   and (Edit_Tax_First_Price.Text<>'')

    then
                                 begin


  IF (StrToFloat(Edit_Balance_Price.Text) - StrToFloat(Edit_First_Price.Text)<=0) then begin
  IF (StrToFloat(Edit_Tax_Balance_Price.Text) - StrToFloat(Edit_Tax_First_Price.Text)<=0) then begin
    v_wares_name:=Edit_Wares_Name.Text;
    v_user_name:=Edit_User.Text;
    v_inventar_date:=integer(trunc(DTP_Inv_Date.DateTime));
    v_wares_id:=DataModWares.ODSWares.fieldbyname('wares_id').AsFloat;
    v_first_price:=StrToFloat(Edit_First_Price.Text);
    v_remainder:=StrToFloat(Edit_Balance_Price.Text);
    v_amort:=StrToFloat(Edit_Amort.Text);
    v_all_amort:=StrToFloat(Edit_All_Amort.Text);

    v_tax_first_price:=StrToFloat(Edit_Tax_First_Price.Text);
    v_tax_remainder:=StrToFloat(Edit_Tax_Balance_Price.Text);
    v_tax_amort:=StrToFloat(Edit_Tax_Amort.Text);
    v_tax_all_amort:=StrToFloat(Edit_Tax_All_Amort.Text);


    v_amort_date:=integer(trunc(DTP_Amort_Date.Date));
    v_fxm:=StrToFloat(CBoxFXM.Text);
    v_keeping_sec:=Edit_Keeping_Sec.Text;
    v_inventar_no:=Edit_Inv_No.Text;

    DataModWares.SB_MAIN_RESOURCE.CallProcedure('Update_Wares',[
   v_wares_name        ,
   v_wares_id          ,
   v_inventar_date     ,
   v_first_price       ,
   v_remainder         ,
   v_amort             ,
   v_all_amort         ,
   v_tax_first_price   ,
   v_tax_remainder     ,
   v_tax_amort         ,
   v_tax_all_amort     ,
   v_amort_date        ,
   v_fxm               ,
   v_keeping_sec       ,
   v_inventar_no       ,
   v_user_name
    ]);

     close;
     DataModWares.ODSWares.Refresh;
    end
    else
         ShowMessage('¬ерэи цзр€ илин €вв€лин€ галыг д€й€р галыг д€й€рд€н < в€ йа = олмалыдыр!');


       end
       else
             ShowMessage('√алыг д€й€р илкин д€й€рд€н < в€ йа = олмалыдыр!');

   end
   else
   ShowMessage('ƒолдурулмамыш ханалар вар!');

end;

procedure TFormUpdWares.Edit_All_AmortChange(Sender: TObject);
begin
if (Edit_First_Price.Text<>'')
       and (Edit_Balance_Price.Text<>'')
          and (StrToFloat(Edit_All_Amort.Text) -
                    StrToFloat(Edit_First_Price.Text)<=0) then
               Edit_Balance_Price.Text:=
                     FloatToStr(StrToFloat(Edit_First_Price.Text)
                                                -StrToFloat(Edit_All_Amort.Text))
                                     else
                                  Edit_Balance_Price.Text:='';
end;

procedure TFormUpdWares.Edit_Wares_NameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key = '''') then
   Key :=#0
end;

end.
