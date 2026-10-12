unit frmBudgetMgrImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
  ActiveX, AxCtrls, budgetmgr_TLB, StdVcl, ComCtrls, ToolWin, Grids,Db,
  DBGridEh, ExtCtrls, ImgList, StdCtrls, Menus, ActnList, StdActns,oracledata,oracle,
  CMExcelExport;

type
  TfrmBudgetMgr = class(TActiveForm, IfrmBudgetMgr)
    ControlBar1: TControlBar;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    AddToolBtn: TToolButton;
    AddToolButton: TToolButton;
    EditToolBtn: TToolButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TEdit;
    editname: TEdit;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    ActionList1: TActionList;
    add: TEditCut;
    steting: TAction;
    Edit3: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Editaname: TEdit;
    Editasumamount: TEdit;
    Edit5: TEdit;
    MainQrid: TDBGridEh;
    N5: TMenuItem;
    PopupMenu3: TPopupMenu;
    ss1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure stetingExecute(Sender: TObject);
    procedure EditToolBtnClick(Sender: TObject);
    procedure ActnSearchExecute(Sender: TObject);
    procedure ActnSearchExecute_a(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure editnameChange(Sender: TObject);
   // procedure Edit2Exit(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure llTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure editnameKeyPress(Sender: TObject; var Key: Char);
    procedure editnameExit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure EditanameKeyPress(Sender: TObject; var Key: Char);
    procedure EditanameExit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ss1Click(Sender: TObject);
    //procedure ExportDataTable;
  private
    { Private declarations }
    FEvents: IfrmBudgetMgrEvents;
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
    Var

notAccId    :string;

   Exl, Sheet: Variant;
implementation

//uses Dmbudgetimpl, FrmAddBugcetimpl, FrmSetingBudgetImpl, FrmEditBudgetimpl,
  //FrmAddEditBdImpl;


uses ComObj, ComServ,Dmbudgetimpl, FrmAddBugcetimpl, FrmSetingBudgetImpl,FrmEditBudgetimpl,
  FrmAddEditBdImpl,SBTranslateProc,sboapiDataModuleImpl, ReportFrmImpl;

{$R *.DFM}

{ TfrmBudgetMgr }

procedure TfrmBudgetMgr.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_frmBudgetMgrPage); }
end;

procedure TfrmBudgetMgr.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfrmBudgetMgrEvents;
end;

procedure TfrmBudgetMgr.Initialize;
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

