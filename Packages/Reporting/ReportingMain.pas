unit ReportingMain;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Reporting_TLB, StdVcl, StdCtrls, Buttons, ComCtrls, Grids,
  DBGrids, ExtCtrls, DB, OracleData, DBCtrls, Oracle, QExport4, QExport4Xlsx,
  Mask, DBGridEh, DBCtrlsEh, DBLookupEh, CMExcelExport, TypInfo, DBXJSON;

type
  TReporting = class(TActiveForm, IReporting)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DTPicker1: TDateTimePicker;
    DTPicker2: TDateTimePicker;
    BtnOK: TBitBtn;
    ODS_Date: TOracleDataSet;
    ODS_Reporting: TOracleDataSet;
    BtnExpand: TSpeedButton;
    DS_Reporting: TDataSource;
    DBGrid2: TDBGrid;
    ODS_SQL: TOracleDataSet;
    DS_SQL: TDataSource;
    BtnRefresh: TBitBtn;
    BtnExcel: TBitBtn;
    QExport4Xlsx1: TQExport4Xlsx;
    PanelParameters: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    BtnSQLAdd: TButton;
    PanelSQLAdd: TPanel;
    MemoSQLAdd: TMemo;
    EditSQLPass: TEdit;
    Panel2: TPanel;
    ODS_Labels: TOracleDataSet;
    ODS_Combo1: TOracleDataSet;
    DS_Combo1: TDataSource;
    CBox1: TDBLookupComboboxEh;
    CBox2: TDBLookupComboboxEh;
    ODS_Combo2: TOracleDataSet;
    DS_Combo2: TDataSource;
    CBox3: TDBLookupComboboxEh;
    CBox4: TDBLookupComboboxEh;
    CBox5: TDBLookupComboboxEh;
    ODS_Combo3: TOracleDataSet;
    DS_Combo3: TDataSource;
    ODS_Combo4: TOracleDataSet;
    DS_Combo4: TDataSource;
    ODS_Combo5: TOracleDataSet;
    DS_Combo5: TDataSource;
    CBoxGroups: TDBLookupComboboxEh;
    ODS_Groups: TOracleDataSet;
    DS_Groups: TDataSource;
    LabelVar1: TLabel;
    LabelVar2: TLabel;
    LabelVar3: TLabel;
    LabelVar4: TLabel;
    LabelVar5: TLabel;
    CMExcelExport1: TCMExcelExport;
    LblCount: TLabel;
    OQR_PROC: TOracleQuery;
    SB_ACA: TOraclePackage;
    BtnPDF: TBitBtn;
    ProgressBar1: TProgressBar;
    BtnClear1: TSpeedButton;
    BtnClear2: TSpeedButton;
    BtnClear3: TSpeedButton;
    BtnClear4: TSpeedButton;
    BtnClear5: TSpeedButton;
    PanelReportingLabels: TPanel;
    BtnLabelsSave: TSpeedButton;
    ODS_LabelsSettings: TOracleDataSet;
    BtnLabelsCancel: TSpeedButton;
    EditDisplayLabel: TDBEdit;
    EditWidth: TDBEdit;
    DS_LabelsSettings: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    LblTime: TLabel;
    ChBoxShowCount: TCheckBox;
    BtnJSON: TBitBtn;
    procedure BtnExpandClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure ODS_ReportingAfterScroll(DataSet: TDataSet);
    procedure BtnSQLAddClick(Sender: TObject);
    procedure ODS_GroupsAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnPDFClick(Sender: TObject);
    procedure ExportToXLSPDF(FileType :string);
    procedure BtnClear1Click(Sender: TObject);
    procedure BtnClear2Click(Sender: TObject);
    procedure BtnClear3Click(Sender: TObject);
    procedure BtnClear4Click(Sender: TObject);
    procedure BtnClear5Click(Sender: TObject);
    procedure BtnLabelsSaveClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BtnLabelsCancelClick(Sender: TObject);
    procedure ChBoxShowCountClick(Sender: TObject);
    procedure QExport4Xlsx1GetDataParams(Sender: TObject; const Col,
      Row: Integer; var Style: TXlsxCellStyle; var UseStyle: Boolean);
    procedure BtnJSONClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IReportingEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);

  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ShlObj,ComServ, SboapiDataModuleImpl, SBTranslateProc,
  StrUtils, Variants, ShellAPI;

{$R *.DFM}

{ TReporting }

procedure TReporting.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ReportingPage); }
end;

procedure TReporting.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IReportingEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TReporting.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TReporting.Get_Active: WordBool;
begin
  Result := Active;
end;

