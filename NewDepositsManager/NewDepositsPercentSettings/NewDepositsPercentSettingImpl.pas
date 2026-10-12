unit NewDepositsPercentSettingImpl;

interface
    // depcapitalperiods
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Db,
  OracleData,  XFSCtrls, ComCtrls, XDBGrids, Oracle;

type
  TNewPercentSetting = class(TForm)
    depcapitalperiods: TOracleDataSet;
    depcapitalperiodsID: TFloatField;
    depcapitalperiodsPERIOD: TFloatField;
    depcapitalperiodsDESCRIPTION: TWideStringField;
    depcapitalperiodsPERIODID: TFloatField;
    depcapitalperiodsTYPE: TWideStringField;
    Depositdatsettings: TOracleDataSet;
    DepositdatsettingsID: TFloatField;
    DepositdatsettingsPERCENT: TFloatField;
    DepositdatsettingsFIRSTDATEINT: TFloatField;
    DepositdatsettingsLASTDATEINT: TFloatField;
    DepositdatsettingsVALCOD: TFloatField;
    DepositdatsettingsDEPID: TFloatField;
    DepositdatsettingsPERIODID: TFloatField;
    DepositdatsettingsCAPITALID: TFloatField;
    DepositdatsettingsDEPSETID: TFloatField;
    DepositPerSetting: TOracleDataSet;
    DepositPerSettingID: TFloatField;
    DepositPerSettingCURRENCYID: TFloatField;
    DepositPerSettingINTERESTRATE: TFloatField;
    DepositPerSettingDUEINTRATE: TFloatField;
    DepositPerSettingFIRSTAMOUNT: TFloatField;
    DepositPerSettingLASTAMOUNT: TFloatField;
    DepositPerSettingDEPID: TFloatField;
    DepositPerSettingPERIODID: TFloatField;
    DepositPerSettingCAPITALID: TFloatField;
    DepositPerSettingBEFOINTRATE: TFloatField;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TWideStringField;
    depperiods: TOracleDataSet;
    depperiodsID: TFloatField;
    depperiodsPERIOD: TFloatField;
    depperiodsDESCRIPTION: TWideStringField;
    depperiodsDEPID: TFloatField;
    XFGroupBox1: TXFGroupBox;
    XDBGrid1: TXDBGrid;
    XFGroupBox4: TXFGroupBox;
    XDBGrid4: TXDBGrid;
    XFGroupBox5: TXFGroupBox;
    XDBGrid5: TXDBGrid;
    XFGroupBox6: TXFGroupBox;
    XDBGrid6: TXDBGrid;
    XFPanel1: TXFPanel;
    XFGroupBox2: TXFGroupBox;
    XDBGrid2: TXDBGrid;
    XFGroupBox3: TXFGroupBox;
    XDBGrid3: TXDBGrid;
    XFStatusBar1: TXFStatusBar;
    Valutes: TOracleDataSet;
    ValutesVAL_NAME: TWideStringField;
    ValutesVALU_NAME: TWideStringField;
    ValutesVALUTE: TIntegerField;
    DepositTypesDatSrc: TDataSource;
    depperiodsds: TDataSource;
    depcapitalperiodsds: TDataSource;
    ValutesDatSrc: TDataSource;
    PerSettingDatSrc: TDataSource;
    DatsettingsDatSrc: TDataSource;
    Edit1: TEdit;
    DepositPerSettingPERCENTAGE_GROWTH_STEP: TFloatField;
    DepositPerSettingFIRST_DAY: TFloatField;
    DepositPerSettingLAST_DAY: TFloatField;
    DSRsbcm_amount_setting: TDataSource;
    XFGroupBox8: TXFGroupBox;
    XDBGrid7: TXDBGrid;
    XFGroupBox9: TXFGroupBox;
    DSsbcm_amount_setting: TOracleDataSet;
    DSsbcm_amount_settingID: TFloatField;
    DSsbcm_amount_settingFIRSTAMOUNT: TFloatField;
    DSsbcm_amount_settingLASTAMOUNT: TFloatField;
    DSsbcm_amount_settingPERIODID: TFloatField;
    DepositPerSettingAMOUNT_SETTING_ID: TFloatField;
    DSsbcm_amount_settingCURRENCYID: TFloatField;
    DepositdatsettingsAMOUNT_SETTING_ID: TFloatField;
    DepositPerSettingAMOUNT_GROWTH_FIRST: TFloatField;
    DepositPerSettingAMOUNT_GROWTH_LAST: TFloatField;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    DepositPerSettingWRITE_MEMORY: TFloatField;
    DepositPerSettingCONFIRMATION: TFloatField;
    dm_percent_converting: TOraclePackage;
    DSsysdat: TOracleDataSet;
    DSsysdatTEK_DAT: TDateTimeField;
    DSsysdatPRED_DAT: TDateTimeField;
    DSsysdatARC_DAY: TDateTimeField;
    DSsysdatCLOSE: TIntegerField;
    DepositPerSettingHDATE: TDateTimeField;
    XFPanel3: TXFPanel;
    XFCheckBox1: TXFCheckBox;
    DSsbcm_amount_settingMAXAMUONTCONRTACT: TFloatField;
    DSsbcm_amount_settingMAXAMUONTCONRTACTPERCENT: TFloatField;
    depperiodsPERIOD_TYPE: TWideStringField;
    sb_aca: TOraclePackage;
    DepositPerSettingPROLONGATION: TFloatField;
    PieceSofWriting: TOraclePackage;
    depcapitalperiodsPERIODTYPE: TWideStringField;
    depperiodsPERIODTYPEID: TIntegerField;
    depcapitalperiodsPERIODTYPEID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure XDBGrid3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure depperiodsAfterPost(DataSet: TDataSet);
    procedure DepositPerSettingAfterPost(DataSet: TDataSet);
    procedure XDBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure PerSettingDatSrcDataChange(Sender: TObject; Field: TField);
    procedure XDBGrid6KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure depcapitalperiodsAfterPost(DataSet: TDataSet);
    procedure DepositdatsettingsAfterPost(DataSet: TDataSet);
    procedure XDBGrid6KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure XDBGrid7KeyPress(Sender: TObject; var Key: Char);
    procedure DSsbcm_amount_settingAfterPost(DataSet: TDataSet);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XDBGrid5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DepositTypesDatSrcDataChange(Sender: TObject; Field: TField);
    procedure DSRsbcm_amount_settingDataChange(Sender: TObject; Field: TField);
    procedure depperiodsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure depcapitalperiodsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
  private

  public
      procedure WaitForOp;
      procedure WaitFor;
  end;