function TfrmBudgetMgr.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmBudgetMgr.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmBudgetMgr.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmBudgetMgr.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmBudgetMgr.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmBudgetMgr.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmBudgetMgr.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfrmBudgetMgr.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmBudgetMgr.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmBudgetMgr.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmBudgetMgr.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmBudgetMgr.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmBudgetMgr.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmBudgetMgr.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmBudgetMgr.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmBudgetMgr.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmBudgetMgr.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmBudgetMgr.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmBudgetMgr._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmBudgetMgr.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfrmBudgetMgr.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfrmBudgetMgr.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfrmBudgetMgr.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfrmBudgetMgr.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfrmBudgetMgr.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfrmBudgetMgr.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfrmBudgetMgr.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfrmBudgetMgr.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmBudgetMgr.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmBudgetMgr.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmBudgetMgr.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmBudgetMgr.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmBudgetMgr.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfrmBudgetMgr.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmBudgetMgr.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmBudgetMgr.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmBudgetMgr.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmBudgetMgr.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfrmBudgetMgr.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmBudgetMgr.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmBudgetMgr.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmBudgetMgr.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmBudgetMgr.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
 procedure TfrmBudgetMgr.ActnSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    MainQrid.SelectedRows.Clear;
    with  TOracleDataSet(MainQrid.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatıb.'+#13+'əvvəldən başlamaq istəyirsinizmi?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;
   end;
  procedure TfrmBudgetMgr.ActnSearchExecute_a(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,6,length(Name));
    MainQrid.SelectedRows.Clear;
    with  TOracleDataSet(DBGridEh2.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatıb.'+#13+'əvvəldən başlamaq istəyirsinizmi?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;


end;
procedure TfrmBudgetMgr.N1Click(Sender: TObject);
begin
panel1.Visible:=true ;
N1.Visible:=false;
N2.Visible:=true;
end;

procedure TfrmBudgetMgr.N2Click(Sender: TObject);
begin
panel1.Visible:=false;
N1.Visible:=true;
N2.Visible:=false;
end;

procedure TfrmBudgetMgr.ActiveFormCreate(Sender: TObject);
begin
DMBudget := TDMBudget.Create(Self);
BudgetSetAccaontfr :=TBudgetSetAccaontfr.Create(Self);
BudgetSetingFr:=TBudgetSetingFr.Create(self);
FrmeditBudget:=TFrmeditBudget.create(self);
FrmAddEditBdfr:=TFrmAddEditBdfr.create(self);
ReportFrm:=TReportFrm.create(self);
SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmBudgetMgr.ToolButton2Click(Sender: TObject);
begin
  if MessageDlg('Silinməsinə əminsinizmi?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
//tBudgetSetingFr.Create(Self);
with DMBudget do
begin
   ArticlesPkg.CallProcedure('del_art',[ArtDataSet.FieldByname('id').asinteger]);
   ArtDataSet.refresh;
   ArticlesDST .refresh
    end;

end;

procedure TfrmBudgetMgr.addExecute(Sender: TObject);
begin
DMBudget.articles_accgroup.open;
DMBudget.articles_accs.open;
  { with DMBudget,AddArt do
  begin
     if active then close;
     open;
     insert;
     //Refresh;
  end;  }
  dmbudget.articles_accgroup.refresh;
  BudgetSetAccaontfr.showmodal ;
end;
 procedure DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except

  end;
end;
procedure ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
   end;
end;

procedure TfrmBudgetMgr.ss1Click(Sender: TObject);
begin
ReportFrm.ShowModal;
end;

procedure TfrmBudgetMgr.stetingExecute(Sender: TObject);
begin
DMBudget.SetigDatSet.Active:=true;
 with DMBudget,AddArt do

  begin
     if active then close;
     SetVariable('artid', ArtDataSet.Fieldbyname('id').asInteger);
     open;
    // insert;
     edit
  end;
   BudgetSetingFr.showmodal
end;



procedure TfrmBudgetMgr.EditToolBtnClick(Sender: TObject);

   const
number_format='#,##0.00';
number_format_r='#,##0.00%';
n='yyy';
d=2;
f=3;


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;


var

 cell, row,i , j , k ,m ,www :Integer;
t_val :integer;

bash: string;
begin
DMBudget.OracleDataSet1.open;
DMBudget.OracleDataSet2.open;
DMBudget.OracleDataSet3.open;
DMBudget.OracleDataSet4.open;
DMBudget.OracleDataSet1.refresh;
DMBudget.OracleDataSet2.refresh;
DMBudget.OracleDataSet3.refresh;
DMBudget.OracleDataSet4.refresh;
DMBudget.ArtDataSetExcl.open ;
DMBudget.ItmDataSetExcl.open;
DMBudget.ArtDataSetExcl.refresh;
 try
     DMBudget.ArtDataSet.DisableControls;
     CreateSheet;
     Sheet.Range['A1:A60000'].ColumnWidth:=12;
     Sheet.Range['B1:B60000'].ColumnWidth:=60;
     Sheet.Range['C2:C60000'].ColumnWidth:=24;
     Sheet.Range['C2:D60000'].NumberFormat:=number_format;
     Sheet.Range['D2:D60000'].NumberFormat:=number_format;
     Sheet.Range['D2:D60000'].ColumnWidth:=23;
      Sheet.Range['D2:E60000'].NumberFormat:='#########';
     Sheet.Range['E1:E60000'].ColumnWidth:=25;
     Sheet.Range['F1:F60000'].NumberFormat:=number_format;
     Sheet.Range['F1:F60000'].ColumnWidth:=18;
     Sheet.Range['G1:G60000'].ColumnWidth:=10;
     Sheet.Range['H1:E60000'].NumberFormat:=number_format;
     Sheet.Range['H1:G60000'].ColumnWidth:=10;
     Sheet.Range['Q1:E60000'].NumberFormat:=number_format_r;
     Sheet.Range['Q1:G60000'].ColumnWidth:=25;
     Sheet.Range['I1:E60000'].NumberFormat:=number_format;
     Sheet.Range['I1:G60000'].ColumnWidth:=10;
     Sheet.Range['J1:E60000'].NumberFormat:=number_format;
     Sheet.Range['J1:G60000'].ColumnWidth:=10;
     Sheet.Range['K1:E60000'].NumberFormat:=number_format;
     Sheet.Range['K1:G60000'].ColumnWidth:=11;
    // Sheet.Range['L1:E60000'].NumberFormat:=number_format;
     Sheet.Range['L2:G60000'].ColumnWidth:=30;
     Sheet.Range['M1:E60000'].NumberFormat:=number_format;
     Sheet.Range['M1:G60000'].ColumnWidth:=16;
  //   Sheet.Range['N2:E60000'].NumberFormat:=number_format_r;
     Sheet.Range['N2:G60000'].ColumnWidth:=20;
     Sheet.Range['O1:E60000'].NumberFormat:=number_format;
     Sheet.Range['O1:G60000'].ColumnWidth:=16;
     Sheet.Range['P1:E60000'].NumberFormat:=number_format;
     Sheet.Range['P1:G60000'].ColumnWidth:=20;


     k:=1;
  with DMBudget do  begin
                     i:=0;

           Sheet.Cells[i+k,5].Font.Name:='Tahoma';
           Sheet.Cells[i+k,5].Font.Bold :=true;
           Sheet.Cells[i+k,5].Font.size :=25;
           Sheet.Cells[i+k,5]:= FormatDateTime( n,SYSDAT.FieldByName('BEGINDAT').AsDateTime)+' вя '+
           FormatDateTime(n,SYSDAT.FieldByName('ENDDAT').AsDateTime)+'  ci illər üzrə Müqayisəli büdcə ';
           //DateTimeToStr

    {      Sheet.Cells[i+k,1]:='Маддянин №-си';
          Sheet.Cells[i+k,1].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k,1].Font.Bold :=true;
          Sheet.Cells[i+k,2]:=ArtDataSet.FieldByName('NUMBEROFARTICLE').AsString;

          Sheet.Cells[i+k,3].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k,3].Font.Bold :=true;
          Sheet.Cells[i+k,3]:=ArtDataSet.FieldByName('statu').AsString;

          Sheet.Cells[i+k+1,1]:='№';
          Sheet.Cells[i+k+1,1].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,2].Value:=ArtDataSet.FieldByName('name').AsString;}


          Sheet.Cells[i+k+1,1]:='№';
          Sheet.Cells[i+k+1,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2].Value:='Maddalərin adı';
          Sheet.Cells[i+k+1,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3]:='İlin əvvəlinə büdcə proqnoz';
          Sheet.Cells[i+k+1,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:='Hesab';
          Sheet.Cells[i+k+1,4].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,5]:='Hesabın dövriyyəsi';
          Sheet.Cells[i+k+1,5].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:='Büdcə qalığı';
          Sheet.Cells[i+k+1,6].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,6].Font.Bold :=true;
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:='I rüb';
          Sheet.Cells[i+k+1,7].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,7].Font.Bold :=true;
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8]:='II rüb';
          Sheet.Cells[i+k+1,8].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,8].Font.Bold :=true;
          Sheet.Cells[i+k+1,8].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,9]:='III rüb';
          Sheet.Cells[i+k+1,9].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,9].Font.Bold :=true;
          Sheet.Cells[i+k+1,9].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,10]:='IV rüb';
          Sheet.Cells[i+k+1,10].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,10].Font.Bold :=true;
          Sheet.Cells[i+k+1,10].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,11]:=' V rüb fatiki istifadə';
          Sheet.Cells[i+k+1,11].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,11].Font.Bold :=true;
          Sheet.Cells[i+k+1,11].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,12]:=' VI rüb faktiki istifadə';
          Sheet.Cells[i+k+1,12].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,12].Font.Bold :=true;
          Sheet.Cells[i+k+1,12].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,13]:=' VII rüb faktiki istifadə';
          Sheet.Cells[i+k+1,13].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,13].Font.Bold :=true;
          Sheet.Cells[i+k+1,13].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,14]:=' VIII rüb faktiki istifadə';
          Sheet.Cells[i+k+1,14].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,14].Font.Bold :=true;
          Sheet.Cells[i+k+1,14].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,15]:='Növbəti ilin əvvəlinə büdcə proqnoz';
          Sheet.Cells[i+k+1,15].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,15].Font.Bold :=true;
          Sheet.Cells[i+k+1,15].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,16]:='Fərq';
          Sheet.Cells[i+k+1,16].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,16].Font.Bold :=true;
          Sheet.Cells[i+k+1,16].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,17]:='Fərq %lə';
          Sheet.Cells[i+k+1,17].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,17].Font.Bold :=true;
          Sheet.Cells[i+k+1,17].Font.Color:=clBlue;


        for i:=1 to  ArtDataSetExcl.RecordCount do begin
        //  if  ArtDataSet.FieldByName('status').Asinteger=0then
       // begin
          bash:=inttostr(i+k);
         // Sheet.Cells[i+k,1]:='Маддянин №-си';
        //  Sheet.Cells[i+k,1].Font.Name:='Tahoma';
         // Sheet.Cells[i+k,1].Font.Bold :=true;
       //   Sheet.Cells[i+k,2]:=ArtDataSet.FieldByName('NUMBEROFARTICLE').AsString;

          Sheet.Cells[i+k+2,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+2,1].Font.Bold :=true;
          Sheet.Cells[i+k+2,1]:=ArtDataSetExcl.FieldByName('NUMBEROFARTICLE').AsString+'   '+ArtDataSetExcl.FieldByName('stat').AsString;

         // Sheet.Cells[i+k+1,1]:='Бяндин ады:';
         // Sheet.Cells[i+k+1,1].Font.Name:='Tahoma';

          Sheet.Cells[i+k+2,2].Font.Name:='Tahoma';
           Sheet.Cells[i+k+2,2].Font.Bold :=true;
           Sheet.Cells[i+k+2,2].Font.size :=10;
          Sheet.Cells[i+k+2,2].Value:=ArtDataSetExcl.FieldByName('name').AsString;



         for j:=1 to ItmDataSetExcl.RecordCount do begin

          Sheet.Cells[i+k+j+d,2]:=ItmDataSetExcl.FieldByName('NUMBEROFITEM').Asstring+'  '+ItmDataSetExcl.FieldByName('name').AsString;
          Sheet.Cells[i+k+j+d,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+j+d,3]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('sumamount_e').Asfloat);
          Sheet.Cells[i+k+j+d,4]:=ItmDataSetExcl.FieldByName('ACCNO').Asstring;
          Sheet.Cells[i+k+j+d,5]:= ItmDataSetExcl.FieldByName('reat').Asfloat;
          Sheet.Cells[i+k+j+d,6]:= ItmDataSetExcl.FieldByName('Budcet_rest').Asfloat;
          Sheet.Cells[i+k+j+d,7]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFFIRSTQUARTER').AsFloat);
          Sheet.Cells[i+k+j+d,8]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFSECONDQUARTER').AsFloat);
          Sheet.Cells[i+k+j+d,9]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFTHRIDQUARTER').AsFloat);
          Sheet.Cells[i+k+j+d,10]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFFOURTHQUARTER').AsFloat);

          Sheet.Cells[i+k+j+d,11]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFFIRSTQUARTER_REAL').AsFloat);
          Sheet.Cells[i+k+j+d,12]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFSECONDQUARTER_REAL').AsFloat);
          Sheet.Cells[i+k+j+d,13]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFTHRIDQUARTER_REAL').AsFloat);
          Sheet.Cells[i+k+j+d,14]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFFOURTHQUARTER_REAL').AsFloat);

          Sheet.Cells[i+k+j+d,15]:=FormatFloat(number_format,ItmDataSetExcl.FieldByName('AMOUNTOFENDYEAR').Asinteger);
          Sheet.Cells[i+k+j+d,16]:=FormatFloat(number_format,ItmDataSetEXcl.FieldByName('Dispatry').AsFloat);
          Sheet.Cells[i+k+j+d,17]:=FormatFloat(number_format_r,ItmDataSetExcl.FieldByName('faiz').AsFloat);

          ItmDataSetExcl.Next;

             end;

              m:=ItmDataSetExcl.RecordCount;
              Exl.Range['A'+bash+':Q'+inttostr(i+k+m+d+2)].select;
              Sheet.Range['A'+bash+':Q'+inttostr(i+k+m+d+2)].Borders.Color:=clBlack;
             //  Exl.Range['A'+Inttostr(i+k+m+d+3)+':R'+Inttostr(i+k+m+d+3)].Select;
             //  Exl.Selection.Interior.ColorIndex := 1;
          k:=k+d+m-2;
          ArtDataSetExcl.Next;
            end;

            end;

    ShowSheet;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
   DMBudget.ArtDataSet.EnableControls;
  end;




