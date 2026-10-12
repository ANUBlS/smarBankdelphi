unit frmDepositContract_new_Impl;
         {ClientTypes}
interface
      //GenAnnualInt
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, CMDBSearchEdit, ComCtrls,
  DBCtrls, Buttons, HintBox, DB,variants, DBGridEh;

type
  TfrmDepositContract_new = class(TForm)
    Panel1: TPanel;
    RefreshListLbl: TLabel;
    Label13: TLabel;
    Lbluser: TLabel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    ContractHint: THintBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel17: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    ContractTypes: TDBLookupComboboxEh;
    Panel43: TPanel;
    Label98: TLabel;
    Label99: TLabel;
    Label3: TLabel;
    LCBPeriods: TDBLookupComboboxEh;
    LCBCapPer: TDBLookupComboboxEh;
    Panel15: TPanel;
    Label16: TLabel;
    Label22: TLabel;
    DBLCBValutes: TDBLookupComboboxEh;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DTO: TDBDateTimeEditEh;
    Panel7: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Panel13: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    DBEditEh3: TDBEditEh;
    Panel11: TPanel;
    Label4: TLabel;
    DBNumberEditEh3: TDBNumberEditEh;
    Panel18: TPanel;
    Label17: TLabel;
    DBEditEh2: TDBEditEh;
    Panel10: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Panel16: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Panel12: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    DBNumberEditeh: TDBNumberEditEh;
    Panel14: TPanel;
    Panel26: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    StaticText1: TStaticText;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Panel25: TPanel;
    Label30: TLabel;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    StaticText2: TStaticText;
    CMSearchEdit1: TCMSearchEdit;
    Panel24: TPanel;
    StaticText3: TStaticText;
    CMSearchEdit2: TCMSearchEdit;
    DBLookupComboboxEh10: TDBLookupComboboxEh;
    Panel23: TPanel;
    CMSearchEdit3: TCMSearchEdit;
    DBLookupComboboxEh11: TDBLookupComboboxEh;
    StaticText4: TStaticText;
    Panel20: TPanel;
    StaticText5: TStaticText;
    CMSearchEdit4: TCMSearchEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel19: TPanel;
    Label31: TLabel;
    Label29: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    ChAutopr: TCheckBox;
    Panel4: TPanel;
    Label5: TLabel;
    Label32: TLabel;
    DBLCBFilial: TDBLookupComboboxEh;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEditEh1: TDBEditEh;
    Panel8: TPanel;
    CMSearchEdit5: TCMSearchEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    StaticText6: TStaticText;
    CBCategories: TDBLookupComboboxEh;
    CBPersons: TDBLookupComboboxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBLookupComboboxEh9KeyValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBFilialKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshListLblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ContractTypesKeyPress(Sender: TObject; var Key: Char);
    procedure LCBCapPerKeyPress(Sender: TObject; var Key: Char);
    procedure LCBPeriodsKeyValueChanged(Sender: TObject);
    procedure ContractTypesKeyValueChanged(Sender: TObject);
    procedure LCBPeriodsChange(Sender: TObject);
    procedure LCBCapPerChange(Sender: TObject);
    procedure DBNumberEditehKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh11KeyValueChanged(Sender: TObject);
    procedure DBLookupComboboxEh2KeyValueChanged(Sender: TObject);
    procedure CBCategories1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure AddContract;
    function New:Integer;
    procedure EditContract;
    function Edit:Integer;
    procedure SaveDeposits;
    procedure SaveState(Save :Boolean);
    procedure RefreshAllDeposits;
    procedure CheckNeedsFields;
    procedure GenAnnualInt;
  public
    FInserted,
    FCommited,
    FEdited:Boolean;
    procedure ShowAccounts;
  end;

var
  frmDepositContract_new: TfrmDepositContract_new;
  OIntRate,DIntRate:real;
  IntRate:string;
  procedure exportproc(S:String);export;
implementation

