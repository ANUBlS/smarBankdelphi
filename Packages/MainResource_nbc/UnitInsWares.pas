unit UnitInsWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, ComCtrls, Buttons,Oracle;

type
  TFormInsert = class(TForm)
    NLSLocalizer: TNLSLocalizer;
    PanelMain: TPanel;
    GBoxPublic: TGroupBox;
    Edit_Wares_Name: TEdit;
    GroupBoxFXM: TGroupBox;
    GroupBoxSector: TGroupBox;
    CBoxFXM: TComboBox;
    Edit_Keeping_Sec: TEdit;
    GroupBoxInvDate: TGroupBox;
    GroupBoxAmortDate: TGroupBox;
    DTP_Inv_Date: TDateTimePicker;
    DTP_Amort_Date: TDateTimePicker;
    GroupBoxNB: TGroupBox;
    GroupBoxNL: TGroupBox;
    Edit_First_Price: TEdit;
    Edit_Balance_Price: TEdit;
    Edit_All_Amort: TEdit;
    Edit_Amort: TEdit;
    Edit_Tax_First_Price: TEdit;
    Edit_Tax_Balance_Price: TEdit;
    Edit_Tax_All_Amort: TEdit;
    Edit_Tax_Amort: TEdit;
    BtnOk: TBitBtn;
    Label_First_Price: TLabel;
    Label_Balance_Price: TLabel;
    Label_All_Amort: TLabel;
    Label_Amort: TLabel;
    Label_Tax_First_Price: TLabel;
    Label_Tax_Balance_Price: TLabel;
    LabelTax_All_Amort: TLabel;
    LabelTax_Amort: TLabel;
    GroupBoxAction: TGroupBox;
    MemoAction: TMemo;
    Image: TImage;
    GroupBoxInv_No: TGroupBox;
    Edit_Inv_No: TEdit;
    GroupBox1: TGroupBox;
    Edit_User: TEdit;
    procedure BtnOkClick(Sender: TObject);
    procedure Edit_First_PriceKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Balance_PriceChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit_Tax_Balance_PriceChange(Sender: TObject);
    procedure Edit_Wares_NameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInsert: TFormInsert;

implementation
            uses UnitData,MainResourceImpl, UnitShowTrans;
{$R *.DFM}

procedure TFormInsert.BtnOkClick(Sender: TObject);
var
   v_wares_name        :string;
   v_inventar_date     :TDateTime;
   v_groups_id         :real;
   v_first_price       :real;
   v_remainder         :real;
   v_amort             :real;
   v_all_amort         :real;
   v_percent           :real;
   v_tax_first_price   :real;
   v_tax_remainder     :real;
   v_tax_amort         :real;
   v_tax_all_amort     :real;
   v_tax_percent       :real;
   v_amort_date        :TDateTime;
   v_fxm               :real;
   v_keeping_sec       :string;
   v_inventar_no       :string;

   v_debt,v_cred      :integer;
   v_trans_name       :string;
   v_user_name        :string;
