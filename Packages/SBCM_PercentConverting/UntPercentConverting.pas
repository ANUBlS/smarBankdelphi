unit UntPercentConverting;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, ToolWin, ImgList,Oracle,DB,OracleData;

type
  TFrmPercentConvert = class(TForm)
    PanelFooter: TPanel;
    LazyPercentViewer: TDBGrid;
    HeaderToolBar: TToolBar;
    tbRefresh: TToolButton;
    ToolButton2: TToolButton;
    tbPrint: TToolButton;
    ToolButton6: TToolButton;
    HeaderImages: TImageList;
    Panel1: TPanel;
    tbCancelDeffferedTransactions: TToolButton;
    ToolButton5: TToolButton;
    tbApplyDefferedTransactions: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure LazyPercentViewerTitleClick(Column: TColumn);
    procedure tbPrintClick(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure tbApplyDefferedTransactionsClick(Sender: TObject);
    procedure tbCancelDeffferedTransactionsClick(Sender: TObject);
    procedure SelectAllRows;
  private
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmPercentConvert: TFrmPercentConvert;

implementation

uses
   PercentConvertingDataModule, UnitCalcedPercentRPT, UntConvertionProgress,StoredProgramsUnit;

{$R *.DFM}

procedure TFrmPercentConvert.FormCreate(Sender: TObject);
begin
   DataModPercentConv :=TDataModPercentConv.Create(Self);
   CalcedPercentRpt :=TCalcedPercentRpt.Create(Self);
end;

procedure TFrmPercentConvert.LazyPercentViewerTitleClick(Column: TColumn);
var
  OrderClause :string;
begin
  Screen.Cursor := crHourGlass;
  try

  with  TOracleDataSet(LazyPercentViewer.DataSource.DataSet) do
  begin
    OrderClause := 'ContractCurrencyID,'+Copy(Column.Field.Name,15,Length(Column.Field.Name));
    if Active then CloseAll;
    SetVariable('ORDERCLAUSE',OrderClause);
    Open;
  end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPercentConvert.tbPrintClick(Sender: TObject);
begin
  CalcedPercentRpt.Preview
end;

procedure TFrmPercentConvert.tbRefreshClick(Sender: TObject);
var
  SavedPos :TBookmark;
begin
  with LazyPercentViewer.DataSource.DataSet  do
  begin
     SavedPos :=GetBookmark;
     Refresh;
     GotoBookmark(SavedPos);
  end;
    TOracleDataSet(LazyPercentViewer.DataSource.DataSet).Session.Commit;
end;

procedure TFrmPercentConvert.tbApplyDefferedTransactionsClick(
  Sender: TObject);
const
   ResulTitle = '  : Errors Found On Convertion Percents';
var
  SelRowsCount :Integer;
  SelRowIndex  :Integer;
  Aborted :Integer;
begin
    SelectAllRows;
    with LazyPercentViewer,SelectedRows,DataSource.DataSet  do
    begin
      Aborted :=0;

      SelRowsCount :=Count;
      if   MessageDlg('Apply Percents  Now?'
              ,mtConfirmation
              ,[mbYes,mbNo],0
              )<>mrYes then Abort;
     TOracleDataSet(LazyPercentViewer.DataSource.DataSet).Session.Commit;
      with  FrmProgress,ProgressBar  do
      begin
        Max :=SelRowsCount;
        Position :=0;
        NoteMemo.Lines.Clear;
        NoteMemo.Hide;
        BtnDetails.Enabled :=False;
        FrmProgress.Show;
      end;
      Application.ProcessMessages;
    try
      for  SelRowIndex :=0  to  SelRowsCount-1 do
      try
        GotoBookmark(Pointer(Items[SelRowIndex]));
        FrmProgress.ProgressBar.StepIt;
        FrmProgress.CurrentContractLabel.Caption :=FieldByName('ContractNo').AsString;
        with  DataModPercentConv.CalcedPercentsPack do
          CallProcedure('ApplyDefferedTransactions',[FieldByName('ContractID').Value,GetBankDate])
      except
          FrmProgress.NoteMemo.Lines.Add('Could Not Converting Percents for #'
                                +FieldByName('ContractNo').AsString
                              );
          Inc(Aborted);
          Continue;
      end;
    finally
         FrmProgress.ProgressBar.Position :=0;
         FrmProgress.LblResult.Caption :=IntToStr(Aborted)+ResulTitle;
         FrmProgress.BtnDetails.Enabled :=True;
         FrmProgress.CurrentContractLabel.Caption :='';
         tbCancelDeffferedTransactions.Enabled :=False;
         tbApplyDefferedTransactions.Enabled :=False;
         Refresh;
      end;
    end;
end;


procedure TFrmPercentConvert.tbCancelDeffferedTransactionsClick(
  Sender: TObject);
begin
  Close;
end;

procedure TFrmPercentConvert.SelectAllRows;
begin
  with LazyPercentViewer,SelectedRows,DataSource.DataSet do 
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        CurrentRowSelected := True;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

end.
