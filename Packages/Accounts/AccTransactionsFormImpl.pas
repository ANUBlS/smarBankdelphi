unit AccTransactionsFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, Db, OracleData, ToolWin, StdCtrls,
  CurrencyEdit, ExtCtrls, Mask, DBCtrls, ExcelExporter;

type
  TAccTransactionsForm = class(TForm)
    TransactionsPageControl: TPageControl;
    DebitTrSheet: TTabSheet;
    CreditTrSheet: TTabSheet;
    DebitTransactionsGrid: TDBGrid;
    DebitTransactions: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DebitAmountEdit: TCurrencyEdit;
    Label2: TLabel;
    DebitLAmountEdit: TCurrencyEdit;
    Bevel1: TBevel;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    OkButton: TButton;
    CreditTransactions: TDataSource;
    CreditTransactionsData: TOracleDataSet;
    IntegerField1: TIntegerField;
    CreditTransactionsDataCREDITACCID: TFloatField;
    CreditTransactionsDataOPERATIONDATE: TDateTimeField;
    CreditTransactionsDataDEBITAMOUNT: TFloatField;
    CreditTransactionsDataCREDITAMOUNT: TFloatField;
    CreditTransactionsDataLAMOUNT: TFloatField;
    CreditTransactionsDataDEBITACCNO: TStringField;
    CreditTransactionsDataDESTINATION: TStringField;
    CreditTransactionsDataCreditAccNo: TStringField;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    CreditAmountEdit: TCurrencyEdit;
    CreditLAmountEdit: TCurrencyEdit;
    StartDateEdit: TDateTimePicker;
    EndDateEdit: TDateTimePicker;
    DebitTransactionsData: TOracleDataSet;
    DebitTransactionsDataDEBITACCID: TFloatField;
    DebitTransactionsDataOPERATIONDATE: TDateTimeField;
    DebitTransactionsDataDEBITAMOUNT: TFloatField;
    DebitTransactionsDataCREDITAMOUNT: TFloatField;
    DebitTransactionsDataLAMOUNT: TFloatField;
    DebitTransactionsDataCREDITACCNO: TStringField;
    DebitTransactionsDataDESTINATION: TStringField;
    DebitTransactionsDataRowNumber: TIntegerField;
    DebitTransactionsDataDebitAccNo: TStringField;
    DebitTransactionsDataID: TFloatField;
    CreditTransactionsDataID: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    AccTrExport: TExcelExporter;
    procedure DebitTransactionsDataCalcFields(DataSet: TDataSet);
    procedure OkButtonClick(Sender: TObject);
    procedure CreditTransactionsDataCalcFields(DataSet: TDataSet);
    procedure DebitTransactionsDataAfterOpen(DataSet: TDataSet);
    procedure CreditTransactionsDataAfterOpen(DataSet: TDataSet);
    procedure StartDateEditChange(Sender: TObject);
    procedure EndDateEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FStartDate: TDateTime;
    FEndDate: TDateTime;
    procedure FillAmounts(DataSet: TDataSet; AmountField, LAmountField: TField;
      AmountEdit, LAmountEdit: TCurrencyEdit);
    procedure SetBorderDate(Index: Integer; Value: TDateTime);
    procedure RefreshTransactions;
  public
    { Public declarations }
    property StartDate: TDateTime index 0 read FStartDate write SetBorderDate;
    property EndDate: TDateTime index 1 read FEndDate write SetBorderDate;
  end;

var
  AccTransactionsForm: TAccTransactionsForm;

implementation

uses AccountDataModuleImpl, sboapiDataModuleiMPL, StartEndDateInputImpl, SBCore;

{$R *.DFM}

procedure TAccTransactionsForm.DebitTransactionsDataCalcFields(
  DataSet: TDataSet);
begin
  with DataSet as TOracleDataSet do
    FieldByName('DebitAccNo').AsString :=
      AccountDataModule.Accounts.DataSet.FieldByName('AccNo').AsString;
end;

procedure TAccTransactionsForm.OkButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAccTransactionsForm.CreditTransactionsDataCalcFields(
  DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('CreditAccNo').AsString :=
      AccountDataModule.Accounts.DataSet.FieldByName('AccNo').AsString;
end;

procedure TAccTransactionsForm.DebitTransactionsDataAfterOpen(
  DataSet: TDataSet);
begin
  FillAmounts(
    DataSet,
    DebitTransactionsDataDEBITAMOUNT,
    DebitTransactionsDataLAMOUNT,
    DebitAmountEdit,
    DebitLAmountEdit);
end;

procedure TAccTransactionsForm.FillAmounts(DataSet: TDataSet; AmountField, LAmountField: TField;
  AmountEdit, LAmountEdit: TCurrencyEdit);
var
  Amount: Currency;
  LAmount: Currency;
begin
  Amount := 0.0;
  LAmount := 0.0;
  with DataSet do
  begin
    DisableControls;
    try
      while not Eof do
      begin
        Amount := Amount + AmountField.Value;
        LAmount := LAmount + LAmountField.Value;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  AmountEdit.Value := Amount;
  LAmountEdit.Value := LAmount;
end;

procedure TAccTransactionsForm.SetBorderDate(Index: Integer; Value: TDateTime);
var
  VarName: String;
begin
  case Index of
  0:
    begin
      VarName := 'StartDate';
      StartDateEdit.DateTime := Value;
    end;
  1:
    begin
      VarName := 'EndDate';
      EndDateEdit.DateTime := Value;
    end;
  end;
  DebitTransactionsData.SetVariable(VarName, Value);
  CreditTransactionsData.SetVariable(VarName, Value);
end;

procedure TAccTransactionsForm.CreditTransactionsDataAfterOpen(
  DataSet: TDataSet);
begin
  FillAmounts(
    DataSet,
    CreditTransactionsDataCreditAMOUNT,
    CreditTransactionsDataLAMOUNT,
    CreditAmountEdit,
    CreditLAmountEdit);
end;

procedure TAccTransactionsForm.StartDateEditChange(Sender: TObject);
begin
  StartDate := (Sender as TDateTimePicker).DateTime;
  RefreshTransactions;
end;

procedure TAccTransactionsForm.EndDateEditChange(Sender: TObject);
begin
  EndDate := (Sender as TDateTimePicker).DateTime;
  RefreshTransactions;
end;

procedure TAccTransactionsForm.RefreshTransactions;

  procedure ReOpen(DataSet: TDataSet);
  begin
    with DataSet do
    begin
      Close;
      Open;
    end;
  end;

begin
  ReOpen(DebitTransactionsData);
  ReOpen(CreditTransactionsData);
  if (DebitTransactionsData.RecordCount = 0) and (CreditTransactionsData.RecordCount <> 0) then
    TransactionsPageControl.ActivePageIndex := 1;
end;

procedure TAccTransactionsForm.FormActivate(Sender: TObject);
begin
  RefreshTransactions;
end;

procedure TAccTransactionsForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TAccTransactionsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  with  AccTrExport do
  begin
  if TransactionsPageControl.ActivePageIndex = 0 then
  ExportSource := DebitTransactions else
  ExportSource := CreditTransactions;
  Report;
  end;

end;

end.