function TReporting.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TReporting.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TReporting.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TReporting.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TReporting.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TReporting.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TReporting.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TReporting.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TReporting.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TReporting.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TReporting.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TReporting.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TReporting.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TReporting.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TReporting.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TReporting.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TReporting.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TReporting.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TReporting.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TReporting.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TReporting.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TReporting.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TReporting.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TReporting.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TReporting.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TReporting.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TReporting.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TReporting.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TReporting.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TReporting.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TReporting.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TReporting._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TReporting.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TReporting.ActiveFormCreate(Sender: TObject);
begin
  ODS_Date.Open;
  DTPicker1.Date := ODS_Date.FieldByName('tek_dat').AsDateTime;
  DTPicker2.Date := ODS_Date.FieldByName('tek_dat').AsDateTime;
  ODS_Groups.Open;
  ODS_Groups.First;
  CBoxGroups.KeyValue:=0;
  ODS_Reporting.Open;

  SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;


function DesktopPath:string;
var zpath: array [0..MAX_PATH] of char;
begin
 SHGetFolderPath(0, CSIDL_DESKTOP, 0, SHGFP_TYPE_CURRENT, @zpath);
 result:=   (zpath);
end;

procedure TReporting.ExportToXLSPDF(FileType :string);
var
  FilePath :string;
  i, EmpRows :integer;
  FillColorField: TField;
begin
  ProgressBar1.Position := 20;
  Application.ProcessMessages;

  FilePath := ODS_Reporting.FieldByName('FileName').AsString;
  QExport4Xlsx1.DataSet := ODS_SQL;
  QExport4Xlsx1.ShowFile := False;

  if FilePath = '' then QExport4Xlsx1.FileName := DesktopPath+'\Reporting.xlsx'
   else if ContainsText(FilePath, 'DesktopPath') then QExport4Xlsx1.FileName
    := DesktopPath + StringReplace(FilePath, 'DesktopPath', '', [rfReplaceAll, rfIgnoreCase])
   else QExport4Xlsx1.FileName := FilePath;

  if (ODS_Reporting.FieldByName('FileShow').AsInteger = 1)
   and (FileType='xlsx') then QExport4Xlsx1.ShowFile := True;
  QExport4Xlsx1.Header.Text := ODS_Reporting.FieldByName('Header').AsWideString; // + #13 + #13;
  if ODS_Reporting.FieldByName('EmptyRows').IsNull then EmpRows:=0
   else EmpRows := ODS_Reporting.FieldByName('EmptyRows').AsInteger;
  if EmpRows > 0 then for i := 0 to EmpRows - 1 do
   QExport4Xlsx1.Header.Text := QExport4Xlsx1.Header.Text + #13;

  QExport4Xlsx1.Footer.Text := #13 + ODS_Reporting.FieldByName('Footer').AsWideString;
  QExport4Xlsx1.Formats.ThousandSeparator := FormatSettings.ThousandSeparator;

  //FillColorField := ODS_SQL.FindField('FillColor');
  //if Assigned(FillColorField) then FillColorField.Visible := False;
  QExport4Xlsx1.Execute;

  FilePath := ODS_Reporting.FieldByName('FileName2').AsString;
  if ODS_Reporting.FieldByName('FileName2').AsString <> '' then
  with QExport4Xlsx1 do begin
   if ContainsText(FilePath, 'DesktopPath') then FileName
     := DesktopPath + StringReplace(FilePath, 'DesktopPath', '', [rfReplaceAll, rfIgnoreCase])
    else FileName := FilePath;

   DataSet := nil;
   if FileType='xlsx' then ShowFile := True;
   try
    //FillColorField := ODS_SQL.FindField('FillColor');
    //if Assigned(FillColorField) then FillColorField.Visible := False;
     Execute;
   except
   end;
  end;

  ProgressBar1.Position := 100;
  Application.ProcessMessages;
end;

procedure TReporting.BtnExcelClick(Sender: TObject);
var FilePath :string;
begin
  ExportToXLSPDF('xlsx');
  //ShowMessage('Hazir');
  {FilePath := ODS_Reporting.FieldByName('FileName').AsString;
  if FilePath = '' then FilePath := DesktopPath+'\Reporting.xlsx'
   else if ContainsText(FilePath, 'DesktopPath')
    then FilePath := DesktopPath + StringReplace(FilePath, 'DesktopPath', '',
      [rfReplaceAll, rfIgnoreCase]);
  with CMExcelExport1 do begin

   Filename := FilePath;
        Connect;
   LblCount.Caption := Filename;}
   //if ODS_Reporting.FieldByName('FileShow').AsInteger = 1 then
   //ExportDataset(ODS_SQL, 'Sheet', True, False);
    //else
    //ExportDataset(ODS_SQL, 'Sheet', False, False);
  // Disconnect;
  //end;
  //LblCount.Caption := ODS_Reporting.FieldByName('FileShow').AsString;

  {FilePath := ODS_Reporting.FieldByName('FileName2').AsString;
  if FilePath <> '' then begin
   if ContainsText(FilePath, 'DesktopPath')
    then FilePath := DesktopPath + StringReplace(FilePath, 'DesktopPath', '',
      [rfReplaceAll, rfIgnoreCase]);
  LblCount.Caption := ODS_Reporting.FieldByName('FileName2').Asstring;
  with CMExcelExport1 do begin
   Connect;
   Filename := FilePath;}
   //ExportDataset(nil, 'Sheet', True, False);

   //CMExcelExport1.ShowExcel;
   //ShowMessage('ozzun');
   //Disconnect;
  //end;
  //end;

