unit InsCustomersProperties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, DBViewComboBox, DB;

type
  TfmCustomersProperties = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbSex: TComboBox;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    DBEdit17: TDBEdit;
    Label25: TLabel;
    DBInsuredType: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label10: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DTPDateOfBirthChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCustomersProperties: TfmCustomersProperties;

implementation

uses InsDataModule;

{$R *.DFM}

procedure TfmCustomersProperties.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TfmCustomersProperties.BitBtn1Click(Sender: TObject);
begin
  with InsDataMod do begin
    if ODSInsCustomers.State in [dsInsert, dsEdit] then
    // ODSInsCustomersDATEOFBIRTH.Value := DTPDateOfBirth.DateTime;
     ODSInsCustomersSEX.Value := cbSex.ItemIndex;
    // ODSInsCustomersMS_ID.Value := cbMillitaryStatus.ItemIndex;   
  end;
  ModalResult := mrOk
end;

procedure TfmCustomersProperties.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end;
end;

procedure TfmCustomersProperties.FormCreate(Sender: TObject);
begin
  with InsDataMod do
  if ODSInsCustomers.State in [dsInsert, dsEdit] then begin
   // DTPDateOfBirth.DateTime := ODSInsCustomersDATEOFBIRTH.Value;
    cbSex.ItemIndex := ODSInsCustomersSEX.Value;
   // cbMillitaryStatus.ItemIndex := ODSInsCustomersMS_ID.Value;
  end;

  with InsDataMod do
  if ODSInsCustomers.State = dsInsert then begin
    ODSInsCustomersCITY.Value := 'ֱאךû';
    ODSInsCustomersSTATE.Value := 'ְחÿנבאיזאם';
  end;

end;

procedure TfmCustomersProperties.DTPDateOfBirthChange(Sender: TObject);
begin
  with InsDataMod do
  if ODSInsCustomers.State in [dsInsert, dsEdit] then begin
     //ODSInsCustomersAGE.Value := Trunc((Now- DTPDateOfBirth.DateTime)/365);

  end;
end;

end.
