unit UnitUpdBuyers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DBCtrls;

type
  TFormUpdBuyers = class(TForm)
    PanelMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EditByrName: TEdit;
    DTPBirthDate: TDateTimePicker;
    CBoxFamStatus: TComboBox;
    EditSerial: TEdit;
    CBoxSex: TComboBox;
    EditWorkPlace: TEdit;
    EditWage: TEdit;
    EditEmail: TEdit;
    EditPassport: TEdit;
    adrs_state: TEdit;
    buyerid: TEdit;
    Editmobil: TMaskEdit;
    EditPhone: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Editstate: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    BirthPlace: TDBLookupComboBox;
    birthstate: TEdit;
    EditAdress: TDBLookupComboBox;
    Editcity: TDBLookupComboBox;
    adrs_city: TEdit;
    DBEdit4: TDBEdit;
    procedure SelectSetting;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure birthplaceKeyPress(Sender: TObject; var Key: Char);
    procedure DTPBirthDateKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxSexKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxFamStatusKeyPress(Sender: TObject; var Key: Char);
    procedure EditAdressKeyPress(Sender: TObject; var Key: Char);
    procedure birthplaceChange(Sender: TObject);
    procedure EditByrNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure birthstateKeyPress(Sender: TObject; var Key: Char);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassportKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure adrs_cityKeyPress(Sender: TObject; var Key: Char);
    procedure adrs_stateKeyPress(Sender: TObject; var Key: Char);
    procedure EditWorkPlaceKeyPress(Sender: TObject; var Key: Char);
    procedure EditWageKeyPress(Sender: TObject; var Key: Char);
    procedure EditmobilKeyPress(Sender: TObject; var Key: Char);
    procedure EditPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure EditstateClick(Sender: TObject);
    procedure EditcityClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure EditstateKeyPress(Sender: TObject; var Key: Char);
    procedure EditcityKeyPress(Sender: TObject; var Key: Char);
  //  procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure addbirthplace;
   // procedure addadress;

  end;

var
  FormUpdBuyers: TFormUpdBuyers;

implementation
      uses UnitData,sboapiDataModuleImpl;
{$R *.DFM}


procedure TFormUpdBuyers.SelectSetting;
begin
with DataMod_Buyers.ODSBuyers do
begin
  EditByrName.Text:=FieldByName('BYR_NAME').AsString;
 BirthPlace.keyvalue :=FieldByName('BIRTHPLACE').AsString;
  DTPBirthDate.Date:=Int(FieldByName('BIRTHDATE').AsDateTime);
  birthstate.text :=FieldByName('birth_state').AsString;
  EditAdress.keyvalue :=FieldByName('ADRESS').AsString;
  EditEmail.Text:=FieldByName('EMAIL').AsString;
  EditPassport.Text:=FieldByName('passp_number').AsString;
  EditSerial.Text:=FieldByName('PASSPORT').AsString;
  Editmobil.Text:=FieldByName('phone_mob').AsString;
  Editphone.Text:=FieldByName('PHONE').AsString;
    EditWorkPlace.Text:=FieldByName('WORKPLACE').AsString;
  EditWage.Text:=FieldByName('WAGE').AsString;
  CBoxFamStatus.ItemIndex:=FieldByName('FAM_STATUS').AsInteger;
  CBoxSex.ItemIndex:=FieldByName('SEX').AsInteger;
  EditEmail.Text:=FieldByName('email').AsString;
   adrs_city.Text:=FieldByName('adrs_city').AsString;
  adrs_state.Text:=FieldByName('adrs_state').AsString;

 end;
end;



procedure TFormUpdBuyers.FormCreate(Sender: TObject);
begin
SelectSetting;
//addbirthplace;
// addadress;
end;

procedure TFormUpdBuyers.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ORD(Key) =VK_ESCAPE) then Close;
end;

