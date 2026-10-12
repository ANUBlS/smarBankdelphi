Unit WesternUnionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, WesternUnion_TLB, StdVcl, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids, ActnList, ComCtrls, ToolWin, Menus, sboapiDataModuleImpl,
  Db, OracleData, Mask, DBCtrls, FileCtrl, ImgList, CurrencyEdit,
  SearchEdit, DBViewComboBox, ExcelExporter, CheckLst;

type
  TWesternUnionForm = class(TActiveForm, IWesternUnionForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ButtonLoad: TToolButton;
    ToolButton2: TToolButton;
    ButtonRefresh: TToolButton;
    ToolButton4: TToolButton;
    ButtonFilter: TToolButton;
    ToolButton7: TToolButton;
    StartDate: TDateTimePicker;
    ToolButton8: TToolButton;
    EndDate: TDateTimePicker;
    OpenFileDialog: TOpenDialog;
    ImageList: TImageList;
    LoadFile: TAction;
    ButtonDelete: TToolButton;
    ButtonConvert: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Panel4: TPanel;
    EditFileName: TEdit;
    ToolButton12: TToolButton;
    ButtonSearch: TToolButton;
    ToolButton14: TToolButton;
    ButtonPrint: TToolButton;
    PopupErrors: TPopupMenu;
    Clear1: TMenuItem;
    ClearErrorLogs: TAction;
    RefreshIncoming: TAction;
    SelectAll: TAction;
    ToolButton16: TToolButton;
    ButtonConfig: TToolButton;
    ConvertFileA: TAction;
    GridImage: TImageList;
    DeleteIncoming: TAction;
    Panel7: TPanel;
    PanelFileName: TPanel;
    Panel2: TPanel;
    PanelFilter: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    FileRich: TRichEdit;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    Panel8: TPanel;
    ListBoxErrors: TListBox;
    Panel9: TPanel;
    GridWUIncoming: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    Panel11: TPanel;
    SpeedButton1: TSpeedButton;
    GetConfig: TAction;
    SearchEditID: TSearchEdit;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    Accept: TAction;
    ExcelExporter1: TExcelExporter;
    LoadFile1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    IncomingFilter: TAction;
    SearchEditReference: TSearchEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxKind: TComboBox;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    PrintWithInterval: TAction;
    PrintTotal: TAction;
    ExcelExporterComplex: TExcelExporter;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    BranchFilter: TCheckListBox;
    Label2: TLabel;
    ComboFilter: TDBViewComboBox;
    procedure ActiveFormCreate(Sender: TObject);
    procedure LoadFileExecute(Sender: TObject);
    procedure ListBoxErrorsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ClearErrorLogsExecute(Sender: TObject);
    procedure RefreshIncomingExecute(Sender: TObject);
    procedure SelectAllExecute(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ConvertFileAExecute(Sender: TObject);
    procedure GridWUIncomingDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DeleteIncomingExecute(Sender: TObject);
    procedure GridWUIncomingTitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GetConfigExecute(Sender: TObject);
    procedure AcceptExecute(Sender: TObject);
    procedure ComboFilterDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboFilterChange(Sender: TObject);
    procedure IncomingFilterExecute(Sender: TObject);
    procedure N5DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure SearchEditReferenceExit(Sender: TObject);
    procedure ComboBoxKindDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure PrintTotalExecute(Sender: TObject);
    procedure PrintWithIntervalExecute(Sender: TObject);
    function GetFilterBody : String;
    procedure BranchFilterClickCheck(Sender: TObject);
    procedure ComboBoxKindChange(Sender: TObject);
  private
    { Private declarations }
    FEvents: IWesternUnionFormEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;

  end;
var
  WesternUnionForm : TWesternUnionForm;
  FilterFilialID: TStringList;

implementation


uses ComObj, ComServ, DataModuleUnit, ConfigUnit;

{$R *.DFM}

{ TWesternUnionForm }

procedure TWesternUnionForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_WesternUnionFormPage); }
end;

procedure TWesternUnionForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IWesternUnionFormEvents;
end;