var
  NewPercentSetting: TNewPercentSetting;
  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,NewCommonDeclsImpl,SBTranslateProc;

procedure exportproc(S:String);export;
begin
  NewPercentSetting.ShowModal;
end;
exports
    exportproc;

procedure TNewPercentSetting.XDBGrid5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   with Sender as TXDBGrid ,dm_percent_converting do begin
   if (key = VK_DELETE) and (DataSource.DataSet.RecordCount>0) then
   if MessageDlg('Silinməsinə əminsinizmi?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then


  // showmessage(inttostr(XDBGrid5.DataSource.DataSet.FieldByName('id').AsInteger));
   //abort;
   begin
       CallProcedure('deppseting_hist_new',[XDBGrid5.DataSource.DataSet.FieldByName('id').AsInteger,0]);
       DataSource.DataSet.Delete;
      end;
   end;
end;

procedure TNewPercentSetting.XDBGrid5KeyPress(Sender: TObject; var Key: Char);
var

 p_id,p_currencyid,p_interestrate,p_dueintrate,p_firstamount,
 p_lastamount,p_depid,p_periodid,p_capitalid,p_befointrate,p_first_day,
 p_percentage_growth_step,p_last_day,p_amount_setting_id,p_amount_growth_first,
 p_amount_growth_last,p_write_memory,p_confirmation,p_prolongation :real;
 p_hdate:Tdate;




begin
      with DepositPerSetting ,dm_percent_converting do
   begin
        //if UpdateStatus=usModified then
     //begin

       p_id                    :=XDBGrid5.DataSource.DataSet.FieldByName('id').AsFloat;
       p_currencyid            :=XDBGrid5.DataSource.DataSet.FieldByName('currencyid').AsFloat;
       p_interestrate          :=XDBGrid5.DataSource.DataSet.FieldByName('interestrate').AsFloat;
       p_dueintrate            :=XDBGrid5.DataSource.DataSet.FieldByName('dueintrate').AsFloat;
       p_firstamount           :=XDBGrid5.DataSource.DataSet.FieldByName('firstamount').AsFloat;
       p_lastamount            :=XDBGrid5.DataSource.DataSet.FieldByName('lastamount').AsFloat;
       p_depid                 :=XDBGrid5.DataSource.DataSet.FieldByName('depid').AsFloat;
       p_periodid              :=XDBGrid5.DataSource.DataSet.FieldByName('periodid').AsFloat;
       p_capitalid             :=XDBGrid5.DataSource.DataSet.FieldByName('capitalid').AsFloat;
       p_befointrate           :=XDBGrid5.DataSource.DataSet.FieldByName('befointrate').AsFloat;
       p_first_day             :=XDBGrid5.DataSource.DataSet.FieldByName('first_day').AsFloat;
       p_percentage_growth_step:=XDBGrid5.DataSource.DataSet.FieldByName('percentage_growth_step').AsFloat;
       p_last_day              :=XDBGrid5.DataSource.DataSet.FieldByName('last_day').AsFloat;
       p_amount_setting_id     :=XDBGrid5.DataSource.DataSet.FieldByName('amount_setting_id').AsFloat;
       p_amount_growth_first   :=XDBGrid5.DataSource.DataSet.FieldByName('amount_growth_first').AsFloat;
       p_amount_growth_last    :=XDBGrid5.DataSource.DataSet.FieldByName('amount_growth_last').AsFloat;
       p_write_memory          :=XDBGrid5.DataSource.DataSet.FieldByName('write_memory').AsFloat;
       p_confirmation          :=XDBGrid5.DataSource.DataSet.FieldByName('confirmation').AsFloat;
       p_prolongation          :=XDBGrid5.DataSource.DataSet.FieldByName('prolongation').AsFloat;
       //p_hdate:=XDBGrid5.DataSource.DataSet.FieldByName('hdate').AsDateTime;


       //end;


     if UpdateStatus in [usInserted, usModified] then
     begin

       FieldByName('DepID').AsInteger            := DepositTypes.FieldByName('ID').AsInteger;
       FieldByName('PeriodID').AsInteger         := Depperiods.FieldByName('ID').AsInteger;
       FieldByName('CapitalID').AsInteger        := Depcapitalperiods.FieldByName('ID').AsInteger;
       FieldByName('Currencyid').AsInteger       := Valutes.FieldByName('VALUTE').AsInteger;
       FieldByName('amount_setting_id').AsInteger:= DSsbcm_amount_setting.FieldByName('id').AsInteger;
       FieldByName('WRITE_MEMORY').AsInteger     := 0;
       FieldByName('CONFIRMATION').AsInteger     := 0;
       FieldByName('prolongation').AsInteger     := 0;
       FieldByName('hdate').AsDateTime           := DSsysdat.FieldByName('tek_dat').AsDateTime;


   end;
 { CallProcedure('deppseting_upd_hist_new',[p_id,
                                        p_currencyid,
                                        p_interestrate,
                                        p_dueintrate,
                                        p_firstamount,
                                        p_lastamount,
                                        p_depid,
                                        p_periodid,
                                        p_capitalid,
                                        p_befointrate,
                                        p_first_day,
                                        p_percentage_growth_step,
                                        p_last_day,
                                        p_amount_setting_id,
                                        p_amount_growth_first,
                                        p_amount_growth_last,
                                        p_write_memory,
                                        p_confirmation
                                        ]);      }
   end;

end;
procedure TNewPercentSetting.XDBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   with Sender as TXDBGrid do begin
   if (key = VK_DELETE) and (DataSource.DataSet.RecordCount>0) then
   if MessageDlg('Silinməsinə əminsinizmi?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then

      DataSource.DataSet.Delete;
   end;
end;

procedure TNewPercentSetting.XDBGrid6KeyPress(Sender: TObject; var Key: Char);
begin
  with Depositdatsettings do
   begin
     if UpdateStatus in [usInserted, usModified] then
     begin
       FieldByName('Depsetid').AsInteger := DepositPerSetting.FieldByName('ID').AsInteger;
       FieldByName('Depid').AsInteger    := DepositTypes.FieldByName('id').AsInteger;
       FieldByName('PeriodID').AsInteger := Depperiods.FieldByName('ID').AsInteger;
       FieldByName('CapitalID').AsInteger:= Depcapitalperiods.FieldByName('ID').AsInteger;
       FieldByName('valcod').AsInteger   := Valutes.FieldByName('Valute').AsInteger;
       FieldByName('amount_setting_id').AsInteger:= DSsbcm_amount_setting.FieldByName('id').AsInteger;
       //showmessage(DepositTypes.FieldByName('id').AsString);

    end;
   end;
end;

procedure TNewPercentSetting.XDBGrid7KeyPress(Sender: TObject; var Key: Char);
   var period :String;
begin
{period:=Depperiods.FieldByName('ID').AsString;
if period='' then
begin }

   with DSsbcm_amount_setting do
   begin
     if UpdateStatus in [usInserted, usModified] then
     begin
       FieldByName('PeriodID').AsInteger  := Depperiods.FieldByName('ID').AsInteger;
       FieldByName('Currencyid').AsInteger:= Valutes.FieldByName('VALUTE').AsInteger;
     end;
   end;
{end else
begin
     showmessage('Depozitin Periodu daxil edilmiyib');
       abort;
end; }
end;

procedure TNewPercentSetting.XFButton1Click(Sender: TObject);
begin
 with NewPercentSetting,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['SBCM_PERCENT_SETTING_SAVE']);
end;

with DSsbcm_amount_setting ,dm_percent_converting do
   begin

       //CallProcedure('CancelDepositIntCalc',['p_contractID',ContractID]);

       CallProcedure('upd_confir_and_writ_memory_new',[Valutes.FieldByName('Valute').AsInteger,
                                                       Depperiods.FieldByName('ID').AsInteger,
                                                       Depcapitalperiods.FieldByName('ID').AsInteger,
                                                       DepositTypes.FieldByName('id').AsInteger,
                                                       DSsbcm_amount_setting.FieldByName('id').AsInteger,
                                                       0]);
   showmessage('Seçilmiş sazlamalara görə faiz dərəcələri yaddaşa yazıldı.');
   end;
end;

procedure TNewPercentSetting.XFButton2Click(Sender: TObject);
var
say :real;
secimdurumu :integer;
begin
 with NewPercentSetting,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['SBCM_PERCENT_SETTING_COMMIT']);
