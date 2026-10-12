unit InsCustFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, ComCtrls, Mask, OracleData;

type
  TfmCustFind = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dtDateOfBirth: TDateTimePicker;
    cbOCC_ID: TDBLookupComboBox;
    cbEd_id: TDBLookupComboBox;
    cbSex: TComboBox;
    cbMS_ID: TComboBox;
    cbACT_ID: TDBLookupComboBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edName: TEdit;
    edSurname: TEdit;
    edFathername: TEdit;
    edPlaceOfBirth: TEdit;
    edAge: TEdit;
    edPasportno: TEdit;
    edContactPerson: TEdit;
    Label25: TLabel;
    Label8: TLabel;
    edAddress: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edMailingAddress: TEdit;
    edCity: TEdit;
    edState: TEdit;
    edIndex_: TEdit;
    Label5: TLabel;
    edHomePhone: TEdit;
    Label6: TLabel;
    edWorkPhone: TEdit;
    edMobilePhone: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    edFax: TEdit;
    edContactPersonPhone: TEdit;
    Label24: TLabel;
    Label1: TLabel;
    Label26: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ckbFilter: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure edAgeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function GetConditions(OwnerObj : TCustomControl; out Fields : String):Variant;
    function GetFilterSring : String;
  public
    { Public declarations }
  end;

var
  fmCustFind: TfmCustFind;

implementation

uses InsDataModule;

{$R *.DFM}

function GetFieldName(value : String):String;
begin
  if Length(Value) >= 3 then
  Result := Copy(value, 3, Length(value)-2);
end;



function TfmCustFind.GetConditions(OwnerObj : TCustomControl;  out Fields : String):Variant;
var i, l :integer;
    varVal : variant;


  procedure addVal(val : variant; VarType : Integer = varInteger);
  var idx : integer;
  begin

    if VarIsEmpty( varVal ) then begin
      varVal := VarArrayCreate([0, 0], varVariant);
      idx := 0;
    end
    else begin
      VarArrayRedim(varVal, VarArrayHighBound(varVal, VarArrayDimCount(varVal))+1);
      idx := VarArrayHighBound(varVal, VarArrayDimCount(varVal));
    end;
    varVal[idx] := VarAsType(val, VarType);
  end;

begin

  with OwnerObj do
  for i:=0 to ControlCount-1 do begin
    if controls[i] is TEdit then
      if (controls[i] as TEdit).Text <> '' then begin
         Fields := Fields+';'+GetFieldName((controls[i] as TEdit).Name);
         addVal((controls[i] as TEdit).Text, varString);
      end;
    if controls[i] is TComboBox then
      if (controls[i] as TComboBox).ItemIndex <> -1 then begin
         Fields := Fields+';'+GetFieldName((controls[i] as TComboBox).Name);
         addVal((controls[i] as TComboBox).ItemIndex);
      end;
    if controls[i] is TDBLookupComboBox then
      if not varIsNull((controls[i] as TDBLookupComboBox).KeyValue) then begin
         Fields := Fields+';'+GetFieldName((controls[i] as TDBLookupComboBox).Name);
         addVal((controls[i] as TDBLookupComboBox).keyValue);
      end;

    if controls[i] is TDateTimePicker then
      if Trunc((controls[i] as TDateTimePicker).DateTime) <> 0  then begin
         Fields := Fields+';'+GetFieldName((controls[i] as TDateTimePicker).Name);
         l := Trunc((controls[i] as TDateTimePicker).Date);
         addVal(l , varDate);
      end;
  end;
    Fields := lowercase(copy(Fields, 2, Length(Fields)-1));
    result := varVal;

end;



procedure TfmCustFind.BitBtn1Click(Sender: TObject);
var Fields: String;
    i : integer;
    Val: variant;
begin
  Val := GetConditions(GroupBox1, Fields);
  if not VarIsEmpty(Val) then
  with InsDataMod do begin
   if not ODSInsCustomers.SearchRecord( Fields, Val, [srFromCurrent, srWildCards]) then
      ShowMessage('Verilmish parametrlere uygun mwshteri tapilmadi!')
  end;
end;

procedure TfmCustFind.edAgeKeyPress(Sender: TObject; var Key: Char);

begin
{  try
  if (Length((Sender as TEdit).text) => 3) and StrToInt((Sender as TEdit).text) > 9 then
    Key := #0;}
end;

procedure TfmCustFind.BitBtn3Click(Sender: TObject);
var i : Integer;
begin

  with GroupBox1 do
  for i:=0 to ControlCount-1 do begin
    if controls[i] is TEdit then
         (controls[i] as TEdit).Text := '';
    if controls[i] is TComboBox then
         (controls[i] as TComboBox).ItemIndex := -1;
    if controls[i] is TDBLookupComboBox then
         (controls[i] as TDBLookupComboBox).KeyValue := null;
    if controls[i] is TDateTimePicker then
         (controls[i] as TDateTimePicker).DateTime := StrToDate('30/12/1899');

  end;

end;


function TfmCustFind.GetFilterSring : String;
var Fields, str: String;
    i, p : integer;
    Val: variant;
    value : String;
begin
  Val := GetConditions(GroupBox1, Fields);
  if not VarIsEmpty(Val) then
 // Label25.Caption := Fields;

  for i := 0 to VarArrayHighBound(Val, VarArrayDimCount(Val)) do begin
   case pos(';', Fields) of
     0 : p := Length(Fields)+1;
     else p := pos(';', Fields);
   end;

   if i > 0 then str := str + ' and ';

  // ShowMessage(IntToStr(VarType(Val[i])));
   case VarType(Val[i]) of
     varInteger : value := VarToStr(Val[i]);
     varOleStr  : Value := ''''+Val[i]+'''';
     varDate    : Value := ''''+DateToStr( Trunc(Val[i]))+'''';
   end;

   str := str + ' ( ' + copy(Fields, 1, p-1) +'='+ Value + ' ) ';
   Fields := Copy(Fields, p+1, length(Fields)-p);
  end;
   Result := str;
end;

procedure TfmCustFind.BitBtn4Click(Sender: TObject);
begin
 with InsDataMod, ODSInsCustomers do begin
   Filter := GetFilterSring;
 //  ShowMessage(Filter);
   Filtered := (ckbFilter.Checked) and (Filter <> '');
 end;
end;

end.