procedure TWesternUnionForm.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TWesternUnionForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TWesternUnionForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TWesternUnionForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TWesternUnionForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TWesternUnionForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TWesternUnionForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TWesternUnionForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TWesternUnionForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TWesternUnionForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TWesternUnionForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TWesternUnionForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TWesternUnionForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TWesternUnionForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TWesternUnionForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TWesternUnionForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TWesternUnionForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TWesternUnionForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TWesternUnionForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TWesternUnionForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TWesternUnionForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TWesternUnionForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TWesternUnionForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TWesternUnionForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TWesternUnionForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TWesternUnionForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TWesternUnionForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TWesternUnionForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TWesternUnionForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TWesternUnionForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TWesternUnionForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TWesternUnionForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TWesternUnionForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TWesternUnionForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TWesternUnionForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TWesternUnionForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TWesternUnionForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TWesternUnionForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TWesternUnionForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TWesternUnionForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TWesternUnionForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TWesternUnionForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TWesternUnionForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TWesternUnionForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TWesternUnionForm.GetFilterBody : String;
  var
    I: Integer;
    FilterBranchBody,
    FilterKindBody,
    FilterBody       : String;
  //Check Rule Exsist
  function CheckBodyText(Abody : String) : String;
  var
    FilterSeperat : String;
  begin
     if (ABody <> EmptyStr) then
      FilterSeperat := 'OR'
       else
        FilterSeperat := EmptyStr;
     Result := FilterSeperat;
  end;
begin
 //Get Branch Filter
 with  BranchFilter, DataModWU do
 begin
  if Items.Count = 0 then
   Exit;
  FilterBranchBody := EmptyStr;
  for I := 0 to Items.Count -1 do
  begin
    if Checked[I] Then
     begin
     FilterBranchBody :=  FilterBranchBody
                          + CheckBodyText(FilterBranchBody)
                          + '(BranchID=' +TStringList(Pointer(BranchFilter.Tag)^).Strings[I]+ ')';
     end;
  end;
  if (FilterBranchBody <> EmptyStr) then
  begin
   FilterBranchBody := '(' + FilterBranchBody + ')';
  end
   else
    FilterBranchBody := EmptyStr;

  //Get Kind Filter
  with  ComboBoxKind do
  case ItemIndex of
    0 : FilterKindBody := EmptyStr;
    1 : FilterKindBody := FilterKindBody + CheckBodyText(FilterKindBody) + '(KIND = ''P'')';
    2 : FilterKindBody := FilterKindBody + CheckBodyText(FilterKindBody) + '(KIND = ''S'')';
   end;

  if ( FilterKindBody <> EmptyStr ) then
  begin
   FilterKindBody := '(' + FilterKindBody + ')';
  end
    else
     FilterKindBody := EmptyStr;

  //Set Filter For DataSet
  IF (not (FilterBranchBody = EmptyStr)) and
     (not (FilterKindBody = EmptyStr))
  THEN
  FilterBody :=  FilterBranchBody
                 + 'AND'
                 + FilterKindBody
   ELSE
      FilterBody :=  FilterBranchBody
                   + FilterKindBody;
  IF FilterBody <> EmptyStr THEN
  BEGIN
//    ShowMessage(FilterBody);
    DataWUIncoming.Filter := FilterBody;
    DataWUIncoming.Filtered := True;
  END
   else
    DataWUIncoming.Filtered := False;

 end;
end;

procedure ConvertFile;
  var i : integer;
begin
  with WesternUnionForm, DataModWU do
  begin
      if (EditFileName.Text = '')or
         (not FileExists(EditFileName.Text)) then Exit;
      for i := 0 to FileRich.Lines.Count - 1 do
      begin
        if Trim(FileRich.Lines[i]) = '' then continue;
        TempPack.CallProcedure('ConvertFileToTable',[FileRich.Lines[i]]);
      end;
  end;
end;

procedure TWesternUnionForm.ActiveFormCreate(Sender: TObject);
   var
   stDt,
   enDt : TDate;
   I :Integer;


