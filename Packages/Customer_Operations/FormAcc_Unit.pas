unit FormAcc_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, StdCtrls, SearchEdit, Mask, DBCtrls,
  ComCtrls, Buttons, ExtCtrls, Variants, ActnList, Oracle;

type
  TFormAccount = class(TForm)
    Currency: TOracleDataSet;
    CurrencyData: TDataSource;
    BalAcc: TOracleDataSet;
    BalAccData: TDataSource;
    Customers: TOracleDataSet;
    CustomersData: TDataSource;
    BranchesData: TDataSource;
    Branches: TOracleDataSet;
    BranchesID: TFloatField;
    buyerid: TEdit;
    AccountGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    DBText88: TDBText;
    DBLookupCurr: TDBLookupComboBox;
    DBLookupCust: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupBalance1: TDBLookupComboBox;
    EditAcc: TEdit;
    EditCust: TEdit;
    DBEditLimit: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    EditAccName: TEdit;
    DBEdit5: TDBEdit;
    AccountFlagsGB: TGroupBox;
    Button3: TButton;
    CurrencyVALUTE: TFloatField;
    DBRepSymb: TDBLookupComboBox;
    CurrencyVALU_NAME: TWideStringField;
    BalAccBALNAME: TWideStringField;
    BranchesNAME: TWideStringField;
    BalAccBAL_CN: TWideStringField;
    ActionList1: TActionList;
    AccountAutoCreat: TAction;
    EditBall: TSearchEdit;
    EditFil: TSearchEdit;
    EditValute: TSearchEdit;
    SymbolEdit_: TSearchEdit;
    Label7: TLabel;
    BALACC2: TOracleDataSet;
    dsbalacc2: TDataSource;
    BALACC2BAL_CN: TWideStringField;
    BALACC2BALNAME: TWideStringField;
    EditNoteCode: TEdit;
    Label11: TLabel;
    BAL_CN2: TGroupBox;
    editballnew: TSearchEdit;
    DBLookupBalance2: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DayStartStateGB: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbedit6: TEdit;
    dbedit7: TEdit;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    tipacc: TEdit;
    custid: TDBEdit;
    dbrepsymb1: TDBLookupComboBox;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    PG_PCustService: TOraclePackage;
    Label10: TLabel;
    Label3: TLabel;
    procedure DBLookupCustClick(Sender: TObject);
    procedure bal_cnChange(Sender: TObject);
    procedure EditCustChange(Sender: TObject);
    procedure BrancheditChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure DBEditAccNoKeyPress(Sender: TObject; var Key: Char);
    procedure val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCurrKeyPress(Sender: TObject; var Key: Char);
    procedure bal_cnKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupBalance1KeyPress(Sender: TObject; var Key: Char);
    procedure EditCustKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCustKeyPress(Sender: TObject; var Key: Char);
    procedure DTPOpenDateKeyPress(Sender: TObject; var Key: Char);
    procedure TweditKeyPress(Sender: TObject; var Key: Char);
    procedure SymbolEditKeyPress(Sender: TObject; var Key: Char);
    procedure LimitEditKeyPress(Sender: TObject; var Key: Char);
    procedure BrancheditKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditAccNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure EditValuteChange(Sender: TObject);
    procedure DBLookupCurrClick(Sender: TObject);
    procedure EditBallChange(Sender: TObject);
    procedure DBLookupBalance1Click(Sender: TObject);
    procedure EditFilChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure EditAccKeyPress(Sender: TObject; var Key: Char);
    procedure EditValuteKeyPress(Sender: TObject; var Key: Char);
    procedure EditBallKeyPress(Sender: TObject; var Key: Char);
    procedure EditFilKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCommitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SymbolEdit_Change(Sender: TObject);
    procedure DBRepSymbCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AccountAutoCreatExecute(Sender: TObject);
    procedure editballnewChange(Sender: TObject);
    procedure editballnewKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupBalance2Click(Sender: TObject);
    procedure DBLookupBalance2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // procedure EditCustChange(Sender: TObject);
  private
    { Private declarations }
  public
    function CheckParams(Sender: TObject): Boolean;
  end;

var
  FormAccount: TFormAccount;

implementation

uses sboapiDataModuleImpl, co_datamod_impl, CO_AccFlags, SBTranslateProc;
{$R *.DFM}

procedure TFormAccount.DBLookupCustClick(Sender: TObject);
begin
  EditCust.Text := IntToStr(DBLookupCust.ListSource.DataSet.FieldByName('ID')
    .AsInTeger);

