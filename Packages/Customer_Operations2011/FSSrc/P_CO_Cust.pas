unit P_CO_Cust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  DBCtrls, StdCtrls, Mask, ComCtrls, ExtCtrls, NLSLocalizer, Buttons;

type
  TP_CO_Cust_Form = class(TForm)
    PanelMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    EditByrName: TEdit;
    DTPBirthDate: TDateTimePicker;
    CBoxFamStatus: TComboBox;
    EditSerial: TEdit;
    CBoxSex: TComboBox;
    EditEmail: TEdit;
    EditPassport: TEdit;
    adrs_city: TEdit;
    EditPhone: TMaskEdit;
    Editmobil: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    DBEdit1: TDBEdit;
    adrs_state: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    EditAdress: TDBLookupComboBox;
    passp_id: TEdit;
    BirthPlace: TDBLookupComboBox;
    EditBirthState: TDBLookupComboBox;
    Label8: TLabel;
    chbox: TCheckBox;
    Edit1: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    Label9: TLabel;
    Label10: TLabel;
    EditInn: TEdit;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure BirthPlaceClick(Sender: TObject);
    procedure BirthPlaceKeyPress(Sender: TObject; var Key: Char);
    procedure EditBirthStateKeyPress(Sender: TObject; var Key: Char);
    procedure EditAdressKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_stateKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure EditPassportChange(Sender: TObject);
    procedure chboxClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditByrNameKeyPress(Sender: TObject; var Key: Char);
    procedure DTPBirthDateKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxSexKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxFamStatusKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_cityKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassportKeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure EditmobilKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure EditAdressClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P_CO_Cust_Form: TP_CO_Cust_Form;

implementation
  Uses P_Datamod_Unit, CustInfoFormImpl;
{$R *.DFM}

procedure TP_CO_Cust_Form.Button1Click(Sender: TObject);


var
  p_byr_name   :string;
  p_passport   :integer;
  p_birthdate  :TDateTime;
  p_birthplace :string;
  p_fam_status :integer;
  p_adress     :string;
  p_phone      :string;
  p_email      :string;
  p_sex        :integer;
  p_passp_number : string;
  p_adrs_state : string;
  p_adrs_city: string;
  p_birthstate :string;
  p_phone_mob : string;

begin
if Editpassport.Text='' then
ShowMessage('Паспорт №  дахил един!');
if passp_id.text <> '' then
showmessage('Паспорт № артыг гейдиййатдан кечмишдир!')
else
if Trim(EditByrName.Text)<>'' then
begin
 p_byr_name:=EditByrName.Text;
 p_passport:=StrtoInt(EditPassport.Text);
 p_birthdate:=Integer(Trunc(DTPBirthDate.DateTime));
 p_birthplace:=BirthPlace.Text;
 p_birthstate :=EditBirthState.text;
 p_adress:=EditAdress.Text;
 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=EditSerial.text;
 p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;
 p_birthstate :=EditBirthState.text;
  p_phone_mob :=Editmobil.Text;



 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='киши' then
 p_sex:=1
 else
 p_sex:=2;

      if Length(EditPassport.text)<>8 then
showmessage('Паспорт №-дя рягямлярин сайы 8-дян аз ола билмяз!') else

          with P_DataModuleFS do begin
               PHYSICAL_CUSTOMERS.CallIntegerFunction('add_p_customers',[
                                                       p_byr_name,
                                                       p_passp_number,
                                                       p_birthdate,
                                                       p_birthplace,
                                                       p_fam_status,
                                                       p_adress,
                                                       p_phone,
                                                       p_email,
                                                       p_sex,
                                                       p_passport,
                                                       p_adrs_state,
                                                       p_adrs_city,
                                                       p_birthstate,
                                                       p_phone_mob,
                                                       editinn.text
                                                       ]
                                                       );

                 EditByrName.Text :='';
                 EditPassport.text :='';
                 adrs_city.text :='';
                 Editmobil.Text :='';
                 EditPhone.Text :='';
                 EditEmail.Text :='';

          EditByrName.Setfocus;
          P_DataModuleFS.P_Customers.Close;
          P_DataModuleFS.P_Customers.Open;

        end;
end
else
ShowMessage('Бош галан ханалар вар!');



end;



procedure TP_CO_Cust_Form.BirthPlaceClick(Sender: TObject);
begin
if BirthPlace.Keyvalue ='Азярбайжан'
then
EditSerial.Text :='АЗЕ';
if BirthPlace.Keyvalue <> 'Азярбайжан'
then
EditSerial.Text :=' ';

end;

procedure TP_CO_Cust_Form.BirthPlaceKeyPress(Sender: TObject;
  var Key: Char);
