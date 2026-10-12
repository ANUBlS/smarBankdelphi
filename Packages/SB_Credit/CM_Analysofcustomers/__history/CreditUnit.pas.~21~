unit CreditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,  Grids, DBGridEh, StdCtrls, ComCtrls, ImgList, ToolWin, PluginToolBar,oracle,db,oracledata,
   ActnList, ExtCtrls, Menus, Mask, DBCtrlsEh, CMExcelExport, DBGridEhGrouping,
  GridsEh, DBCtrls;

type
  TCreditForm = class(TForm)
    PluginToolBar1: TPluginToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGridEhCredit: TDBGridEh;
    SearchPanel: TGroupBox;
    Panel10: TPanel;
    StaticText1: TStaticText;
    EditCONTRACTACCNO: TEdit;
    Panel11: TPanel;
    StaticText2: TStaticText;
    Editrest: TEdit;
    Panel12: TPanel;
    StaticText3: TStaticText;
    Editnumberofcredit: TEdit;
    GroupBox2: TGroupBox;
    DBEditEh1: TDBEditEh;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ActionSearch: TAction;
    Actionpayments: TAction;
    REpPopupMenu: TPopupMenu;
    N1: TMenuItem;
    CMExcelExport: TCMExcelExport;
    v: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Label1: TLabel;
    DBText1: TDBText;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGridEhCreditTitleClick(Column: TColumnEh);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure miPaymentsDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure ActionSearchExecute(Sender: TObject);
    procedure EditnumberofcreditExit(Sender: TObject);
    procedure DBGridEhCreditDblClick(Sender: TObject);
    procedure ActionpaymentsExecute(Sender: TObject);
    procedure DBGridEhCreditKeyPress(Sender: TObject; var Key: Char);
    procedure EditnumberofcreditKeyPress(Sender: TObject; var Key: Char);
    procedure EditCONTRACTACCNOKeyPress(Sender: TObject; var Key: Char);
    procedure EditrestKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure vClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
  private
      function FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;
      procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;
                  ARect: TRect; Selected: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditForm: TCreditForm;        

implementation
    uses  CustAnalysDataModuleImpl,FilterUnit, PaymentsUnit, DateintervalUnit,sboapiDataModuleImpl, SBTranslateProc,
  PayImpl, ReturnTr;

{$R *.DFM}



function TCreditForm.FindNextRecord(DataSet : TDataSet;FieldName : String;Value : String) : Boolean;

resourcestring
  rsRecordRecachedEOF = 'Axtarış cərgənin sonuna çatıb .';
  rsContinueFromTop   = 'Əvvəldən axtarmaqla davam etmək istayirsiniz?';
  rsRecordNotFound    = 'Yazı tapılmadı.';

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