begin
   WesternUnionForm := Self;
   DataModWU:=TDatamodWU.Create(Self);
   FormConfig:=TFormConfig.Create(Self);
   StartDate.Date := Date;
   EndDate.Date   := Date;
   stdt := Trunc(StartDate.Date);
   endt := Trunc(EndDate.Date);
   with DataModWU, ComboFilter do
   begin
    DataWUIncoming.SetVariable('StDate', StDt);
    DataWUIncoming.SetVariable('EnDate', EnDt);
    DataWUIncoming.Active := True;
    DataAccount.Active := True;
    DataValute.Active := True;
    DataBranch.Active := True;
    Items.Insert(0,'Ѕцтцн филилаллар');
    ItemIndex := 0
   end;
   // Create Branch Filter
   ComboBoxKind.ItemIndex := 0;
   FilterFilialID := TStringList.Create;
   with DataModWU, BranchFilter do
   begin
   BranchFilter.Clear;
   DataBranch.First;
   BranchFilter.Tag := Integer(@FilterFilialID) ;
   I := 0;
   while not DataBranch.Eof do
     begin
       Items.Add(DataBranch.FieldbyName('BRANCHNAME').AsString);
       Checked[I] := True;
       TStringList(Pointer(Tag)^).Add(DataBranch.FieldbyName('BRANCHID').AsString);
       Inc(I);
     DataBranch.Next;
     end;
   end;  
end;

procedure TWesternUnionForm.LoadFileExecute(Sender: TObject);
  var Cdir : String;
begin
   Cdir:= GetCurrentDir;
   TRY
   if OpenFileDialog.Execute then
     begin
      EditFileName.Text := OpenFileDialog.FileName;
      PanelFileName.Caption := ExtractFileName(OpenFileDialog.FileName);
      FileRich.Lines.LoadFromFile(OpenFileDialog.FileName);
      end;
   FINALLY
   SetCurrentDir(Cdir);
   END;
end;

procedure TWesternUnionForm.ListBoxErrorsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
   ListBoxErrors.Canvas.TextRect(Rect,22,Rect.Top,ListBoxErrors.Items[index]);
   ImageList.draw(ListBoxErrors.Canvas,Rect.Left+2 ,Rect.Top ,8,true);
end;

procedure TWesternUnionForm.ClearErrorLogsExecute(Sender: TObject);
begin
   ListBoxErrors.Items.Clear;
end;

procedure TWesternUnionForm.RefreshIncomingExecute(Sender: TObject);
   var stDt,enDt : TDate;
begin
   stdt := Trunc(StartDate.Date);
   endt := Trunc(EndDate.Date);
   DataModWU.DataWUIncoming.SetVariable('StDate', StDt);
   DataModWU.DataWUIncoming.SetVariable('EnDate', EnDt);

   DataModWU.DataWUIncoming.Refresh;
   GridWUIncoming.SelectedRows.Clear;
   
end;

procedure TWesternUnionForm.SelectAllExecute(Sender: TObject);
begin
  with GridWUIncoming, SelectedRows, DataSource.DataSet do
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

procedure TWesternUnionForm.ToolButton9Click(Sender: TObject);
begin
   if (EditFileName.Text <> '')and
      (FileExists(EditFileName.Text)) then
   begin
      with DataModWU do
      begin
        DataTempFile.Edit;
        TBlobField(DataTempFile.FieldByName('FileBody')).LoadFromFile(EditFileName.Text);
        DataTempFile.Post;
        sboapiDataModule.SBSession.Commit;
        ShowMessage(TempPack.CallStringFunction('ConvertFileToTable', [Length(FileRich.Text) - 1]));
      end;
   end;
end;

procedure TWesternUnionForm.ConvertFileAExecute(Sender: TObject);
begin
   ConvertFile;
   RefreshIncoming.Execute; 
end;

