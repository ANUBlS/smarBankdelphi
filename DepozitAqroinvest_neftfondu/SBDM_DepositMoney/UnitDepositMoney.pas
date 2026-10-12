unit UnitDepositMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, CurrencyEdit, ComCtrls, Oracle, Db,
  OracleData;

type
  TFrmDepositMoney = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    StaticText2: TStaticText;
    DBEdit2: TDBEdit;
    Panel4: TPanel;
    StaticText3: TStaticText;
    DBEdit3: TDBEdit;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    Panel5: TPanel;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    DTPCurrentDate: TDateTimePicker;
    AmountEdit: TCurrencyEdit;
    DepositMoneyPackage: TOraclePackage;
    PercentEdit: TCurrencyEdit;
    PercentLabel: TLabel;
    CBUseTransaction: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DTPCurrentDateExit(Sender: TObject);
  private
    function  DepositCommited(ContractID :LongInt;HDate :TDateTime;Total,Percent :Real;UseTransaction : Boolean) : Boolean;
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmDepositMoney: TFrmDepositMoney;

implementation

{$R *.DFM}

uses
    DepositDataModuleUnit
   ,StoredProgramsUnit
   ,sboapiDataModuleImpl;

function  TFrmDepositMoney.DepositCommited(ContractID :LongInt;HDate :TDateTime;Total,Percent :Real; UseTransaction : Boolean):Boolean;
begin
  Result :=True;

  with  DepositMoneyPackage  do
  try
    CallProcedure('DepositMoney',[
                  ContractID
                 ,HDate
                 ,Total
                 ,Percent
                 ,UseTransaction
                 ]);
   except
  //   Result :=False;
     raise;
   end;
end;

procedure TFrmDepositMoney.FormCreate(Sender: TObject);
begin
   DTPCurrentDate.DateTime :=GetBankDate;
   Caption := Caption  +  DepositDataModule.Deposits.FieldByName('ContractNo').AsString;
   PercentEdit.Value := DepositDataModule.Percents.FieldByName('Interest').AsCurrency;
end;

procedure TFrmDepositMoney.ApplyBtnClick(Sender: TObject);
begin
   if DepositCommited(
             FContractID
            ,Trunc(DTPCurrentDate.DateTime)
            ,AmountEdit.Value
            ,PercentEdit.Value
            ,CBUseTransaction.Checked
            ) then
     ModalResult :=mrOk;
end;

procedure TFrmDepositMoney.FormShow(Sender: TObject);
begin
    Percentedit.Visible := GetAdditionalDepositType(FContractID) = 'Collection';
    PercentLabel.Visible := Percentedit.Visible;
    DTPCurrentDateExit(nil);
end;

procedure TFrmDepositMoney.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27  then
    Close;
end;

procedure TFrmDepositMoney.DTPCurrentDateExit(Sender: TObject);
begin
   CBUseTransaction.Checked := DTPCurrentDate.Date >= GetBankDate;
   CBUseTransaction.Enabled := DTPCurrentDate.Date >= GetBankDate;
end;

end.
