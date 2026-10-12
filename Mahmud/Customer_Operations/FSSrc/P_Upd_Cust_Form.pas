unit P_Upd_Cust_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons;

type
  TP_Upd_Cust = class(TForm)
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
    Label8: TLabel;
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
    chbox: TCheckBox;
    userid: TEdit;
    Label9: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    EditInn: TEdit;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditByrNameKeyPress(Sender: TObject; var Key: Char);
    procedure BirthPlaceKeyPress(Sender: TObject; var Key: Char);
    procedure EditBirthStateKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_stateKeyPress(Sender: TObject; var Key: Char);
    procedure DTPBirthDateKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_cityKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxFamStatusKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxSexKeyPress(Sender: TObject; var Key: Char);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassportKeyPress(Sender: TObject; var Key: Char);
    procedure EditmobilKeyPress(Sender: TObject; var Key: Char);
    procedure EditPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure EditAdressKeyPress(Sender: TObject; var Key: Char);
    procedure chboxClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure EditPassportChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure  SelectSettings;
  end;

var
  P_Upd_Cust: TP_Upd_Cust;

implementation

uses P_Datamod_Unit, CustInfoFormImpl, phy_cust_Unit;

{$R *.DFM}
 procedure TP_Upd_Cust.SelectSettings;
 begin
 with P_DataModuleFS.P_Customers do
begin
  EditByrName.Text:=FieldByName('CUST_NAME').AsString;
 BirthPlace.keyvalue :=FieldByName('BIRTHPLACE').AsString;
  DTPBirthDate.Date:=Int(FieldByName('BIRTHDATE').AsDateTime);
  EditBirthState.keyvalue :=FieldByName('birth_state').AsString;
  EditAdress.keyvalue :=FieldByName('ADRESS').AsString;
  EditEmail.Text:=FieldByName('EMAIL').AsString;
  EditPassport.Text:=FieldByName('passp_number').AsString;
  EditSerial.Text:=FieldByName('PASSPORT').AsString;
  Editmobil.Text:=FieldByName('phone_mob').AsString;
  Editphone.Text:=FieldByName('PHONE').AsString;
  CBoxFamStatus.ItemIndex:=FieldByName('FAM_STATUS').AsInteger;
  CBoxSex.ItemIndex:=FieldByName('SEX').AsInteger;
  EditEmail.Text:=FieldByName('email').AsString;
  EditInn.Text:=FieldByName('inn').AsString;
   adrs_city.Text:=FieldByName('ADRS_CITY').AsString;
  adrs_state.keyvalue:=FieldByName('ADRS_STATE').AsString;

end;
 end;

procedure TP_Upd_Cust.FormActivate(Sender: TObject);
begin
userid.Text :=P_DataModuleFS.P_Customers.Fieldbyname('id').asstring;
 
 end;


procedure TP_Upd_Cust.Button1Click(Sender: TObject);
var
  p_byr_name   :string;
  p_passport   :integer;
  p_birthdate  :TDateTime;
  p_birthplace :string;
  p_fam_status :integer;
  p_adress     :string;
  p_workplace  :string;
  p_wage       :real;
  p_phone      :string;
  p_email      :string;
  p_sex        :integer;
  p_passp_number : string;
  p_adrs_state : string;
  p_adrs_city: string;
  p_birth_state :string;
  p_phone_mob : string;
  p_id: string;
begin
if Trim(EditByrName.Text)<>'' then
begin
 p_byr_name:=EditByrName.Text;
 p_passport:=StrtoInt(EditPassport.Text);
 p_birthdate:=Integer(Trunc(DTPBirthDate.DateTime));
 p_birthplace:=BirthPlace.keyvalue;
 p_adress:=EditAdress.Keyvalue;
 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=EditSerial.text;
 p_birthplace :=birthplace.keyvalue;
 p_birth_state :=Editbirthstate.keyvalue;

  p_phone_mob :=Editmobil.Text;
  p_id :=userid.text;
   p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;
 {
 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='киши' then
 p_sex:=1
 else
 p_sex:=2;
  }
  p_fam_status := CBoxFamStatus.ItemIndex ;
  p_sex := CBoxSex.ItemIndex ;

          with P_DataModuleFS do begin
               Physical_Customers.CallIntegerFunction('upd_p_customes',[ p_id,
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
                                                       p_birth_state,
                                                       p_phone_mob,
                                                       editinn.text
                                                       ]
                                                       );
                                                       P_DataModuleFS.P_Customers.Close;
                                                       P_DataModuleFS.P_Customers.Open;

                  P_Customers.Locate('id',p_id,[]);
                 close;
        end;
end
else
ShowMessage('Бош галан ханалар вар!');



end;



procedure TP_Upd_Cust.FormCreate(Sender: TObject);
begin
SelectSettings;

end;

procedure TP_Upd_Cust.Button2Click(Sender: TObject);
begin
close;
end;

procedure TP_Upd_Cust.EditByrNameKeyPress(Sender: TObject; var Key: Char);
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
procedure TP_Upd_Cust.BirthPlaceKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
  end;
procedure TP_Upd_Cust.EditBirthStateKeyPress(Sender: TObject;
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
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
end;

procedure TP_Upd_Cust.adrs_stateKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
end;

procedure TP_Upd_Cust.DTPBirthDateKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.adrs_cityKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.CBoxFamStatusKeyPress(Sender: TObject;
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
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
end;

procedure TP_Upd_Cust.CBoxSexKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
    if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
end;

procedure TP_Upd_Cust.EditSerialKeyPress(Sender: TObject; var Key: Char);
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
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;

procedure TP_Upd_Cust.EditPassportKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.EditmobilKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.EditPhoneKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.EditEmailKeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.Button1KeyPress(Sender: TObject; var Key: Char);
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

procedure TP_Upd_Cust.EditAdressKeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
if not (key in ['0'..'9','.',#8]) then
    key :=#0;
if not (key in ['а'..'я','А'..'Я','A'..'Z','а'..'z']) then
    key :=#0;
end;
     end;
procedure TP_Upd_Cust.chboxClick(Sender: TObject);
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
adrs_state.keyvalue :='Бакы';   end;
if  (chbox.checked=true)
then
EditSerial.Text :='АЗЕ';
if  (chbox.checked=false)
then
EditSerial.Text :=' ';
end;



   
procedure TP_Upd_Cust.DBEdit1Change(Sender: TObject);
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
procedure TP_Upd_Cust.DBEdit2Change(Sender: TObject);
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


procedure TP_Upd_Cust.EditPassportChange(Sender: TObject);
begin
with P_DataModuleFS.pasp do begin
Close;
SQL.Clear;
SQL.Add('Select * From customers_physical Where passp_number='''+EditPassport.text+'''');
Open;
passp_id.text :=fieldbyname('id').asstring;
end;

end;

procedure TP_Upd_Cust.SpeedButton1Click(Sender: TObject);
begin
  with CustInfoForm do begin   
    Button1Click(Sender);
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
