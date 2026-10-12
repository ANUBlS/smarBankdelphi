unit UntMainTransactions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Grids, DBGrids, ToolWin, ComCtrls, ImgList, Oracle,
  StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TFrmTransactions = class(TForm)
    ODSTransactions: TOracleDataSet;
    DSTransactions: TDataSource;
    ODSTransactionsDACCOUNT: TStringField;
    ODSTransactionsDEBITCURRENCY: TStringField;
    ODSTransactionsCACCOUNT: TStringField;
    ODSTransactionsCREDITCURRENCY: TStringField;
    ODSTransactionsID: TFloatField;
    ODSTransactionsOP_ID: TFloatField;
    ODSTransactionsNO_PROV: TStringField;
    ODSTransactionsDAT: TDateTimeField;
    ODSTransactionsDEBT: TFloatField;
    ODSTransactionsKREDIT: TFloatField;
    ODSTransactionsVAL_ACC: TFloatField;
    ODSTransactionsVID_OP: TIntegerField;
    ODSTransactionsAMMOUNT: TFloatField;
    ODSTransactionsLAMMOUNT: TFloatField;
    ODSTransactionsKASSA_B: TIntegerField;
    ODSTransactionsKASSA_Z: TIntegerField;
    ODSTransactionsNO_FILIAL: TIntegerField;
    ODSTransactionsRATE_D: TFloatField;
    ODSTransactionsRATE_C: TFloatField;
    ODSTransactionsCURRENCYID_C: TIntegerField;
    ODSTransactionsAMMOUNT_C: TFloatField;
    ODSTransactionsNAME: TStringField;
    ImageList: TImageList;
    OPTransactions: TOraclePackage;
    ODSMainGroups: TOracleDataSet;
    ODSMainGroupsID: TFloatField;
    ODSMainGroupsNAME: TStringField;
    ODSMainGroupsAMORT: TFloatField;
    ODSMainGroupsMAIN_ACCOUNT: TFloatField;
    ODSMainGroupsEXP_ACCOUNT: TFloatField;
    ODSMainGroupsAMORT_ACCOUNT: TFloatField;
    ODSMainGroupsSALE_ACCOUNT: TFloatField;
    ODSMainGroupsTAXAMORT: TFloatField;
    Panel2: TPanel;
    TransactionViewer: TDBGrid;
    Panel3: TPanel;
    ODSTransactionsFormatteddate: TStringField;
    Panel1: TPanel;
    Panel4: TPanel;
    StaticText1: TStaticText;
    DTPBeginDate: TDateTimePicker;
    Panel5: TPanel;
    StaticText2: TStaticText;
    DTPEndDate: TDateTimePicker;
    Panel6: TPanel;
    StaticText3: TStaticText;
    CBGroupFilter: TComboBox;
    SpeedButton1: TSpeedButton;
    EBeginDate: TEdit;
    ELastDate: TEdit;
    AssignmentsEdit: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CBGroupFilterChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure ODSTransactionsCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DTPBeginDateChange(Sender: TObject);
    procedure DTPEndDateChange(Sender: TObject);
    procedure CBGroupFilterDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
     Rate : array of integer;
     procedure ExecuteFilter(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
     procedure MouseWheelHandler(var Message: TMessage); override;
   end;

var
  FrmTransactions: TFrmTransactions;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl;

procedure TFrmTransactions.ExecuteFilter(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
var
   RateIndex :Integer;
   SavePlace :Pointer;
begin
 RateIndex :=1;
 with DataSet do
  begin
   SavePlace :=GetBookmark;
   if Active = false then Open;
   SetLength(Rate,RecordCount+1);
   ComboBox.Items.Clear;
   ComboBox.Items.Add('Áöòöí ãðóïëàð');
   try
    DisableControls;
    First;
     while not(Eof) do
      begin
       ComboBox.Items.Add(FieldByName(Field).AsString);
       Rate[RateIndex] :=FieldByName(IDfield).AsInteger;
       Next;
       Inc(RateIndex);
      end;
   finally
    GotoBookmark(SavePlace);
    FreeBookmark(SavePlace);
    EnableControls;
   end;
  end;

end;

procedure TFrmTransactions.MouseWheelHandler(var Message: TMessage);
begin
 Inherited;
 if TransactionViewer.Focused then
  with TCMMouseWheel(Message), TransactionViewer.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
   TransactionViewer.Repaint;
end;

procedure TFrmTransactions.FormCreate(Sender: TObject);
begin
 ExecuteFilter(ODSMainGroups,'Name','ID',CBGroupFilter);
 CBGroupFilter.Itemindex :=0;
 with OPTransactions do
  begin
   DTPBeginDate.DateTime :=CallDateFunction('GetPresentDate',[]);
   EBeginDate.Text :=FormatDateTime('dd-mmm-yyyy',CallDateFunction('GetPresentDate',[]));
   DTPEndDate.DateTime :=CallDateFunction('GetPresentDate',[]);
   ELastDate.Text :=FormatDateTime('dd-mmm-yyyy',CallDateFunction('GetPresentDate',[]));
  end;
end;

procedure TFrmTransactions.ToolButton1Click(Sender: TObject);
var
 BeginDate :TDateTime;
 EndDate   :TDateTime;
 SqlStr    :WideString;
begin
 BeginDate :=Trunc(DTPBeginDate.DateTime);
 EndDate :=Trunc(DTPEndDate.DateTime);
 with OPTransactions do
  SqlStr :=CallStringFunction('GetTransactions',[Rate[CBGroupFilter.ItemIndex],BeginDate,EndDate]);
 with ODSTransactions do
  begin
   if Active = True then CloseAll;
   SetVariable('AStrParam',SqlStr);
   Open;
  end;
end;

procedure TFrmTransactions.CBGroupFilterChange(Sender: TObject);
begin
// ShowMessage(inttostr(CBGroupFilter.Itemindex)+'  '+Inttostr(Rate[CBGroupFilter.ItemIndex]))
end;

procedure TFrmTransactions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_ESCAPE) then
  Close;
end;

procedure TFrmTransactions.FormDestroy(Sender: TObject);
begin
 SetLength(Rate,0);
 ODSTransactions.CloseAll;
 ODSMainGroups.CloseAll;
end;

procedure TFrmTransactions.ODSTransactionsCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('FormattedDate').AsString :=FormatDateTime('dd-mmm-yyyy',FieldByName('DAT').AsDateTime);
end;

procedure TFrmTransactions.SpeedButton1Click(Sender: TObject);
var
 BeginDate :TDateTime;
 EndDate   :TDateTime;
 SqlStr    :WideString;
begin
 BeginDate :=Trunc(DTPBeginDate.DateTime);
 EndDate :=Trunc(DTPEndDate.DateTime);
 with OPTransactions do
  SqlStr :=CallStringFunction('GetTransactions',[Rate[CBGroupFilter.ItemIndex],BeginDate,EndDate]);
 with ODSTransactions do
  begin
   if Active then CloseAll;
   SetVariable('AStrParam',SqlStr);
   Open;
  end;
end;

procedure TFrmTransactions.DTPBeginDateChange(Sender: TObject);
begin
 EBeginDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
end;

procedure TFrmTransactions.DTPEndDateChange(Sender: TObject);
begin
 ELastDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
end;

procedure TFrmTransactions.CBGroupFilterDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 with Control as TComboBox do
  begin
    Canvas.FillRect(Rect);
    if (Index = 0) and (not (odComboBoxEdit in State)) then
      if odSelected in State then
        Canvas.Font.Color := clWhite
      else
        Canvas.Font.Color := clBlue;
    Canvas.TextOut(Rect.Left+2, Rect.Top, Items[Index]);
  end;

end;

end.