end;

procedure TFormAccount.AccountAutoCreatExecute(Sender: TObject);
begin
  SpeedButton1.Click;
end;

procedure TFormAccount.bal_cnChange(Sender: TObject);
begin
  BalAcc.FieldByName('bal_cn').asstring := TSearchEdit(Sender)
    .datasource.DataSet.FieldByName('bal_cn').asstring;

end;

procedure TFormAccount.EditCustChange(Sender: TObject);
begin
  if (EditCust.Text <> '') then
  begin
    DBLookupCust.KeyValue := StrToInt((Sender as TEdit).Text);
    // EditAccName.Text := DBLookupCust.ListSource.DataSet.FIeldByName('Name').AsString;
  end
  else
  begin
    EditAccName.Text := '';
    DBLookupCust.KeyValue := null;
  end;

end;

procedure TFormAccount.BrancheditChange(Sender: TObject);
begin
  Branches.FieldByName('id').asstring := TSearchEdit(Sender)
    .datasource.DataSet.FieldByName('id').asstring;

end;

procedure TFormAccount.ButtonCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFormAccount.DBEditAccNoKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.val_codeKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBLookupCurrKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.bal_cnKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBLookupBalance1KeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBLookupBalance2Click(Sender: TObject);
begin
 editballnew.Text := IntToStr(DBLookupBalance2.ListSource.DataSet.FieldByName
    ('BAL_CN').AsInTeger);

end;

procedure TFormAccount.DBLookupBalance2KeyPress(Sender: TObject; var Key: Char);
begin
 if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.EditCustKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBLookupCustKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DTPOpenDateKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.TweditKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.SymbolEditKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.LimitEditKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.BrancheditKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBLookupComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.DBEditAccNameKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;
end;

procedure TFormAccount.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.EditValuteChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    DBLookupCurr.KeyValue := StrToInt((Sender as TEdit).Text)
  else
    DBLookupCurr.KeyValue := null;

end;

procedure TFormAccount.DBLookupCurrClick(Sender: TObject);
begin
  EditValute.Text := IntToStr(DBLookupCurr.ListSource.DataSet.FieldByName
    ('VALUTE').AsInTeger);

end;

procedure TFormAccount.EditBallChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    DBLookupBalance1.KeyValue := StrToInt((Sender as TEdit).Text)
  else
    DBLookupBalance1.KeyValue := null;

end;

procedure TFormAccount.DBLookupBalance1Click(Sender: TObject);
begin
  EditBall.Text := IntToStr(DBLookupBalance1.ListSource.DataSet.FieldByName
    ('BAL_CN').AsInTeger);

end;

procedure TFormAccount.EditFilChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    DBLookupComboBox4.KeyValue := StrToInt((Sender as TEdit).Text)
  else
    DBLookupComboBox4.KeyValue := null;

end;

procedure TFormAccount.DBLookupComboBox4Click(Sender: TObject);
begin
  EditFil.Text := IntToStr(DBLookupComboBox4.ListSource.DataSet.FieldByName
    ('ID').AsInTeger);

end;

procedure TFormAccount.EditAccKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.EditValuteKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.EditBallKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.editballnewChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    DBLookupBalance2.KeyValue := StrToInt((Sender as TEdit).Text)
  else
    DBLookupBalance2.KeyValue := null;

end;

procedure TFormAccount.editballnewKeyPress(Sender: TObject; var Key: Char);
begin
 if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.EditFilKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  begin
    if Sender is TWinControl then
      with Sender as TWinControl do
        case Tag of
          1:
            SelectNext(Sender as TWinControl, True, True);
        end;
    Key := #0;
  end;

end;

procedure TFormAccount.ButtonCommitClick(Sender: TObject);
var
  DDate: TDateTime;
begin
  if CheckParams(Sender) then
    ShowMessage('Məlumat tam deyil')

  else
    with CO_DataMod do
    begin
      DDate := Trunc(DTPOpenDate.DateTime);
      OPackage.CallIntegerFunction('open_Account',
        [EditAcc.Text, EditValute.Text, EditBall.Text, EditCust.Text, DDate,
        DBEditLimit.Text, DBRepSymb.KeyValue, EditFil.Text, tipacc.Text,

        EditAccName.Text, custid.Text]);
      Account.Refresh;
      close;
    end;
end;