{$R *.dfm}
  uses dmDepositContract_new_Impl,
     ContractCommonDecls_new,
     NewCommonDeclsImpl,
     SBTranslateProc,
     sboapiDataModuleimpl;

     procedure TfrmDepositContract_new.GenAnnualInt;
var DepositID,CurrencyID ,PeriodID,CapitalperID:Integer;
    CheckSett,R :Boolean;
    Amount:real;
begin
   with dmDepositContract_new,sbcm_contract,DepositPorps do
   begin

   DepositID := ContractTypes.ListSource.DataSet.FieldByName('ID').AsInteger;
   CurrencyID := DBLCBValutes.ListSource.DataSet.FieldByName('valute').AsInteger;
   PeriodID := LCBPeriods.ListSource.DataSet.FieldByName('ID').AsInteger;
   CapitalperID := LCBCapPer.ListSource.DataSet.FieldByName('ID').AsInteger;
   Amount:=DBNumberEditEh.Value;

     IntRate  := FieldByName('INTEREST').AsString;
     OIntRate := FieldByName('OVERDUEINTEREST').AsFloat;
     DIntRate := FieldByName('DUEINTEREST').AsFloat;

       if (ContractTypes.KeyValue <> null) and
          (DBLCBValutes.KeyValue <> null) and
          (LCBPeriods.KeyValue <> null) and
          (LCBCapPer.KeyValue <> null)  then
       begin

        FieldByName('INTEREST').AsString := CallFloatFunction('Get_DefaultContractRate',
                            [ 'p_DepositType',DepositID,
                              'p_Currency',CurrencyID,
                              'p_periodID',PeriodID,
                              'p_CapitalperID',CapitalperID,
                              'p_Amount',Amount,
                              'p_defint',True,
                              'p_defUntimeint',false]);

        FieldByName('OVERDUEINTEREST').AsFloat := CallFloatFunction('Get_DefaultContractRate',
                            [ 'p_DepositType',DepositID,
                              'p_Currency',CurrencyID,
                              'p_periodID',PeriodID,
                              'p_CapitalperID',CapitalperID,
                              'p_Amount',Amount,
                              'p_defint',false,
                              'p_defUntimeint',true]);

        FieldByName('DUEINTEREST').AsFloat := CallFloatFunction('Get_DefaultContractRate',
                            [ 'p_DepositType',DepositID,
                              'p_Currency',CurrencyID,
                              'p_periodID',PeriodID,
                              'p_CapitalperID',CapitalperID,
                              'p_Amount',Amount,
                              'p_defint',false,
                              'p_defUntimeint',false]);

     //  r := CallBooleanFunction('CheckDTForSF',['DT',DepositID]);
      end ;

   end;


  // DBNumberEditEh2.ReadOnly := r;
  // DBNumberEditEh3.ReadOnly := r;
  // DBEditEh2.ReadOnly := r;

end;

procedure TfrmDepositContract_new.LCBCapPerChange(Sender: TObject);

var period:integer;
begin
  period := LCBCapPer.ListSource.DataSet.FieldByName('period').AsInteger;
  IF period>0 then
   with dmDepositContract_new,DepositPorps do
   FieldByName('FIRSTINTERESTPAYDAT').AsDateTime := IncMonth(FieldByName('OpenDate').AsDateTime,period div 30)
  ELSE
   with dmDepositContract_new,DepositPorps do
   FieldByName('FIRSTINTERESTPAYDAT').AsDateTime := IncMonth(FieldByName('OpenDate').AsDateTime,period)
end;

procedure TfrmDepositContract_new.LCBCapPerKeyPress(Sender: TObject;
  var Key: Char);
begin
ContractTypesKeyPress(Sender,key);
end;