procedure TWesternUnionForm.GridWUIncomingDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  var  ImageIndex: Integer;
begin
  ImageIndex:=-1;
  with (Sender as TDBGrid) do
  begin
    if (Sender as TDBGrid).DataSource.DataSet.RecordCount <> 0 then
    begin
      case (Sender as TDBGrid).DataSource.DataSet.FieldByName('Status').AsInteger of
      0:
       ImageIndex := 0;
      1:
       ImageIndex := 1;
      end;
      if (DataCol = 2) and (ImageIndex <> -1) then
        begin
        Canvas.TextRect(Rect,Rect.Left, Rect.Top,'');
        GridImage.Draw(Canvas, Rect.Left + 2, Rect.Top + 1, ImageIndex, True);
        end
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);

      if (Sender as TDBGrid).DataSource.DataSet.FieldByName('KIND').AsString = 'S' then
          ImageIndex := 2
      else
          ImageIndex := 3;
        end;
        if (DataCol = 0) and (ImageIndex <> -1) then
            GridImage.Draw(Canvas, Rect.Left  Rect.Top, ImageIndex, True);
      end;
end;

procedure TWesternUnionForm.DeleteIncomingExecute(Sender: TObject);
   var i,j : integer;
begin
   GridWUIncoming.SetFocus;
   GridWUIncoming.SelectedRows.CurrentRowSelected:=GridWUIncoming.DataSource.DataSet.RecordCount<>0;
   for i:=0 to GridWUIncoming.SelectedRows.Count-1 do
   begin
      GridWUIncoming.DataSource.DataSet.GotoBookmark(pointer(GridWUIncoming.SelectedRows.items[i]));
      case MessageDlg(Format('Emeliyyat  #%d silinsinmi ?',[GridWUIncoming.DataSource.DataSet.FieldByName('ID').Asinteger]),
                                                            mtConfirmation,[mbyes,mbno,mbcancel,mball], 0) of
           mryes :begin
                  DataModWU.TempPack.CallProcedure('wu_incoming_delete',[GridWUIncoming.DataSource.DataSet.fieldbyname('ID').asinteger]);
                  RefreshIncoming.Execute;
                  end;
           mrno  : exit;
           mrcancel : Break;
           mrall : begin
                   case MessageDlg(Format('%d sayda emeliyyat silinsinmi ?',[GridWUIncoming.SelectedRows.Count]), mtConfirmation,[mbyes,mbno], 0) of
                   mryes: begin
                             for j:=0 to GridWUIncoming.SelectedRows.Count-1 do
                             begin
                                GridWUIncoming.DataSource.DataSet.GotoBookmark(pointer(GridWUIncoming.SelectedRows.items[j]));
                                DataModWU.TempPack.CallProcedure('wu_incoming_delete',[GridWUIncoming.DataSource.DataSet.fieldbyname('ID').asinteger]);
                             end;
                          RefreshIncoming.Execute;
                          break;
                          end;
                   mrno : exit;
                   end;
                   end;
      end;
   end;

end;

procedure TWesternUnionForm.GridWUIncomingTitleClick(Column: TColumn);
   var
     i : Integer; 
begin
   if Column.FieldName = '' then
   Exit;
   with DataModWU do
   begin
    DataWUIncoming.SetVariable('Title', Column.FieldName);
    DataWUIncoming.Refresh;
   end;
   GridWUIncoming.SelectedRows.Clear;
   with GridWUIncoming do
    for i := 0 to Columns.Count - 1 do
    begin
      Columns[i].Title.Font.Style := [];
    end;
   Column.Title.Font.Style := [fsUnderline];
end;

procedure TWesternUnionForm.SpeedButton1Click(Sender: TObject);
begin
  PanelFilter.Visible := False;
  ButtonFilter.Down := False;
end;

procedure TWesternUnionForm.GetConfigExecute(Sender: TObject);
begin
  with FormConfig, DataModWU do
  begin
   P_ComboDC.ItemIndex := 0;
   R_ComboDC.ItemIndex := 0;