end;

procedure TReporting.BtnOKClick(Sender: TObject);
var
  i :integer;
  a: string;
begin
  if ODS_Reporting.FieldByName('Grp_ID').AsInteger > 0 then
   SB_ACA.CallProcedure('CheckAdvancedObjectAccess',['REPORTING_'+
    ODS_Reporting.FieldByName('Grp_ID').AsString]);

  LblCount.Caption := 'Gözləyin!!!';
  LblCount.Font.Color := clRed;
  LblTime.Caption := TimeToStr(Now);
  ProgressBar1.Position := 20;
  Application.ProcessMessages;

  with OQR_PROC do begin
   SQL.Text := ODS_Reporting.FieldByName('Proc').AsString;
   DeleteVariables;

   if ContainsText(SQL.Text, ':dat1') then
    DeclareAndSet('dat1', otDate, trunc(DTPicker1.Date));

   if ContainsText(SQL.Text, ':dat2') then
    DeclareAndSet('dat2', otDate, trunc(DTPicker2.Date));

   if Length(Trim(ODS_Reporting.FieldByName('Proc').AsString)) > 0
    then Execute;
  end;

  with ODS_SQL do begin
   SQL.Text := ODS_Reporting.FieldByName('SQLText').AsString;
   CloseAll;
   DeleteVariables;

   if ContainsText(SQL.Text, ':dat1') then
    DeclareAndSet('dat1', otDate, trunc(DTPicker1.Date));

   if ContainsText(SQL.Text, ':dat2') then
    DeclareAndSet('dat2', otDate, trunc(DTPicker2.Date));


   for i :=1 to 5 do
    if ContainsText(SQL.Text, ':var' + IntToStr(i)) then begin
     a := ODS_Reporting.FieldByName('var' + IntToStr(i)).AsString;
     if a <> '' then begin
      a := StringReplace(a, ',' ,''',''',[rfReplaceAll]);
      a := StringReplace(a, ', ' ,''',''',[rfReplaceAll]);
      a := StringReplace(a, ' , ' ,''',''',[rfReplaceAll]);
      a := StringReplace(a, ' ,' ,''',''',[rfReplaceAll]);
     end;
     DeclareAndSet('var' + IntToStr(i), otSubst,
      //'('''+ODS_Reporting.FieldByName('var' + IntToStr(i)).AsVariant+''')');
      '(''' +
      //StringReplace(ODS_Reporting.FieldByName('var' + IntToStr(i)).AsVariant, ',' ,''',''',[rfReplaceAll])
      a
      + ''')');

    if VarIsNull(ODS_Reporting.FieldByName('var' + IntToStr(i)).AsVariant) then
     SetVariable('var' + IntToStr(i), ''''' or 1=1 ');
    end;

   for i :=1 to 5 do
    if ContainsText(SQL.Text, ':par' + IntToStr(i)) then
    DeclareAndSet('par' + IntToStr(i), otSubst,
     ODS_Reporting.FieldByName('par' + IntToStr(i)).AsVariant);

   if ContainsText(SQL.Text, ':c1') then
    if CBox1.Text='' then begin
     SetVariable('par1', '1');
     DeclareAndSet('c1', otSubst, ' = 1');
    end
     else DeclareAndSet('c1', otSubst, '='+ODS_Combo1.FieldByName(CBox1.KeyField).AsString);

   if ContainsText(SQL.Text, ':c2') then
    if CBox2.Text='' then begin
     SetVariable('par2', '1');
     DeclareAndSet('c2', otSubst, ' = 1');
    end
     else DeclareAndSet('c2', otSubst, '='+ODS_Combo2.FieldByName(CBox2.KeyField).AsString);

   if ContainsText(SQL.Text, ':c3') then
    if CBox3.Text='' then begin
     SetVariable('par3', '1');
     DeclareAndSet('c3', otSubst, ' = 1');
    end
     else DeclareAndSet('c3', otSubst, '='+ODS_Combo3.FieldByName(CBox3.KeyField).AsString);

   if ContainsText(SQL.Text, ':c4') then
    if CBox4.Text='' then begin
     SetVariable('par4', '1');
     DeclareAndSet('c4', otSubst, ' = 1');
    end
     else DeclareAndSet('c4', otSubst, '='+ODS_Combo4.FieldByName(CBox4.KeyField).AsString);

   if ContainsText(SQL.Text, ':c5') then
    if CBox5.Text='' then begin
     SetVariable('par5', '1');
     DeclareAndSet('c5', otSubst, ' = 1');
    end
     else DeclareAndSet('c5', otSubst, '='+ODS_Combo5.FieldByName(CBox5.KeyField).AsString);

   QueryAllRecords := ODS_Reporting.FieldByName('ShowCount').AsInteger = 1;
   Open;

   if ODS_Reporting.FieldByName('ShowCount').AsInteger = 1 then
    LblCount.Caption := SysUtils.FormatFloat('# ### ### ###', RecordCount)
    else LblCount.Caption := 'Hazırdır!!!';
   LblCount.Font.Color := clWindowText;
   LblTime.Caption := TimeToStr(Now - StrToTime(LblTime.Caption));
   ProgressBar1.Position := 100;
  end;

  with ODS_Labels do begin
    CloseAll;
    SetVariable('report', ODS_Reporting.FieldByName('id').AsInteger);
    Open;
    First;
  end;

  for i:=0 to ODS_SQL.FieldCount - 1 do begin
   if ODS_SQL.Fields[i].DisplayWidth * 6 < 300 then
    DBGrid2.Columns[i].Width := ODS_SQL.Fields[i].DisplayWidth * 6
    else DBGrid2.Columns[i].Width := 300;
  end;

  for i:=0 to ODS_Labels.RecordCount-1 do begin
    DBGrid2.Columns[ODS_Labels.FieldByName('Field_ID').AsInteger].Width :=
     ODS_Labels.FieldByName('Width').AsInteger;
    ODS_SQL.Fields[ODS_Labels.FieldByName('Field_ID').AsInteger].DisplayLabel :=
     ODS_Labels.FieldByName('DisplayLabel').AsString;
    ODS_Labels.Next;
  end;
  //ShowMessage(ODS_SQL.SQL.Text);
end;

procedure TReporting.BtnPDFClick(Sender: TObject);
var
  ExcelApp, Workbook: OleVariant;
  FilePath: string;
begin
  ExportToXLSPDF('pdf');
  CoInitialize(nil);
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := False;
  ExcelApp.DisplayAlerts := False;
  FilePath := QExport4Xlsx1.FileName;
  Workbook := ExcelApp.Workbooks.Open(FilePath, 3); // 3 = update all links
  FilePath := StringReplace(FilePath, '.xlsx', '.pdf', [rfReplaceAll, rfIgnoreCase]);
  Workbook.ExportAsFixedFormat(0, FilePath);
  Workbook.Close(False);
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  Workbook := Unassigned;
  CoUninitialize;
  ShellExecute(0, 'open', PChar(FilePath), nil, nil, SW_SHOWNORMAL);
end;

procedure TReporting.BtnRefreshClick(Sender: TObject);
begin
  ODS_Reporting.Refresh;
end;

procedure TReporting.BtnSQLAddClick(Sender: TObject);
begin
  if PanelSQLAdd.Visible = False then begin
   if EditSQLPass.Text = 'reporting' then
    PanelSQLAdd.Visible := True
  end
  else PanelSQLAdd.Visible := False;
  end;

procedure TReporting.Button1Click(Sender: TObject);
begin
  ODS_Groups.Next;
end;

procedure TReporting.Button2Click(Sender: TObject);
begin
  ODS_Groups.First;
end;

procedure TReporting.Button3Click(Sender: TObject);
begin
  ODS_Groups.Prior;
end;

procedure TReporting.ChBoxShowCountClick(Sender: TObject);
begin
  with ODS_Reporting do begin
    Edit;
    FieldByName('ShowCount').AsInteger := Ord(ChBoxShowCount.Checked);
    Post;
  end;
end;

procedure TReporting.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TReporting.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TReporting.DBGrid1DblClick(Sender: TObject);
begin
  BtnOK.Click;
end;

procedure TReporting.DBGrid2DblClick(Sender: TObject);
begin
  if ODS_Reporting.FieldByName('id').AsInteger > 0 then begin

   with ODS_LabelsSettings do begin
    CloseAll;
    SetVariable('report', ODS_Reporting.FieldByName('id').AsInteger);
    SetVariable('fieldid', DBGrid2.SelectedIndex);
    Open;
    First;
   end;

   if ODS_LabelsSettings.RecordCount = 0 then
   with ODS_LabelsSettings do begin
    Insert;
    FieldByName('rep_id').AsInteger := ODS_Reporting.FieldByName('ID').AsInteger;
    FieldByName('field_id').AsInteger := DBGrid2.SelectedIndex;
   end
   else ODS_LabelsSettings.Edit;

   PanelReportingLabels.Visible := True;

  end;
end;

procedure TReporting.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TReporting.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TReporting.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TReporting.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TReporting.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TReporting.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TReporting.ODS_GroupsAfterScroll(DataSet: TDataSet);
begin
  with ODS_Reporting do begin
   CloseAll;
   SetVariable('grp', ODS_Groups.FieldByName('id').AsInteger);
   Open;
  end;
end;

procedure TReporting.ODS_ReportingAfterScroll(DataSet: TDataSet);
begin
  with ODS_Reporting do begin
   DTPicker1.Visible := ContainsText(FieldByName('SQLText').AsString, ':dat1')
    or ContainsText(FieldByName('Proc').AsString, ':dat1');
   DTPicker2.Visible := ContainsText(FieldByName('SQLText').AsString, ':dat2')
    or ContainsText(FieldByName('Proc').AsString, ':dat2');

   ChBoxShowCount.Checked := FieldByName('ShowCount').AsInteger = 1;

   CBox1.Visible := False;
   ODS_Combo1.CloseAll;
   if ContainsText(FieldByName('SQLText').AsString, ':c1') then begin
    ODS_Combo1.SetVariable('tbl', FieldByName('c1').AsString);
    CBox1.ListField := FieldByName('c1List').AsString;
    CBox1.KeyField := FieldByName('c1Key').AsString;
    ODS_Combo1.Open;
    CBox1.Visible := True;
   end;
   BtnClear1.Visible := CBox1.Visible;

   CBox2.Visible := False;
   ODS_Combo2.CloseAll;
   if ContainsText(FieldByName('SQLText').AsString, ':c2') then begin
    ODS_Combo2.SetVariable('tbl', FieldByName('c2').AsString);
    CBox2.ListField := FieldByName('c2List').AsString;
    CBox2.KeyField := FieldByName('c2Key').AsString;
    ODS_Combo2.Open;
    CBox2.Visible := True;
   end;
   BtnClear2.Visible := CBox2.Visible;

   CBox3.Visible := False;
   ODS_Combo3.CloseAll;
   if ContainsText(FieldByName('SQLText').AsString, ':c3') then begin
    ODS_Combo3.SetVariable('tbl', FieldByName('c3').AsString);
    CBox3.ListField := FieldByName('c3List').AsString;
    CBox3.KeyField := FieldByName('c3Key').AsString;
    ODS_Combo3.Open;
    CBox3.Visible := True;
   end;
   BtnClear3.Visible := CBox3.Visible;

   CBox4.Visible := False;
   ODS_Combo4.CloseAll;
   if ContainsText(FieldByName('SQLText').AsString, ':c4') then begin
    ODS_Combo4.SetVariable('tbl', FieldByName('c4').AsString);
    CBox4.ListField := FieldByName('c4List').AsString;
    CBox4.KeyField := FieldByName('c4Key').AsString;
    ODS_Combo4.Open;
    CBox4.Visible := True;
   end;
   BtnClear4.Visible := CBox4.Visible;

   CBox5.Visible := False;
   ODS_Combo5.CloseAll;
   if ContainsText(FieldByName('SQLText').AsString, ':c5') then begin
    ODS_Combo5.SetVariable('tbl', FieldByName('c5').AsString);
    CBox5.ListField := FieldByName('c5List').AsString;
    CBox5.KeyField := FieldByName('c5Key').AsString;
    ODS_Combo5.Open;
    CBox5.Visible := True;
   end;
   BtnClear5.Visible := CBox5.Visible;

   PanelParameters.Visible := ContainsText(FieldByName('SQLText').AsString, ':var');
   PanelParameters.AutoSize := False;
   PanelParameters.Width := 2000;
   DBEdit1.Visible := ContainsText(FieldByName('SQLText').AsString, ':var1');
   DBEdit2.Visible := ContainsText(FieldByName('SQLText').AsString, ':var2');
   DBEdit3.Visible := ContainsText(FieldByName('SQLText').AsString, ':var3');
   DBEdit4.Visible := ContainsText(FieldByName('SQLText').AsString, ':var4');
   DBEdit5.Visible := ContainsText(FieldByName('SQLText').AsString, ':var5');

   LabelVar1.Caption := FieldByName('var1Label').AsString;
   LabelVar2.Caption := FieldByName('var2Label').AsString;
   LabelVar3.Caption := FieldByName('var3Label').AsString;
   LabelVar4.Caption := FieldByName('var4Label').AsString;
   LabelVar5.Caption := FieldByName('var5Label').AsString;

   LabelVar1.Visible := DBEdit1.Visible;
   LabelVar2.Visible := DBEdit2.Visible;
   LabelVar3.Visible := DBEdit3.Visible;
   LabelVar4.Visible := DBEdit4.Visible;
   LabelVar5.Visible := DBEdit5.Visible;

   PanelParameters.AutoSize := True;
  end;
end;

procedure TReporting.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;


procedure TReporting.QExport4Xlsx1GetDataParams(
  Sender: TObject; const Col, Row: Integer;
  var Style: TXlsxCellStyle; var UseStyle: Boolean);
var
  FColor: TField;
  S: string;
  C: TColor;
begin
  UseStyle := False;
  if Row <= 0 then Exit;
  FColor := ODS_SQL.FindField('FILLCOLOR');
  if (FColor = nil) or FColor.IsNull then Exit;
  S := Trim(FColor.AsString);
  if S = '' then Exit;
  if not StartsText('cl', S) then S := 'cl' + S;
  if not IdentToColor(S, Integer(C)) then Exit;
  Style.BackgroundColor := ColorToRGB(C);
  UseStyle := True;
end;

procedure TReporting.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TReporting.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TReporting.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TReporting.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TReporting.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TReporting.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TReporting.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TReporting.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TReporting.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TReporting.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TReporting.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TReporting.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TReporting.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TReporting.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TReporting.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TReporting.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TReporting.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TReporting.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TReporting.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TReporting.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TReporting.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TReporting.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TReporting.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TReporting.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TReporting.BtnLabelsSaveClick(Sender: TObject);
begin
  ODS_LabelsSettings.Post;
  PanelReportingLabels.Visible := False;
end;

procedure TReporting.BtnLabelsCancelClick(Sender: TObject);
begin
  ODS_LabelsSettings.Cancel;
  PanelReportingLabels.Visible := False;
end;

procedure TReporting.BtnExpandClick(Sender: TObject);
begin
  DBGrid1.Visible := not DBGrid1.Visible;
end;

type
  TArrState = class            // grouping state of one template array
  public
    Tpl: TJSONArray;           // the array node in the template
    Arr: TJSONArray;           // instance currently open for new elements
    CurKey: string;
    CurElem: TJSONValue;
  end;

// JSON export driven by reporting.JSONTEMPLATE
//   "{COL}" / "{COL:num|int|date|bool}"  value of column COL in the current row
//   "{#ROW}"                             row number 1, 2, 3 ...
//   [ {...} ]                            first element repeated once per group of consecutive
//                                        rows with equal values in the columns referenced
//                                        directly inside it (nested arrays do not count)
//   "#name": "{COL}"                     used for grouping only, not written to the file
// Without a template: {"<Header|Name>": [ {col: value, ...}, ... ]}  (old flat format)
procedure TReporting.BtnJSONClick(Sender: TObject);
const
  TZ = '+04:00';   // time-zone suffix for ISO dates (Baku)
var
  Tpl, Root: TJSONValue;
  F: TField;
  TplText, FilePath, Msg: string;
  Bytes: TBytes;
  i, NRows: Integer;
  Stream: TFileStream;
  Missing: TStringList;
  States: TList;
  SB: TStringBuilder;

  function NumStr(V: Double): string;            // '.' decimal in any locale
  var Fmt: TFormatSettings;
  begin
    Fmt := FormatSettings;
    Fmt.DecimalSeparator := '.';
    Result := FormatFloat('0.####', V, Fmt);
  end;

  // "{COL}" or "{COL:kind}"  ->  column name + kind (str num int date bool)
  function IsRef(const S: string; out Col, Kind: string): Boolean;
  var p: Integer;
  begin
    Result := (Length(S) > 2) and (S[1] = '{') and (S[Length(S)] = '}');
    if not Result then Exit;
    Col := Copy(S, 2, Length(S) - 2);
    p := Pos(':', Col);
    if p > 0 then begin
      Kind := LowerCase(Trim(Copy(Col, p + 1, MaxInt)));
      Col := Copy(Col, 1, p - 1);
    end
    else Kind := 'str';
    Col := UpperCase(Trim(Col));
  end;

  function StateOf(Node: TJSONArray): TArrState;
  var i: Integer;
  begin
    for i := 0 to States.Count - 1 do
      if TArrState(States[i]).Tpl = Node then begin
        Result := TArrState(States[i]);
        Exit;
      end;
    Result := TArrState.Create;
    Result.Tpl := Node;
    States.Add(Result);
  end;

  // value of the current row for one reference
  function LeafValue(const Col, Kind: string): TJSONValue;
  var F: TField; S: string;
  begin
    if Col = '#ROW' then begin
      Result := TJSONNumber.Create(IntToStr(NRows + 1));
      Exit;
    end;
    F := ODS_SQL.FindField(Col);
    if F = nil then Missing.Add(Col);
    if (F = nil) or F.IsNull then begin
      if Kind = 'bool' then Result := TJSONFalse.Create else Result := TJSONNull.Create;
      Exit;
    end;
    if Kind = 'num' then Result := TJSONNumber.Create(NumStr(F.AsFloat))
    else if Kind = 'int' then Result := TJSONNumber.Create(IntToStr(F.AsInteger))
    else if Kind = 'bool' then begin
      S := UpperCase(Trim(F.AsString));
      if (S = '1') or (S = 'Y') or (S = 'T') or (S = 'TRUE') then Result := TJSONTrue.Create
      else Result := TJSONFalse.Create;
    end
    else if (Kind = 'date') and (F.DataType in [ftDate, ftDateTime, ftTimeStamp]) then
      Result := TJSONString.Create(FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', F.AsDateTime) + TZ)
    else if F is TNumericField then Result := TJSONString.Create(NumStr(F.AsFloat))
    else Result := TJSONString.Create(Trim(F.AsString));
  end;

  // grouping key of a template node for the current row
  function RowKey(Node: TJSONValue): string;
  var i: Integer; Col, Kind: string; F: TField;
  begin
    Result := '';
    if Node is TJSONObject then begin
      for i := 0 to TJSONObject(Node).Size - 1 do
        Result := Result + RowKey(TJSONObject(Node).Get(i).JsonValue);
    end
    else if (Node is TJSONString) and not (Node is TJSONNumber) then begin
      if IsRef(TJSONString(Node).Value, Col, Kind) then begin
        if Col = '#ROW' then Result := IntToStr(NRows + 1) + '|'
        else begin
          F := ODS_SQL.FindField(Col);
          if F <> nil then Result := F.AsString + '|';
        end;
      end;
    end;
  end;

  // new instance of a template node, filled from the current row
  function Instantiate(Node: TJSONValue): TJSONValue;
  var i: Integer; O: TJSONObject; A: TJSONArray; St: TArrState; Col, Kind: string;
  begin
    if Node is TJSONObject then begin
      O := TJSONObject.Create;
      for i := 0 to TJSONObject(Node).Size - 1 do
        O.AddPair(TJSONObject(Node).Get(i).JsonString.Value,
                  Instantiate(TJSONObject(Node).Get(i).JsonValue));
      Result := O;
    end
    else if Node is TJSONArray then begin        // first element = repeating template
      A := TJSONArray.Create;
      St := StateOf(TJSONArray(Node));
      St.Arr := A;
      if TJSONArray(Node).Size > 0 then begin
        St.CurKey := RowKey(TJSONArray(Node).Get(0));
        St.CurElem := Instantiate(TJSONArray(Node).Get(0));
        A.AddElement(St.CurElem);
      end;
      Result := A;
    end
    else if Node is TJSONNumber then
      Result := TJSONNumber.Create(NumStr(TJSONNumber(Node).AsDouble))
    else if Node is TJSONString then begin
      if IsRef(TJSONString(Node).Value, Col, Kind) then Result := LeafValue(Col, Kind)
      else Result := TJSONString.Create(TJSONString(Node).Value);   // constant text
    end
    else if Node is TJSONTrue then Result := TJSONTrue.Create
    else if Node is TJSONFalse then Result := TJSONFalse.Create
    else Result := TJSONNull.Create;
  end;

  // adds the current row to the instance built earlier
  procedure Feed(Node: TJSONValue);
  var i: Integer; St: TArrState; Key: string;
  begin
    if Node is TJSONObject then begin
      for i := 0 to TJSONObject(Node).Size - 1 do
        Feed(TJSONObject(Node).Get(i).JsonValue);
    end
    else if (Node is TJSONArray) and (TJSONArray(Node).Size > 0) then begin
      St := StateOf(TJSONArray(Node));
      Key := RowKey(TJSONArray(Node).Get(0));
      if Key = St.CurKey then
        Feed(TJSONArray(Node).Get(0))                     // same group: go deeper
      else begin                                          // new group: new element
        St.CurKey := Key;
        St.CurElem := Instantiate(TJSONArray(Node).Get(0));
        St.Arr.AddElement(St.CurElem);
      end;
    end;
  end;

  // JSON text with real Unicode characters; only " \ and control chars are escaped
  procedure EmitStr(const S: string);
  var i: Integer; c: Char;
  begin
    SB.Append('"');
    for i := 1 to Length(S) do begin
      c := S[i];
      case c of
        '"': SB.Append('\"');
        '\': SB.Append('\\');
        #8:  SB.Append('\b');
        #9:  SB.Append('\t');
        #10: SB.Append('\n');
        #12: SB.Append('\f');
        #13: SB.Append('\r');
      else
        if c < ' ' then SB.Append('\u' + IntToHex(Ord(c), 4))
        else SB.Append(c);
      end;
    end;
    SB.Append('"');
  end;

  procedure Emit(V: TJSONValue);
  var i: Integer; PairName: string; NeedComma: Boolean;
  begin
    if V is TJSONObject then begin
      SB.Append('{');
      NeedComma := False;
      for i := 0 to TJSONObject(V).Size - 1 do begin
        PairName := TJSONObject(V).Get(i).JsonString.Value;
        if (PairName <> '') and (PairName[1] = '#') then Continue;   // grouping only
        if NeedComma then SB.Append(',');
        NeedComma := True;
        EmitStr(PairName);
        SB.Append(':');
        Emit(TJSONObject(V).Get(i).JsonValue);
      end;
      SB.Append('}');
    end
    else if V is TJSONArray then begin
      SB.Append('[');
      for i := 0 to TJSONArray(V).Size - 1 do begin
        if i > 0 then SB.Append(',');
        Emit(TJSONArray(V).Get(i));
      end;
      SB.Append(']');
    end
    else if V is TJSONNumber then SB.Append(TJSONString(V).Value)   // number text as built
    else if V is TJSONString then EmitStr(TJSONString(V).Value)
    else if V is TJSONTrue then SB.Append('true')
    else if V is TJSONFalse then SB.Append('false')
    else SB.Append('null');
  end;

begin
  if (not ODS_SQL.Active) or ODS_SQL.IsEmpty then begin
    ShowMessage('Əvvəlcə hesabatı Qəbul edin.');
    Exit;
  end;

  // template from the report row, or the old flat format built on the fly
  TplText := '';
  F := ODS_Reporting.FindField('JSONTEMPLATE');
  if F <> nil then TplText := F.AsString;
  if Trim(TplText) = '' then begin
    TplText := '"#":"{#ROW}"';                       // every row = one element
    for i := 0 to ODS_SQL.FieldCount - 1 do
      if not SameText(ODS_SQL.Fields[i].FieldName, 'FILLCOLOR') then
        TplText := TplText + ',"' + ODS_SQL.Fields[i].FieldName + '":"{' +
                   ODS_SQL.Fields[i].FieldName + '}"';
    Msg := ODS_Reporting.FieldByName('Header').AsString;
    if Msg = '' then Msg := ODS_Reporting.FieldByName('Name').AsString;
    TplText := '{"' + StringReplace(Msg, '"', '\"', [rfReplaceAll]) + '":[{' + TplText + '}]}';
  end;

  Tpl := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(TplText), 0);
  if Tpl = nil then begin
    ShowMessage('JSONTEMPLATE düzgün JSON deyil.');
    Exit;
  end;

  Root := nil;
  NRows := 0;
  Missing := TStringList.Create;
  Missing.Sorted := True;
  Missing.Duplicates := dupIgnore;
  States := TList.Create;
  ODS_SQL.DisableControls;
  try
    // build: the first row creates the skeleton, every other row is added to it
    ODS_SQL.First;
    Root := Instantiate(Tpl);
    Inc(NRows);
    ODS_SQL.Next;
    while not ODS_SQL.Eof do begin
      Feed(Tpl);
      Inc(NRows);
      ODS_SQL.Next;
    end;

    // file: same path rule as Excel, .xlsx -> .json, UTF-8 without BOM
    FilePath := ODS_Reporting.FieldByName('FileName').AsString;
    if FilePath = '' then FilePath := DesktopPath + '\Reporting.xlsx'
    else if ContainsText(FilePath, 'DesktopPath') then
      FilePath := DesktopPath + StringReplace(FilePath, 'DesktopPath', '', [rfReplaceAll, rfIgnoreCase]);
    FilePath := StringReplace(FilePath, '.xlsx', '.json', [rfReplaceAll, rfIgnoreCase]);
    ForceDirectories(ExtractFilePath(FilePath));

    SB := TStringBuilder.Create;
    try
      Emit(Root);
      Bytes := TEncoding.UTF8.GetBytes(SB.ToString);
    finally
      SB.Free;
    end;
    Stream := TFileStream.Create(FilePath, fmCreate);
    try
      if Length(Bytes) > 0 then Stream.WriteBuffer(Bytes[0], Length(Bytes));
    finally
      Stream.Free;
    end;

    // result
    Msg := Format('JSON yaradıldı: %d sətir'#13'%s', [NRows, FilePath]);
    if Missing.Count > 0 then begin
      Msg := Msg + #13#13'Tapılmayan sütunlar (' + IntToStr(Missing.Count) + '):';
      for i := 0 to Missing.Count - 1 do
        if i mod 4 = 0 then Msg := Msg + #13 + Missing[i]
        else Msg := Msg + ', ' + Missing[i];
    end;
    if MessageDlg(Msg + #13#13'Faylın olduğu qovluğu açmaq istəyirsiniz?',
                  mtInformation, [mbYes, mbNo], 0) = mrYes then
      ShellExecute(0, 'open', 'explorer.exe',
                   PChar('/select,"' + FilePath + '"'), nil, SW_SHOWNORMAL);
  finally
    ODS_SQL.EnableControls;
    Root.Free;
    Tpl.Free;
    for i := 0 to States.Count - 1 do TArrState(States[i]).Free;
    States.Free;
    Missing.Free;
  end;
end;

procedure TReporting.BtnClear1Click(Sender: TObject);
begin
  CBox1.Text := '';
end;

procedure TReporting.BtnClear2Click(Sender: TObject);
begin
  CBox2.Text := '';
end;

procedure TReporting.BtnClear3Click(Sender: TObject);
begin
  CBox3.Text := '';
end;

procedure TReporting.BtnClear4Click(Sender: TObject);
begin
  CBox4.Text := '';
end;

procedure TReporting.BtnClear5Click(Sender: TObject);
begin
  CBox5.Text := '';
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TReporting,
    Class_Reporting,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
