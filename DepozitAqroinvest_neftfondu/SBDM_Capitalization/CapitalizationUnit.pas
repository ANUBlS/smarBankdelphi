unit CapitalizationUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, CurrencyEdit, Oracle;

type
  TFrmCapitalization = class(TForm)
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
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    Panel8: TPanel;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    Panel9: TPanel;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    Panel11: TPanel;
    Panel5: TPanel;
    Panel10: TPanel;
    StaticText4: TStaticText;
    DBEdit4: TDBEdit;
    Panel12: TPanel;
    StaticText8: TStaticText;
    DBEdit8: TDBEdit;
    Panel13: TPanel;
    StaticText9: TStaticText;
    DBEdit9: TDBEdit;
    Panel14: TPanel;
    StaticText10: TStaticText;
    DTPCurentDate: TDateTimePicker;
    StaticText11: TStaticText;
    CapitalizationAmountEdit: TCurrencyEdit;
    BtnCommit: TButton;
    BtnCancel: TButton;
    CapitalizationPackage: TOraclePackage;
    CBUseTransaction: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnCommitClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DTPCurentDateExit(Sender: TObject);
  private
    function  Capitalization(ContractID :LongInt;HDate :TDateTime;Total :Real;UseTransaction : Boolean) :Boolean;
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmCapitalization: TFrmCapitalization;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl,StoredProgramsUnit,DepositDataModuleUnit;

function  TFrmCapitalization.Capitalization(ContractID :LongInt;HDate :TDateTime;Total :Real;useTransaction : Boolean) :Boolean;
begin
  Result :=True;
  with CapitalizationPackage do
  try
   CallProcedure('Capitalization',[
                 ContractID
                ,HDate
                ,Total
                ,UseTransaction
                ])
   except
     raise
   end;
end;
procedure TFrmCapitalization.FormCreate(Sender: TObject);
begin
  with  DepositDataModule.Deposits do
  begin
   CapitalizationAmountEdit.Value :=FieldByName('FacticalInterestDebt').AsCurrency;
   Caption := Caption + FieldByName('ContractNo').AsString;
  end;
  DTPCurentDate.DateTime := GetBankDate;
  DTPCurentDateExit(DTPCurentDate)
end;

procedure TFrmCapitalization.BtnCommitClick(Sender: TObject);
begin
  if  Capitalization(
            FContractID
           ,Trunc(DTPCurentDate.DateTime)
           ,CapitalizationAmountEdit.Value
           ,CBUseTransaction.Checked
           ) then
    ModalResult := mrOk;
end;

procedure TFrmCapitalization.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27 then
   BtnCancel.Click;
end;

procedure TFrmCapitalization.DTPCurentDateExit(Sender: TObject);
begin
  CBUseTransaction.Enabled := (Sender as TDateTimePicker).DateTime >=GetBankDate;
  CBUseTransaction.Checked := (Sender as TDateTimePicker).DateTime >=GetBankDate;
end;

end.
