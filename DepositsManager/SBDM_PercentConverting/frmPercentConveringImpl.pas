unit frmPercentConveringImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ExtCtrls, ActnList, ImgList, ToolWin, ComCtrls, StdCtrls, Grids, DBGridEh,
  DB,Oracle,OracleData, CMExcelExport, NLSLocalizer;


const   csUnknown   = -9;
        csCalculated=-10;
        csDisabled  =-11;


  
type
  TfrmPercentConvering = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    ActnLstCalcPercents: TActionList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    SearchPanel: TGroupBox;
    Panel4: TPanel;
    StaticText1: TStaticText;
    EditContractNo: TEdit;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EditContractAccNo: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EditInterestAccNo: TEdit;
    Panel11: TPanel;
    StaticText6: TStaticText;
    EditCustomerName: TEdit;
    calcPerGrid: TDBGridEh;
    ActnCalcPercent: TAction;
    ActnCancelCalc: TAction;
    ActnExport: TAction;
    ExcelExp: TCMExcelExport;
    ActnRefresh: TAction;
    ActnClose: TAction;
    StatusImages: TImageList;
    NLSLocalizer1: TNLSLocalizer;
    ActnSearch: TAction;
    ToolButton10: TToolButton;
    GroupBox1: TGroupBox;
    DTPOperationDate: TDateTimePicker;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ActnFilter: TAction;
    ActnSelectAll: TAction;
    procedure ActnCalcPercentExecute(Sender: TObject);
    procedure ActnCancelCalcExecute(Sender: TObject);
    procedure ActnExportExecute(Sender: TObject);
    procedure calcPerGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure calcPerGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnRefreshExecute(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure ActnSearchExecute(Sender: TObject);
    procedure EditContractNoKeyPress(Sender: TObject; var Key: Char);
    procedure EditContractNoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActnFilterExecute(Sender: TObject);
    procedure ActnSelectAllExecute(Sender: TObject);
  private
    procedure Prepareprogress;
    function CalcDeposits(GetContractID :integer;HDate :TDateTime):integer;
    procedure CancelCalcDeposit(ContractID :integer);
    procedure RefreshCalcedPercent;
  public
    { Public declarations }
  end;

var
  frmPercentConvering: TfrmPercentConvering;
  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses DMPercentConveringImpl,frmCalcPerProgressImpl,
     CommonDeclsImpl,frmCalcPerFilterImpl;

procedure exportproc(S:String);export;
begin
   frmPercentConvering.ShowModal;
end;

exports
     exportproc;

procedure TfrmPercentConvering.RefreshCalcedPercent;
begin
   calcPerGrid.SelectedRows.Clear;
   with DMPercentConvering,CalcedDeposits do
         Refresh;
end;

procedure TfrmPercentConvering.CancelCalcDeposit(ContractID :integer);
begin
   with DMPercentConvering,sbcm_percent_converting do
        CallProcedure('CancelDepositIntCalc',['p_contractID',ContractID]);
end;


function TfrmPercentConvering.CalcDeposits(GetContractID :integer;HDate :TDateTime):integer;
begin
   with DMPercentConvering,sbcm_percent_converting do
        Result := callIntegerfunction('converdeposits',['contractid',GetContractID,'hdate',HDate]);
end;

procedure TfrmPercentConvering.Prepareprogress;
var SelRowsCount : Integer;
begin
      with DMPercentConvering,CalcedDeposits do
            SelRowsCount := RecordCount;
            
      with frmCalcPerProgress, ProgressBar  do
      begin
        Max := SelRowsCount;
        Position :=0;
        DetailsMemo.Lines.Clear;
        DetailsMemo.Hide;
        BtnDetails.Enabled :=False;
        frmCalcPerProgress.Show;
        STContractsCount.Caption := Format('ћцгавил€л€рин сайы %d',[SelRowsCount]);
      end;

end;

procedure TfrmPercentConvering.ActnCalcPercentExecute(Sender: TObject);
const
   NoErrorTitle         = ' ‘аизл€р щесабланды.';
   ResulTitle           = ' ‘аизл€рин щесабланмасында сещвл€р вар! ';
   CapitalizationsTitle = ' %d  апиталлашдырма .';
   WithdrawTitle        = ' %d ∆ари щесаба кючцрцлм€.';
var
  SelRowsCount :Integer;
  SelRowIndex  :Integer;
  Aborted , ConvResult :Integer;
  CapitalizationCount,WithdrawCount :Integer;
  ErrMessage : String;
  HDate : TDateTime;
begin
    with calcPerGrid,SelectedRows,DataSource.DataSet  do
    begin
      Aborted :=0;
      CapitalizationCount :=0;
      WithdrawCount := 0;
      HDate := integer(trunc(DTPOperationDate.DateTime));
      SelRowsCount :=Count;
      if   MessageDlg('‘аизл€р щесабланыр €минсинизми?'
              ,mtConfirmation
              ,[mbYes,mbNo],0
              )<>mrYes then Abort;

      Prepareprogress;
      Application.ProcessMessages;

    try
      for  SelRowIndex :=0  to  SelRowsCount-1 do
      try
        GotoBookmark(Pointer(Items[SelRowIndex]));
        frmCalcPerProgress.ProgressBar.StepIt;
        frmCalcPerProgress.CurrentDeposit.Caption :=FieldByName('ContractNo').AsString;
        ConvResult := CalcDeposits(FieldByName('ID').AsInteger,HDate);
        case ConvResult of
         2 :  INC(WithdrawCount) ;
         1 :  INC(CapitalizationCount) ;
        end;
      except
        on E:EOracleError do
        begin
          ErrMessage := E.Message;
        // ErrMessage := copy(ErrMessage,0,Pos('^',ErrMessage));
          frmCalcPerProgress.DetailsMemo.Lines.Add(' #'
                                +FieldByName('ContractNo').AsString +' << ' + ErrMessage + ' >> '
                              );
          frmCalcPerProgress.DetailsMemo.Lines.Add('');
          Inc(Aborted);
          Continue;
        end;
      end;
    finally
         with frmCalcPerProgress do
         begin
           ProgressBar.Position :=0;
           if Aborted <> 0 then
           begin
             LblResult.Font.Color := clRed;
             LblResult.Caption :=IntToStr(Aborted)+ResulTitle
           end
           else
           begin
             LblResult.Font.Color := clGreen;
             LblResult.Caption := NoErrorTitle;
           end;
           STCapitalizationsCount.Caption := Format(CapitalizationsTitle,[CapitalizationCount]);
           STWithdrawsCount.Caption := Format(WithdrawTitle,[WithdrawCount]);
           BtnDetails.Enabled :=True;
           CurrentDeposit.Caption :='';
         end;
         RefreshCalcedPercent;
      end;
    end;

end;

procedure TfrmPercentConvering.ActnCancelCalcExecute(Sender: TObject);
const
   NoErrorTitle         = ' ўесабламалар л€ьв олунду .';
   ResulTitle           = ' —€щв вар! ';
var
  SelRowsCount :Integer;
  SelRowIndex  :Integer;
  Aborted  :Integer;
  ErrMessage : String;
begin
    with calcPerGrid,SelectedRows,DataSource.DataSet  do
    begin
      Aborted :=0;
      SelRowsCount :=Count;
      if   MessageDlg('ўесабламалар л€ьв олунсун?'
              ,mtConfirmation
              ,[mbYes,mbNo],0
              )<>mrYes then Abort;

      Prepareprogress;
      Application.ProcessMessages;
    try
      for  SelRowIndex :=0  to  SelRowsCount-1 do
      try
        GotoBookmark(Pointer(Items[SelRowIndex]));
        frmCalcPerProgress.ProgressBar.StepIt;
        frmCalcPerProgress.CurrentDeposit.Caption :=FieldByName('ContractNo').AsString;
        CancelCalcDeposit(FieldByName('ID').AsInteger);
      except
        on E:EOracleError do
        begin
          ErrMessage := E.Message;
          frmCalcPerProgress.DetailsMemo.Lines.Add(' #'
                                +FieldByName('ContractNo').AsString +' << ' + ErrMessage + ' >> '
                              );
          frmCalcPerProgress.DetailsMemo.Lines.Add('');
          Inc(Aborted);
          Continue;
        end;
      end;
    finally
         with frmCalcPerProgress do
         begin
           ProgressBar.Position :=0;
           if Aborted <> 0 then
           begin
             LblResult.Font.Color := clRed;
             LblResult.Caption :=IntToStr(Aborted)+ResulTitle
           end
           else
           begin
             LblResult.Font.Color := clGreen;
             LblResult.Caption := NoErrorTitle;
           end;
           BtnDetails.Enabled :=True;
           CurrentDeposit.Caption :='';
         end;
         RefreshCalcedPercent;
      end;
    end;

end;

procedure TfrmPercentConvering.ActnExportExecute(Sender: TObject);
begin
   with ExcelExp do
   begin
      Connect;
      ExportDataset(DMPercentConvering.CalcedDeposits,'ўесабланмыш фаизл€р',True,false);
      Disconnect;
   end;
end;

procedure TfrmPercentConvering.calcPerGridDrawColumnCell(Sender: TObject;
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
      csUnknown:
        ImageIndex := 0;
      csCalculated:
        ImageIndex := 1;
      csDisabled:
        ImageIndex := 2;
      end;   //Case
      if   (DataCol = 1)   then
        StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure TfrmPercentConvering.calcPerGridTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortField : String;
begin
  SortField := Column.FieldName;
  if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
  with Sender as TDBGridEh , TOracleDataSet(DataSource.DataSet) do
  begin
    ClearVariables;
    Screen.Cursor := crSQLWait;
    SetVariable('OrderField',SortField);
    RefResh;
    Screen.Cursor := crDefault;
   end;

end;


procedure TfrmPercentConvering.FormCreate(Sender: TObject);
begin
   DMPercentConvering := TDMPercentConvering.Create(Self);
   frmCalcPerProgress := TfrmCalcPerProgress.Create(Self);
   frmCalcPerFilter := TfrmCalcPerFilter.Create(Self);
end;

procedure TfrmPercentConvering.FormDestroy(Sender: TObject);
begin
   DMPercentConvering.Free;
   frmCalcPerProgress.Free;
   frmCalcPerFilter.Free;
end;

procedure TfrmPercentConvering.ActnRefreshExecute(Sender: TObject);
begin
   RefreshCalcedPercent;
end;

procedure TfrmPercentConvering.ActnCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmPercentConvering.ActnSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    calcPerGrid.SelectedRows.Clear;
    with  TOracleDataSet(calcPerGrid.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'јхтарыш сона чатыб.'+#13+'€вв€лд€н башламаг ист€йирсиниэми?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('…азы тапылмады!',mtInformation,[mbOK],0);
  end;


end;

procedure TfrmPercentConvering.EditContractNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) = VK_RETURN
  then  ActnSearchExecute(Sender)
end;

procedure TfrmPercentConvering.EditContractNoExit(Sender: TObject);
begin
   with (Sender As TEdit) do
         Text := '';
end;

procedure TfrmPercentConvering.FormShow(Sender: TObject);
begin
   DTPOperationDate.DateTime := Get_BankDate
end;

procedure TfrmPercentConvering.ActnFilterExecute(Sender: TObject);
begin
   frmCalcPerFilter.ShowModal;
end;

procedure TfrmPercentConvering.ActnSelectAllExecute(Sender: TObject);
begin
  with calcPerGrid,SelectedRows,DataSource.DataSet do
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

initialization
   frmPercentConvering := TfrmPercentConvering.Create(CommonApplication)
end.