procedure TfrmDepositContract_new.LCBPeriodsChange(Sender: TObject);
var period:integer;
period_type:string;
begin
  period := LCBPeriods.ListSource.DataSet.FieldByName('period').AsInteger;
  period_type := LCBPeriods.ListSource.DataSet.FieldByName('period_type').AsString;
  with dmDepositContract_new,DepositPorps,sbcm_contract do
  begin
  if period_type='Ay' then         ////ayla
    begin
     FieldByName('Closedate').AsDateTime := IncMonth(FieldByName('OpenDate').AsDateTime,period);
   //else
             ////gun
     //FieldByName('Closedate').AsDateTime :='null';
   end;

   if period_type='Gün' then
   begin
    FieldByName('Closedate').AsDateTime := FieldByName('OpenDate').AsDateTime + period;
     //showmessage('salam');
   end;

   if period = 0 then
   DBDateTimeEditEh2.Enabled := false
   else
   DBDateTimeEditEh2.Enabled := true;
  end;
end;

procedure TfrmDepositContract_new.LCBPeriodsKeyValueChanged(Sender: TObject);
begin
if LCBPeriods.KeyValue = null
then
 dmDepositContract_new.DepCapperiod.CloseAll
else
begin
  dmDepositContract_new.DepCapperiod.CloseAll;
  dmDepositContract_new.DepCapperiod.open;
end;
end;

procedure TfrmDepositContract_new.BitBtnCancelClick(Sender: TObject);
begin
SaveState(False)
end;

procedure TfrmDepositContract_new.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmDepositContract_new.BitBtnOkClick(Sender: TObject);
begin
   CheckNeedsFields;
   SaveDeposits;
   SaveState(True);
   FCommited := True;
end;

procedure TfrmDepositContract_new.CBCategories1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  if Sender is TWinControl then
  with Sender as TWinControl do

  begin
  case Tag of
    1,3 : SelectNext(Sender as TWinControl ,True ,True);
    2 :DBLCBValutes.SetFocus;
  end;
   Key := #0;
  end;
end;

procedure TfrmDepositContract_new.CheckNeedsFields;
  const
    sDefEmptyFieldMessage = '"%s" sahəsinə qiymət daxil olunmayıb! ';

    procedure ShowMessage(const Message: String);
    begin
      ContractHint.ShowMessage(Message);
      Abort;
    end;

    procedure Check(
      Field: TField;
      Message: String = sDefEmptyFieldMessage;
      FieldName: String = '');
    begin
      if Field.IsNull  then
      begin
        if FieldName = '' then
          FieldName := Field.DisplayName;
        Message := Format(Message, [FieldName]);
        ShowMessage(Message);
      end;
    end;

    procedure CheckByName(const FieldName: String);
    begin
      with dmDepositContract_new.DepositPorps do
        Check(FieldByName(FieldName));
    end;

    procedure CheckByNames(const Names: array of String);
    var
      Index: Integer;
    begin
      for Index := Low(Names) to High(Names) do
        CheckByName(Names[Index]);
    end;

  begin
    CheckByNames(['BRANCHID', 'CONTRACTNO', 'OPENDATE', 'CLOSEDATE', 'INTEREST','OVERDUEINTEREST',
                   'CONTRACTTYPE','CLIENTTYPE','PERSONALTYPE','CURRENCY','AMOUNT','CUSTOMERID']);
    with dmDepositContract_new,DepositPorps,sbcm_contract do
    begin

       if FieldByName('ContractAccID').AsInteger = 0 then ShowMessage('Depozit Hesabı sahəsinə qiymət daxil olunmayıb! ');
       if FieldByName('InterestAccID').AsInteger = 0 then ShowMessage('Faizlər Hesabı sahəsinə qiymət daxil olunmayıb! ');
       if FieldByName('ClientAccID').AsInteger   = 0 then ShowMessage('Müştəri Hesabı sahəsinə qiymət daxil olunmayıb! ');
       if FieldByName('Booroweraccid').AsInteger = 0 then ShowMessage('Köçürmə Hesabı sahəsinə qiymət daxil olunmayıb! ');

       if not CallBooleanFunction('Check_BankAccount',['p_categoryID',FieldByName('ClientType').AsInteger,
                                                       'p_currencyID',FieldByName('CURRENCY').AsInteger,
                                                       'p_BranchID',FieldByName('BRANCHID').AsInteger]) then
       ShowMessage('Bu tip müqaviləyə "depozitlərdə  faizlər üçün məxaric hesabı" sazlanılmayıb! ');

  with dmDepositContract_new,DepositTypes1 do
    begin
    if DepositTypes1.FieldByName('WITHDRAWTYPE').AsString='BefoPercent'   then

 if DepositPorps.FieldByName('BEFO_INTERESTPEYTACCID').AsInteger = 0 then ShowMessage('Faizlərin əvvəlcədən ödənməsi hesabı sahəsinə qiymət daxil olunmayıb! ');
        exit;
    end;
    end;
   end;

   procedure TfrmDepositContract_new.ContractTypesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  GenAnnualInt;
  DBLCBFilialKeyPress(Sender,Key);