//   DBViewComboBox1.ItemIndex :=0;
//   DBViewComboBox3.ItemIndex :=0;
   P_ComboBranch.ItemIndex :=0;
   R_ComboBranch.ItemIndex :=0;
   Revenue.Clear;
   Principial.Clear;
   if not AccountPrincipial.Active then
      AccountPrincipial.Active := true;
   if not AccountRevenue.Active then
      AccountRevenue.Active := true;
   CheckBox1.Checked := DataConfig.FieldByName('PRINCIPIALTRANS').AsInteger =1;
   ShowModal;
  end;
end;

procedure TWesternUnionForm.AcceptExecute(Sender: TObject);
   var I : Integer;
begin
  with DataModWU, GridWUIncoming do
  TRY
   begin
    if DataWUIncoming.IsEmpty   then Exit;
    DataWUIncoming.DisableControls;
    SetFocus;
    SelectedRows.CurrentRowSelected:=DataSource.DataSet.RecordCount<>0;
    for i:=0 to SelectedRows.Count-1 do
    begin
      DataSource.DataSet.GotoBookmark(pointer(SelectedRows.items[i]));
      TempPack.CallProcedure('SetTransaction', [DataWUIncoming.FieldByName('ID').AsInteger]);
    end;
  end;
  finally
  RefreshIncoming.Execute;
  DataWUIncoming.EnableControls;
  end;
end;

procedure TWesternUnionForm.ComboFilterDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 with Control as TDBViewComboBox do
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

procedure TWesternUnionForm.ComboFilterChange(Sender: TObject);
begin
   with DataModWU, ComboFilter do
   begin
    if ItemIndex = 0 then
     DataWUIncoming.Filter := ''
    else
     begin
//       DataBranch.Locate('BRANCHNAME', TDBViewComboBox(Sender).Text,[]) ;
       DataWUIncoming.Filter := 'branchID = ' + DataBranch.FieldByName('branchID').AsString;
       ShowMessage(DataBranch.FieldByName('branchID').AsString);
     end;
   end;
end;

procedure TWesternUnionForm.IncomingFilterExecute(Sender: TObject);
begin
   PanelFilter.Visible := ButtonFilter.Down;
   SearchEditID.Clear;
end;

procedure TWesternUnionForm.N5DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
 var Stext : String;
  LineBottom: Integer;
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
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption+'      ');
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
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

procedure TWesternUnionForm.SearchEditReferenceExit(Sender: TObject);
begin
  TSearchEdit(Sender).Clear;
end;

procedure TWesternUnionForm.ComboBoxKindDrawItem(Control: TWinControl;
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

procedure TWesternUnionForm.PrintTotalExecute(Sender: TObject);
   var stDt,enDt : TDate;
begin
  with DataModWU do
  begin
    if DataWUIncoming.IsEmpty then
     Exit;
  TRY
    Screen.Cursor:=crSQLWait; 
    DataReport.Close;
    stdt := Trunc(StartDate.Date);
    endt := Trunc(EndDate.Date);
    DataReport.SetVariable('StDate', StDt);
    DataReport.SetVariable('EnDate', EnDt);
    DataReport.Filter := DataWUIncoming.Filter;
    DataReport.Open;
    ExcelExporter1.Report;
  FINALLY
    Screen.Cursor:=crDefault;
  end;
  end;

end;

procedure TWesternUnionForm.PrintWithIntervalExecute(Sender: TObject);
   var stDt,enDt : TDateTime;
begin
  with DataModWU do
  begin
    if DataWUIncoming.IsEmpty then
     Exit;
  TRY
    Screen.Cursor:=crSQLWait;
    DataReport.Close;
    stdt := Int(StartDate.Date);
    endt := Int(EndDate.Date);
    TempPack.CallProcedure('ImportReportTable', [stDt, EnDt]);
    DataReportComplex.Refresh;
    ExcelExporterComplex.Report;
  FINALLY
    Screen.Cursor:=crDefault;
  end;  
  end;
end;

procedure TWesternUnionForm.BranchFilterClickCheck(Sender: TObject);
begin
  GetFilterBody;
end;

procedure TWesternUnionForm.ComboBoxKindChange(Sender: TObject);
begin
  GetFilterBody;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TWesternUnionForm,
    Class_WesternUnionForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
