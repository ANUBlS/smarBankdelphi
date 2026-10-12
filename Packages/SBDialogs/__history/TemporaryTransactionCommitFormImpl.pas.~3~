unit TemporaryTransactionCommitFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, OracleData, StdCtrls, ComCtrls, Mask,
  DBCtrls;

type
  TTempTransactionFilter = (tfDebitAccNo, tfDebitAccName, tfCReditAccNo, tfCreditAccName,
    tfDebitAmount, tfLAmount, tfCreditAmount, tfDebitRate, tfCreditRate, tfTrName);
  TTempTransactionFilters = set of TTempTransactionFilter;

const
  FilterNone = [tfDebitAccNo, tfDebitAccName, tfCReditAccNo, tfCreditAccName,
    tfDebitAmount, tfLAmount, tfDebitRate, tfCreditRate, tfTrName];

type
  TTemporaryTransactionCommitForm = class(TForm)
    Panel1: TPanel;
    TrGrid: TDBGrid;
    DataSource1: TDataSource;
    CommitButton: TButton;
    CancelButton: TButton;
    TempTransactionsData: TOracleDataSet;
    ProgressBar1: TProgressBar;
    CountPanel: TPanel;
    CountLabel: TLabel;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    TempTransactionsDataDEBITID: TFloatField;
    TempTransactionsDataCREDITID: TFloatField;
    TempTransactionsDataDEBITAMOUNT: TFloatField;
    TempTransactionsDataCREDITAMOUNT: TFloatField;
    TempTransactionsDataLAMOUNT: TFloatField;
    TempTransactionsDataDEBITRATE: TFloatField;
    TempTransactionsDataCREDITRATE: TFloatField;
    TempTransactionsDataTRNAME: TWideStringField;
    TempTransactionsDataDEBITACCNO: TWideStringField;
    TempTransactionsDataCREDITACCNO: TWideStringField;
    TempTransactionsDataDEBITACCNAME: TWideStringField;
    TempTransactionsDataCREDITACCNAME: TWideStringField;
    procedure CommitButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TempTransactionsDataAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCommited: Boolean;
    FApplied: Boolean;
    FApply: Boolean;
    FStepByStep: Boolean;
    FTempID: Integer;
    FTransactionsCount: Integer;
  public
    { Public declarations }
    function Execute(TempID: Integer; const Title: String; StepByStep: Boolean = True;
      Apply: Boolean = True; Filters: TTempTransactionFilters = FilterNone): Boolean;
    property TransactionsCount: Integer read FTransactionsCount;
  end;

var
  TemporaryTransactionCommitForm: TTemporaryTransactionCommitForm;

implementation

{$R *.DFM}

uses SBSystem, sboapiDataModuleImpl, SBTransaction;

function TTemporaryTransactionCommitForm.Execute(TempID: Integer; const Title: String;
  StepByStep: Boolean = True; Apply: Boolean = True; Filters: TTempTransactionFilters = FilterNone): Boolean;
begin
  Caption := Title;
  with TempTransactionsData do
  begin
    Close;
    with Variables do
      SetVariable('TempID', TempID);
    Open;
    TempTransactionsDataDebitAccNo.Visible := tfDebitAccNo in Filters;
    TempTransactionsDataCreditAccNo.Visible := tfCreditAccNo in Filters;
    TempTransactionsDataDebitAccName.Visible := tfDebitAccName in Filters;
    TempTransactionsDataCreditAccName.Visible := tfCreditAccName in Filters;
    TempTransactionsDataDebitAmount.Visible := tfDebitAmount in Filters;
    TempTransactionsDataCreditAmount.Visible := tfCreditAmount in Filters;
    TempTransactionsDataLAmount.Visible := tfLAmount in Filters;
    TempTransactionsDataDebitRate.Visible := tfDebitRate in Filters;
    TempTransactionsDataCreditRate.Visible := tfCreditRate in Filters;
    TempTransactionsDataTrName.Visible := tfTrName in Filters;
  end;

  FCommited := False;
  FApplied := False;
  FTempID := TempID;
  FApply := Apply;
  FStepByStep := StepByStep;
  ShowModal;

  Result := FCommited and ((not Apply) or FApplied);
end;

procedure TTemporaryTransactionCommitForm.CommitButtonClick(
  Sender: TObject);
begin
  FCommited := True;
  if FApply then
  begin
    if FStepByStep then
      //...
    else
      FTransactionsCount := Sb_TransactionsTempCommit(FTempID);

    FApplied := True;
  end;
  Close;
end;

procedure TTemporaryTransactionCommitForm.CancelButtonClick(
  Sender: TObject);
begin
  Close;
end;

procedure TTemporaryTransactionCommitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  if FApply and not FApplied then
    Sb_TransactionsTempDelete(FTempID);}
end;

procedure TTemporaryTransactionCommitForm.TempTransactionsDataAfterOpen(
  DataSet: TDataSet);
begin
  CountLabel.Caption := Format('Sayı: %d', [DataSet.RecordCount]);
end;

procedure TTemporaryTransactionCommitForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
resourcestring
  AbandoneTransactionsPrompt = 'Sənədlər əməliyyat gününə daxil olmayacaq. Razısınız?';
begin
  CanClose := FCommited or (
    MessageDlg(
      AbandoneTransactionsPrompt,
      mtConfirmation,
      [mbYes, mbNo],
      0) = mrYes);
end;

procedure TTemporaryTransactionCommitForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.
