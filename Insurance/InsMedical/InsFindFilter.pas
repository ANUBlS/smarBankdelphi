unit InsFindFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, PlgModalContainer, Oracle, OracleData, CurrencyEdit, Buttons,
  StdCtrls, ComCtrls, DBCtrls, Mask, ExtCtrls,variants;



type

  TCalcException = Exception;
  TOutputYear = Exception;

  TfmFind = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label25: TLabel;
    ckbFilter: TCheckBox;
    BitBtn5: TBitBtn;
    lbDBCBCustName: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    edBeginDate: TDateTimePicker;
    edEndDate: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure edInsuredOutputYearKeyPress(Sender: TObject; var Key: Char);
    procedure cbKLI_IDClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetConditions(OwnerObj : TCustomControl; out Fields : String):Variant;
    function GetFilterSring : String;
    function GetAllObjConditions(out Fields : String ):Variant;    
    procedure ClearControlElements(OwnerObj : TCustomControl);
  public

  end;

var
  fmFind: TfmFind;

implementation

      uses SBTranslateProc,sboapiDataModuleimpl, fmMedicalImpl;
{$R *.DFM}

procedure TfmFind.edInsuredOutputYearKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end
end;

procedure TfmFind.FormCreate(Sender: TObject);
begin

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfmFind.cbKLI_IDClick(Sender: TObject);
var key : Char;
begin
  edInsuredOutputYearKeyPress(Sender, Key)

end;

function GetFieldName(value : String):String;
begin
  if Length(Value) >= 3 then
  Result := Copy(value, 3, Length(value)-2);
end;



function TfmFind.GetConditions(OwnerObj : TCustomControl;  out Fields : String):Variant;
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

function VarArrConcat(V1, V2:Variant):Variant;//First Dimension!!!!
var
  V1HighBound, V2HighBound, i : Integer;
  Res : Variant;
begin

  if VarIsArray(V1)
  then Result := V1
  else
  begin
     Result := V2;
     exit;
  end;
  if (not VarIsArray(V2)) then  exit;
  Res := V1;

  V1HighBound := VarArrayHighBound(V1, VarArrayDimCount(V1));
  V2HighBound := VarArrayHighBound(V2, VarArrayDimCount(V2));

//  ShowMessage(IntToStr(V1HighBound)+' '+IntToStr(V2HighBound));
  VarArrayRedim(Res, V1HighBound + V2HighBound+1 );

  for i := 0 to V2HighBound do
    Res[V1HighBound+i+1] := V2[i];
  Result := Res;
end;

function TfmFind.GetAllObjConditions(out Fields : String ):Variant;
var tmp: String;
    Val: variant;
begin
{  Val := GetConditions(plMain, tmp);
  Fields := tmp;
  Val := VarArrConcat(Val, GetConditions(gbObject, tmp));
  if (tmp <> '') and (Fields <> '')  then  tmp := ';' + tmp;
  Fields := Fields + tmp;
  Val := VarArrConcat(Val, GetConditions(plDrAccessPeople, tmp));
  if (tmp <> '') and (Fields <> '')  then  tmp := ';' + tmp;
  Fields := Fields + tmp;
  Val := VarArrConcat(Val, GetConditions(plInsPeriod, tmp));
  if (tmp <> '') and (Fields <> '')  then  tmp := ';' + tmp;
  Fields := Fields + tmp;
  Result := Val; }
end;


procedure TfmFind.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfmFind.BitBtn3Click(Sender: TObject);
var
  Val: variant;
  Fields : String;
//    i : Integer;
begin
  Val := GetAllObjConditions(Fields);
//****Debuggg************
 { Label25.Caption := Fields;
  ckbFilter.Caption := '';
  for i := 0 to VarArrayHighBound(Val, VarArrayDimCount(Val)) do
    ckbFilter.Caption :=  ckbFilter.Caption +' '+ VarToStr(Val[i]);

 if not VarIsEmpty(Val) then
  with fmInsMotorKasco do begin
   if not ODSMotorKasco.SearchRecord( Fields, Val, [srFromCurrent, srWildCards]) then
      ShowMessage('Verilmish parametrlere uygun sigorta tapilmadi!')
  end; }

end;

procedure TfmFind.ClearControlElements(OwnerObj : TCustomControl);
var i : Integer;
begin

  with OwnerObj do
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

procedure TfmFind.BitBtn5Click(Sender: TObject);
begin
{  ClearControlElements(plMain);
  ClearControlElements(gbObject);
  ClearControlElements(plDrAccessPeople);
  ClearControlElements(plInsPeriod); }
end;

function TfmFind.GetFilterSring : String;
var Fields, str: String;
    i, p : integer;
    Val: variant;
    value : String;
begin
  Val := GetAllObjConditions(Fields);
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


procedure TfmFind.BitBtn4Click(Sender: TObject);
begin
{ with fmInsMotorKasco, ODSMotorKasco do begin
   Filter := GetFilterSring;
 //  ShowMessage(Filter);
   Filtered := (ckbFilter.Checked) and (Filter <> '');
 end;  }

end;

end.