procedure TFormUpdBuyers.BtnAddClick(Sender: TObject);
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
 p_birthplace:=BirthPlace.Text;
 p_adress:=EditAdress.Text;
 p_workplace:=EditWorkPlace.Text;
 p_wage:=StrToFloat(EditWage.Text);
 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=EditSerial.text;
 p_birthplace :=birthplace.text;
 p_birth_state :=birthstate.text;

  p_phone_mob :=Editmobil.Text;
  p_id :=buyerid.text;
   p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;

 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='киши' then
 p_sex:=1
 else
 p_sex:=2;


          with DataMod_Buyers do begin
               CC_GENERAL.CallIntegerFunction('upd_Buyers',[ p_id,
                                                       p_byr_name,
                                                       p_passp_number,
                                                       p_birthdate,
                                                       p_birthplace,
                                                       p_fam_status,
                                                       p_adress,
                                                       p_workplace,
                                                       p_wage,
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
                 ODSBuyers.Close;
                 ODSBuyers.Open;
                 close;
        end;
end
else
ShowMessage('Бош галан ханалар вар!');



end;


procedure TFormUpdBuyers.FormActivate(Sender: TObject);
begin

buyerid.Text :=DataMod_Buyers.ODSBuyers.Fieldbyname('id').asstring;


end;

procedure TFormUpdBuyers.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormUpdBuyers.birthplaceKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.DTPBirthDateKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.CBoxSexKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.CBoxFamStatusKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.EditAdressKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.birthplaceChange(Sender: TObject);
begin
with DataMod_Buyers.country do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from countries c where cntr_name= '+''''+birthplace.Text+'''';
   Open;
   dbedit3.Text :=FieldByName('id').AsString;
end;
         end;
procedure TFormUpdBuyers.EditByrNameKeyPress(Sender: TObject;
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
procedure TFormUpdBuyers.DBEdit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.birthstateKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.EditSerialKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.EditPassportKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.DBEdit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.adrs_cityKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.adrs_stateKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.EditWorkPlaceKeyPress(Sender: TObject;
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

procedure TFormUpdBuyers.EditWageKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.EditmobilKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.EditPhoneKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.EditEmailKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormUpdBuyers.Button1Click(Sender: TObject);
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
 p_birthplace:=BirthPlace.Text;
 p_adress:=EditAdress.Text;
 p_workplace:=EditWorkPlace.Text;
 p_wage:=StrToFloat(EditWage.Text);
 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=EditSerial.text;
 p_birthplace :=birthplace.text;
 p_birth_state :=birthstate.text;

  p_phone_mob :=Editmobil.Text;
  p_id :=buyerid.text;
   p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;

 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='киши' then
 p_sex:=1
 else
 p_sex:=2;


          with DataMod_Buyers do begin
               CC_GENERAL.CallIntegerFunction('upd_Buyers',[ p_id,
                                                       p_byr_name,
                                                       p_passp_number,
                                                       p_birthdate,
                                                       p_birthplace,
                                                       p_fam_status,
                                                       p_adress,
                                                       p_workplace,
                                                       p_wage,
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
                 ODSBuyers.Close;
                 ODSBuyers.Open;
                 close;
        end;
end
else
ShowMessage('Бош галан ханалар вар!');



end;



procedure TFormUpdBuyers.Button2Click(Sender: TObject);
begin
close;
end;

procedure TFormUpdBuyers.DBEdit3Change(Sender: TObject);
begin
with DataMod_Buyers.cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit3.Text+'''';
   Open;
  birthstate.text :=fieldbyname('city_name').asstring;
  end;

end;

procedure TFormUpdBuyers.EditstateClick(Sender: TObject);
begin

birthstate.text :=Editstate.keyvalue;
end;

procedure TFormUpdBuyers.EditcityClick(Sender: TObject);
begin
adrs_city.text :=Editcity.keyvalue ;
end;



procedure TFormUpdBuyers.DBEdit4Change(Sender: TObject);
begin
with DataMod_Buyers.ad_cities do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from cities c where country_id= '+''''+dbedit4.Text+'''';
   Open;
  adrs_city.text :=fieldbyname('city_name').asstring;
end;
   end;
procedure TFormUpdBuyers.EditstateKeyPress(Sender: TObject; var Key: Char);
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
      if not (Key in['0'..'9','.',#8]) then Key :=#0;

end;

procedure TFormUpdBuyers.EditcityKeyPress(Sender: TObject; var Key: Char);
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
      if not (Key in['0'..'9','.',#8]) then Key :=#0;

end;

end.
