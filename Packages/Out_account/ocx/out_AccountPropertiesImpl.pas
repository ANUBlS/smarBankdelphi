unit out_AccountPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, DBCtrls, Mask, Buttons, Db;

type
  TAccountPropertiesForm = class(TForm)
    AccountGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEditAccNo: TDBEdit;
    DBEditCurrID: TDBEdit;
    DBLookupCurr: TDBLookupComboBox;
    DBEditBalance1: TDBEdit;
    DBLookupBalance1: TDBLookupComboBox;
    DBEditCustID: TDBEdit;
    DBLookupCust: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    Label7: TLabel;
    Label12: TLabel;
    DBLookupPairAcc: TDBLookupComboBox;
    DBEditLimit: TDBEdit;
    DBLookupSimotchet: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEditAccName: TDBEdit;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    DayStartStateGB: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    AccountFlagsGB: TGroupBox;
    Button3: TButton;
    DBText1: TDBText;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    procedure ButtonCommitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountPropertiesForm: TAccountPropertiesForm;

implementation

uses AccountDataModuleImpl, AccountImpl, AccountFlagsImpl;

{$R *.DFM}

procedure TAccountPropertiesForm.ButtonCommitClick(Sender: TObject);
begin
 with AccDataModule.Account do
  if State in [dsInsert, dsEdit] then
  begin
   FieldByName('open_dat').AsDateTime :=Int(DTPOpenDate.DateTime);
   Post;
  end;
 Close;
end;

procedure TAccountPropertiesForm.FormShow(Sender: TObject);
begin
 with AccountForm, AccDataModule do
 begin

  if OperationMode = omInsert then
   DTPOpenDate.DateTime :=Sysdat.FieldByName('Tek_dat').AsDateTime
  else
   DTPOpenDate.DateTime :=Account.FieldByName('open_dat').AsDateTime;

  if not Customers.Active then Customers.Open;
  if not PairAccount.Active then PairAccount.Open;
 end;
end;

procedure TAccountPropertiesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 with AccDataModule, Account do
  if State in [dsInsert, dsEdit] then
  begin
   Cancel;
   RefreshRecord; //-->Сменить на что нибудь нормальное!!!
  end;
end;

procedure TAccountPropertiesForm.ButtonCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TAccountPropertiesForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
   Close;
end;

procedure TAccountPropertiesForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Ord(Key) = VK_RETURN then
  with Sender as TControl do
   SelectNext(ActiveControl, True, True);
end;

procedure TAccountPropertiesForm.Button3Click(Sender: TObject);
begin
 FormAccFlags :=TFormAccFlags.Create(Self);
 try
  with FormAccFlags, AccDataModule.Account do
   if (ShowModal = mrOk) and (State in [dsInsert, dsEdit]) then
    FieldByName('Tipacc').AsString :=FlagMap;
 finally
  if Assigned(FormAccFlags) then
   FormAccFlags.Release;
 end;
end;


procedure TAccountPropertiesForm.SpeedButton3Click(Sender: TObject);
begin
 with AccDataModule do
  Refresh_('Account');
end;

procedure TAccountPropertiesForm.SpeedButton1Click(Sender: TObject);
const
   c_name = 'GenerateAccountNumber';
begin
{
                  BalCn Bal_spr1.bal_cn%type
                 ,CurrencyID Avalute.valute%type
                 ,CustomerID Customers.id%type
                 ,BranchID Filial.id%type) return Account.acc_no%type
 }
 with AccDataModule, Account do
  if State in [dsInsert, dsEdit] then
   FieldByName('acc_no').AsString :=OUT_SBOP.CallStringFunction(c_name,
                                          [
                                           'BalCn', FieldByName('bal_cn1').AsString
                                          ,'CurrencyID', FieldByName('val_acc').AsString
                                          ,'CustomerID', FieldByName('kli_id').AsString
                                          ,'BranchID', FieldByName('filial').AsString
                                          ]);
end;

end.
