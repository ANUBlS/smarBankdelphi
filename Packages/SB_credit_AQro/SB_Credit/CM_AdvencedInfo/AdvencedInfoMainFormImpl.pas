unit AdvencedInfoMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Mask, DBCtrlsEh,
  DBLookupEh, ActnList,DB, ImgList;

type
  TAdvInfoForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    GroupBox2: TGroupBox;
    DBText2: TDBText;
    Panel3: TPanel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Bancruptey_rg: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    DBEditEh1: TDBEditEh;
    Label4: TLabel;
    DBEditEh2: TDBEditEh;
    Panel6: TPanel;
    Label5: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Panel9: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Panel10: TPanel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Panel11: TPanel;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    InUse_rg: TRadioGroup;
    Panel12: TPanel;
    Label19: TLabel;
    DBMemo1: TDBMemo;
    Panel13: TPanel;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Panel14: TPanel;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    SaveChanges: TAction;
    DismisChanges: TAction;
    ImageList1: TImageList;
    TabSheet3: TTabSheet;
    Panel15: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Panel16: TPanel;
    Label24: TLabel;
    DBEdit13: TDBEdit;
    Label25: TLabel;
    DBEditEh3: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bancruptey_rgClick(Sender: TObject);
    procedure InUse_rgClick(Sender: TObject);
    procedure DismisChangesExecute(Sender: TObject);
    procedure SaveChangesExecute(Sender: TObject);
    procedure SaveChangesUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FBlnCircular : Boolean;
  public
    procedure DoEditAdvencedInfo;
    procedure SaveState;
    { Public declarations }
  end;

var
  AdvInfoForm: TAdvInfoForm;

procedure InitPlugin(Param : String);export;
procedure GetIcon(Param : PChar;Icon : TIcon); export;

implementation

uses
  AdvancedInfoDataModuleImpl ,CommonDecls ,SystemState,
  CMOracleAPIDataModuleImpl;

{$R *.DFM}

procedure TAdvInfoForm.FormCreate(Sender: TObject);
begin
  AdvInfoDataModule := TAdvInfoDataModule.Create(Self);
end;

procedure TAdvInfoForm.FormDestroy(Sender: TObject);
begin
  AdvInfoDataModule.Free;
end;

procedure TAdvInfoForm.DoEditAdvencedInfo;

resourcestring
   SFormCaption = '%s номр€ли мцгавил€ щаггында €лав€ информасийа.';

var
  CrdID : Integer;
  CrdNumber : String;
begin
  CrdID := Get_SelectedCrdID;
  CrdNumber := Get_SelectedCrdNo;

  NLSLocalizer1.Caption := Format(SFormCaption,[CrdNumber]);

  with AdvInfoDataModule.AddInfo do
  begin
    if Active then CloseAll;
    ClearVariables;
    SetVariable('CreditID',CrdID);
    Open;
    Edit;
    FBlnCircular := True;
    Bancruptey_rg.ItemIndex := FieldByName('BANKRUPTEYSTATUS').AsInteger;
    InUse_rg.ItemIndex := FieldByName('PLEDGEINUSE').AsInteger;
    FBlnCircular := False;    
    ShowModal;
  end;
end;


procedure TAdvInfoForm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  DBLookupComboboxEh1.SetFocus;
end;

procedure TAdvInfoForm.Bancruptey_rgClick(Sender: TObject);
begin
  if not FBlnCircular then
  with AdvInfoDataModule.AddInfo do
  FieldByName('BANKRUPTEYSTATUS').AsInteger := Bancruptey_rg.ItemIndex;
end;

procedure TAdvInfoForm.InUse_rgClick(Sender: TObject);
begin
  if not FBlnCircular then
  with AdvInfoDataModule.AddInfo do
  FieldByName('PLEDGEINUSE').AsInteger := InUse_rg.ItemIndex;
end;

procedure TAdvInfoForm.DismisChangesExecute(Sender: TObject);
begin
  with AdvInfoDataModule.AddInfo do
  if dsEdit in [State] then
  begin
    Cancel;
    Self.Close;
  end;
end;

procedure TAdvInfoForm.SaveChangesExecute(Sender: TObject);
begin
  SaveState;
  with AdvInfoDataModule.AddInfo do
  if dsEdit in [State] then
  begin
    Post;
    Self.Close;
  end;
end;

procedure TAdvInfoForm.SaveChangesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := AdvInfoDataModule.AddInfo.Modified;
end;

procedure TAdvInfoForm.SaveState;
begin
  with AdvInfoDataModule , AddInfo ,AdvInfo do
  begin
    ID := FieldByName('ID').AsInteger;
    BOOROWERID := FieldByName('BOOROWERID').AsString;
    NAME := FieldByName('NAME').AsString;
    COUNTRYCODE := FieldByName('COUNTRYCODE').AsString;
    BANKRUPTEYSTATUS := FieldByName('BANKRUPTEYSTATUS').AsString;
    PHONENUMBER := FieldByName('PHONENUMBER').AsString;
    ADDRESS := FieldByName('ADDRESS').AsString;
    FIRSTOWNERID := FieldByName('FIRSTOWNERID').AsString;
    FIRSTOWNERNAME := FieldByName('FIRSTOWNERNAME').AsString;
    SECONDOWNERID := FieldByName('SECONDOWNERID').AsString;
    SECONDOWNERNAME := FieldByName('SECONDOWNERNAME').AsString;
    THIRDOWNERID := FieldByName('THIRDOWNERID').AsString;
    THIRDOWNERNAME := FieldByName('THIRDOWNERNAME').AsString;
    PLEDGENAME := FieldByName('PLEDGENAME').AsString;
    HOLDERNAME := FieldByName('HOLDERNAME').AsString;
    HOLDERADDRESS := FieldByName('HOLDERADDRESS').AsString;
    ANYINFOTODISTING := FieldByName('ANYINFOTODISTING').AsString;
    REGISTRYNO := FieldByName('REGISTRYNO').AsString;
    REGISTRYAGENCY := FieldByName('REGISTRYAGENCY').AsString;
    REGISTRYDATE := FieldByName('REGISTRYDATE').AsDateTime;
    PLEDGEINUSE := FieldByName('PLEDGEINUSE').AsInteger;
    PLEDGEINSURANT := FieldByName('PLEDGEINSURANT').AsInteger;
    INSURANCEAGENCY := FieldByName('INSURANCEAGENCY').AsString;
    INSURANCEAMOUNT := FieldByName('INSURANCEAMOUNT').AsInteger;
    INSURANCEDATE := FieldByName('INSURANCEDATE').AsDateTime;
  end;
end;

procedure TAdvInfoForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=
     (not AdvInfoDataModule.AddInfo.Modified)
      or (
     MessageDlg('ƒ€йишикл€р гейд олунмайажаг !'+#13+'яминсиниз?'
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrYes);
end;

procedure TAdvInfoForm.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    2 :
      with PageControl1 do
      if ActivePageIndex = 0 then
      begin
        ActivePageIndex := 1;
        DBEdit8.SetFocus
      end;
  end;  //Case
    Key := #0;
  end;
end;

procedure TAdvInfoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Close; 
end;

procedure InitPlugin(Param : String);
begin
  AdvInfoForm.DoEditAdvencedInfo;
end;

procedure GetIcon(Param : PChar;Icon : TIcon); export;
begin
  AdvInfoForm.ImageList1.GetIcon(0,Icon);
end;

exports
  GetIcon,InitPlugin;

initialization
  AdvInfoForm := TAdvInfoForm.Create(CommonApplication);

end.
