unit CO_Upd_Cust_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ComCtrls, ExtCtrls;

type
  TCO_Upd_Cust = class(TForm)
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
    EditBirthState: TDBLookupComboBox;
    BirthPlace: TDBLookupComboBox;
    adrs_state: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    EditAdress: TDBLookupComboBox;
    passp_id: TEdit;
    chbox: TCheckBox;
    Edit2: TEdit;
    userid: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chboxClick(Sender: TObject);
  //  procedure edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BirthPlaceClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure EditByrNameKeyPress(Sender: TObject; var Key: Char);
    procedure BirthPlaceKeyPress(Sender: TObject; var Key: Char);
    procedure EditBirthStateKeyPress(Sender: TObject; var Key: Char);
    procedure DTPBirthDateKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxSexKeyPress(Sender: TObject; var Key: Char);
    procedure EditAdressKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_stateKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxFamStatusKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_cityKeyPress(Sender: TObject; var Key: Char);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassportKeyPress(Sender: TObject; var Key: Char);
    procedure EditmobilKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure EditPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_Upd_Cust: TCO_Upd_Cust;

implementation

uses CO_datamod_impl;

{$R *.DFM}

procedure TCO_Upd_Cust.FormActivate(Sender: TObject);
begin
with CO_Datamod.physical_customers do
begin
  EditByrName.Text:=FieldByName('BYR_NAME').AsString;
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
   adrs_city.Text:=FieldByName('adrs_state').AsString;
  adrs_state.keyvalue:=FieldByName('adrs_city').AsString;
  userid.text :=fieldbyname('id').asstring;
 end;
end;

procedure TCO_Upd_Cust.Button2Click(Sender: TObject);
begin
close;
end;

procedure TCO_Upd_Cust.Button1Click(Sender: TObject);

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
  p_birth_state :string;
  p_phone_mob : string;
  p_id: string;
begin
if Trim(EditByrName.Text)<>'' then
begin
 p_byr_name:=EditByrName.Text;
 p_passport:=StrtoInt(EditPassport.Text);
 p_birthdate:=Integer(Trunc(DTPBirthDate.DateTime));
 p_birthplace:=BirthPlace.Text;
 p_adress:=EditAdress.Text;

 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=EditSerial.text;
 p_birthplace :=birthplace.text;
 p_birth_state :=Editbirthstate.text;

  p_phone_mob :=Editmobil.Text;
  p_id :=userid.text;
   p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;

 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='ךטרט' then
 p_sex:=1
 else
 p_sex:=2;

          with CO_DataMod do begin
               Physical_Customer.CallProcedure('upd_customers',[
                                                       p_id,
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
                                                       p_phone_mob
                                                       ]
                                                       );
                 CO_DataMod.physical_customers.Close;
                 CO_DataMod.physical_customers.Open;
                 close;
        end;
end
else
ShowMessage('ֱמר דאכאם ץאםאכאנ גאנ!');



end;





procedure TCO_Upd_Cust.chboxClick(Sender: TObject);
begin
if chbox.checked=false then
//edit1.text :='ְחÿנבאיזאם';
edit2.text :='ְחÿנבאיזאם';
with CO_Datamod.ad_country do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from countries c where cntr_name<> '+''''+edit2.Text+'''';
   Open;
  editadress.keyvalue :=fieldbyname('cntr_name').asstring;

  end;
if chbox.checked=true then

with CO_Datamod.ad_country do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from countries c ';
   Open;
 // birthplace.keyvalue :=fieldbyname('cntr_name').asstring;
EditAdress.Keyvalue :='ְחÿנבאיזאם';
adrs_state.Keyvalue :='ֱאךû';
EditSerial.Text :='ְֵַ';
   end;

      end;



procedure TCO_Upd_Cust.Edit4Change(Sender: TObject);
begin
with CO_Datamod.ad_country do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from countries c where cntr_name<> '+''''+edit2.Text+'''';
   Open;
  editadress.keyvalue :=fieldbyname('cntr_name').asstring;

  end;

end;

procedure TCO_Upd_Cust.BirthPlaceClick(Sender: TObject);
begin
if BirthPlace.Keyvalue ='ְחÿנבאיזאם'
then
EditSerial.Text :='ְֵַ';
if BirthPlace.Keyvalue <> 'ְחÿנבאיזאם'
then
EditSerial.Text :=' ';
 end;

procedure TCO_Upd_Cust.DBEdit2Change(Sender: TObject);
begin
with CO_DataMod.ad_cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit2.Text+'''';
   Open;
  adrs_state.keyvalue :=fieldbyname('city_name').asstring;

end;

end;

procedure TCO_Upd_Cust.DBEdit1Change(Sender: TObject);
begin
with CO_Datamod.cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit1.Text+'''';
   Open;
  EditBirthState.keyvalue :=fieldbyname('city_name').asstring;


end;
  end;
procedure TCO_Upd_Cust.Edit2Change(Sender: TObject);
begin
with CO_Datamod.ad_country do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from countries c where cntr_name<> '+''''+edit2.Text+'''';
   Open;
  editadress.keyvalue :=fieldbyname('cntr_name').asstring;

  end;

end;

procedure TCO_Upd_Cust.EditByrNameKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.BirthPlaceKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditBirthStateKeyPress(Sender: TObject;
  var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.DTPBirthDateKeyPress(Sender: TObject;
  var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.CBoxSexKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditAdressKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.adrs_stateKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.CBoxFamStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.adrs_cityKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditSerialKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditPassportKeyPress(Sender: TObject;
  var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditmobilKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditEmailKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.EditPhoneKeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

procedure TCO_Upd_Cust.Button1KeyPress(Sender: TObject; var Key: Char);
begin
If ord(key)=vk_return then
if sender is TWinControl then
With Sender as TWinControl do
Case Tag of
1: SelectNext(Sender as Twincontrol,True,True);
end;
key :=#0;
end;

end.
