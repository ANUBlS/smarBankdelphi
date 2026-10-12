unit CalcInOBMainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Grids, DBGridEh, ImgList, NLSLocalizer, CMExcelExport, ComCtrls, ToolWin,
  ExtCtrls, ActnList, StdCtrls,DB,Oracle,OracleData, Mask, DBCtrlsEh;

type
  TCOBMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ExcelExport: TCMExcelExport;
    NLSLocalizer1: TNLSLocalizer;
    ImageList1: TImageList;
    COBGrid: TDBGridEh;
    ActionList1: TActionList;
    ActnCalcInt: TAction;
    ActnAcceptInt: TAction;
    ActnCancelInt: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ActnExcelImp: TAction;
    ToolButton9: TToolButton;
    ActnClose: TAction;
    GroupBox1: TGroupBox;
    EditNUMBEROFCREDIT: TEdit;
    EditCONTRACTACCNO: TEdit;
    EditVAL_NAME: TEdit;
    EditNAME: TEdit;
    GroupBox2: TGroupBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    ToolButton10: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnCalcIntExecute(Sender: TObject);
    procedure ActnAcceptIntExecute(Sender: TObject);
    procedure ActnCancelIntExecute(Sender: TObject);
    procedure ActnExcelImpExecute(Sender: TObject);
    procedure COBGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure COBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ActnCloseExecute(Sender: TObject);
    procedure EditNUMBEROFCREDITKeyPress(Sender: TObject; var Key: Char);
    procedure EditNUMBEROFCREDITExit(Sender: TObject);
    procedure EditCONTRACTACCNOKeyPress(Sender: TObject; var Key: Char);
    procedure EditVAL_NAMEKeyPress(Sender: TObject; var Key: Char);
    procedure EditNAMEKeyPress(Sender: TObject; var Key: Char);
    procedure EditNAMEExit(Sender: TObject);
    procedure EditVAL_NAMEExit(Sender: TObject);
    procedure EditCONTRACTACCNOExit(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    procedure PrepareProgress(ProgCnt : Integer; opDesc : String);
    procedure SafelyRefresh(Safely : Boolean);
    function FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;
  public
    { Public declarations }
  end;

var
  COBMainForm: TCOBMainForm;

  procedure InitPlugin(S:String); Export;

implementation

{$R *.DFM}

Uses COBDatModImpl, CommonDecls,SystemState,ProgressUnit;
const  DataColIndex : Integer = 4;


procedure TCOBMainForm.PrepareProgress;
begin
  with ProgressForm , ProgressShower do
  begin
    Position := 0;
    Max := ProgCnt;
    Step := 1;
    NLSLocalizer1.Caption := opDesc;
  end;
  ProgressForm.Show;
  
  end;


function TCOBMainForm.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

resourcestring
  rsRecordRecachedEOF = 'јхтарыш ж€рэ€нин сонуна чатыб .';
  rsContinueFromTop   = 'явв€лд€н ахтармагла давам етм€к истийирсиниз?';
  rsRecordNotFound    = '…азы тапылмады.';

var
  SearchOptions : TSearchRecordOptions;

begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];
  with  (DataSet as TOracleDataSet) do
  begin

    Result := SearchRecord(
                FieldName,
                Value,
                SearchOptions + [srFromCurrent, srForward]
    );
    if not Result then

    if MessageDlg(
              rsRecordRecachedEOF + #10#13 + rsContinueFromTop
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    begin

      Result := SearchRecord(
                  FieldName,
                  Value,
                  SearchOptions + [srFromBeginning]
      );


      if not Result then
      MessageDlg(rsRecordNotFound,mtInformation,[mbOk],0);

    end;
  end;
end;

procedure TCOBMainForm.SafelyRefresh(Safely : Boolean);
var
  SavePlace : TBookmark;
begin
  with COBGrid, DataSource.DataSet do
  begin
    SavePlace := GetBookmark;
    Refresh;
    SelectedRows.Clear;
    if Safely then
    GotoBookmark(SavePlace);
  end;
end;

 procedure InitPlugin(S:String); Export;
 begin

    with COBDatMod do
    begin
      INTCACHEDatSet.Open;
      DateInOut.Open;
    end;

    COBMainForm.ShowModal;
 end;

 exports
 InitPlugin;

procedure TCOBMainForm.FormCreate(Sender: TObject);
begin
  COBDatMod := TCOBDatMod.Create(Self);
  ProgressForm := TProgressForm.Create(Self);
end;

procedure TCOBMainForm.FormDestroy(Sender: TObject);
begin
   with COBDatMod do
   begin
     INTCACHEDatSet.Close;
     Free;
   end;
   ProgressForm.Free;
end;

procedure TCOBMainForm.ActnCalcIntExecute(Sender: TObject);
resourcestring rsAcceptCalced = '‘аизл€р щесабланыр €минсинизми?';
rsProgressCaption = '                            ‘аизл€р щесабланыр. эюзл€йин.   .....';

var

  I : Integer;
  SelectedRowsCnt : Integer;
  CrdID : Integer;
  CrdStatus : Integer;
  CrdNo : String;
  P_Date : TDateTime;
  EndOfMonth :Boolean;
begin

   P_Date := integer(trunc(DBDateTimeEditEh1.DataSource.DataSet.FieldByName('Tek_Dat').AsDateTime));
   EndOfMonth := False;
   with COBGrid ,DataSource.DataSet do
   begin

      SelectedRowsCnt := SelectedRows.Count;

      if SelectedRowsCnt>1 then
      begin
        if  not MessageDlg(
                   rsAcceptCalced,
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then Exit;

       PrepareProgress(SelectedRowsCnt,rsProgressCaption);

        For I := 0 to SelectedRowsCnt-1 do
        begin

          GotoBookmark(Pointer(SelectedRows[I]));

          CrdID := FieldByName('ID').AsInteger;
          CrdNo := FieldByName('NumberOfCredit').AsString;
          CrdStatus := FieldByName('TrProcessed').AsInteger;

          if CrdStatus in [0,1] then
          begin
             with COBDatMod , CM_CALCINOUTBALANCE do
             CallProcedure('CalcPrecents',[CrdID,
                                         P_Date,
                                         EndOfMonth]);
           LogInformation(CrdNo+' - є ли кредит цчцн фаизл€р  щесабланыб олунуб !');
          end
         else
           LogWarning(CrdNo);
        ProgressForm.ProgressShower.Position := I + 1;
       end;
       ProgressForm.Close;
    end
    else
    begin
       CrdID := FieldByName('ID').AsInteger;
       CrdNo := FieldByName('NumberOfCredit').AsString;
       CrdStatus := FieldByName('TrProcessed').AsInteger;

       if CrdStatus in [0,1] then
       begin
           with COBDatMod , CM_CALCINOUTBALANCE do
           CallProcedure('CalcPrecents',[CrdID,
                                         P_Date,
                                         EndOfMonth]);

          LogInformation(CrdNo+' - є ли кредит цчцн фаизл€р  щесабланыб !');
          end
         else
           LogWarning(CrdNo+' - є ли кредит цчцн фаизл€р артыг щесабланыб !');
    end;
    end;
   SafelyRefresh(False);
end;

procedure TCOBMainForm.ActnAcceptIntExecute(Sender: TObject);
resourcestring rsAcceptCalced = '‘аизл€р т€сдиг олунур €минсинизми?';
rsProgressCaption = '                ўесабланмыш ‘аизл€р т€сдиг олунур. эюзл€йин.   .....';
var

  I : Integer;
  SelectedRowsCnt : Integer;
  CrdID : Integer;
  CrdNo : String;
  CrdStatus : Integer;

begin

   with COBGrid ,DataSource.DataSet do
   begin

      SelectedRowsCnt := SelectedRows.Count;

      if SelectedRowsCnt >1 then
      begin
      if  not MessageDlg(
                   rsAcceptCalced,
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then Exit;

      PrepareProgress(SelectedRowsCnt,rsProgressCaption);

      For I := 0 to SelectedRowsCnt-1 do
      begin

        GotoBookmark(Pointer(SelectedRows[I]));

        CrdID := FieldByName('ID').AsInteger;
        CrdNo := FieldByName('NumberOfCredit').AsString;
        CrdStatus := FieldByName('TrProcessed').AsInteger;

        if CrdStatus in [0,1] then
        begin
           with COBDatMod , CM_CALCINOUTBALANCE do
           CallProcedure('AcceptCalcedPrecentInOB',[CrdID]);

        LogInformation(CrdNo+' - є ли кредит цчцн фаизл€р  т€сдиг олунуб !');
        end        else
         LogWarning(CrdNo);
         ProgressForm.ProgressShower.Position := I + 1;
      end;
        ProgressForm.Close;
      end
      else
      begin
        CrdID := FieldByName('ID').AsInteger;
        CrdNo := FieldByName('NumberOfCredit').AsString;
        CrdStatus := FieldByName('TrProcessed').AsInteger;

        if CrdStatus in [0,1] then
        begin
           with COBDatMod , CM_CALCINOUTBALANCE do
           CallProcedure('AcceptCalcedPrecentInOB',[CrdID]);

        LogInformation(CrdNo+' - є ли кредит цчцн фаизл€р  т€сдиг олунуб !');
        end        else
         LogWarning(CrdNo);

      end;
   end;
    SafelyRefresh(False);
end;

procedure TCOBMainForm.ActnCancelIntExecute(Sender: TObject);
resourcestring rsAcceptCalced = ' щесабланыр фаизл€р инкар олунур €минсинизми?';

var

  I : Integer;
  SelectedRowsCnt : Integer;
  CrdID : Integer;
  CrdNo : String;
  CrdStatus :integer;
begin

   with COBGrid ,DataSource.DataSet do
   begin

      SelectedRowsCnt := SelectedRows.Count;


      if  not MessageDlg(
                   rsAcceptCalced,
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then Exit;

      For I := 0 to SelectedRowsCnt-1 do
      begin

        GotoBookmark(Pointer(SelectedRows[I]));

        CrdID := FieldByName('ID').AsInteger;
        CrdNo := FieldByName('NumberOfCredit').AsString;
        CrdStatus := FieldByName('TrProcessed').AsInteger;

        if CrdStatus in [0,1] then
        begin
          with COBDatMod , CM_CALCINOUTBALANCE do
             CallProcedure('CancelCalculation',[CrdID]);
        LogInformation(CrdNo+' - є ли кредит цчцн фаизл€р  инкар олунурб !');
        end
        else
         LogWarning(CrdNo);

      end;

   end;
   SafelyRefresh(False);
end;

procedure TCOBMainForm.ActnExcelImpExecute(Sender: TObject);
begin
  with ExcelExport do
  begin
    Connect;
    ExportDataset(COBGrid.DataSource.DataSet,'Interests',True);
  end;
end;

procedure TCOBMainForm.COBGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);

function FindSpecialRowIndex : Integer;
begin
  Result := 0;
  with Sender as TDBGridEh do
  while (Result < Columns.Count) and (Columns[Result].Tag <> 1) do
  Inc(Result);
end;

begin
  DataColIndex := FindSpecialRowIndex();
end;
procedure TCOBMainForm.COBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    ImageIndex :Integer;
begin
  with Sender as TDBGridEh do
  begin
    if DataSource.DataSet.RecordCount > 0 then
    begin
      ImageIndex := DataSource.DataSet.FieldByName('TrProcessed').AsInteger;
      if   (DataCol = DataColIndex)   then
      ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TCOBMainForm.ActnCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TCOBMainForm.EditNUMBEROFCREDITKeyPress(Sender: TObject; var Key: Char);
resourcestring
  rsNothingToSearch = 'јхтарылмалы оланы дахил един!';

var
  FieldToSearch : String;
  SearchValue : String;
begin
  if ORD(Key) = VK_RETURN then
  begin


  COBGrid.SelectedRows.Clear; //!!!

  FieldToSearch := Copy((Sender as TEdit).Name,5,Length((Sender as TEdit).Name));
  SearchValue := (Sender as TEdit).Text;

  if SearchValue = '' then
    raise ESearchError.Create(rsNothingToSearch);

  FindNextRecord(
      COBGrid.DataSource.DataSet,
      FieldToSearch,
      SearchValue
  );
  Key := #0
  end;
end;

procedure TCOBMainForm.EditNUMBEROFCREDITExit(Sender: TObject);
begin
   (Sender As TEdit).Text := '';
end;

procedure TCOBMainForm.EditCONTRACTACCNOKeyPress(Sender: TObject;
  var Key: Char);
resourcestring
  rsNothingToSearch = 'јхтарылмалы оланы дахил един!';

var
  FieldToSearch : String;
  SearchValue : String;
begin
  if ORD(Key) = VK_RETURN then
  begin


  COBGrid.SelectedRows.Clear; //!!!

  FieldToSearch := Copy((Sender as TEdit).Name,5,Length((Sender as TEdit).Name));
  SearchValue := (Sender as TEdit).Text;

  if SearchValue = '' then
    raise ESearchError.Create(rsNothingToSearch);

  FindNextRecord(
      COBGrid.DataSource.DataSet,
      FieldToSearch,
      SearchValue
  );
  Key := #0
  end;
end;

procedure TCOBMainForm.EditVAL_NAMEKeyPress(Sender: TObject;
  var Key: Char);
resourcestring
  rsNothingToSearch = 'јхтарылмалы оланы дахил един!';

var
  FieldToSearch : String;
  SearchValue : String;
begin
  if ORD(Key) = VK_RETURN then
  begin


  COBGrid.SelectedRows.Clear; //!!!

  FieldToSearch := Copy((Sender as TEdit).Name,5,Length((Sender as TEdit).Name));
  SearchValue := (Sender as TEdit).Text;

  if SearchValue = '' then
    raise ESearchError.Create(rsNothingToSearch);

  FindNextRecord(
      COBGrid.DataSource.DataSet,
      FieldToSearch,
      SearchValue
  );
  Key := #0
  end;
end;

procedure TCOBMainForm.EditNAMEKeyPress(Sender: TObject; var Key: Char);
resourcestring
  rsNothingToSearch = 'јхтарылмалы оланы дахил един!';

var
  FieldToSearch : String;
  SearchValue : String;
begin
  if ORD(Key) = VK_RETURN then
  begin


  COBGrid.SelectedRows.Clear; //!!!

  FieldToSearch := Copy((Sender as TEdit).Name,5,Length((Sender as TEdit).Name));
  SearchValue := (Sender as TEdit).Text;

  if SearchValue = '' then
    raise ESearchError.Create(rsNothingToSearch);

  FindNextRecord(
      COBGrid.DataSource.DataSet,
      FieldToSearch,
      SearchValue
  );
  Key := #0
  end;
end;

procedure TCOBMainForm.EditNAMEExit(Sender: TObject);
begin
   (Sender AS TEdit).Text := '';
end;

procedure TCOBMainForm.EditVAL_NAMEExit(Sender: TObject);
begin
(Sender AS TEdit).Text := '';
end;

procedure TCOBMainForm.EditCONTRACTACCNOExit(Sender: TObject);
begin
  (Sender AS TEdit).Text := '';
end;

procedure TCOBMainForm.ToolButton10Click(Sender: TObject);
begin
COBDatMod.INTCACHEDatSet.Refresh;
end;

Initialization

 COBMainForm := TCOBMainForm.Create(CommonApplication);


end.
