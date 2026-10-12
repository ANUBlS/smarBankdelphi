unit PercentSettingImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Db,
  OracleData, NLSLocalizer, XFSCtrls, ComCtrls, XDBGrids;

type
  TPercentSetting = class(TForm)
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TWideStringField;
    DepositTypesDatSrc: TDataSource;
    Valutes: TOracleDataSet;
    ValutesVAL_NAME: TWideStringField;
    ValutesVALU_NAME: TWideStringField;
    ValutesVALUTE: TIntegerField;
    ValutesDatSrc: TDataSource;
    DepositPerSetting: TOracleDataSet;
    PerSettingDatSrc: TDataSource;
    Depositdatsettings: TOracleDataSet;
    DatsettingsDatSrc: TDataSource;
    XFGroupBox1: TXFGroupBox;
    XFPanel1: TXFPanel;
    XFGroupBox2: TXFGroupBox;
    XFGroupBox3: TXFGroupBox;
    XFGroupBox4: TXFGroupBox;
    XFGroupBox5: TXFGroupBox;
    XFGroupBox6: TXFGroupBox;
    XFStatusBar1: TXFStatusBar;
    XDBGrid1: TXDBGrid;
    XDBGrid2: TXDBGrid;
    XDBGrid4: TXDBGrid;
    XDBGrid5: TXDBGrid;
    XDBGrid6: TXDBGrid;
    depperiods: TOracleDataSet;
    depperiodsPERIOD: TFloatField;
    depperiodsID: TFloatField;
    depperiodsDESCRIPTION: TWideStringField;
    depperiodsDEPID: TFloatField;
    depperiodsds: TDataSource;
    depcapitalperiods: TOracleDataSet;
    depcapitalperiodsPERIOD: TFloatField;
    depcapitalperiodsDESCRIPTION: TWideStringField;
    depcapitalperiodsID: TFloatField;
    depcapitalperiodsPERIODID: TFloatField;
    depcapitalperiodsds: TDataSource;
    XDBGrid3: TXDBGrid;
    DepositPerSettingID: TFloatField;
    DepositPerSettingCURRENCYID: TFloatField;
    DepositPerSettingINTERESTRATE: TFloatField;
    DepositPerSettingDUEINTRATE: TFloatField;
    DepositPerSettingDEPID: TFloatField;
    DepositPerSettingPERIODID: TFloatField;
    DepositPerSettingCAPITALID: TFloatField;
    DepositPerSettingBEFOINTRATE: TFloatField;
    DepositdatsettingsID: TFloatField;
    DepositdatsettingsPERCENT: TFloatField;
    DepositdatsettingsFIRSTDATEINT: TFloatField;
    DepositdatsettingsLASTDATEINT: TFloatField;
    DepositdatsettingsVALCOD: TFloatField;
    DepositdatsettingsDEPID: TFloatField;
    DepositdatsettingsPERIODID: TFloatField;
    DepositdatsettingsCAPITALID: TFloatField;
    DepositdatsettingsDEPSETID: TFloatField;
    DepositPerSettingFIRSTAMOUNT: TFloatField;
    DepositPerSettingLASTAMOUNT: TFloatField;
    depcapitalperiodsTYPE: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure DepositTypesDatSrcDataChange(Sender: TObject; Field: TField);
    procedure XDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure depperiodsAfterPost(DataSet: TDataSet);
    procedure DepositPerSettingAfterPost(DataSet: TDataSet);
    procedure XDBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure PerSettingDatSrcDataChange(Sender: TObject; Field: TField);
    procedure XDBGrid6KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure depcapitalperiodsAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);

  private
   procedure WaitForOp;
  // procedure WaitFor ;
    { Private declarations }
  public
  end;

var
  PercentSetting: TPercentSetting;
  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,CommonDeclsImpl,SBTranslateProc;

procedure exportproc(S:String);export;
begin
   PercentSetting.ShowModal;
end;
exports
    exportproc;


procedure TPercentSetting.FormShow(Sender: TObject);
begin
  DepositTypes.open;
  Depperiods.open;
  Depcapitalperiods.open;
  Valutes.open;
  DepositPerSetting.open;
  Depositdatsettings.Open;
end;