end;

procedure TfrmDepositContract_new.ContractTypesKeyValueChanged(Sender: TObject);
begin
if ContractTypes.KeyValue=null then begin
dmDepositContract_new.DepPeriods.CloseAll;
dmDepositContract_new.DepCapperiod.CloseAll;end  else begin
dmDepositContract_new.DepPeriods.CloseAll;
dmDepositContract_new.DepPeriods.open;
dmDepositContract_new.DepCapperiod.CloseAll;
dmDepositContract_new.DepCapperiod.open;
end;
end;

procedure TfrmDepositContract_new.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  if Sender is TWinControl then
  with Sender as TWinControl do

  begin
  case Tag of
    1,3 : SelectNext(Sender as TWinControl ,True ,True);
    2 :DBLCBValutes.SetFocus;
  end;
   Key := #0;
  end;
end;

procedure TfrmDepositContract_new.DBLCBFilialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  if Sender is TWinControl then
  with Sender as TWinControl do

  begin
  case Tag of
    1,3 : SelectNext(Sender as TWinControl ,True ,True);
    2 :DBLCBValutes.SetFocus;
  end;
   Key := #0;
  end;
end;

procedure TfrmDepositContract_new.DBLookupComboboxEh11KeyValueChanged(
  Sender: TObject);
begin
  with (Sender as TDBLookupComboboxEh) do
  if DataSource.DataSet.Active then
   UpdateData;
end;

procedure TfrmDepositContract_new.DBLookupComboboxEh2KeyValueChanged(
  Sender: TObject);
begin
  with (Sender as TDBLookupComboboxEh) do
  if DataSource.DataSet.Active then
   UpdateData;
end;

procedure TfrmDepositContract_new.DBLookupComboboxEh9KeyValueChanged(
  Sender: TObject);
begin
  with (Sender as TDBLookupComboboxEh) do
  if DataSource.DataSet.Active then
   UpdateData;
end;

procedure TfrmDepositContract_new.DBNumberEditehKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  GenAnnualInt;
  DBLCBFilialKeyPress(Sender,Key);
end;


procedure exportproc(S:String);export;
const
   csAddContract = 'InsertContract';
   csEditContract = 'EditContract';
Var ResultOp : Integer;
begin
   if S = csAddContract then
      ResultOp := frmDepositContract_new.New;

   if S = csEditContract then
      ResultOp := frmDepositContract_new.Edit;

end;

exports
   exportproc;

   procedure TfrmDepositContract_new.AddContract;
begin
   with dmDepositContract_new,DepositPorps do
   begin
      if Active then CloseAll;
      SetVariable('CONTRACTID',0);
      Open;
      Insert;
      FieldByName('CURRENCY').AsInteger := 0;
      FieldByName('Branchid').AsInteger := Get_FilialID;
      FieldByName('OpenDate').AsDateTime := Get_BankDate;
      FieldByName('Closedate').AsDateTime := Get_BankDate;
      FieldByName('FIRSTINTERESTPAYDAT').AsDateTime := Get_BankDate;

   end;