procedure TCreditForm.MenuShrift(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
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
     // Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
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



procedure TCreditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TCreditForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TCreditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TCreditForm.vClick(Sender: TObject);
begin
PayForm.Label8.Caption  :=CustAnalysDataModule.CreditAnalysDataSetMAINPAY.AsVariant;
PayForm.Label9.Caption  :=CustAnalysDataModule.CreditAnalysDataSetINTERESTREST.AsVariant;
PayForm.Label10.Caption :=CustAnalysDataModule.CreditAnalysDataSetDUEREST.AsVariant;
PayForm.Label11.Caption :=CustAnalysDataModule.CreditAnalysDataSetDUEINTERESTREST.AsVariant;
PayForm.Label12.Caption :=CustAnalysDataModule.CreditAnalysDataSetPENALTYREST.AsVariant;
PayForm.Label13.Caption :=CustAnalysDataModule.CreditAnalysDataSetCEMPAY.AsVariant;
PayForm.ShowModal;
end;

procedure TCreditForm.ToolButton11Click(Sender: TObject);
begin
   CustAnalysDataModule.Returntrans.CloseAll;
   CustAnalysDataModule.Returntrans.SetVariable('brid',CustAnalysDataModule.CreditAnalysDataSetBOOROWERID.AsInteger);
   CustAnalysDataModule.Returntrans.SetVariable('crid',CustAnalysDataModule.CreditAnalysDataSetCREDITID.AsInteger);
  CustAnalysDataModule.Returntrans.open;
  FormReturns:= TFormReturns.Create(Self);



FormReturns.showmodal ;

end;

procedure TCreditForm.ToolButton1Click(Sender: TObject);
begin
    with FilterForm do
     Showmodal;

end;

procedure TCreditForm.DBGridEhCreditTitleClick(Column: TColumnEh);
var
  OrderField :string;
begin
   OrderField := Column.Field.FieldName;
   Screen.Cursor := crSQLWait;
   try
       with TOracleDataSet(DBGridEhCredit.DataSource.DataSet) do
       begin
         if  Active  then  CloseAll;
         SetVariable('OrderField',OrderField);
         Open
       end;
    finally
     Screen.Cursor := crDefault;
    end;
end;

procedure TCreditForm.ToolButton5Click(Sender: TObject);
begin
   Close;
end;


procedure TCreditForm.ToolButton3Click(Sender: TObject);
begin
   DateintervalForm.Showmodal;
end;

procedure TCreditForm.ToolButton6Click(Sender: TObject);
begin
   with CustAnalysDataModule.CustAnalysDataSet do
   begin
     Next;
      with CustAnalysDataModule.CreditAnalysDataSet do
      begin
        if Active then CloseAll;
        SetVariable('boorowerid',CustAnalysDataModule.CustAnalysDataSet.FieldByName('BoorowerId').asInteger);
        SetVariable('orderfield','numberofcredit');
        Open;
    end;
   end;
end;

procedure TCreditForm.ToolButton8Click(Sender: TObject);
begin
    with CustAnalysDataModule.CustAnalysDataSet do
   begin
      Prior;
      with CustAnalysDataModule.CreditAnalysDataSet do
      begin
        if Active then CloseAll;
        SetVariable('boorowerid',CustAnalysDataModule.CustAnalysDataSet.FieldByName('BoorowerId').asInteger);
        SetVariable('orderfield','numberofcredit');
        Open;
    end;
   end;
end;

procedure TCreditForm.miPaymentsDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
     MenuShrift(Sender, ACanvas,
  ARect, Selected);
end;

procedure TCreditForm.ActionSearchExecute(Sender: TObject);
var SearchField,SearchRecord : String;
begin
   SearchField := Copy((Sender as TEdit).name,5,length((Sender as TEdit).name));
   SearchRecord := (Sender as TEdit).Text;
   FindNextRecord (CustAnalysDataModule.CreditAnalysDataSet,SearchField,SearchRecord);
 end;


procedure TCreditForm.EditnumberofcreditExit(Sender: TObject);
begin
   with (sender as TEdit) do
         Text := '';
end;

procedure TCreditForm.DBGridEhCreditDblClick(Sender: TObject);
begin
   ActionpaymentsExecute(Sender);
end;

procedure TCreditForm.ActionpaymentsExecute(Sender: TObject);
begin
   with CustAnalysDataModule do
    begin

     with ScheduleDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;

     with  SumSheDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;

     with  SumPayDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;

     with PaymentsDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;

    with TrancheDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;

   with ProlongationDataSet do
     begin
        if Active then CloseAll;
        Setvariable('CrdID',CustAnalysDataModule.CreditAnalysDataSet.FieldByName('Creditid').asInteger);
        Open;
     end;
   end;

   PaymentsForm.Showmodal;

end;

procedure TCreditForm.DBGridEhCreditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) = VK_RETURN then ActionpaymentsExecute(Nil);
end;

procedure TCreditForm.EditnumberofcreditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(key) = VK_RETURN then ActionSearchExecute(Sender);
end;

procedure TCreditForm.EditCONTRACTACCNOKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(key) = VK_RETURN then ActionSearchExecute(Sender);
end;

procedure TCreditForm.EditrestKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(key) = VK_RETURN then ActionSearchExecute(Sender);
end;

procedure TCreditForm.N1Click(Sender: TObject);
var crdid :integer;
begin
  Crdid := CustAnalysDataModule.CreditAnalysDataSet.FieldByName('CREDITID').AsInteger;
  with  CustAnalysDataModule do
  begin

     with ReportDataSet do
     begin
       CloseAll;
       SetVariable('CrdID',Crdid);
       Open;
     end;

     with CMExcelExport do
     begin
       Connect;
       ExportDataset(ReportDataSet,'Hesabat',true);
       Disconnect;
     end;
  end;
end;

procedure TCreditForm.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
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
     // Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
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

end.