end;

procedure TfrmBudgetMgr.ToolButton1Click(Sender: TObject);
begin
DMBudget.ArtDataSet.refresh;
DMBudget.accrest.refresh
end;

procedure TfrmBudgetMgr.Edit1Change(Sender: TObject);
begin
With Edit1 do
if Text <> '' then
DMBudget.ArtDataSrc.DataSet.Locate('NUMBEROFARTICLE',Edit1.Text,[ loPartialKey]);

end;

procedure TfrmBudgetMgr.Edit1Exit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TfrmBudgetMgr.editnameChange(Sender: TObject);
begin
{ With Edit2 do
if Text <> '' then
DMBudget.ArtDataSrc.DataSet.Locate('name',Edit2.Text,[ loCaseInsensitive,loPartialKey]);
end;

procedure TfrmBudgetMgr.Edit2Exit(Sender: TObject);
begin
(Sender as TEdit).Text := '';    }
end;

procedure TfrmBudgetMgr.ToolButton3Click(Sender: TObject);
begin
with DMBudget do
  begin
   ArticlesDST.Active:=true;
   ItemsofArticlesDST.Active:=true;
   end;

FrmAddEditBdfr.ShowModal;
end;


procedure TfrmBudgetMgr.N3Click(Sender: TObject);
begin
panel2.Visible:=true ;
N3.Visible:=false;
N4.Visible:=true;
end;