end;
    if XFCheckBox1.Checked=true then
    begin
       secimdurumu:=1;

    end;
        if XFCheckBox1.Checked=false then
    begin
       secimdurumu:=0;

    end;


with DSsbcm_amount_setting ,dm_percent_converting do
   begin

       //CallProcedure('CancelDepositIntCalc',['p_contractID',ContractID]);
       if secimdurumu=1 then
       begin
        if MessageDlg('Sazlanmis yeni faiz dərəcəsi əvvəlki bu tip depozitlərin bütün yatrımlarının aid edilsinmi?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
       CallProcedure('upd_transh_percent',[Valutes.FieldByName('Valute').AsInteger,
                                                       Depperiods.FieldByName('ID').AsInteger,
                                                       Depcapitalperiods.FieldByName('ID').AsInteger,
                                                       DepositTypes.FieldByName('id').AsInteger,
                                                       DSsbcm_amount_setting.FieldByName('id').AsInteger,
                                                       XDBGrid7.DataSource.DataSet.FieldByName('FIRSTAMOUNT').AsFloat,
                                                       XDBGrid7.DataSource.DataSet.FieldByName('LASTAMOUNT').AsFloat,
                                                       XDBGrid5.DataSource.DataSet.FieldByName('INTERESTRATE').AsFloat
                                                       ]);
       end;
       end;

       say:=CallFloatFunction('get_write_memory',[Valutes.FieldByName('Valute').AsInteger,
                                                       Depperiods.FieldByName('ID').AsInteger,
                                                       Depcapitalperiods.FieldByName('ID').AsInteger,
                                                       DepositTypes.FieldByName('id').AsInteger,
                                                       DSsbcm_amount_setting.FieldByName('id').AsInteger
                                                       ]);
          if say>0 then
          begin
          showmessage('Seçilmiş sazlamalara görə faiz dərəcələri yaddaşa yazılmadığından təsdiqlənə bilməz!');
          exit;
          end;

          if say=0 then
          begin
       CallProcedure('upd_confir_and_writ_memory_new',[Valutes.FieldByName('Valute').AsInteger,
                                                       Depperiods.FieldByName('ID').AsInteger,
                                                       Depcapitalperiods.FieldByName('ID').AsInteger,
                                                       DepositTypes.FieldByName('id').AsInteger,
                                                       DSsbcm_amount_setting.FieldByName('id').AsInteger,
                                                       1]);
   showmessage('Seçilmiş sazlamalara görə faiz dərəcələri təsdiqləndi.');
          end;

   end;
end;

procedure TNewPercentSetting.depcapitalperiodsAfterPost(DataSet: TDataSet);
begin
  Depcapitalperiods.Refresh;
end;

procedure TNewPercentSetting.depcapitalperiodsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: string);
begin
  depcapitalperiodsDESCRIPTION.AsString:=PieceSofWriting.CallStringFunction('CurrencyToHR',[depcapitalperiodsPERIOD.AsInteger])+' '+depcapitalperiodsPERIODTYPE.AsString;

  if depcapitalperiodsTYPE.AsString='NONE'           then depcapitalperiodsPERIOD.AsInteger:=0;
 // if depcapitalperiodsTYPE.AsString='WITHDRAW'       then depcapitalperiodsPERIOD.AsInteger:=1;
 // if depcapitalperiodsTYPE.AsString='CAPITALIZATION' then depcapitalperiodsPERIOD.AsInteger:=2;
