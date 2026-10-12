unit uIpPredMainImpl;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, ComCtrls, CMCurrencyEdit,
  NLSLocalizer, DBLookupEh, Db, OracleData, DBCtrls, Oracle, Buttons;

resourcestring
  rs_ipoteka_predmet = '%s нюмряли кредитин ипотека предмети';

type
  TfrmIpPredMain = class(TForm)
    ODSIPred: TOracleDataSet;
    IPred: TDataSource;
    OPKIP: TOraclePackage;
    Types: TDataSource;
    ODSTypes: TOracleDataSet;
    Panel2: TPanel;
    btnSave: TButton;
    Button1: TButton;
    Localizer: TNLSLocalizer;
    ODSInsurances: TOracleDataSet;
    Insurances: TDataSource;
    Button2: TButton;
    Button3: TButton;
    Qiyms: TDataSource;
    ODSQiyms: TOracleDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Regions: TDataSource;
    ODSExec: TOracleDataSet;
    Panel3: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBEditEh8: TDBLookupComboboxEh;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    DateTimePicker3: TDateTimePicker;
    DBEditEh11: TDBEditEh;
    DateTimePicker4: TDateTimePicker;
    DBEditEh12: TDBEditEh;
    DBEditEh13: TDBEditEh;
    DateTimePicker5: TDateTimePicker;
    Label43: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Panel1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    spbInsurances: TSpeedButton;
    spbTypes: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    DBEdit1: TDBEditEh;
    DBEdit3: TDBEditEh;
    DBEdit4: TDBEditEh;
    DBEdit5: TDBEditEh;
    DBEdit6: TDBEditEh;
    DBEdit7: TDBLookupComboboxEh;
    DBEdit8: TDBLookupComboboxEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEdit2: TDBEditEh;
    DBEdit9: TDBEditEh;
    DBEdit10: TDBEditEh;
    DBEdit11: TDateTimePicker;
    DBEdit12: TDBEditEh;
    DBEdit13: TDateTimePicker;
    DBEdit14: TDBEditEh;
    DBEdit15: TDBEditEh;
    DBEdit16: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    edymno: TEdit;
    edymdesc: TEdit;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    Button4: TButton;
    ODSIPredCREDITID: TFloatField;
    ODSIPredPREDADDRESS: TStringField;
    ODSIPredPREDTYPE: TFloatField;
    ODSIPredPREDPLATZ: TFloatField;
    ODSIPredOWNERNAME: TStringField;
    ODSIPredPREDCOST: TFloatField;
    ODSIPredPROPLAWNO: TStringField;
    ODSIPredPROPLAWREGNO: TStringField;
    ODSIPredCONTRACTNO: TStringField;
    ODSIPredCONTRACTDATE: TDateTimeField;
    ODSIPredCONTRACTNOT: TStringField;
    ODSIPredPAPERNO: TStringField;
    ODSIPredPAPERDATE: TDateTimeField;
    ODSIPredEVALUATER: TFloatField;
    ODSIPredINSURANCECOMPANY: TFloatField;
    ODSIPredINSURANCEAMOUNT: TFloatField;
    ODSIPredINSURANCENO: TStringField;
    ODSIPredINSURANCEDATE: TDateTimeField;
    ODSIPredBANKOPENDATE: TDateTimeField;
    ODSIPredBANKCLOSEDATE: TDateTimeField;
    ODSIPredGIVENFLATAMT: TFloatField;
    ODSIPredHANDINGACTDATE: TDateTimeField;
    ODSIPredHANDINGACTNO: TStringField;
    ODSIPredRESORTDATE: TDateTimeField;
    ODSIPredALEVPREDADDRESS: TStringField;
    ODSIPredALEVPREDTYPE: TFloatField;
    ODSIPredALEVPREDPLATZ: TFloatField;
    ODSIPredALEVOWNERNAME: TStringField;
    ODSIPredALEVPREDCOST: TFloatField;
    ODSIPredALEVPROPLAWNO: TStringField;
    ODSIPredALEVPROPLAWREGNO: TStringField;
    ODSIPredALEVCONTRACTNO: TStringField;
    ODSIPredALEVCONTRACTDATE: TDateTimeField;
    ODSIPredALEVCONTRACTNOT: TStringField;
    ODSIPredALEVPAPERNO: TStringField;
    ODSIPredALEVPAPERDATE: TDateTimeField;
    ODSIPredALEVEVALUATER: TFloatField;
    ODSIPredALEVINSURANCECOMPANY: TFloatField;
    ODSIPredALEVINSURANCEAMOUNT: TFloatField;
    ODSIPredALEVINSURANCENO: TStringField;
    ODSIPredALEVINSURANCEDATE: TDateTimeField;
    ODSIPredREGIONID: TFloatField;
    ODSIPredALEVREGIONID: TFloatField;
    ODSIPredCARDID: TFloatField;
    ODSIPredPLEDGEINSLASTDATE: TDateTimeField;
    GroupBox2: TGroupBox;
    Label45: TLabel;
    DateTimePicker7: TDateTimePicker;
    Label46: TLabel;
    DateTimePicker8: TDateTimePicker;
    Label47: TLabel;
    DateTimePicker9: TDateTimePicker;
    Label48: TLabel;
    DateTimePicker10: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    DateTimePicker11: TDateTimePicker;
    DateTimePicker12: TDateTimePicker;
    GroupBox4: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DateTimePicker14: TDateTimePicker;
    DateTimePicker15: TDateTimePicker;
    DateTimePicker16: TDateTimePicker;
    GroupBox5: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    BankOpenDat: TDateTimePicker;
    BankCloseDat: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    DBEditEh1: TDBEditEh;
    DateTimePicker2: TDateTimePicker;
    Label55: TLabel;
    DateTimePicker17: TDateTimePicker;
    Label56: TLabel;
    DateTimePicker18: TDateTimePicker;
    ODSIPredYQIYMDATE: TDateTimeField;
    ODSIPredPAPERREREGDATE: TDateTimeField;
    ODSIPredAND1: TDateTimeField;
    ODSIPredAND2: TDateTimeField;
    ODSIPredAND3: TDateTimeField;
    ODSIPredAND4: TDateTimeField;
    ODSIPredALQI1: TDateTimeField;
    ODSIPredALQI2: TDateTimeField;
    ODSIPredYMD1: TDateTimeField;
    ODSIPredYMD2: TDateTimeField;
    ODSIPredYMD3: TDateTimeField;
    ODSIPredYMD4: TDateTimeField;
    Label57: TLabel;
    DBEditEh2: TDBLookupComboboxEh;
    Label58: TLabel;
    DBEditEh14: TDBEditEh;
    Button5: TButton;
    ODSRegions: TOracleDataSet;
    Button6: TButton;
    Button7: TButton;
    ODSIPredPREDAREA: TFloatField;
    ODSIPredALEVPREDAREA: TFloatField;
    ODSArazis: TOracleDataSet;
    Arazis: TDataSource;
    Label44: TLabel;
    DateTimePicker6: TDateTimePicker;
    Label51: TLabel;
    Label24: TLabel;
    DateTimePicker13: TDateTimePicker;
    crdInf: TOracleDataSet;
    crdInfPURPOSEOFCREDIT: TStringField;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    ODSIPredTICKNO: TStringField;
    ODSIPredBUILDID: TFloatField;
    ODSIPredPROFITID: TFloatField;
    ODSIPredREISTERID: TFloatField;
    buildingcompds: TDataSource;
    profitdes: TDataSource;
    reisterds: TDataSource;
    buildingcomp: TOracleDataSet;
    profit: TOracleDataSet;
    reister: TOracleDataSet;
    buildingcompID: TFloatField;
    buildingcompNAME: TStringField;
    profitID: TFloatField;
    profitNAME: TStringField;
    reisterID: TFloatField;
    reisterNAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure spbTypesClick(Sender: TObject);
    procedure DBEdit16Click(Sender: TObject);
    procedure DBEdit13Click(Sender: TObject);
    procedure DBEdit11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edymnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Panel1Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FillDates;
    procedure savechg;
    procedure ODSIPredAfterOpen(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
  private            
    edNewName: TEdit;
    procedure edNewNameClick(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  public
    { Public declarations }
  end;

var
  frmIpPredMain: TfrmIpPredMain;

procedure InitPlugin(S : String); export;

implementation

{$R *.DFM}


uses
  CommonDecls, SystemState,CMOracleApiDataModuleImpl, uIPYMReportImpl,
  CurrencyToHR_Azeri_Impl, uIPReestrReportImpl, uIpReestr;


procedure InitPlugin(S : String); export;
begin

    frmIpPredMain.ShowModal;
end;

exports
  InitPlugin;
  
procedure TfrmIpPredMain.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if not assigned(edNewName) then edNewName := TEdit.Create(Self);
  with edNewName do begin
    Parent := Panel1;
    OnKeyDown := edNewNameClick;
    Visible := False;
  end;

  for i:= 0 to ComponentCount-1 do
    if Components[i] is TSpeedButton then
      (Components[i] as TSpeedButton).Enabled := True;

  Localizer.Caption := Format(rs_ipoteka_predmet,[Get_SelectedCrdNo]);

  with crdInf do begin
    if active then Close;
    SetVariable('crdid', Get_SelectedCrdID);
    Open;
  end;


  with ODSIPred do begin
    if active then Close;
    SetVariable('creditid', Get_SelectedCrdID);
    Open;
    edit;
    if ODSIPredPAPERNO.IsNull  then fieldByName('PAPERNO').AsString :=
    crdInf.fieldByName('PURPOSEOFCREDIT').AsString;
  end;

  ODSTypes.close;
  ODSQiyms.close;
  ODSInsurances.close;
  ODSRegions.close;
  ODSArazis.Close;
  ODSTypes.Open;
  ODSQiyms.Open;
  ODSInsurances.open;
  ODSRegions.open;
  ODSArazis.Open;
  buildingcomp.Open;
  profit.Open;
  reister.Open;
  PageControl1.ActivePageIndex := 0;
  btnSave.Enabled := true;

  FillDates;
end;

procedure TfrmIpPredMain.FillDates;
begin

  if Trim(ODSIPredCONTRACTDATE.AsString)<>'' then
    DBEdit11.Date := ODSIPredCONTRACTDATE.AsDateTime
  else
    DBEdit11.Date := Date;

  if Trim(ODSIPredPAPERDATE.AsString)<>'' then
    DBEdit13.Date := ODSIPredPAPERDATE.AsDateTime
  else
    DBEdit13.Date := Date;

  if Trim(ODSIPredINSURANCEDATE.AsString)<>'' then
    DBEdit16.Date := ODSIPredINSURANCEDATE.AsDateTime
  else
    DBEdit16.Date := Date;

  if Trim(ODSIPredALEVCONTRACTDATE.AsString)<>'' then
    DateTimePicker3.Date := ODSIPredCONTRACTDATE.AsDateTime
  else
    DateTimePicker3.Date := Date;

  if Trim(ODSIPredALEVPAPERDATE.AsString)<>'' then
    DateTimePicker4.Date := ODSIPredPAPERDATE.AsDateTime
  else
    DateTimePicker4.Date := Date;

  if Trim(ODSIPredALEVINSURANCEDATE.AsString)<>'' then
    DateTimePicker5.Date := ODSIPredINSURANCEDATE.AsDateTime
  else
    DateTimePicker5.Date := Date;

  if Trim(ODSIPredBANKOPENDATE.AsString)<>'' then
    BankOpenDat.Date := ODSIPredBANKOPENDATE.AsDateTime
  else
    BankOpenDat.Date := Date;

  if Trim(ODSIPredBANKCLOSEDATE.AsString)<>'' then
    BankCloseDat.Date := ODSIPredBANKCLOSEDATE.AsDateTime
  else
    BankCloseDat.Date := Date;

  if Trim(ODSIPredRESORTDATE.AsString)<>'' then
    DateTimePicker2.Date := ODSIPredRESORTDATE.AsDateTime
  else
    DateTimePicker2.Date := Date;

  if Trim(ODSIPredHANDINGACTDATE.AsString)<>'' then
    DateTimePicker1.Date := ODSIPredHANDINGACTDATE.AsDateTime
  else
    DateTimePicker1.Date := Date;

  if Trim(ODSIPredPLEDGEINSLASTDATE.AsString)<>'' then
    DateTimePicker6.Date := ODSIPredPLEDGEINSLASTDATE.AsDateTime
  else
    DateTimePicker6.Date := Date;

  if Trim(ODSIPredYQIYMDATE.AsString)<>'' then
    DateTimePicker17.Date := ODSIPredYQIYMDATE.AsDateTime
  else
    DateTimePicker17.Date := Date;

  if Trim(ODSIPredPAPERREREGDATE.AsString)<>'' then
    DateTimePicker18.Date := ODSIPredPAPERREREGDATE.AsDateTime
  else
    DateTimePicker18.Date := Date;


  if Trim(ODSIPredAND1.AsString)<>'' then
    DateTimePicker7.Date := ODSIPredAND1.AsDateTime
  else
    DateTimePicker7.Date := Date;

  if Trim(ODSIPredAND2.AsString)<>'' then
    DateTimePicker8.Date := ODSIPredAND2.AsDateTime
  else
    DateTimePicker8.Date := Date;

  if Trim(ODSIPredAND3.AsString)<>'' then
    DateTimePicker9.Date := ODSIPredAND3.AsDateTime
  else
    DateTimePicker9.Date := Date;

  if Trim(ODSIPredAND4.AsString)<>'' then
    DateTimePicker10.Date := ODSIPredAND4.AsDateTime
  else
    DateTimePicker10.Date := Date;

  if Trim(ODSIPredALQI1.AsString)<>'' then
    DateTimePicker11.Date := ODSIPredALQI1.AsDateTime
  else
    DateTimePicker11.Date := Date;

  if Trim(ODSIPredALQI2.AsString)<>'' then
    DateTimePicker12.Date := ODSIPredALQI2.AsDateTime
  else
    DateTimePicker12.Date := Date;

  if Trim(ODSIPredYMD1.AsString)<>'' then
    DateTimePicker13.Date := ODSIPredYMD1.AsDateTime
  else
    DateTimePicker13.Date := Date;

  if Trim(ODSIPredYMD2.AsString)<>'' then
    DateTimePicker14.Date := ODSIPredYMD2.AsDateTime
  else
    DateTimePicker14.Date := Date;

  if Trim(ODSIPredYMD3.AsString)<>'' then
    DateTimePicker15.Date := ODSIPredYMD3.AsDateTime
  else
    DateTimePicker15.Date := Date;

  if Trim(ODSIPredYMD4.AsString)<>'' then
    DateTimePicker16.Date := ODSIPredYMD4.AsDateTime
  else
    DateTimePicker16.Date := Date;

end;

procedure TfrmIpPredMain.SaveChg;
begin

  ODSIPredCONTRACTDATE.AsDateTime := Int(DBEdit11.Date);
  ODSIPredPAPERDATE.AsDateTime := Int(DBEdit13.Date);
  ODSIPredINSURANCEDATE.AsDateTime := Int(DBEdit16.Date);
  ODSIPredALEVCONTRACTDATE.AsDateTime := Int(DateTimePicker3.Date);
  ODSIPredALEVPAPERDATE.AsDateTime := Int(DateTimePicker4.Date);
  ODSIPredALEVINSURANCEDATE.AsDateTime := Int(DateTimePicker5.Date);
  ODSIPredBANKOPENDATE.AsDateTime := Int(BankOpenDat.Date);
  ODSIPredBANKCLOSEDATE.AsDateTime := Int(BankCloseDat.Date);
  ODSIPredRESORTDATE.AsDateTime := int(DateTimePicker2.Date);
  ODSIPredHANDINGACTDATE.AsDateTime := int(DateTimePicker1.Date);
  ODSIPredPLEDGEINSLASTDATE.AsDateTime := int(DateTimePicker6.Date);
  
  ODSIPredYQIYMDATE.AsDateTime := int(DateTimePicker17.Date);
  ODSIPredPAPERREREGDATE.AsDateTime := int(DateTimePicker18.Date);

  ODSIPredAND1.AsDateTime := int(DateTimePicker7.Date);
  ODSIPredAND2.AsDateTime := int(DateTimePicker8.Date);
  ODSIPredAND3.AsDateTime := int(DateTimePicker9.Date);
  ODSIPredAND4.AsDateTime := int(DateTimePicker10.Date);
  ODSIPredALQI1.AsDateTime := int(DateTimePicker11.Date);
  ODSIPredALQI2.AsDateTime := int(DateTimePicker12.Date);

  ODSIPredYMD1.AsDateTime := int(DateTimePicker13.Date);
  ODSIPredYMD2.AsDateTime := int(DateTimePicker14.Date);
  ODSIPredYMD3.AsDateTime := int(DateTimePicker15.Date);
  ODSIPredYMD4.AsDateTime := int(DateTimePicker16.Date);


  OPKIP.CallProcedure('ipAddEditInfo',[ Get_SelectedCrdID
                                       ,ODSIPredCARDID.AsFloat
                                       ,ODSIPredPREDADDRESS.AsString
                                       ,ODSIPredPREDTYPE.AsFloat
                                       ,ODSIPredPREDPLATZ.AsFloat
                                       ,ODSIPredOWNERNAME.AsString
                                       ,ODSIPredPREDCOST.AsFloat
                                       ,ODSIPredPROPLAWNO.AsString
                                       ,ODSIPredPROPLAWREGNO.AsString
                                       ,ODSIPredCONTRACTNO.AsString
                                       ,ODSIPredCONTRACTDATE.AsDateTime
                                       ,ODSIPredCONTRACTNOT.AsString
                                       ,ODSIPredPAPERNO.AsString
                                       ,ODSIPredPAPERDATE.AsDateTime
                                       ,ODSIPredEVALUATER.AsString
                                       ,ODSIPredINSURANCECOMPANY.AsFloat
                                       ,ODSIPredINSURANCEAMOUNT.AsFloat
                                       ,ODSIPredINSURANCENO.AsString
                                       ,ODSIPredINSURANCEDATE.AsDateTime
                                       ,ODSIPredBANKOPENDATE.AsDateTime
                                       ,ODSIPredBANKCLOSEDATE.AsDateTime
                                       ,ODSIPredGIVENFLATAMT.AsFloat
                                       ,ODSIPredHANDINGACTDATE.AsDateTime
                                       ,ODSIPredHANDINGACTNO.AsString
                                       ,ODSIPredRESORTDATE.AsDateTime
                                       ,ODSIPredALEVPREDADDRESS.AsString
                                       ,ODSIPredALEVPREDTYPE.AsFloat
                                       ,ODSIPredALEVPREDPLATZ.AsFloat
                                       ,ODSIPredALEVOWNERNAME.AsString
                                       ,ODSIPredALEVPREDCOST.AsFloat
                                       ,ODSIPredALEVPROPLAWNO.AsString
                                       ,ODSIPredALEVPROPLAWREGNO.AsString
                                       ,ODSIPredALEVCONTRACTNO.AsString
                                       ,ODSIPredALEVCONTRACTDATE.AsDateTime
                                       ,ODSIPredALEVCONTRACTNOT.AsString
                                       ,ODSIPredALEVPAPERNO.AsString
                                       ,ODSIPredALEVPAPERDATE.AsDateTime
                                       ,ODSIPredALEVEVALUATER.AsString
                                       ,ODSIPredALEVINSURANCECOMPANY.AsFloat
                                       ,ODSIPredALEVINSURANCEAMOUNT.AsFloat
                                       ,ODSIPredALEVINSURANCENO.AsString
                                       ,ODSIPredALEVINSURANCEDATE.AsDateTime
                                       ,ODSIPredREGIONID.AsFloat
                                       ,ODSIPredALEVREGIONID.AsFloat
                                       ,ODSIPredPLEDGEINSLASTDATE.AsDateTime
                                       ,ODSIPredYQIYMDATE.AsDateTime
                                       ,ODSIPredPAPERREREGDATE.AsDateTime
                                       ,ODSIPredAND1.AsDateTime
                                       ,ODSIPredAND2.AsDateTime
                                       ,ODSIPredAND3.AsDateTime
                                       ,ODSIPredAND4.AsDateTime
                                       ,ODSIPredALQI1.AsDateTime
                                       ,ODSIPredALQI2.AsDateTime
                                       ,ODSIPredYMD1.AsDateTime
                                       ,ODSIPredYMD2.AsDateTime
                                       ,ODSIPredYMD3.AsDateTime
                                       ,ODSIPredYMD4.AsDateTime
                                       ,ODSIPredPREDAREA.AsString
                                       ,ODSIPredALEVPREDAREA.AsString
                                       ,ODSIPredBUILDID.asInteger
                                       ,ODSIPredPROFITID.asInteger
                                       ,ODSIPredREISTERID.asInteger
]);


end;

procedure TfrmIpPredMain.btnSaveClick(Sender: TObject);
begin
  savechg;
  (Sender as TButton).enabled := False;
  with ODSIPred do begin
    if active then Close;
    SetVariable('creditid', Get_SelectedCrdID);
    Open;
  end;
end;

procedure TfrmIpPredMain.DBEdit1Change(Sender: TObject);
begin
  btnSave.Enabled := True;
end;

procedure TfrmIpPredMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmIPPredMain.edNewNameClick;
var
  ProcName: String;
  i: Integer;
begin

  if (Trim((Sender as TEdit).Text)<>'') and (ord(key)=VK_RETURN) then begin
    if (Sender as TEdit).Left>200 then
      ProcName := 'ipAddIns'
    else
      if top<160 then
        ProcName := 'ipAddType'
      else
        ProcName := 'ipAddQiym';
    OPKIP.CallProcedure(ProcName,[(Sender as TEdit).Text]);
    if (Sender as TEdit).Left<200 then begin  
      if top<160 then
        ODSTypes.Refresh
      else
        ODSQiyms.Refresh;
    end else begin
      ODSInsurances.Refresh;
    end;
    (Sender as TEdit).Visible := False;
    for i:= 0 to ComponentCount-1 do
      if Components[i] is TSpeedButton then
        (Components[i] as TSpeedButton).Enabled := True;
  end;
  if  (ord(key)=VK_RETURN) then begin
    (Sender as TEdit).Visible := False; 
    for i:= 0 to ComponentCount-1 do
      if Components[i] is TSpeedButton then
        (Components[i] as TSpeedButton).Enabled := True;
  end;
end;

procedure TfrmIpPredMain.spbTypesClick(Sender: TObject);
var
  DataSetName: String[30];
  i: Integer;
begin
  DataSetName :=Copy((Sender as TComponent).Name,4,length((Sender as TComponent).Name)-3);
  with edNewName do begin
    Text := '';
    width := 224;
    if DataSetName = 'Types' then begin
      Left := 8;
      top := (Sender as TSpeedButton).Top;
    end else 
    if DataSetName = 'Qiyms' then begin
      Left := 8;
      top := (Sender as TSpeedButton).Top;
    end else begin
      Left := 264;
      top := (Sender as TSpeedButton).Top;
    end;
    Visible := True;
  end;
  for i:= 0 to ComponentCount-1 do
    if Components[i] is TSpeedButton then
      (Components[i] as TSpeedButton).Enabled := False;
end;

procedure TfrmIpPredMain.DBEdit16Click(Sender: TObject);
begin
  ODSIPredINSURANCEDATE.AsDateTime := (Sender as TDateTimePicker).Date;
end;

procedure TfrmIpPredMain.DBEdit13Click(Sender: TObject);
begin
  ODSIPredPAPERDATE.AsDateTime := (Sender as TDateTimePicker).Date;
end;

procedure TfrmIpPredMain.DBEdit11Click(Sender: TObject);
begin
  ODSIPredCONTRACTDATE.AsDateTime := (Sender as TDateTimePicker).Date;
end;

procedure TfrmIpPredMain.Button2Click(Sender: TObject);
begin
  try
    if not assigned(qrpIPYM) then
      qrpIPYM := TqrpIPYM.Create(Self);
  except
    on E: Exception do
      LogError(E.Message);
  end;
  with qrpIPYM, ODSYMInfo do begin
     Close;
     ClearVariables;
     SetVariable('CREDITID',Get_SelectedCrdID);
     Open;
     lbYMStrAmount.Caption := CurrencyToHR_Azeri(ODSYMInfo.FieldByName('YMAMOUNT').AsFloat,2,[0]);
     lbYMStrAmount2.Caption := CurrencyToHR_Azeri(ODSYMInfo.FieldByName('YMAMOUNT').AsFloat,2,[0]);

     if edymdesc.Text<>'' then   begin
     lbDesc1.Caption := edymdesc.Text;
     lbDesc2.Caption := edymdesc.Text; end
     else
      begin
     lbDesc1.Caption := 'Ясас: Тящвил - Тяслим акты № '+ODSIPred.FieldByName('HANDINGACTNO').AsString+', '+
     ODSYMInfo.FieldByName('IPDATE').AsString+' ил'+'; '+'Ипотека каэызы '+ODSIPred.FieldByName('PAPERNO').AsString+', '+
     ODSIPred.FieldByName('PAPERREREGDATE').AsString;

     lbDesc2.Caption := 'Ясас: Тящвил - Тяслим акты № '+ODSIPred.FieldByName('HANDINGACTNO').AsString+', '+
     ODSYMInfo.FieldByName('IPDATE').AsString+'; '+'Ипотека каэызы '+ODSIPred.FieldByName('PAPERNO').AsString+', '+
     ODSIPred.FieldByName('PAPERREREGDATE').AsString;
     end;

     lbNum1.Caption := edymno.Text;
     lbNum2.Caption := edymno.Text;
     Preview;
  end;
end;

procedure TfrmIpPredMain.Button3Click(Sender: TObject);
begin       
  try
    if not assigned(qrpIPYM) then
      qrpIPYM := TqrpIPYM.Create(Self);
  except
    on E: Exception do
      LogError(E.Message);
  end;
  with qrpIPYM, ODSYMInfo do begin
     Close;
     ClearVariables;
     SetVariable('CREDITID',Get_SelectedCrdID);
     Open;
     OPKIP.CallProcedure('tmaddnewticket',[Get_SelectedCrdID, 'Тящвил - Тяслим акты № '+ODSIPred.FieldByName('HANDINGACTNO').AsString+', '+
     ODSYMInfo.FieldByName('IPDATE').AsString+'; '+'Ипотека каэызы '+ODSIPred.FieldByName('PAPERNO').AsString+', '+
     ODSIPred.FieldByName('PAPERREREGDATE').AsString+#13#10+'Ипотека каьызына ясасян ипотека кредитинин йенидян малиййяляшдирилмяси цчцн.']);
  end;
end;

procedure TfrmIpPredMain.edymnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key<48) or (key>57) then key:=0;
end;

procedure TfrmIpPredMain.Button4Click(Sender: TObject);
begin
{
  if not assigned(frmReestr) then
    frmReestr := TfrmReestr.Create(Self);
  frmReestr.ShowModal;
 }

  try
    if not assigned(qrpReestrInfo) then
      qrpReestrInfo := TqrpReestrInfo.Create(Self);
  except
    on E: Exception do
      LogError(E.Message);
  end;
  with qrpReestrInfo, ODSReestrInfo do begin
     Close;
     ClearVariables;
     SetVariable('CREDITID',Get_SelectedCrdID);
     Open;

     lbTitle.Caption := format(fmtTitle,[FieldByName('YMBANK').AsString,
                                         FieldByName('MKBANK').AsString,
                                         DateToStr(date),//FieldByName('').AsString,
                                         '9']);//FieldByName('').AsString]);
     lbNo.Caption := format(fmtNo,[edymno.text]);

     lbN.Caption := CurrencyToHR_Azeri(ODSReestrInfo.FieldByName('NEWFINANCEAMOUNT').AsFloat,2,[0]);
     lbC.Caption := CurrencyToHR_Azeri(ODSReestrInfo.FieldByName('YMAMOUNT').AsFloat,2,[0]);

     Preview;
  end;
end;

procedure TfrmIpPredMain.Button5Click(Sender: TObject);
begin
  with ODSExec do begin
    SetVariable('cid', Get_SelectedCrdID);
    ExecSQL;
  end;       
  with ODSIPred do begin
    if active then Close;
    SetVariable('creditid', Get_SelectedCrdID);
    Open;
  end;
end;

procedure TfrmIpPredMain.Button6Click(Sender: TObject);

var
 index :Integer;
begin
  savechg;

  OPKIP.CallProcedure ( 'ipaddnewcard', [Get_SelectedCrdID] );

  with Panel1,odsipred do
  begin
   Refresh;
   recno:=RecordCount;
   index:=RecordCount;
   TabIndex :=Tabs.Add(Format('Карт №%d', [Index-1]));
  end;

end;

procedure TfrmIpPredMain.Panel1Change(Sender: TObject);
begin
  //
  savechg;
  ODSIPred.RecNo := (Sender as TTabControl).TabIndex+1;
end;

procedure TfrmIpPredMain.Button7Click(Sender: TObject);
var
   Index:integer;
begin
OPKIP.CallProcedure('ipdeletecard',[get_selectedcrdid, ODSIPredCARDID.AsVariant]);
ODSIPred.Refresh;
if Panel1.Tabs.Count=1 then exit;
Panel1.Tabs.Clear;
for Index := 0 to ODSIPred.RecordCount-1 do
panel1.Tabs.Add(Format('Карт №%d', [Index]));

end;

procedure TfrmIpPredMain.ODSIPredAfterOpen(DataSet: TDataSet);
var index: integer;
begin
   with DataSet, Panel1 do
  begin
    Tabs.Clear;
    for Index := 0 to RecordCount-1 do
      Tabs.Add(Format('Карт №%d', [Index]));
    if recordcount=0 then tabs.Add ((Format('Карт №%d', [0]))) ;
    First;
  end;


end;

procedure TfrmIpPredMain.PageControl1Change(Sender: TObject);
begin
  ODSIPred.RecNo := 1;
  Panel1.TabIndex := 0;
end;

initialization
  frmIpPredMain := TfrmIpPredMain.Create(CommonApplication);

end.