procedure TPercentSetting.WaitForOp;
var P_DepositID,P_PeriodID,P_CapitalPerID,P_CurrencyID :Integer;
begin

      with DepositTypes do
           P_DepositID := FieldByName('ID').AsInteger;

      with depcapitalperiods do
           P_CapitalPerID := FieldByName('ID').AsInteger;


      with depperiods do
           P_PeriodID := FieldByName('ID').AsInteger;


      with Valutes do
           P_CurrencyID := FieldByName('VALUTE').AsInteger;

       // Edit1.Text:= IntToStr(P_DepositID)+'=' + IntToStr(P_CapitalPerID)+'='+IntToStr(P_PeriodID)+'='+IntToStr(P_CurrencyID);

   with DepositPerSetting do
   begin
      if Active then close;
      setVariable('DepID',P_DepositID);
      setVariable('PeriodID',P_PeriodID);
      setVariable('CapitalID',P_CapitalPerID);
      setVariable('Currencyid',P_CurrencyID);
      open;
   end;





end;


{procedure TPercentSetting.WaitFor;
var P_DepID,P_Periodid,P_Capitalid,P_Valcod,P_Depsetid :Integer;
begin

   with   DepositPerSetting do begin
                                 P_DepID     :=FieldByName('DEPID').AsInteger;
                                 P_Periodid  :=FieldByName('PERIODID').AsInteger;
                                 P_Capitalid :=FieldByName('CAPITALID').AsInteger;
                                 P_Valcod    :=FieldByName('CURRENCYID').AsInteger;
                                 P_Depsetid  :=FieldByName('ID').AsInteger;
                               end;

  with Depositdatsettings do
   begin
      if Active then close;
      setVariable('DepID',P_DepID);
      setVariable('PeriodID',P_PeriodID);
      setVariable('CapitalID',P_Capitalid);
      setVariable('Valcod',P_Valcod);
      setVariable('Depsetid',P_Depsetid);
      open;
   end;

end;  }

procedure TPercentSetting.DepositTypesDatSrcDataChange(Sender: TObject;
  Field: TField);
begin
   WaitForOp;
end;

procedure TPercentSetting.XDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   with Sender as TXDBGrid do begin
   if (key = VK_DELETE) and (DataSource.DataSet.RecordCount>0) then
   if MessageDlg('Silinməsinə əminsinizmi?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DataSource.DataSet.Delete;
end;
end;
procedure TPercentSetting.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TPercentSetting.FormDestroy(Sender: TObject);
begin
  DepositTypes.CloseAll;
  Depperiods.CloseAll;
  Depcapitalperiods.CloseAll;
  Valutes.CloseAll;
  DepositPerSetting.CloseAll;
  Depositdatsettings.CloseAll;
end;

procedure TPercentSetting.depperiodsAfterPost(DataSet: TDataSet);
begin
  depperiods.Refresh;
end;

procedure TPercentSetting.DepositPerSettingAfterPost(DataSet: TDataSet);
begin
  depositpersetting.RefreshRecord;
end;

procedure TPercentSetting.XDBGrid5KeyPress(Sender: TObject; var Key: Char);
begin
   with DepositPerSetting do
   begin
     if UpdateStatus in [usInserted, usModified] then
     begin
       FieldByName('DepID').AsInteger     := DepositTypes.FieldByName('ID').AsInteger;
       FieldByName('PeriodID').AsInteger  := Depperiods.FieldByName('ID').AsInteger;
       FieldByName('CapitalID').AsInteger := Depcapitalperiods.FieldByName('ID').AsInteger;
       FieldByName('Currencyid').AsInteger:= Valutes.FieldByName('VALUTE').AsInteger;
     end;
   end;
end;

procedure TPercentSetting.PerSettingDatSrcDataChange(Sender: TObject;
  Field: TField);
begin
//   WaitFor;
end;

procedure TPercentSetting.XDBGrid6KeyPress(Sender: TObject; var Key: Char);
begin
  with Depositdatsettings do
   begin
     if UpdateStatus in [usInserted, usModified] then
     begin
       FieldByName('Depsetid').AsInteger := DepositPerSetting.FieldByName('ID').AsInteger;
       FieldByName('Depid').AsInteger    := DepositTypes.FieldByName('Depid').AsInteger;
       FieldByName('PeriodID').AsInteger := Depperiods.FieldByName('PeriodID').AsInteger;
       FieldByName('CapitalID').AsInteger:= Depcapitalperiods.FieldByName('CapitalID').AsInteger;
       FieldByName('valcod').AsInteger   := Valutes.FieldByName('Valute').AsInteger;
    end;
   end;
end;

procedure TPercentSetting.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(key) = VK_ESCAPE then close
end;

procedure TPercentSetting.depcapitalperiodsAfterPost(DataSet: TDataSet);
begin
   depcapitalperiods.Refresh;
end;

initialization
   PercentSetting := TPercentSetting.Create(CommonApplication)

end.