begin
New_Or_Calc_Wares_Trans:=2;

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
    v_groups_id:=DataModWares.ODSGroups.fieldbyname('id').AsFloat;
    v_first_price:=StrToFloat(Edit_First_Price.Text);
    v_remainder:=StrToFloat(Edit_Balance_Price.Text);
    v_amort:=StrToFloat(Edit_Amort.Text);;
    v_all_amort:=StrToFloat(Edit_All_Amort.Text);
    v_percent:=DataModWares.ODSGroups.fieldbyname('amort').AsFloat;

    v_tax_first_price:=StrToFloat(Edit_Tax_First_Price.Text);
    v_tax_remainder:=StrToFloat(Edit_Tax_Balance_Price.Text);
    v_tax_amort:=StrToFloat(Edit_Tax_Amort.Text);
    v_tax_all_amort:=StrToFloat(Edit_Tax_All_Amort.Text);
    v_tax_percent:=DataModWares.ODSGroups.fieldbyname('taxamort').AsFloat;

    v_amort_date:=integer(trunc(DTP_Amort_Date.Date));
    v_fxm:=StrToFloat(CBoxFXM.Text);
    v_keeping_sec:=Edit_Keeping_Sec.Text;
    v_inventar_no:=Edit_Inv_No.Text;

    DataModWares.SB_MAIN_RESOURCE.CallProcedure('add_wares',[
   v_wares_name        ,
   v_inventar_date     ,
   v_groups_id         ,
   v_first_price       ,
   v_remainder         ,
   v_amort             ,
   v_all_amort         ,
   v_percent           ,
   v_tax_first_price   ,
   v_tax_remainder     ,
   v_tax_amort         ,
   v_tax_all_amort     ,
   v_tax_percent       ,
   v_amort_date        ,
   v_fxm               ,
   v_keeping_sec       ,
   v_inventar_no       ,
   v_user_name         
    ]);

     close;
     DataModWares.ODSWares.Refresh;
  if MessageDlg('…ени дахил едилмиш в€саитин юд€нишини  '+#13+'    эцнцн с€н€дл€рин€ эюнд€рим?',mtConfirmation,mbYesNoCancel,0)=mrYes then
           begin
              with DataModWares.SB_MAIN_RESOURCE do
               begin
                CallProcedure('new_wares_trans_acc',[v_groups_id,parInteger,parInteger]);
                v_debt:=GetParameter(1);
                v_cred:=GetParameter(2);
                            v_trans_name:=v_wares_name+' йени в€саитинин алынмасы';
                CallProcedure('new_wares_transaction',
                                [v_groups_id  ,
                                v_first_price ,
                                v_cred        ,
                                v_debt        ,
                                v_trans_name  ]
                                );
               end;
                                 FormShowTrans:=TFormShowTrans.Create(self);
                                 FormShowTrans.ShowModal;

           end;
    end
    else
         ShowMessage('¬ерэи цзр€ илин €вв€лин€ галыг д€й€р галыг д€й€рд€н < в€ йа = олмалыдыр!');


       end
       else
             ShowMessage('√алыг д€й€р илкин д€й€рд€н < в€ йа = олмалыдыр!');

   end
   else
   ShowMessage('ƒолдурулмамыш ханалар вар!');

Edit_Wares_Name.Text:='';
Edit_First_Price.Text:='';
Edit_Balance_Price.Text:='';
Edit_All_Amort.Text:='';
Edit_Amort.Text:='';

Edit_Tax_First_Price.Text:='';
Edit_Tax_Balance_Price.Text:='';
Edit_Tax_All_Amort.Text:='';
Edit_Tax_Amort.Text:='';

CBoxFXM.Text:='';
Edit_Keeping_Sec.Text:='';
end;

procedure TFormInsert.Edit_First_PriceKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',',','.',#8]) then
   Key :=#0
end;

procedure TFormInsert.Edit_Balance_PriceChange(Sender: TObject);
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

procedure TFormInsert.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ORD(Key) =VK_ESCAPE) then Close;

end;

procedure TFormInsert.FormActivate(Sender: TObject);
begin
DTP_Amort_Date.Date:=DataModWares.SB_MAIN_RESOURCE.CallDateFunction('get_date',[]);;
DTP_Inv_Date.Date:=DataModWares.SB_MAIN_RESOURCE.CallDateFunction('get_date',[]);;
end;

procedure TFormInsert.Edit_Tax_Balance_PriceChange(Sender: TObject);
begin
if (Edit_First_Price.Text<>'')
       and (Edit_Tax_Balance_Price.Text<>'')
          then
               Edit_Tax_All_Amort.Text:=
                     FloatToStr(StrToFloat(Edit_First_Price.Text)
                                                -StrToFloat(Edit_Tax_Balance_Price.Text))
                                     else
                                  Edit_Tax_All_Amort.Text:='';
end;

procedure TFormInsert.Edit_Wares_NameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key = '''') then
   Key :=#0
end;

end.