procedure TfrmBudgetMgr.N4Click(Sender: TObject);
begin
panel2.Visible:=false;
N3.Visible:=true;
N4.Visible:=false;
end;

procedure TfrmBudgetMgr.llTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  SortField : String;
begin
  SortField := Column.FieldName;
  if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
  with (Sender as TDBGridEh) , TOracleDataSet(DataSource.DataSet) do
  begin
   //ClearVariables;
    Screen.Cursor := crSQLWait;
    SetVariable('OrderField',SortField);
    RefResh;
    Screen.Cursor := crDefault;
   end;

end;

procedure TfrmBudgetMgr.editnameKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN
  then  ActnSearchExecute(Sender)
end;

procedure TfrmBudgetMgr.editnameExit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TfrmBudgetMgr.Edit3Change(Sender: TObject);
begin
With Edit3 do
if Text <> '' then
DMBudget.ItmDataSrc.DataSet.Locate('NUMBEROFITEM',Edit3.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmBudgetMgr.Edit3Exit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TfrmBudgetMgr.EditanameKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key) = VK_RETURN
  then  ActnSearchExecute_a(Sender)
end;

procedure TfrmBudgetMgr.EditanameExit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TfrmBudgetMgr.Edit5Exit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TfrmBudgetMgr.Edit5Change(Sender: TObject);
begin
With Edit5 do
if Text <> '' then
DMBudget.ItmDataSrc.DataSet.Locate('ACCNO',Edit5.Text,[ loPartialKey]);
end;

procedure TfrmBudgetMgr.N5Click(Sender: TObject);
begin
 DMBudget.ArtDataSet.refresh;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmBudgetMgr,
    Class_frmBudgetMgr,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.



end;