//  if depcapitalperiodsTYPE.AsString='BEFOPERCENT'    then depcapitalperiodsPERIOD.AsInteger:=3;

  if depcapitalperiodsPERIODTYPE.AsString='GÜN'      then depcapitalperiodsPERIODTYPEID.AsInteger:=0;
  if depcapitalperiodsPERIODTYPE.AsString='AY'       then depcapitalperiodsPERIODTYPEID.AsInteger:=1;
  if depcapitalperiodsPERIODTYPE.AsString='İL'       then depcapitalperiodsPERIODTYPEID.AsInteger:=2;


end;

procedure TNewPercentSetting.DepositdatsettingsAfterPost(DataSet: TDataSet);
begin
  Depositdatsettings.Refresh;
end;

procedure TNewPercentSetting.DepositPerSettingAfterPost(DataSet: TDataSet);
begin
  DepositPerSetting.Refresh;
end;

procedure TNewPercentSetting.DepositTypesDatSrcDataChange(Sender: TObject;
  Field: TField);
begin
  WaitForOp;
end;

procedure TNewPercentSetting.depperiodsAfterPost(DataSet: TDataSet);
begin
  Depperiods.Refresh;
end;

procedure TNewPercentSetting.depperiodsApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  depperiodsDESCRIPTION.AsString:=PieceSofWriting.CallStringFunction('CurrencyToHR',[depperiodsPERIOD.AsInteger])+' '+depperiodsPERIOD_TYPE.AsString;
  if depperiodsPERIOD_TYPE.AsString='GÜN' then depperiodsPERIODTYPEID.AsInteger:=0;
  if depperiodsPERIOD_TYPE.AsString='AY'  then depperiodsPERIODTYPEID.AsInteger:=1;
  if depperiodsPERIOD_TYPE.AsString='İL'  then depperiodsPERIODTYPEID.AsInteger:=2;
