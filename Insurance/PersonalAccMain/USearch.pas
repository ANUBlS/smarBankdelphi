unit USearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrls,variants;

type
  TfrmSearch = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    lbBeginDate: TLabel;
    lbEndDate: TLabel;
    lcbKli_id: TDBLookupComboBox;
    lcbProfitID: TDBLookupComboBox;
    edBegin_Date: TDateTimePicker;
    edEnd_Date: TDateTimePicker;
    EBanking_Details: TEdit;
    lbcAgentID: TDBLookupComboBox;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbFilter: TCheckBox;
    Label1: TLabel;
    Label3: TLabel;
    ETotalEmp_Number: TEdit;
    Label52: TLabel;
    Label37: TLabel;
    edNot_CoveredPeriod: TDateTimePicker;
    edNot_CoverePeriod1: TDateTimePicker;
    Bevel1: TBevel;
    EMaxWeeks: TEdit;
    Bevel2: TBevel;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TWideStringField;
    ODSBeneficiaryADDRESS: TWideStringField;
    ODSBeneficiaryPHONE: TWideStringField;
    ODSBeneficiaryBANKING_DETAILS: TWideStringField;
    BeneficiarySource: TDataSource;
    ODSAgent: TOracleDataSet;
    ODSAgentID: TFloatField;
    ODSAgentNAME: TWideStringField;
    AgentSource: TDataSource;
    ODSCustomersSource: TDataSource;
    ODSCustomers: TOracleDataSet;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TWideStringField;
    ODSCustomersADDRESS: TWideStringField;
    ODSCustomersMOBILEPHONE: TWideStringField;
    ODSCustomersFAX: TWideStringField;
    DsSysdat: TOracleDataSet;
    DsSysdatTEK_DAT: TDateTimeField;
    DsSysdatPRED_DAT: TDateTimeField;
    DsSysdatARC_DAY: TDateTimeField;
    DsSysdatCLOSE: TIntegerField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EMaxWeeksKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetFields(OwnerObj:TCustomControl;out Fields:string):variant;
    function GetFilterSring : String;
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses UMainPersonalAcc,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

{ TfrmSearch }

function TfrmSearch.GetFields(OwnerObj: TCustomControl;
  out Fields: string): variant;
var
    i:byte;
    l:integer;
    varVal : variant;
    procedure AddVal(val : variant; VarType : Integer = varInteger);
    var
        idx:integer;
    begin
        if VarIsEmpty( varVal ) then
        begin
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
      for i:=0 to ControlCount-1 do
      begin
          if controls[i] is TEdit then
          if (controls[i] as TEdit).Text <> '' then begin
             Fields:=Fields+';'+Copy((controls[i] as TEdit).Name,2,length((controls[i] as TEdit).Name)-1);
             addVal((controls[i] as TEdit).Text, varString);
          end;

          if controls[i] is TDBLookupComboBox then
          if not varIsNull((controls[i] as TDBLookupComboBox).KeyValue) then begin
             Fields:=Fields+';'+Copy((controls[i] as TDBLookupComboBox).Name,4,length((controls[i] as TDBLookupComboBox).Name));
             addVal((controls[i] as TDBLookupComboBox).KeyValue);
          end;

         { if controls[i] is TComboBox then
          if (controls[i] as TComboBox).ItemIndex <> -1 then begin
              Fields := Fields+';'+Copy((controls[i] as TComboBox).Name,3,length((controls[i] as TComboBox).Name));
              addVal((controls[i] as TComboBox).Text,varString);
          end; }

          if controls[i] is TDateTimePicker then
          if Trunc((controls[i] as TDateTimePicker).DateTime) <> 0  then begin
           //  ShowMessage(FloatToStr(Trunc((controls[i] as TDateTimePicker).DateTime) ));
             Fields:=Fields+';'+Copy((controls[i] as TDateTimePicker).Name,3,length((controls[i] as TDateTimePicker).Name));
             l := Trunc((controls[i] as TDateTimePicker).Date);
             addVal(l , varDate);
          end;
      end;
      Fields := lowercase(copy(Fields, 2, Length(Fields)-1));
     //  ShowMessage(Fields);
      result:=varVal;
end;

function TfrmSearch.GetFilterSring: String;
var
    Fields, str: String;
    i, p : integer;
    Val: variant;
    value : String;
begin
    Val := GetFields(GroupBox1, Fields);
    if not VarIsEmpty(Val) then

    for i := 0 to VarArrayHighBound(Val, VarArrayDimCount(Val)) do begin
    case pos(';', Fields) of
         0 : p := Length(Fields)+1;
     else p := pos(';', Fields);
   end;

   if i > 0 then str := str + ' and ';      
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

procedure TfrmSearch.BitBtn3Click(Sender: TObject);
var
    i:byte;
begin
  with GroupBox1 do
  for i:=0 to ControlCount-1 do
  begin
      if controls[i] is TEdit then
         (controls[i] as TEdit).Text := '';
      if controls[i] is TComboBox then
      begin
         (controls[i] as TComboBox).ItemIndex := -1;
         (controls[i] as TComboBox).Text:='';
      end;
      if controls[i] is TDBLookupComboBox then
         (controls[i] as TDBLookupComboBox).KeyValue := null;
      if controls[i] is TDateTimePicker then
         (controls[i] as TDateTimePicker).DateTime := StrToDate('30/12/1899');
  end;
end;

procedure TfrmSearch.BitBtn1Click(Sender: TObject);
var
    Fields: String;
    Val: variant;
    f:boolean;
begin
    f:=false;
    Val := GetFields(GroupBox1, Fields);
    if not VarIsEmpty(Val) then
    with MainPersonalAcc do
    begin

    end;

end;

procedure TfrmSearch.EMaxWeeksKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
      end;
end;

procedure TfrmSearch.FormCreate(Sender: TObject);
begin

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfrmSearch.FormShow(Sender: TObject);
begin
frmSearch.edBegin_Date.DateTime:=frmSearch.DsSysdat.FieldByName('tek_dat').AsDateTime;
frmSearch.edEnd_Date.DateTime:=frmSearch.DsSysdat.FieldByName('tek_dat').AsDateTime;
frmSearch.edNot_CoveredPeriod.DateTime:=frmSearch.DsSysdat.FieldByName('tek_dat').AsDateTime;
frmSearch.edNot_CoverePeriod1.DateTime:=frmSearch.DsSysdat.FieldByName('tek_dat').AsDateTime;
end;

end.
