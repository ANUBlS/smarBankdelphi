unit LazyTransactionMainImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
  StdCtrls, ExtCtrls,  ToolWin, ComCtrls, ActnList, ImgList,
  Grids, DBGridEh, Buttons, CMExcelExport, Mask, DBCtrlsEh, Menus,oracle,oracledata,
  DBGridEhGrouping, GridsEh;

type
  TLazTransMainForm = class(TForm)
    GroupBox1: TGroupBox;
    ActnLOperations: TActionList;
    DBGridtransactions: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    StatusImages: TImageList;
    StatusBar1: TStatusBar;
    ExortOperations: TCMExcelExport;
    ActnRefresh: TAction;
    ActnCommitTransaction: TAction;
    GroupBox3: TGroupBox;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    PopupMenu: TPopupMenu;
    ActnDelete: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox2: TGroupBox;
    OperationDate: TDateTimePicker;
    ActnExport: TAction;
    GroupBox4: TGroupBox;
    ChBUpdPlane: TCheckBox;
    ToolButton10: TToolButton;
    procedure ActnRefreshExecute(Sender: TObject);
    procedure DBGridtransactionsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ActnCommitTransactionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnDeleteExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActnDeleteUpdate(Sender: TObject);
    procedure ActnCommitTransactionUpdate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure ActnExportExecute(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure DBGridtransactionsTitleBtnClick(Sender: TObject;
      ACol: Integer; Column: TColumnEh);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CommitTransaction(TrID : integer;PrTr :Boolean);
    procedure PrepareProgress(ProgCnt :integer);
  end;

var
  LazTransMainForm: TLazTransMainForm;

procedure InitPlugin(s:string);export;

implementation

{$R *.DFM}



uses LazyTransactionDatModImpl,CommonDecls,sbsystem,ProgressImpl,
  BanklarImpl;

procedure InitPlugin(s:string);export;
begin
  LazTransMainForm.ShowModal;
end;
exports
InitPlugin;

procedure TLazTransMainForm.PrepareProgress;
begin
  with TransactionProgForm , ProgressTr do
  begin
    Position := 0;
    Max := ProgCnt;
    Step := 1;
  end;
  TransactionProgForm.Show;
end;

procedure TLazTransMainForm.CommitTransaction(TrID :integer;PrTr :Boolean);
resourcestring rsCreditNumber = '%s - № ли кредит : ';
begin
   with LazTrDatMod,Transactions do
   try
        CallProcedure('Commit_Transaction',[
                     'TransactionID',TrID,
                     'DefUpdPlane',PrTr]);
        TransactionsData.Refresh;             
   except
       on E:Exception do
         LogError(Format(rsCreditNumber,[TransactionsData.FieldByname('Numberofcredit').AsString]) + E.Message);
   end;

end;

procedure TLazTransMainForm.ActnRefreshExecute(Sender: TObject);
begin
    with LazTrDatMod,TransactionsData do begin
          Cursor := crSqlWait;
          Close;
          SetVariable('TransactionDate',Integer(Trunc(OperationDate.DateTime)));
          Open;         
          Cursor := crDefault;
    end;
end;

procedure TLazTransMainForm.DBGridtransactionsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
const
    DataColIndex = 1;
var
    ImageIndex :Integer;
begin
  ImageIndex :=-1;
  with Sender as TDBGridEh do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
      0:
        ImageIndex := 0;
      1:
        ImageIndex := 1;
      end;   //Case
      if   (DataCol = 1)   then
        StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure TLazTransMainForm.ActnCommitTransactionExecute(Sender: TObject);
resourcestring
  rs_CommitTransaction =' Ямялиййат тясдиг олунур яминсиниз? ';
  rs_CommitSelectedTransactions =' Сечилмиш ямялиййатлар тясдиг олунур яминсиниз? ';
var
  SelectedRowCount,TransID,i :integer;

begin
  with DBGridtransactions,DataSource.DataSet do begin
       SelectedRowCount := SelectedRows.count;

  if SelectedRowCount > 1 then begin
  if MessageDlg(
      rs_CommitSelectedTransactions
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrNO then exit;

      if MessageDlg(
          rs_CommitSelectedTransactions
            ,mtConfirmation
            ,[mbYes,mbNo]
             ,0
            ) = mrNO then exit;

      Self.Update;

      PrepareProgress(SelectedRowCount);

      for I := 0 to SelectedRowCount - 1 do
      begin
        GotoBookmark(Pointer(SelectedRows[I]));
        TransID := FieldByName('ID').AsInteger;
        GotoBookmark(Pointer(SelectedRows[I]));
        CommitTransaction(TransID,ChBUpdPlane.Checked);
        TransactionProgForm.ProgressTr.Position := I + 1;
    //    ShowMessage(IntToStr(TransID));
      end;
      TransactionProgForm.Close;
   end

   else
   if MessageDlg(
      rs_CommitTransaction
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrNO then exit;
     CommitTransaction(FieldByName('ID').AsInteger,ChBUpdPlane.Checked);
   end;

end;

procedure TLazTransMainForm.FormCreate(Sender: TObject);
begin
   LazTrDatMod := TLazTrDatMod.Create(Self);
   TransactionProgForm := TTransactionProgForm.Create(Self);
   OperationDate.DateTime := Get_CurrentDate;
end;

procedure TLazTransMainForm.FormDestroy(Sender: TObject);
begin
  LazTrDatMod.Free;
  TransactionProgForm.Free;
  LazTrDatMod.OracleDataSet1.close;
end;

procedure TLazTransMainForm.ActnDeleteExecute(Sender: TObject);
resourcestring  rs_DeleteTransaction =' Ямялиййат силинир яминсиниз? ';
begin
  if MessageDlg(
      rs_DeleteTransaction
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrNO then exit;

   with LazTrDatMod,Transactions,TransactionsData do begin
        CallProcedure('Delete_Transactions',[
                     'TransactionID',TransactionsData.FieldByName('ID').AsInteger]);
      Refresh
  end;
end;

procedure TLazTransMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close
end;

procedure TLazTransMainForm.ActnDeleteUpdate(Sender: TObject);
begin
  with LazTrDatMod,TransactionsData do
  (Sender as TAction).Enabled := Active and (RecordCount > 0);
end;

procedure TLazTransMainForm.ActnCommitTransactionUpdate(Sender: TObject);
begin
  with LazTrDatMod,TransactionsData do
  (Sender as TAction).Enabled := Active and (RecordCount>0)
  and (FieldByName('Status').AsInteger=0);
end;

procedure TLazTransMainForm.N4Click(Sender: TObject);
begin
  with DBGridtransactions,SelectedRows,DataSource.DataSet do
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

procedure TLazTransMainForm.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with ACanvas.Font do
    begin
      Charset := DEFAULT_CHARSET;
      Name := 'Azl Sans Serif';
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-7, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;

end;

procedure TLazTransMainForm.ActnExportExecute(Sender: TObject);
begin
   with ExortOperations do begin
        Connect;
        ExportDataset(LazTrDatMod.TransactionsData,'Кредит Ямялиййатлары',True);
        Disconnect;
   end;

end;

procedure TLazTransMainForm.ToolButton9Click(Sender: TObject);
begin
  Close
end;

procedure TLazTransMainForm.DBGridtransactionsTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  SortField : String;
begin
  SortField := Column.FieldName;
  if SortField='' then
  SortField := 'Status';
  if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
  with Sender as TDBGridEh , TOracleDataSet(DataSource.DataSet) do
  begin
   // ClearVariables;
    Screen.Cursor := crSQLWait;
    SetVariable('OrderField',SortField);
    RefResh;
    Screen.Cursor := crDefault;
   end;

end;

procedure TLazTransMainForm.ToolButton10Click(Sender: TObject);
begin
FormBank:=tFormBank.Create(self);
LazTrDatMod.OracleDataSet1.open;
FormBank.showmodal;

end;

initialization
   LazTransMainForm :=  TLazTransMainForm.Create(CommonApplication);
end.