begin

if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;


end;

procedure TP_CO_Cust_Form.EditBirthStateKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
    end;
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure TP_CO_Cust_Form.EditAdressKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
    end;
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;

end;

procedure TP_CO_Cust_Form.adrs_stateKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
    end;
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;

procedure TP_CO_Cust_Form.DBEdit1Change(Sender: TObject);
begin
with P_DataModuleFS.cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit1.Text+'''';
   Open;
  EditBirthState.keyvalue :=fieldbyname('city_name').asstring;


  end;
end;

procedure TP_CO_Cust_Form.DBEdit2Change(Sender: TObject);
begin
with P_DataModuleFS.ad_cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit2.Text+'''';
   Open;
  adrs_state.keyvalue :=fieldbyname('city_name').asstring;
  end;

end;

procedure TP_CO_Cust_Form.EditPassportChange(Sender: TObject);
begin
with P_DataModuleFS.pasp do begin
Close;
SQL.Clear;
SQL.Add('Select * From customers_physical Where passp_number='''+EditPassport.text+'''');
Open;
passp_id.text :=fieldbyname('id').asstring;
end;
  end;
procedure TP_CO_Cust_Form.chboxClick(Sender: TObject);
begin

if chbox.checked=false then
edit1.text :='Азярбайжан';
with  P_DataModuleFS.ad_country do begin
Close;
Sql.Clear;
Sql.Add('Select * from countries where cntr_name<>'''+edit1.text+''' ');
open;
EditAdress.KeyValue :=fieldbyname('cntr_name').asstring;   end;
if chbox.checked=true then

with  P_DataModuleFS.ad_country do begin
Close;
Sql.Clear;
Sql.Add('Select * from countries  ');
open;
EditAdress.KeyValue :=fieldbyname('cntr_name').asstring;
Editadress.keyvalue :='Азярбайжан';
adrs_state.keyvalue :='Бакы'; end;
if  (chbox.checked=true)
then
EditSerial.Text :='АЗЕ';
if  (chbox.checked=false)
then
EditSerial.Text :=' ';
end;



procedure TP_CO_Cust_Form.FormActivate(Sender: TObject);
begin
P_DataModuleFS.Sysdat.Open;
DTPBirthDate.date :=P_DataModuleFS.Sysdat.Fieldbyname('tek_dat').asdatetime;
P_DataModuleFS.Country.first;
BirthPlace.Keyvalue :='Азярбайжан';
EditAdress.Keyvalue :='Азярбайжан';
adrs_state.keyvalue :='Бакы';
EditBirthState.keyvalue :='Бакы';
EditSerial.Text :='АЗЕ';

end;

procedure TP_CO_Cust_Form.EditByrNameKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
     end;
procedure TP_CO_Cust_Form.DTPBirthDateKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
end;
procedure TP_CO_Cust_Form.CBoxSexKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;

procedure TP_CO_Cust_Form.CBoxFamStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;

procedure TP_CO_Cust_Form.adrs_cityKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;

end;

procedure TP_CO_Cust_Form.EditEmailKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;

end;

procedure TP_CO_Cust_Form.EditSerialKeyPress(Sender: TObject;
  var Key: Char);
begin
      key := UpCase(key);
      if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
 
end;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;

procedure TP_CO_Cust_Form.EditPassportKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_CO_Cust_Form.Button1KeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_CO_Cust_Form.EditmobilKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

end;
if not (key in ['0'..'9','.',#8]) then
    key :=#0;

    end;
procedure TP_CO_Cust_Form.Button2Click(Sender: TObject);
begin
close;
end;

procedure TP_CO_Cust_Form.EditAdressClick(Sender: TObject);
begin
if EditAdress.Keyvalue ='Азярбайжан'
then
EditSerial.Text :='АЗЕ';
if EditAdress.Keyvalue <> 'Азярбайжан'
then
EditSerial.Text :=' ';
end;

procedure TP_CO_Cust_Form.SpeedButton1Click(Sender: TObject);
begin       
  with CustInfoForm do begin
    Button1Click(Sender);
    P_DataModuleFS.P_Customers.Last;
    CustInfoData.ClearVariables;
    CustInfoData.Close;
    CustInfoData.SetVariable('CustomerID',P_DataModuleFS.P_Customers.Fields[0].AsVariant);
    CustInfoData.Open;
    CustInfoData.First;
    ODSCustImages.ClearVariables;
    ODSCustImages.Close;
    ODSCustImages.SetVariable('ID', CustInfoData.Fields[0].AsVariant);
    ODSCustImages.Open;
    ShowModal;
  end;
end;

end.
