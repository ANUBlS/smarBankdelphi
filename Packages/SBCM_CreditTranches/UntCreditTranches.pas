unit UntCreditTranches;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, Mask, ComCtrls, Buttons,
  CurrencyEdit;

type
  TFrmTranches = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DTPTranchDate: TDateTimePicker;
    GroupBoxAboutContract: TGroupBox;
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
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    Panel3: TPanel;
    BtnApplyTranch: TButton;
    BtnClose: TButton;
    CBUseTransaction: TCheckBox;
    TotalEdit: TCurrencyEdit;
    procedure TotalEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyTranchClick(Sender: TObject);
    procedure  AddTranch(ContractID :LongInt;HDate :TDateTime;Total :Real;UseTransaction : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmTranches: TFrmTranches;

implementation

uses sbcmMainDataModule,StoredProgramsUnit, TranchesDataModuleImpl;

{$R *.DFM}
procedure  TFrmTranches.AddTranch(ContractID :LongInt;HDate :TDateTime;Total :Real;UseTransaction :Boolean);
begin
   with  TranchesDataModule.TranchesPackage  do
     CallProcedure('AddTranch',[
                                 ContractID
                                ,HDate
                                ,Total
                                ,UseTransaction
                                ]);
end;
procedure TFrmTranches.TotalEditKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in ['0'..'9','.',Chr(VK_DELETE),Chr(VK_BACK)]) then
     Key :=#0;
end;

procedure TFrmTranches.FormShow(Sender: TObject);
var
  ClientAccID : Integer;
begin
   DTPTranchDate.DateTime :=GetBankDate;
   ClientAccID := MainDataModule.Contracts.FieldByName('ClientAccID').AsInteger;
   with TranchesDataModule.AccountData do
   begin
     SetVariable('ClientAccID',ClientAccID);
     Open;
   end;
end;

procedure TFrmTranches.BtnApplyTranchClick(Sender: TObject);
var
  TranchTotal :Real;
  TranchDate  :TDateTime;
begin
   TranchDate :=Trunc(DTPTranchDate.DateTime);
   TranchTotal :=TotalEdit.Value;
   if   TranchTotal<>0  then
   begin
     AddTranch(FContractID,TranchDate,TranchTotal,CBUseTransaction.Checked);
     ModalResult :=mrOk;
   end;
end;

procedure TFrmTranches.FormCreate(Sender: TObject);
begin
  TranchesDataModule := TTranchesDataModule.Create(Self);
  Caption := 'Tranch for contract ¹  '+MainDataModule.Contracts.FieldByName('ContractNo').AsString;
  CBUseTransaction.Checked := SBCMGetOption('cmrAutoTransactionTranch') = 'ON';
end;

procedure TFrmTranches.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27  then
    BtnClose.Click;
end;

procedure TFrmTranches.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TranchesDataModule.AccountData do
  CloseAll;
end;

end.