end;

procedure TNewPercentSetting.DSRsbcm_amount_settingDataChange(Sender: TObject;
  Field: TField);
var P_DepositID,P_PeriodID,P_CapitalPerID,P_CurrencyID,P_Amount_Setting_Id :Integer;
begin
  WITH DepositTypes          DO P_DepositID := FieldByName('ID').AsInteger;
  WITH DepCapitalPeriods     DO P_CapitalPerID := FieldByName('ID').AsInteger;
  WITH DSsbcm_amount_setting DO P_Amount_Setting_Id := FieldByName('ID').AsInteger;
  WITH DepPeriods            DO P_PeriodID := FieldByName('ID').AsInteger;
  WITH Valutes               DO P_CurrencyID := FieldByName('VALUTE').AsInteger;
  WITH DepositPerSetting DO
  begin
    if Active then close;
    setVariable('DepID',P_DepositID);
    setVariable('PeriodID',P_PeriodID);
    setVariable('CapitalID',P_CapitalPerID);
    setVariable('Currencyid',P_CurrencyID);
    setVariable('Amount_setting_id',p_amount_setting_id);
    open;
  end;
end;

procedure TNewPercentSetting.DSsbcm_amount_settingAfterPost(DataSet: TDataSet);
begin
DSsbcm_amount_setting.Refresh;
end;

