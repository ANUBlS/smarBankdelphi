unit ReserveContUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBViewComboBox, CurrencyEdit, Mask, DBCtrls, ExtCtrls;

type
  TFrmReserveCont = class(TForm)
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
    BtnApplyExpire: TButton;
    BtnCancel: TButton;
    cbUseTransactions: TCheckBox;
    cbChangeSecondaryResreve: TCheckBox;
    Panel3: TPanel;
    GroupBox8: TGroupBox;
    StaticText8: TStaticText;
    ExpiredReserveEdit: TCurrencyEdit;
    GroupBox10: TGroupBox;
    StaticText10: TStaticText;
    DBEdit6: TDBEdit;
    cbChangePrimaryResreve: TCheckBox;
    Panel4: TPanel;
    GroupBox12: TGroupBox;
    StaticText11: TStaticText;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox14: TGroupBox;
    StaticText13: TStaticText;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    CBReliabilityPercent: TDBViewComboBox;
    CBOverdueReliabilityPercent: TDBViewComboBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    FacticalReserveEdit: TCurrencyEdit;
    GroupBox3: TGroupBox;
    StaticText3: TStaticText;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    procedure cbChangePrimaryResreveClick(Sender: TObject);
    procedure cbChangeSecondaryResreveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyExpireClick(Sender: TObject);
  private
    { Private declarations }
  public
  FContractID : Integer;
    { Public declarations }
  end;

var
  FrmReserveCont: TFrmReserveCont;

implementation

uses  StoredProgramsUnit,sbcmMainDataModule, UntExpireDataModule;

{$R *.DFM}

procedure TFrmReserveCont.cbChangePrimaryResreveClick(Sender: TObject);
begin
  CBReliabilityPercent.Enabled := (Sender as TCheckBox).Checked;
end;

procedure TFrmReserveCont.cbChangeSecondaryResreveClick(Sender: TObject);
begin
  CBOverdueReliabilityPercent.Enabled := (Sender as TCheckBox).Checked;
end;

procedure TFrmReserveCont.FormCreate(Sender: TObject);
begin
  DataModExpire :=TDataModExpire.Create(Self);
  Caption := 'Reserve contoller of contract ¹  '+MainDataModule.Contracts.FieldByName('ContractNo').AsString;
end;

procedure TFrmReserveCont.FormShow(Sender: TObject);
var
  ClientAccID : Integer;
  PReserveAccID ,SReserveAccID: Integer;
begin
   with MainDataModule.Contracts do
   begin
     ClientAccID := FieldByName('ClientAccID').AsInteger;
     PReserveAccID := FieldByName('ReserveAccID').AsInteger;
     SReserveAccID := FieldByName('OverdueReserveAccID').AsInteger;
   end;

   DataModExpire.ReliabilityPercentData.Open;
   DataModExpire.OverdueReserveData.Open;

   CBReliabilityPercent.Enabled := cbChangePrimaryResreve.Checked;
   CBOverdueReliabilityPercent.Enabled := cbChangeSecondaryResreve.Checked;

   DataModExpire.MainReserve.SetVariable('id',FContractID);
   DataModExpire.MainReserve.Open;

   DataModExpire.ExpiredReserve.SetVariable('id',FContractID);
   DataModExpire.ExpiredReserve.Open;

   FacticalReserveEdit.Value := MainDataModule.Contracts.FieldByName('FacticalDebt').AsFloat
                              * DataModExpire.MainReserve.FieldByName('Percent').AsFloat / 100;
   ExpiredReserveEdit.Value := MainDataModule.Contracts.FieldByName('OverdueDebt').AsFloat
                              * DataModExpire.ExpiredReserve.FieldByName('Percent').AsFloat / 100;

   with DataModExpire do
   begin
     with ClientAccData do
     begin
       SetVariable('ClientAccID',ClientAccID);
       Open;
     end;
     with PReserveData do
     begin
       SetVariable('ClientAccID',PReserveAccID);
       Open;
     end;
     with SReserveData do
     begin
       SetVariable('ClientAccID',SReserveAccID);
       Open;
     end;
   end;

end;

procedure TFrmReserveCont.BtnApplyExpireClick(Sender: TObject);
var
  ContractID : Integer;
  HDate : TDateTime;
  changePReserve ,changeSReserve : Boolean;
  newReserveID ,newExpiredReserveID : Integer;
  TransactionsOn : Boolean;
begin
  ContractID := FContractID;
  HDate := Trunc(GetBankDate);
  changePReserve := cbChangePrimaryResreve.Checked;
  changeSReserve := cbChangeSecondaryResreve.Checked;
  newReserveID := CBReliabilityPercent.ListSource.DataSet.FieldByName('ID').AsInteger;
  newExpiredReserveID := CBOverdueReliabilityPercent.ListSource.DataSet.FieldByName('ID').AsInteger;
  TransactionsOn := cbUseTransactions.Checked;
  with DataModExpire.ReserveCont do
  CallProcedure('ChangeReserve',[
      ContractID ,
      HDate ,
      newReserveID ,
      newExpiredReserveID ,
      changePReserve ,
      changeSReserve ,
      TransactionsON
      ]);
  ModalResult := mrOk;
end;

end.
