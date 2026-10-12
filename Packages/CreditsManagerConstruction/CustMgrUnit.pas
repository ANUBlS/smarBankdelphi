unit CustMgrUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TCustMgrForm = class(TForm)
    Countries: TOracleDataSet;
    cc_general: TOraclePackage;
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
    birthstate: TEdit;
    DTPBirthDate: TDateTimePicker;
    CBoxFamStatus: TComboBox;
    EditSerial: TEdit;
    CBoxSex: TComboBox;
    EditAdress: TEdit;
    EditWorkPlace: TEdit;
    EditWage: TEdit;
    EditEmail: TEdit;
    BtnAdd: TBitBtn;
    EditPassport: TEdit;
    adrs_city: TEdit;
    adrs_state: TEdit;
    CountriesID: TFloatField;
    CountriesCNTR_NAME: TStringField;
    DBLCBState: TDBLookupComboboxEh;
    CountriesDatSrc: TDataSource;
    DataSource3: TDataSource;
    BitBtn1: TBitBtn;
    Editmobil: TMaskEdit;
    EditPhone: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure EditPassportKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBStateKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustMgrForm: TCustMgrForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl,ContractAddEditImpl;

procedure TCustMgrForm.FormCreate(Sender: TObject);
begin
   Countries.Open;
end;

procedure TCustMgrForm.FormDestroy(Sender: TObject);
begin
Countries.CloseAll;
end;

procedure TCustMgrForm.BtnAddClick(Sender: TObject);
var
  p_byr_name   :string;
  p_passport   :string;
  p_birthdate  :TDateTime;
  p_birthplace :string;
  p_fam_status :integer;
  BayerID   : integer;
  p_adress     :string;
  p_workplace  :string;
  p_wage       :real;
  p_phone      :string;
  p_email      :string;
  p_sex        :integer;
  p_passp_number : integer;
  p_adrs_state : string;
  p_adrs_city: string;
  p_birth_state :string;
  p_phone_mob : string;
begin
if Trim(EditByrName.Text)<>'' then
begin
 p_byr_name:=EditByrName.Text;
 p_passport:=EditSerial.Text;
 p_birthdate:=Integer(Trunc(DTPBirthDate.DateTime));
 p_birthplace:=DBLCBState.Text;
 p_adress:=EditAdress.Text;
 p_workplace:=EditWorkPlace.Text;
 p_wage:=StrToFloat(EditWage.Text);
 p_phone:=EditPhone.Text;
 p_email:=EditEmail.Text;
 p_passp_number :=StrtoInt(EditPassport.text);
 p_birthplace :=DBLCBState.text;
 p_birth_state :=birthstate.text;

  p_phone_mob :=Editmobil.Text;
   p_adrs_state :=adrs_state.text;
 p_adrs_city :=adrs_city.text;

 if CBoxFamStatus.Text='evli' then
 p_fam_status:=1
 else
 p_fam_status:=2;

 if CBoxSex.Text='qadın' then
 p_sex:=1
 else
 p_sex:=2;


          with cc_general do begin
               BayerID := CC_GENERAL.CallIntegerFunction('Add_Buyers',[
                                                       p_byr_name,
                                                       p_passport,
                                                       p_birthdate,
                                                       p_birthplace,
                                                       p_fam_status,
                                                       p_adress,
                                                       p_workplace,
                                                       p_wage,
                                                       p_phone,    
                                                       p_email,
                                                       p_sex,
                                                       p_passp_number,
                                                       p_adrs_state,
                                                       p_adrs_city,
                                                       p_birth_state,
                                                       p_phone_mob
                                                       ]
                                                       );
        end;

   with AddEditContractForm do
   begin
      DBLookupComboboxEh6.ListSource.DataSet.Refresh;
      DBLookupComboboxEh6.DataSource.DataSet.FieldByName('ClientID').AsInteger := BayerID;
   end;
    CustMgrForm.Close;
end;

end;

procedure TCustMgrForm.EditPassportKeyPress(Sender: TObject;
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
if not (Key in['0'..'9','.',#8]) then Key :=#0;
end;

procedure TCustMgrForm.DBLCBStateKeyPress(Sender: TObject; var Key: Char);
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

procedure TCustMgrForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := True;
end;

procedure TCustMgrForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close
end;

procedure TCustMgrForm.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TCustMgrForm.EditSerialKeyPress(Sender: TObject; var Key: Char);
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
  key := UpCase(key);

end;

end.
