unit UCProperty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PCPropertyBlank_TLB, StdVcl,SBPlgAx50_TLB, ExtCtrls,
  StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, OracleData, Oracle,
  INSWordExporter, PlgModalContainer;

const
     WM_ModalResult = WM_USER+139;

type
  TCProperty = class(TActiveForm, ICProperty,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    ConstructionPageControl: TPageControl;
    SECTION1: TTabSheet;
    DatailsGroupBox: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    InsLookupComboBox: TDBLookupComboBox;
    SECTION23: TTabSheet;
    SecurityGroupBox: TGroupBox;
    SECTION4: TTabSheet;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    ConstYearDateTimePicker: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    SECTION5: TTabSheet;
    CoverGroupBox: TGroupBox;
    Label17: TLabel;
    DBLookupComboBoxRisk: TDBLookupComboBox;
    btRisksAdd: TBitBtn;
    memRisk: TMemo;
    cbRisks: TCheckBox;
    LossOfProfitGroupBox: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ERent: TDBEdit;
    EAnnual: TDBEdit;
    EWages: TDBEdit;
    EEmploy: TDBEdit;
    EIndeminity: TDBEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label39: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBComboBox5: TDBComboBox;
    Panel1: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    Report: TBitBtn;
    Suggest: TBitBtn;
    btApply: TBitBtn;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label33: TLabel;
    AgentLookupComboBox: TDBLookupComboBox;
    CPropertyExporter: TINSWordExporter;
    plgSuggest: TPlgModalContainer;
    Panel6: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    edBeginDate: TDateTimePicker;
    edIns_Date: TDateTimePicker;
    edEndDate: TDateTimePicker;
    rbBank: TRadioButton;
    rbBeneficiary: TRadioButton;
    dbBeneficiary: TDBEdit;
    DBBanks: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    lbInsSumm: TLabel;
    lbFranshiz: TLabel;
    SpeedButton7: TSpeedButton;
    dbAvalute: TDBLookupComboBox;
    edInsSumm: TDBEdit;
    edFranshiz: TDBComboBox;
    edAmmount: TDBEdit;
    Label44: TLabel;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    ESpecify: TDBEdit;
    EHeat: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBMemo1: TDBMemo;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label2: TLabel;
    DBComboBox12: TDBComboBox;
    DBComboBox13: TDBComboBox;
    Label3: TLabel;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    FulDescrip: TDBEdit;
    YearsInBus: TDBEdit;
    ExpirityDateTimePicker: TDateTimePicker;
    DBEdit2: TDBEdit;
    Label45: TLabel;
    DBEdit22: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    lbTariff: TLabel;
    edTariff: TDBEdit;
    Label8: TLabel;
    Label48: TLabel;
    btPolicy: TBitBtn;
    DBEdit25: TDBEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ConstructionPageControlChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure InsLookupComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure CommitClick(Sender: TObject);
    procedure btRisksAddClick(Sender: TObject);
    procedure InsLookupComboBoxClick(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure SuggestClick(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure btPolicyClick(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FOwnerHandle : Integer;
    FEvents: ICPropertyEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function SaveData():boolean;
    procedure LoadData;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;

    function  Get_Owner:Integer; safecall;
    procedure Set_Owner(val : Integer);  safecall;
    {IParamInput}
    function  Get_Params(const Name: WideString): OleVariant; safecall;
    procedure Set_Params(const Name: WideString; Value: OleVariant); safecall;
    property Params[const Name: WideString]: OleVariant read Get_Params write Set_Params;
    {IInstance}
    function InstanceInitialize: HResult; safecall;
    function IUIObject.Initialize = InstanceInitialize;
    function Cleanup: HResult; safecall;
    {IUIObject}
//    function  Get_Icon: OLE_HANDLE; safecall;
    function UIObjectActivate: HResult; safecall;
    function IUIObject.Activate = UIObjectActivate;
    function QueryDeactivate: HResult; safecall;
    function UIObjectDeactivate: HResult; safecall;
    function IUIObject.Deactivate = UIObjectDeactivate;
    function SaveState: HResult; safecall;
    function  Get_Height : Integer; safecall;
    function  Get_Width  : Integer; safecall;

  public
    { Public declarations }
    CID : Integer;
    procedure Initialize; override;
  end;

var
    CProperty:TCProperty;
implementation

uses ComObj, ComServ,sboapidatamoduleimpl, URisks, UDModule;

{$R *.DFM}

{ TCProperty }

procedure TCProperty.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CPropertyPage); }
end;

procedure TCProperty.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICPropertyEvents;
end;

procedure TCProperty.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TCProperty.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCProperty.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCProperty.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCProperty.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCProperty.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCProperty.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCProperty.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCProperty.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCProperty.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCProperty.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCProperty.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCProperty.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCProperty.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCProperty.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCProperty.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCProperty.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCProperty.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCProperty.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCProperty._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCProperty.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCProperty.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCProperty.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCProperty.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCProperty.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCProperty.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCProperty.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCProperty.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCProperty.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCProperty.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCProperty.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCProperty.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCProperty.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCProperty.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCProperty.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCProperty.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCProperty.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCProperty.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCProperty.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCProperty.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCProperty.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCProperty.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCProperty.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCProperty.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TCProperty.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TCProperty.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TCProperty.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TCProperty.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TCProperty.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TCProperty.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TCProperty.UIObjectActivate: HResult;
begin
       CID := Get_Params('ÑID');
       //ShowMessage(IntToStr(cid));
       with DModule do
       begin
            ODSCProperty.SetVariable('CID', CID);
            ODSCProperty.Open;

            ODSContracts.SetVariable('CID', CID);
            ODSContracts.Open;

            ODSCustomers.Locate('id',ODSContractsKli_ID.Value,[]);
       end;
       if  Get_Params('Mod') = 'Insert' then
       begin
           with DModule do
           begin
                ODSContracts.Insert;
                ODSCProperty.Insert;
                edBeginDate.DateTime := Now;
                edEndDate.DateTime := Now;
                InsLookupComboBox.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
                ODSContracts.FieldByName('KLI_ID').AsInteger :=StrToInt(Get_Params('KLI_ID'));
           end;
       end;
       if Get_Params('Mod')='Edit' then
       begin
         with DModule, ODSContracts do
         begin
              LoadData;
              ODSCProperty.Edit;
              ODSContracts.Edit;
              //edIns_Date.DateTime := fieldByName('INS_DATE').asDateTime;
              edBeginDate.DateTime := fieldByName('BEGIN_DATE').asDateTime;
              edEndDate.DateTime := fieldByName('END_DATE').asDateTime;
              rbBank.Checked := FieldByName('ben_id').asInteger = 0;
              rbBeneficiary.Checked := FieldByName('ben_id').asInteger = 1;
         end;
          //Suggest.Enabled:=true;
          Report.Enabled:=true;
       end;
       Result := S_OK;
end;

function TCProperty.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TCProperty.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TCProperty.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TCProperty.Get_Height : Integer;
begin
  Result := Height;
end;

function  TCProperty.Get_Width  : Integer;
begin
  Result := Width;
end;


procedure TCProperty.ActiveFormCreate(Sender: TObject);
begin
    CProperty:=Self;
    FParams := TStringList.Create;
    DModule:=TDModule.Create(Self);
    Back.Enabled:=false;
end;

procedure TCProperty.ConstructionPageControlChange(Sender: TObject);
begin
      with ConstructionPageControl do
      begin
          if ActivePageIndex<>PageCount-1 then Next.Enabled:=true else Next.Enabled:=false;
          if ActivepageIndex<>0 then Back.Enabled:=true else Back.Enabled:=false;
      end;
end;

procedure TCProperty.BitBtn2Click(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TCProperty.InsLookupComboBoxKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TCProperty.BackClick(Sender: TObject);
begin
     with ConstructionPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
          Next.Enabled:=true;
     end;
end;

procedure TCProperty.NextClick(Sender: TObject);
begin
      ConstructionPageControl.ActivePageIndex:= ConstructionPageControl.ActivePageIndex+1;
      if ConstructionPageControl.ActivePageIndex=ConstructionPageControl.PageCount-1 then
      Next.Enabled:=false;
      Back.Enabled:=true;
end;

function TCProperty.SaveData: boolean; 
begin
       Result:=false;
      if   cbRisks.State = cbChecked then
      with DModule.ODSRisks do
      begin
           Insert;
           FieldByName('name').asString := memRisk.Text;
           Post;
           RefreshRecord;
      end;

     with DModule, ODSContracts do
     if State in [dsEdit, dsInsert] then
     begin
        FieldByName('AGENT_ID').AsFloat := ODSAgentID.value;
        FieldByName('Ins_Date').AsDateTime := Integer(trunc(edIns_Date.Date));
        FieldByName('Begin_Date').AsDateTime := Integer(trunc(edBeginDate.Date));
        FieldByName('End_Date').AsDateTime := Integer(trunc(edEndDate.Date));
     //   FieldByName('ben_id').asInteger := Integer(not rbBank.Checked);
        Post;
        RefreshRecord;
        CID := FieldByName('id').asInteger;
        Edit;
     end;
     with DModule,ODSCProperty do
     begin
          if State in [dsInsert,dsEdit] then
          begin
             //ODSCPropertyKli_ID.Value:= InsLookupComboBox.KeyValue;
             ODSBanks.Locate('name',DBBanks.KeyValue,[]);
             ODSCPropertyBank_Id.Value:=ODSBanksID.Value;
             FieldByName('riskid').AsInteger := ODSRisks.FieldByName('id').AsInteger;
             FieldByName('ConstYear').AsDateTime:=ConstYearDateTimePicker.Date;
             FieldByName('Expirity').AsDateTime:=ExpirityDateTimePicker.Date;
             FieldByName('CID').AsInteger := CID;
             Post;
             RefreshRecord;
             ODSContracts.Edit;
             ODSContractsAmmount.Value:=ODSCPropertyAmmount.Value;
             ODSContractsTariff.Value:=ODSCPropertyTariff.Value;
             ODSContractsInssumm.Value:=ODSCPropertyInssumm.Value;
             ODSContracts.Post;
             ODSContracts.RefreshRecord;
           //  OPCommon.CallIntegerFunction('newinsurance',[5,ODSCPropertyID.Value,edBeginDate.DateTime,edEndDate.DateTime,ODSCPropertyKLI_ID.Value]);
         end;
      end;
      Result:=true;
end;

procedure TCProperty.btApplyClick(Sender: TObject);
begin
     if SaveData() then
     begin
        Report.Enabled:=true;
        Suggest.Enabled:=true;
        btApply.Enabled:=false;
     end;
end;

procedure TCProperty.CommitClick(Sender: TObject);
begin
     if SaveData() then
     PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TCProperty.LoadData;
begin
    with DModule,ODSCProperty do
    begin
         ConstYearDateTimePicker.Date:= FieldByName('ConstYear').AsDateTime;
         ExpirityDateTimePicker.Date:= FieldByName('Expirity').AsDateTime;
    end;
end;

procedure TCProperty.btRisksAddClick(Sender: TObject);
begin
    DModule.ODSRisktype.Open;
    with TRiskForm.Create(Self) do
    ShowModal;
    if memRisk.Text <> '' then
    cbRisks.State := cbChecked;
    DModule.ODSRisktype.Close;
end;

procedure TCProperty.InsLookupComboBoxClick(Sender: TObject);
begin
     btApply.Enabled:=True;
end;

procedure TCProperty.ReportClick(Sender: TObject);
begin
     with DModule do
     begin
     ODSContracts.Close;
     ODSContracts.SetVariable('cid',cid);
     ODSContracts.Open;
     ODSCustomers.Locate('id',ODSContractsKLI_ID.Value,[]);
     ODSBeneficiary.Locate('id',ODSCPropertyProfitID.Value,[]);
     ODSRisks.Locate('id',ODSCPropertyRiskID.Value,[]);
     try
        with CPropertyExporter do
        begin
             FileName:=ExtractFilePath(Application.ExeName)+ '\CPropertyppl.doc';
             Open(False);
             {SetBookmark('Insured',ODSCustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('AInsured',ODSCustomersAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('TInsured',ODSCustomersMobilePhone.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('FInsured',ODSCustomersFax.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RPeriod',DateToStr(ODSContractsBegin_Date.value)+' - '+DateToStr(ODSContractsEnd_Date.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Beneficiary',ODSBeneficiaryName.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BAddress',ODSBeneficiaryAddress.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BTel',ODSBeneficiaryPhone.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BBank',ODSBeneficiaryBanking_details.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('FullDesc',ODSCPropertyFullDescription.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Location',ODSCPropertyLocationObj.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Yearsinb',ODSCPropertyYEARSINBUSINESS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('CPerson',ODSCustomersContactPerson.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('TCPerson',ODSCustomersContactPersonPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('BUsage',ODSCPropertyBuildingusage.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('YearConst',DateToStr(ODSCPropertyconstyear.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('FloorsNum',IntToStr(ODSCPropertyFloorsNum.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('WallsM',ODSCPropertyWallsM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('CeilingsM',ODSCPropertyCeilingsM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RoofM',ODSCPropertyRoofM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Area',FloatToStr(ODSCPropertyArea.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('AppArea',FloatToStr(ODSCPropertyApplicantSpace.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Earthquake',ODSCPropertyEARTHQUAKEDETAILS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Flamable',ODSCPropertyFlamable.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Surroinding',ODSCPropertySURROINDINGDETAILS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Situeted',ODSCPropertySitueted.value, false, false, False, false, 8, 'Arial AzLat', False); }
             if ODSCPropertyGuard.IsNull then
                SetBookmark('Issecure','Õåéð', false, false, False, false, 8, 'Arial AzLat', False)
             else
                SetBookmark('Issecure','Áÿëè', false, false, False, false, 8, 'Arial AzLat', False);
            { SetBookmark('Alarm',ODSCPropertyAlarm.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Locks',ODSCPropertyLocks.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('SLocks',ODSCPropertySecurityLocks.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Bars',ODSCPropertyBars.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Other',ODSCPropertyOther.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Settings',ODSCPropertySettings.value, false, false, False, false, 8, 'Arial AzLat', False);    }
             if not(ODSCPropertyRepair.IsNull) then
             SetBookmark('Repair','Áÿëè', false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RepairDetail',ODSCPropertyRepair.value, false, false, False, false, 8, 'Arial AzLat', False);
             {SetBookmark('Heated',ODSCPropertyHeated.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('ValueType',ODSCPropertyValueType.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Risks',ODSRisksName.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Buildings',floatToStr(ODSCPropertyBuildings.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Contents',floatToStr(ODSCPropertyContent.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Equipments',floatToStr(ODSCPropertyEquipment.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Glass',floatToStr(ODSCPropertyGlass.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Cash',floatToStr(ODSCPropertyCash.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Warehouse',floatToStr(ODSCPropertyWarehouse.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Stock',floatToStr(ODSCPropertyStock.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Products',floatToStr(ODSCPropertyProducts.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('WProqress',floatToStr(ODSCPropertyWorkinprogress.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Raw',floatToStr(ODSCPropertyRawmaterials.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Annual',floatToStr(ODSCPropertyAnnual.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Wages',floatToStr(ODSCPropertyWages.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Rent',floatToStr(ODSCPropertyRent.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Employes',floatToStr(ODSCPropertyEmployes.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Indeminity',ODSCPropertyIndeminity.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Expirity',DateToStr(ODSCPropertyExpirity.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('LHistory',ODSCPropertyLossHistory.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('OtherInf',ODSCPropertyRenewal.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Thirdp',ODSCPropertyThirdParty.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('OtherInform',ODSCPropertyOtherInf.value, false, false, False, false, 8, 'Arial AzLat', False); }
         end;
     finally
        CPropertyExporter.Show;
     end;
     end;
end;

procedure TCProperty.SuggestClick(Sender: TObject);
var
   p : TStringList;
begin
    p:= TStringList.Create;
    p.Values['ID']:=IntToStr(cid);
    with plgSuggest do
         ShowModal(StringToGuid('{3918AA1B-6A5D-4559-8F6E-826F4E72F309}'),p );
    p.Free;

end;

procedure TCProperty.edBeginDateChange(Sender: TObject);
begin  
     btApply.Enabled:=True;
end;

procedure TCProperty.SpeedButton7Click(Sender: TObject);
begin
     edAmmount.SetFocus;
     with DModule, ODSCProperty do
     begin
          FieldByName('AMMOUNT').asFloat :=
                round((FieldByName('INSSUMM').asFloat / 100) * FieldByName('TARIFF').asFloat);
     end;
end;

procedure TCProperty.DBLookupComboBox1Click(Sender: TObject);
begin
   with DModule,ODSCProperty do
   edEndDate.DateTime :=
       IncMonth(edBeginDate.DateTime,ODSMonths.fieldbyname('COUNT').asInteger);
end;

procedure TCProperty.btPolicyClick(Sender: TObject);
var
   p : TStringList;
begin
   p:= TStringList.Create; 
   p.Values['CID']:=IntToStr(cid);
   with PLGSuggest do begin
     ShowModal(StringToGuid('{0F2A35A4-7A65-4085-BED1-BDCBC55C5836}'),p );
   end;
   p.Free;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCProperty,
    Class_CProperty,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