end;

procedure TfrmDepositContract_new.EditContract;
  procedure LocateAccounts(LookupControl : TDBLookupComboboxEh);
  begin
    with LookupControl do
    if (not VarIsNull(DataSource.DataSet.FieldByName(DataField).AsVariant))
     and (DataSource.DataSet.FieldByName(DataField).AsInteger <> 0) then
    begin
      KeyValue := Null;
      KeyValue := ListSource.DataSet.FieldByName(KeyField).AsInteger;
    end;
  end;
   begin
   FInserted := False;
   with dmDepositContract_new,DepositPorps do
   begin
      if Active then CloseAll;
      SetVariable('CONTRACTID',Get_SelectedContID);
      Open;
      Edit;
      ShowAccounts;
      FEdited := True;
   end;
    end;

    procedure TfrmDepositContract_new.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TfrmDepositContract_new.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FCommited then
      RefreshWithSavely(True)
  // RefreshAllDeposits;
end;

procedure TfrmDepositContract_new.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose :=
     (not dmDepositContract_new.DepositPorps.Modified)
      or (
     MessageDlg('Dəyişiklər qeyd olunmayacaq !'+#13+'Əminsiniz?'
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrYes);
end;

procedure TfrmDepositContract_new.FormCreate(Sender: TObject);
begin
   dmDepositContract_new := TdmDepositContract_new.Create(Self);
    SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmDepositContract_new.FormDestroy(Sender: TObject);
begin
dmDepositContract_new.Free;
end;

procedure TfrmDepositContract_new.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    RefreshListLbl.OnClick(nil);
end;

procedure TfrmDepositContract_new.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmDepositContract_new.FormShow(Sender: TObject);
begin
   ContractTypes.SetFocus;
   //DBDateTimeEditEh2.ReadOnly := True;
   //ShowAccounts
end;

procedure TfrmDepositContract_new.ShowAccounts;
  var CustomerID,CONTRACTACCID,
      InterestAccID,ClientAccID,Booroweraccid,Autopr,BEFO_INTERESTPEYTACCID :Integer;

  begin

  with   dmDepositContract_new do begin

   with DepositPorps do  begin
        CustomerID    := FieldByName('CustomerID').AsInteger;
        CONTRACTACCID := FieldByName('CONTRACTACCID').AsInteger;
        InterestAccID := FieldByName('InterestAccID').AsInteger;
        ClientAccID   := FieldByName('ClientAccID').AsInteger;
        Booroweraccid := FieldByName('Booroweraccid').AsInteger;
        Autopr        := FieldByName('Autopr').AsInteger;
        BEFO_INTERESTPEYTACCID :=FieldByName('BEFO_INTERESTPEYTACCID').AsInteger;
   end;
   with DepositAccs do
   begin
      if Active then CloseAll;
      SetVariable('CustID',CustomerID);
      Open;
   end;


   with InterestsAccs do
   begin
      if Active then CloseAll;
      SetVariable('CustID',CustomerID);
      Open;
   end;

      with ClientAccs do
   begin
      if Active then CloseAll;
      SetVariable('CustID',CustomerID);
      Open;
   end;

   with BoorowerAccs do
   begin
      if Active then CloseAll;
      SetVariable('CustID',CustomerID);
      Open;
   end;
   with DSBEFO_INTERESTPEYTACC do
   begin
      if Active then CloseAll;
      SetVariable('CustID',CustomerID);
      Open;
   end;
   end;





   with DBLookupComboboxEh9,DataSource.DataSet do
         KeyValue := CONTRACTACCID;

   with DBLookupComboboxEh10,DataSource.DataSet do
         KeyValue := ClientAccID;

   with DBLookupComboboxEh11,DataSource.DataSet do
         KeyValue := InterestAccID;

   with DBLookupComboboxEh2,DataSource.DataSet do
         KeyValue := Booroweraccid;

   if Autopr=1 then ChAutopr.Checked:=true
               else ChAutopr.Checked:=false

end;




function TfrmDepositContract_new.New:integer;
resourcestring
   rs_NewContract = 'Müqavilənin  əlavə olunması';
begin
   FInserted := True;
   AddContract;
   Caption := rs_NewContract;
   Lbluser.Visible := false;
   Label13.Visible := false;
   ChAutopr.checked := true;
   Result := ShowModal;
end;

function TfrmDepositContract_new.Edit:Integer;
resourcestring
   rs_EditContract = '%s № li müqavilənin redaktə olunması';
var FContractNo :String;
begin
   FContractNo := Get_SelectedContNo;
   EditContract;
   Caption := Format(rs_EditContract,[FContractNo]);
   Lbluser.Visible := true;
   Label13.Visible := true;
   Lbluser.Caption := dmDepositContract_new.DepositPorps.FieldByName('username').AsString;
   Result := ShowModal;
end;
  procedure TfrmDepositContract_new.SaveDeposits;
begin

   with dmDepositContract_new,DepositPorps,SaveDeposit do
   begin
     TypeD := 3;
     ContractNo := FieldByName('Contractno').AsString;
     opendate := FieldByName('opendate').AsDateTime;
     CloseDate := FieldByName('CloseDate').AsDateTime;
     amount := FieldByName('amount').AsFloat;
     contracttype := FieldByName('contracttype').AsInteger;
     clienttype := FieldByName('clienttype').AsInteger;
     branchid := FieldByName('branchid').AsInteger;
     currency := FieldByName('currency').AsInteger;
     personaltype:= FieldByName('personaltype').AsInteger;
     customerid:= FieldByName('customerid').AsInteger;
     interest:= FieldByName('interest').AsString;
     overdueinterest:= FieldByName('overdueinterest').AsFloat;
     dueinterest:= FieldByName('dueinterest').AsFloat;
     contractaccid:= FieldByName('contractaccid').AsInteger;
     clientaccid:= FieldByName('clientaccid').AsInteger;
     interestaccid:= FieldByName('interestaccid').AsInteger;
     booroweraccid := FieldByName('booroweraccid').AsInteger;
     FirstPayDateforInt := FieldByName('firstinterestpaydat').AsDateTime;
     PeriodID := fieldbyName('PeriodID').AsInteger;
     CapitalperID := fieldbyName('CapitalperID').AsInteger;
     if ChAutopr.Checked
     then
        begin
          fieldbyName('Autopr').AsInteger:=1;
          autopr := fieldbyName('Autopr').AsInteger;
        end
     else
        begin
          fieldbyName('Autopr').AsInteger:=0;
          autopr := fieldbyName('Autopr').AsInteger;
        end;
     BEFO_INTERESTPEYTACCID:= FieldByName('BEFO_INTERESTPEYTACCID').AsInteger;
   end;

end;

procedure TfrmDepositContract_new.SaveState(Save :Boolean);
begin
  with dmDepositContract_new,DepositPorps do
  begin
    if  Save then
        Post else
        Cancel;

    if  FInserted then
    begin
       if Save then
       AddContract else
       Cancel;
       DBLCBFilial.SetFocus;
    end else
    Self.Close;

  end;
end;

procedure TfrmDepositContract_new.RefreshListLblClick(Sender: TObject);
begin
   with dmDepositContract_new do
        RefreshDataSets;
end;
procedure TfrmDepositContract_new.RefreshAllDeposits;
var Bookm :pointer;
begin
   if FCommited then
   RefreshWithSavely(True)

   {with CommonGrid do  begin
        SelectedRows.Clear;
        with DataSource.DataSet do begin
        Bookm := GetBookmark;
        Refresh;
        if not FInserted then
        GotoBookmark(Bookm)
        end;
   end; }
end;
   initialization
   frmDepositContract_new := TfrmDepositContract_new.Create(CommonApplication);
end.
