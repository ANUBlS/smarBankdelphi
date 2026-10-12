unit WithDrawUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, CurrencyEdit, Oracle;

type
  TFrmWithDraw = class(TForm)
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
    Panel5: TPanel;
    StaticText4: TStaticText;
    DBEdit4: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    Panel10: TPanel;
    StaticText7: TStaticText;
    MainDebtIncreaseEdit: TCurrencyEdit;
    Panel11: TPanel;
    StaticText8: TStaticText;
    DBEdit7: TDBEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    StaticText9: TStaticText;
    DBEdit8: TDBEdit;
    Panel14: TPanel;
    StaticText10: TStaticText;
    DBEdit9: TDBEdit;
    Panel15: TPanel;
    StaticText11: TStaticText;
    InterestDebtIncreaseEdit: TCurrencyEdit;
    Panel16: TPanel;
    StaticText12: TStaticText;
    DBEdit10: TDBEdit;
    BtnCommit: TButton;
    BtnCancel: TButton;
    WithdrawPackage: TOraclePackage;
    CBUseTransactions: TCheckBox;
    procedure BtnCommitClick(Sender: TObject);
  private
    procedure WithDrawMoney(ContractID :LongInt;HDate :TDateTime;MainDebtWithdraw,InterestDebtWithdraw :Real;UseTransations : Boolean);
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmWithDraw: TFrmWithDraw;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl,StoredProgramsUnit,DepositDataModuleUnit;

procedure  TFrmWithDraw.WithDrawMoney(ContractID :LongInt;HDate :TDateTime;MainDebtWithdraw,InterestDebtWithdraw :Real;UseTransations : Boolean);
begin
  with WithdrawPackage do
   CallProcedure('WithDrawMoney',[
                ContractID
               ,HDate
               ,MainDebtWithdraw
               ,InterestDebtWithdraw
               ,UseTransations
               ]);
end;
procedure TFrmWithDraw.BtnCommitClick(Sender: TObject);
begin
    WithDrawMoney(
        FContractID
       ,GetBankDate
       ,MainDebtIncreaseEdit.Value
       ,InterestDebtIncreaseEdit.Value
       ,CBUseTransactions.Checked
       );
    ModalResult :=mrOk;
end;

end.
