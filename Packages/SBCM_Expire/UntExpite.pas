unit UntExpite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, CurrencyEdit, DBViewComboBox;

type
  TFrmExpire = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;                                
    StaticText4: TStaticText;
    DBEdit1: TDBEdit;
    GroupBox7: TGroupBox;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    DBEdit2: TDBEdit;
    GroupBox3: TGroupBox;
    StaticText3: TStaticText;
    BtnApplyExpire: TButton;
    BtnCancel: TButton;
    GroupBox9: TGroupBox;
    StaticText9: TStaticText;
    DBEdit4: TDBEdit;
    GroupBox11: TGroupBox;
    DTPExpireDate: TDateTimePicker;
    cbUseTransactions: TCheckBox;
    FacticalDebtEdit: TCurrencyEdit;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    GroupBox8: TGroupBox;
    StaticText8: TStaticText;
    ExpiredDebtEdit: TCurrencyEdit;
    GroupBox10: TGroupBox;
    StaticText10: TStaticText;
    DBEdit6: TDBEdit;
    Panel4: TPanel;
    GroupBox12: TGroupBox;
    StaticText11: TStaticText;
    DBEdit8: TDBEdit;
    GroupBox14: TGroupBox;
    StaticText13: TStaticText;
    DBEdit9: TDBEdit;
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    CBReliabilityPercent: TDBViewComboBox;
    CBOverdueReliabilityPercent: TDBViewComboBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnApplyExpireClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DTPExpireDateExit(Sender: TObject);
    procedure FacticalDebtEditChange(Sender: TObject);
    procedure ExpiredDebtEditChange(Sender: TObject);
  private
    { Private declarations }
  public
     FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmExpire: TFrmExpire;

implementation

uses  StoredProgramsUnit,sbcmMainDataModule, UntExpireDataModule;

{$R *.DFM}

procedure TFrmExpire.FormCreate(Sender: TObject);
begin
  DataModExpire :=TDataModExpire.Create(Self);
  DTPExpireDate.DateTime :=GetBankDate;
  Caption := 'Expire of contract ¹  '+MainDataModule.Contracts.FieldByName('ContractNo').AsString;
  FacticalDebtEdit.Value := MainDataModule.Contracts.FieldByName('FacticalDebt').AsCurrency;
  CBUseTransactions.Checked := SBCMGetOption('cmrAutoTransactionExpire') = 'ON' 
end;

procedure TFrmExpire.BtnApplyExpireClick(Sender: TObject);
var
  useTransactions : Boolean;
  changePrimaryReserve , changeSecondaryReserve : Boolean;
  FacticalDebt , ExpiredDebt : real;
  HDate : TDateTime;
  newPrimaryReserveID , newSecondaryReserveID : Integer;
begin
  HDate := Trunc(DTPExpireDate.DateTime);
  FacticalDebt := FacticalDebtEdit.Value;
  ExpiredDebt :=ExpiredDebtEdit.Value;
  changePrimaryReserve := TRUE;
  changeSecondaryReserve := TRUE;
  useTransactions := cbUseTransactions.Checked;
  newPrimaryReserveID := CBReliabilityPercent.ListSource.DataSet.FieldByName('ID').AsInteger;
  newSecondaryReserveID := CBOverdueReliabilityPercent.ListSource.DataSet.FieldByName('ID').AsInteger;
  with  DataModExpire.ExpirePackage do
  CallProcedure('AddExpire',[
      FContractID ,
      HDate ,
      FacticalDebt ,
      ExpiredDebt ,
      newPrimaryReserveID ,
      newSecondaryReserveID ,
      changePrimaryReserve ,
      changeSecondaryReserve ,
      useTransactions
      ]);
  ModalResult :=mrOk;
end;

procedure TFrmExpire.FormShow(Sender: TObject);
var
  ClientAccID : Integer;
  OverdueAccID : Integer;
begin
   DataModExpire.ReliabilityPercentData.Open;
   DataModExpire.OverdueReserveData.Open;
   DTPExpireDateExit(DTPExpireDate);
   with MainDataModule.Contracts do
   begin
     ClientAccID := FieldByName('ClientAccID').AsInteger;
     OverdueAccID := FieldByName('OverdueAccID').AsInteger;
   end;

   DataModExpire.MainReserve.SetVariable('id',FContractID);
   DataModExpire.MainReserve.Open;

   DataModExpire.ExpiredReserve.SetVariable('id',FContractID);
   DataModExpire.ExpiredReserve.Open;
   CBReliabilityPercent.ListSource.DataSet.Locate('id',DataModExpire.MainReserve.FieldByName('ID').AsInteger,[]);
   CBOverdueReliabilityPercent.ListSource.DataSet.Locate('id',DataModExpire.ExpiredReserve.FieldByName('ID').AsInteger,[]);

   with DataModExpire do
   begin
     with OverdueAccData do
     begin
       SetVariable('ClientAccID',OverdueAccID);
       Open;
     end;
     with ClientAccData do
     begin
       SetVariable('ClientAccID',ClientAccID);
       Open;
     end;
   end;

end;

procedure TFrmExpire.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExpire.DTPExpireDateExit(Sender: TObject);
begin
  CBUseTransactions.Enabled := (Sender as TDateTimePicker).DateTime >=GetBankDate;
  CBUseTransactions.Checked := (Sender as TDateTimePicker).DateTime >=GetBankDate;
end;

procedure TFrmExpire.FacticalDebtEditChange(Sender: TObject);
begin
  ExpiredDebtEdit.Value :=0;
end;

procedure TFrmExpire.ExpiredDebtEditChange(Sender: TObject);
begin
  FacticalDebtEdit.Value :=0;
end;

end.
