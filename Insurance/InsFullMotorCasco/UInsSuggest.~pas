unit UInsSuggest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls,Quickrpt,QRCtrls,HintBox,DB,
  INSWordExporter, ComCtrls;

type
  TFormSuggestion = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    INSWordExporter1: TINSWordExporter;
    lbBookmarks: TListBox;
    DBLookupComboBoxRisk: TDBLookupComboBox;
    memRisk: TMemo;
    btRisksAdd: TBitBtn;
    cbRisks: TCheckBox;
    DBLookupComboBoxFranshiz: TDBLookupComboBox;
    memFrashize: TMemo;
    cbFranshiz: TCheckBox;
    DBLookupComboBoxCondition: TDBLookupComboBox;
    cbConditions: TCheckBox;
    memConditions: TMemo;
    DTPContractDate: TDateTimePicker;
    btPrint: TBitBtn;
    btApply: TBitBtn;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Function SaveData():boolean;
    Procedure LoadData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure btRisksAddClick(Sender: TObject);
    procedure DBLookupComboBoxRiskClick(Sender: TObject);
    procedure DBLookupComboBoxFranshizClick(Sender: TObject);
    procedure memConditionsChange(Sender: TObject);
    procedure DBLookupComboBoxConditionClick(Sender: TObject);
    procedure DTPContractDateChange(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSuggestion: TFormSuggestion;

implementation

uses DataUnitFullMotor, USReport, URiskTypes;

{$R *.DFM}

{ TFormSuggestion }


function TFormSuggestion.SaveData:Boolean;
begin
         Result := False;
  //----------Save new risk----------------
  if   cbRisks.State = cbChecked then
  with DataModuleFullMotor.Risks do begin
    Insert;
    FieldByName('name').asString := memRisk.Text;
    Post;
    RefreshRecord;
  end;

  //----------Save new franshiz----------------
  if   cbFranshiz.State = cbChecked then
  with DataModuleFullMotor.Franshiz do begin
    Insert;
    FieldByName('name').asString := memFrashize.Text;
    Post;
    RefreshRecord;
  end;

  //----------Save new conditions----------------
  if   cbConditions.State = cbChecked then
  with DataModuleFullMotor.Conditions do begin
    Insert;
    FieldByName('name').asString := memConditions.Text;
    Post;
    RefreshRecord;
  end;

  with DataModuleFullMotor,DataModuleFullMotor.Suggestion do begin
    FieldByName('mk_id').AsFloat := Ins_MotorFullid.Value;
    FieldByName('rsk_id').AsFloat := Risks.FieldByName('id').asFloat;
    FieldByName('frz_id').AsFloat := Franshiz.FieldByName('id').asFloat;
    FieldByName('cndt_id').AsFloat := Conditions.FieldByName('id').asFloat;
    FieldByName('enddate').AsDateTime := DTPContractDate.DateTime;
    {if ckMonth.Checked then
     FieldByName('ITSPEC').asString := 'M';
    if ckYear.Checked then
     FieldByName('ITSPEC').asString := 'Y'; }
    Post;
    RefreshRecord();
    ODSContracts.Edit;
    ODSContracts.FieldByName('sugg_id').AsFloat := FieldByName('id').asFloat;
    ODSContracts.FieldByName('ins_date').AsDateTime := DTPContractDate.DateTime;
    //SuggestionInsuranceammount.Value:=ODSContractsAmmount.Value;
    ODSContracts.Post;
    result := True;
  end;

end;

procedure TFormSuggestion.LoadData;
begin
  with DataModuleFullMotor.Suggestion do
  begin
    //memRisk.Text := FieldByName('INSURANCERISKS').AsString ;
    //memFrashize.Text := FieldByName('FRANSHIZ').AsString ;
   // memConditions.Text := FieldByName('CONDITIONS').AsString ;
    DTPContractDate.DateTime:=  FieldByName('enddate').AsDateTime ;
    {if FieldByName('ITSPEC').AsString = 'M'
    then ckMonth.Checked := true;
    if FieldByName('ITSPEC').AsString = 'Y'
    then ckYear.Checked := true; }
  end;
end;

procedure TFormSuggestion.BitBtn1Click(Sender: TObject);
begin
      if SaveData then
      ModalResult := mrOk;
      {with DataModuleFullMotor.Suggestion do
      begin
           if State in [dsInsert, dsEdit] then  Post;
           RefreshRecord;
      end;   }
      //ModalResult := mrOk;
      DataModuleFullMotor.Suggestion.RefreshRecord;

end;

procedure TFormSuggestion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSuggestion.BitBtn2Click(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TFormSuggestion.DBEdit4KeyPress(Sender: TObject; var Key: Char);
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

procedure TFormSuggestion.FormCreate(Sender: TObject);
begin

    with DataModuleFullMotor do
    begin
      ODSContracts.Close;
      ODSContracts.SetVariable('blankid', Suggestionmk_id.value);
      ODSContracts.Open;
      if Suggestion.State = dsEdit then
      begin
           Caption := Caption + '  (redakte)';
           btPrint.Enabled:=true;
           btApply.Enabled:=true;
      end
      else Caption := Caption + '  (elave etmek)';
      Risks.Open;
      Conditions.Open;
      Franshiz.Open;
    end;
    LoadData();
end;

procedure TFormSuggestion.btPrintClick(Sender: TObject);
const
    months : array [1..12] of String = ('Йанвар', 'Феврал', 'Март', 'Апрел', 'Май', 'Ийун',
                                         'Ийул', 'Август', 'Сентйабр', 'Октйабр', 'Нойабр', 'Декабр');
var
   day, month, year : word;
begin

     with DataModuleFullMotor do
          Ins_Rep.Locate('ID',Ins_MotorFullID.Value,[]);
     with INSWordExporter1 do
     begin
          FileName:=ExtractFilePath(Application.ExeName)+ '\MotorFullSuggest.doc';
          with DataModuleFullMotor do
          begin
          Open(False);
              DecodeDate(SuggestionENDDATE.AsDateTime, year, month, day);
              SetBookmark('Insured',CustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('IAddress',CustomersADDRESS.value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('RAddress',SuggestionRISKADDRESS.value, false, false, False, false, 8, 'Arial AzLat', False);
             //SetBookmark('IObject',Suggestion.value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('IValue',CurrToStr(SuggestionInsuranceSum.value), false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('ISum',CurrToStr(ODSContractsAmmount.value), false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('EndDate', IntToStr(day)+'    '+months[month]+'    '+IntToStr(year), False, False, False,
                 False, 8, 'Arial AzLat', False);
              SetBookmark('IPeriod', DateToStr(ODSContractsBegin_Date.Value)+' - '+DateToStr(ODSContractsEnd_Date.Value), False, False, False, False, 10, 'Arial AzLat', False);
              //SetBookmark('ETime', str2, False, False, False, False, 10, 'Arial AzLat', False);
              SetBookmark('IRisks',Risks.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('IFrans',Franshiz.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('ICond',Conditions.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
              SetBookmark('Insured2',CustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
           end;
           Show;
     end;

end;

procedure TFormSuggestion.btRisksAddClick(Sender: TObject);
begin
  with DataModuleFullMotor do
  begin
     Risktypes.Open;
     with TfmRiskTypes.Create(Self) do
     ShowModal;
     if memRisk.Text <> '' then
     cbRisks.State := cbChecked;
     Risktypes.Close;
  end;
end;

procedure TFormSuggestion.DBLookupComboBoxRiskClick(Sender: TObject);
begin
    with DataModuleFullMotor.Risks do
    memRisk.Text := FieldByName('name').asString;
end;

procedure TFormSuggestion.DBLookupComboBoxFranshizClick(Sender: TObject);
begin
    with DataModulefullMotor.Franshiz do
    memFrashize.Text := FieldByName('name').asString;
end;

procedure TFormSuggestion.memConditionsChange(Sender: TObject);
begin
      DTPContractDateChange(Sender);
end;

procedure TFormSuggestion.DBLookupComboBoxConditionClick(Sender: TObject);
begin
     with DataModulefullMotor.Conditions do
     memConditions.Text := FieldByName('name').asString;
end;

procedure TFormSuggestion.DTPContractDateChange(Sender: TObject);
var
    key:char;
begin
    DBEdit4KeyPress(Sender, Key);
end;

procedure TFormSuggestion.btApplyClick(Sender: TObject);
begin
    if SaveData() then
    begin
        btPrint.Enabled := True;
        btApply.Enabled := False;
        DataModuleFullMotor.Suggestion.Edit;
    end;
end;

procedure TFormSuggestion.DBEdit4Change(Sender: TObject);
begin
     btApply.Enabled:=true;
end;

end.
