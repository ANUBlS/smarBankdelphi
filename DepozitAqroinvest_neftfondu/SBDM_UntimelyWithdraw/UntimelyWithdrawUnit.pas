unit UntimelyWithdrawUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, CurrencyEdit;

type
  TFrmUntimelyWithdraw = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    CheckBox1: TCheckBox;
    GroupBox6: TGroupBox;
    DBEdit4: TDBEdit;
    Panel5: TPanel;
    GroupBox10: TGroupBox;
    StaticText4: TStaticText;
    EditDaysInterval: TStaticText;
    GroupBox11: TGroupBox;
    StaticText6: TStaticText;
    DBEdit5: TDBEdit;
    GroupBox12: TGroupBox;
    StaticText7: TStaticText;
    DBEdit8: TDBEdit;
    Panel6: TPanel;
    GroupBox14: TGroupBox;
    StaticText8: TStaticText;
    GroupBox15: TGroupBox;
    StaticText9: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    GroupBox13: TGroupBox;
    StaticText5: TStaticText;
    CurrencyEdit3: TCurrencyEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    GroupBox16: TGroupBox;
    StaticText11: TStaticText;
    GroupBox17: TGroupBox;
    StaticText12: TStaticText;
    DBEdit9: TDBEdit;
    GroupBox18: TGroupBox;
    StaticText13: TStaticText;
    OtherDepositsDBEdit: TDBEdit;
    GroupBox8: TGroupBox;
    StaticText1: TStaticText;
    CurrentDateEdit: TEdit;
    TotalDebtCurrencyEdit: TCurrencyEdit;
    Panel4: TPanel;
    GroupBox7: TGroupBox;
    TotalCalcedPercentsEdit: TCurrencyEdit;
    PaidAmountEdit: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TotalCalcedPercentsEditKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    FContractID : LongInt; 
    { Public declarations }
  end;

var
  FrmUntimelyWithdraw: TFrmUntimelyWithdraw;

implementation

{$R *.DFM}

uses
   DepositDataModuleUnit, DataModuleUWUnit , StoredProgramsUnit;

procedure TFrmUntimelyWithdraw.FormCreate(Sender: TObject);
begin
  UWDataModule := TUWDataModule.Create(Self);
  Caption := Caption + DepositDataModule.Deposits.FieldByName('ContractNO').AsString;

end;

procedure TFrmUntimelyWithdraw.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if  Key = #27  then
   Close;
end;

procedure TFrmUntimelyWithdraw.FormShow(Sender: TObject);
var
  DaysInterval : Integer;
begin
    with UWDataModule.ContractTypeData do
    begin
      SetVariable('ID',FContractID);
      Open;
    end;
    with UWDataModule.OtherDeposits do
    begin
      SetVariable('ContractID',FContractID);
      Open;
      OtherDepositsDBEdit.Enabled := not (FieldByName('TotalDeposits').IsNull);
      if OtherDepositsDBEdit.Enabled then
      OtherDepositsDBEdit.Color := clWhite
      else
      OtherDepositsDBEdit.Color := clInactiveCaption;
    end;
    with DepositDataModule.Deposits do
    begin
      TotalDebtCurrencyEdit.Value := FieldByName('FacticalDebt').AsCurrency
       + UWDataModule.OtherDeposits.FieldByName('TotalDeposits').AsCurrency;
      TotalCalcedPercentsEdit.Value := FieldByName('TotalCalcedInterest').AsCurrency;
      DaysInterval := Trunc(GetBankDate - FieldByName('OpenDate').AsDateTime);
    end;
    EditDaysInterval.Caption := IntToStr(DaysInterval);
    CurrentDateEdit.Text := DateToStr(GetBankDate);
end;

procedure TFrmUntimelyWithdraw.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with UWDataModule.ContractTypeData do
  CloseAll;
end;

procedure TFrmUntimelyWithdraw.TotalCalcedPercentsEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  //
end;

end.