procedure TFormAccount.FormActivate(Sender: TObject);
begin
  with CO_DataMod do
  begin
    Sysdat.Open;
    AccSettings.Open;
    RepSymbol.Open;
    DTPOpenDate.Date := Sysdat.FieldByName('tek_dat').AsDateTime;
    EditCust.Text := Customers.FieldByName('ID').asstring;
    DBEditLimit.Text := '0';
    EditValute.Text := '0';
    EditFil.Text := AccSettings.FieldByName('Branch_ID').asstring;
    EditAccName.Text := Customers.FieldByName('Name').asstring;
    DBRepSymb.ListSource.DataSet.First;
    DBRepSymb.KeyValue := DBRepSymb.ListSource.DataSet.Fields[0].AsVariant;
    SymbolEdit_.Text := DBRepSymb.ListSource.DataSet.Fields[0].AsVariant;
  end;
  BalAcc.First;
  EditBall.Text := '';
  editballnew.Text:='';
  EditAcc.Text := '';
  // EditAccName.Text:='';
end;

procedure TFormAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DBText88.Caption := '' ;
end;

procedure TFormAccount.FormCreate(Sender: TObject);
 var tt:integer;
begin
  Customers.Open;
  Currency.Open;
  BalAcc.Open;
  Branches.Open;
  BALACC2.Open;


  tt:=PG_PCustService.CallIntegerFunction('get_Modle_comp',['customer_operations','FormAccount','Bal_CN2']);
   if tt=0 then
          Bal_CN2.Visible:=false
           else
          Bal_CN2.Visible:=true;


  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);


end;

procedure TFormAccount.FormShow(Sender: TObject);
begin
if Bal_CN2.Visible=true then
  begin
    FormAccount.AutoSize:=true ;
    FormAccount.ClientHeight:=380
  end
    else
    begin
    FormAccount.AutoSize:=False;
    FormAccount.ClientHeight:=330;
    end;
end;

procedure TFormAccount.Button3Click(Sender: TObject);
begin
  AccFlags := TAccFlags.Create(Self);
  // co_datamod.AccFlags.Open;
  // co_datamod.AccFlag.Open;
  try

    with AccFlags do

      if (ShowModal = mrOk) then // and (State in [dsInsert, dsEdit]) then
        // FieldByName('Tipacc').AsString :=FlagMap;
        tipacc.Text := FlagMap;

  finally
    if Assigned(AccFlags) then
      AccFlags.Release;
  end;

end;

procedure TFormAccount.SpeedButton1Click(Sender: TObject);
const
  c_name = 'GenerateAccountNumber';
begin
  if CheckParams(Sender) then
    ShowMessage('Məlumat tam deyil')

  else
    {
      BalCn Bal_spr1.bal_cn%type
      ,CurrencyID Avalute.valute%type
      ,CustomerID Customers.id%type
      ,BranchID Filial.id%type) return Account.acc_no%type
    }
    with CO_DataMod, SBOP do
        EditAcc.Text := SBOP.CallStringFunction(c_name,
        ['BalCn', DBLookupBalance1.KeyValue, 'CurrencyID',
        DBLookupCurr.KeyValue, 'CustomerID', DBLookupCust.KeyValue, 'BranchID',
        DBLookupComboBox4.KeyValue, 'AnalitKod',
        DBRepSymb.KeyValue,'NoteCode', EditNoteCode.Text,
        'BalCN2',DBLookupBalance2.KeyValue]);
end;

procedure TFormAccount.SymbolEdit_Change(Sender: TObject);
begin
  DBRepSymb.KeyValue := SymbolEdit_.Text;
  // dbrepsymb.ListSource.dataset.Fields[0].AsVariant
end;

function TFormAccount.CheckParams;
var s:Boolean;
begin
if Bal_CN2.Visible=true then s:=(trim(editballnew.Text) = '')
                        else s:=false;


Result := (trim(SymbolEdit_.Text) = '') or (trim(EditBall.Text) = '') or
    (trim(EditCust.Text) = '') or (trim(EditFil.Text) = '') or
    (trim(EditValute.Text) = '') or s;
  // end;

  if (Sender as TComponent).Name = 'ButtonCommit' then
    Result := Result or (trim(EditAcc.Text) = '');

   { if Result then ShowMessage('1')
              else ShowMessage('0'); }

   end;






procedure TFormAccount.DBRepSymbCloseUp(Sender: TObject);
begin
  SymbolEdit_.Text := (Sender as TDBLookupComboBox).ListSource.DataSet.Fields
    [0].asstring;
end;

end.