procedure TNewPercentSetting.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewPercentSetting.FormDestroy(Sender: TObject);
begin
  DepositTypes.CloseAll;
  Depperiods.CloseAll;
  Depcapitalperiods.CloseAll;
  Valutes.CloseAll;
  DepositPerSetting.CloseAll;
  Depositdatsettings.CloseAll;
  DSsbcm_amount_setting.CloseAll;
  DSsysdat.CloseAll;
end;

procedure TNewPercentSetting.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ORD(key) = VK_ESCAPE then close
end;

procedure TNewPercentSetting.FormShow(Sender: TObject);
var
P_PeriodID ,P_CurrencyID : Integer;
begin
  DSsysdat.Close;
  DSsysdat.Open;

  DepositTypes.Close;
  DepositTypes.Open;

  Depperiods.Close;
  Depperiods.Open;

  Depcapitalperiods.Close;
  Depcapitalperiods.Open;

  Valutes.open;
  //DepositPerSetting.open;

  Depositdatsettings.Open;
  XFCheckBox1.Checked:=false;
// DSsbcm_amount_setting.Open;

end;
procedure TNewPercentSetting.PerSettingDatSrcDataChange(Sender: TObject;
  Field: TField);
begin
   WaitFor;
end;

procedure TNewPercentSetting.WaitForOp;
var P_DepositID,P_PeriodID,P_CapitalPerID,P_CurrencyID,P_Amount_Setting_Id :Integer;
begin
  WITH DepositTypes          DO P_DepositID := FieldByName('ID').AsInteger;
  WITH depcapitalperiods     DO P_CapitalPerID := FieldByName('ID').AsInteger;
  //with DSsbcm_amount_setting do P_Amount_Setting_Id := FieldByName('ID').AsInteger;
  WITH depperiods            DO P_PeriodID := FieldByName('ID').AsInteger;
  WITH Valutes               DO P_CurrencyID := FieldByName('VALUTE').AsInteger;
  WITH DSsbcm_amount_setting DO
  begin
    if Active then close;
    setVariable('PERIODID',P_PeriodID);
    setVariable('Currencyid',P_CurrencyID);
    open;
    P_Amount_Setting_Id := FieldByName('ID').AsInteger;
  end;
  WITH DepositPerSetting DO
  begin
    if Active then close;
    setVariable('DepID',P_DepositID);
    setVariable('PeriodID',P_PeriodID);
    setVariable('CapitalID',P_CapitalPerID);
    setVariable('Currencyid',P_CurrencyID);
    setVariable('Amount_setting_id',p_amount_setting_id);
    open;
  end;
end;


procedure TNewPercentSetting.XDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  WITH  Sender as TXDBGrid DO
  begin
    if (key = VK_DELETE) and (DataSource.DataSet.RecordCount>0) then
    if MessageDlg('Silinməsinə əminsinizmi?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DataSource.DataSet.Delete;
  end;
end;

procedure TNewPercentSetting.WaitFor;
var P_DepID,P_Periodid,P_Capitalid,P_Valcod,P_Depsetid,p_amount_setting_id :Integer;
begin
  WITH DepositTypes          DO P_DepID := FieldByName('ID').AsInteger;
  WITH depperiods            DO P_Periodid := FieldByName('ID').AsInteger;
  WITH depcapitalperiods     DO P_Capitalid := FieldByName('ID').AsInteger;
  WITH Valutes               DO P_Valcod := FieldByName('VALUTE').AsInteger;
  WITH DSsbcm_amount_setting DO P_Amount_Setting_Id := FieldByName('ID').AsInteger;
  WITH Depositdatsettings DO
  begin
    if Active then close;
    setVariable('DepID',P_DepID);
    setVariable('PeriodID',P_PeriodID);
    setVariable('CapitalID',P_Capitalid);
    setVariable('Valcod',P_Valcod);
    setVariable('amount_setting_id',p_amount_setting_id);
    open;
  end;
end;
initialization
   NewPercentSetting := TNewPercentSetting.Create(CommonApplication)
end.
