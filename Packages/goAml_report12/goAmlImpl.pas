unit goAmlImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, goAml_TLB, StdVcl, ComCtrls, ToolWin, StdCtrls, XFSCtrls,
  Grids, XDBGrids, DBGrids, Buttons, DB, Gauges, ExtCtrls, Menus, DBGridEh,
  Mask, DBCtrlsEh, DBLookupEh,dbxjson,  IOUtils, OracleData;

type
  EFieldNotFoud = class(Exception);

  TgoAml = class(TActiveForm, IgoAml)
    SaveDlg: TSaveDialog;
    RE_Errors: TRichEdit;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    mliyyatlarabax1: TMenuItem;
    Faylhazrla1: TMenuItem;
    mliyyatlarabax2: TMenuItem;
    Faylhazrla2: TMenuItem;
    PM_RE_Errors: TPopupMenu;
    mizl1: TMenuItem;
    PopupMenu3: TPopupMenu;
    Emeeee1: TMenuItem;
    PC1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DTP1: TDateTimePicker;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBGridTransactions1: TDBGrid;
    ods_report: TOracleDataSet;
    ods_reportID: TFloatField;
    ods_reportNAME: TWideStringField;
    ods_reportDESCRIPTION: TWideStringField;
    ods_reportCOD: TFloatField;
    dsrc_report: TDataSource;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure mizl1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBLookupComboboxEh1CloseUp(Sender: TObject; Accept: Boolean);

    procedure Faylhazrla1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);

  private
    { Private declarations }
    FEvents: IgoAmlEvents;
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
    procedure DefinePropertyPages(DefinePropertyPage
      : TDefinePropertyPage); override;
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

   var
    dey,dey1,dey2: string;
   v_dat: TDate;

implementation

uses ComObj, ComServ, DMgoAmlUnit, sboapiDataModuleImpl, SBTranslateProc,DMgoAmlUnit_DT;

{$R *.DFM}
{ TgoAml }

procedure TgoAml.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin

end;


procedure TgoAml.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IgoAmlEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TgoAml.Faylhazrla1Click(Sender: TObject);

var
 i: integer;
 id:string;
 yol:string;
 JsonObject: TJSONObject; //dbxjson,  IOUtils uses artir
  JsonString: string;
  FileName: string;
begin
   yol:= 'C:\GoAml\';
   JsonObject := TJSONObject.Create;
   DMgoAml.ODS_Main.First;
   for I := 0 to DMgoAml.ODS_Main.RecordCount-1 do
    begin
    DMgoAml.ods_jeson_credit.Close;
    DMgoAml.ODS_Jeson_credit.SetVariable('v_id',DMgoAml.ODS_MainID.AsInteger);
    DMgoAml.ODS_Jeson_credit.open;
    id:=DMgoAml.ODS_MainID.AsString;
    //JsonObject.AddPair('j',DMgoAml.ODS_Jeson_creditJSON_REPORT.AsString); // CLOB məlumatını JSON obyektinə əlavə edirik

  JsonString :=DMgoAml.ODS_Jeson_creditJSON_REPORT.AsString;// JsonObject.ToString;
  FileName :=yol+id+'.json';
  TFile.WriteAllText(FileName, JsonString);
    DMgoAml.ODS_Main.Next;
    end;
  JsonObject.Free;

end;

procedure TgoAml.Initialize;
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

function TgoAml.Get_Active: WordBool;
begin
  Result := Active;
end;

function TgoAml.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TgoAml.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TgoAml.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TgoAml.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TgoAml.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TgoAml.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TgoAml.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TgoAml.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TgoAml.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TgoAml.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TgoAml.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TgoAml.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TgoAml.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TgoAml.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TgoAml.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TgoAml.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TgoAml.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TgoAml.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TgoAml.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TgoAml.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TgoAml.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TgoAml.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TgoAml.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TgoAml.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TgoAml.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TgoAml.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TgoAml.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TgoAml.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TgoAml.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TgoAml.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TgoAml.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TgoAml._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TgoAml.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnActivate;
end;

procedure TgoAml.ActiveFormCreate(Sender: TObject);
begin
DMgoAml:=TDMgoAml.Create(self);
end;

procedure TgoAml.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnClick;
end;

procedure TgoAml.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCreate;
end;

procedure TgoAml.DBGrid1CellClick(Column: TColumn);
begin

if DBGrid1.DataSource=DMgoAml.DS_Rep then
   begin
 case DMgoAml.ODS_Rep.FieldByName('dk').AsInteger of
   1:begin
  DMgoAml.Ods_maindebt.close;
  DMgoAml.Ods_maindebt.SQL.Clear;
  DMgoAml.Ods_maindebt.sql.Text:=
' select * from mmx_rep_car_dbt where transmode_code=:v_transmcode'+
' and transactiondate = :v_dat and report_code=:v_report_code'+#13+#13+#13+ #13+ #13+#13+#13+
' order by  transactionnumber';


  DMgoAml.Ods_maindebt.SetVariable('v_transmcode',DMgoAml.ODS_RepTRANSMODE_CODE.AsString);
  DMgoAml.Ods_maindebt.SetVariable('v_dat', Integer(Trunc(DTP1.Date)));
  DMgoAml.Ods_maindebt.SetVariable('v_report_code',DMgoAml.ODS_RepREPORT_CODE.AsString);
  DMgoAml.Ods_maindebt.SQL[4]:=' and KCUSTID ='+DMgoAml.ODS_RepCUSTID.AsString;
  DMgoAml.Ods_maindebt.SQL[5]:=' and amount_local >=20000';
   DMgoAml.Ods_maindebt.Open;
  DBGridTransactions1.DataSource:=DMgoAml.ds_maindbt;
   dey:=(DBGrid1.DataSource.DataSet.FieldByName('CUSTID').AsString);
   dey1:=DBGridTransactions1.DataSource.DataSet.FieldByName('TRANSACTIONNUMBER').AsString;
  end;
2:begin
  DMgoAml.ODS_Main.Close;
  DMgoAml.ODS_Main.SQL.Clear;
  DMgoAml.ODS_Main.sql.Text:=
'select * from mmx_rep_car_credt where transmode_code=:v_transmcode'+
' and transactiondate = :v_dat and report_code=:v_report_code'+#13+#13+#13+ #13+ #13+#13+#13+
' order by  transactionnumber';
 DMgoAml.ODS_Main.SetVariable('v_transmcode',DMgoAml.ODS_RepTRANSMODE_CODE.AsString);
  DMgoAml.ODS_Main.SetVariable('v_dat', Integer(Trunc(DTP1.Date)));
  DMgoAml.ODS_Main.SetVariable('v_report_code',
  DMgoAml.ODS_RepREPORT_CODE.AsString);
  DMgoAml.ODS_Main.SQL[4]:=' and DCUSTID= '+DMgoAml.ODS_RepCUSTID.AsString;
  DMgoAml.ODS_Main.SQL[5]:=' and amount_local >=20000';
  DMgoAml.ODS_Main.Open;
  DBGridTransactions1.DataSource:=DMgoAml.DS_Main;
   dey:=(DBGrid1.DataSource.DataSet.FieldByName('CUSTID').AsString);
   dey1:=DBGridTransactions1.DataSource.DataSet.FieldByName('TRANSACTIONNUMBER').AsString;
end;
end;
   end;


end;


procedure TgoAml.DBGrid2DblClick(Sender: TObject);
begin
  mliyyatlarabax1.Click;
end;

procedure TgoAml.DBGrid3DblClick(Sender: TObject);
begin
mliyyatlarabax2.Click;
end;

procedure TgoAml.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDblClick;
end;

procedure TgoAml.DBLookupComboboxEh1CloseUp(Sender: TObject; Accept: Boolean);
begin
case ods_reportCOD.AsInteger of
1: begin
DBGridTransactions1.DataSource:=DMgoAml.dsrc_grid;

   DMgoAml.ODS_Rep.close;
   DMgoAml.ODS_Rep.SQL.Clear;
   DMgoAml.ODS_Rep.SQL.Text
   :='select transmode_code, report_code,custid,b.name,sum(lammount) lammount,dk  from ('+
'select ti.transmode_code,ti.report_code,l.kcustid as custid,sum(l.lamount) lammount, 1 as dk  from mmx_transactions l,mmx_transinfo ti '+
' where l.id=ti.transid and  '+
' (l.debitbalance in (select bal_cn from bal_spr1 where goaml=1) and  '+
' l.debitbalance in (''1001'',''1011'',''1003'',''2801'',''2811''/*turan b,''2509'',''2519'',''2801'',''2811'',''4801'',''4811'',''4509'',''4519''*/))'+
' and l.transactiondate=:V_DAT and l.lamount>=20000 and ti.report_code  in(''CTR'',''TPR1'',''TPR2'',''TPR3'')'+
' group by ti.transmode_code,ti.report_code,l.kcustid '+
'/* union all  '+
' select ti.transmode_code,ti.report_code,l.kcustid as custid  , sum(l.lamount) lammount,1 as dk from mmx_transactions l,mmx_transinfo ti '+
' where l.id=ti.transid and '+
'(l.creditbalance in (select bal_cn from bal_spr1 where goaml=1)) and  '+
' l.transactiondate=:V_DAT and l.lamount>=20000 and l.vid_op=-2 and ti.report_code=''CTR'''+
' group by ti.transmode_code,ti.report_code,l.kcustid*/'+
' union all '+
' select ti.transmode_code,ti.report_code,l.dcustid as custid  , sum(l.lamount) lammount,2 as dk from mmx_transactions l,mmx_transinfo ti '+
' where l.id=ti.transid and '+
'(l.creditbalance in (select bal_cn from bal_spr1 where goaml=1) and  '+
' l.creditbalance in (''1001'',''1011'',''1003'',''2801'',''2811''/*,''2509'',''2519'',''2801'',''2811'',''4801'',''4811'',''4509'',''4519''*/)) '+
' and l.transactiondate=:V_DAT and l.lamount>=20000 and ti.report_code  in(''CTR'',''TPR1'',''TPR2'',''TPR3'')'+
' group by ti.transmode_code,ti.report_code,l.dcustid) a, customers b where  a.custid=b.id /*and b.compani  not in(2,3,5,6,7)*/ '+

' group by transmode_code, report_code,custid ,name,dk'+
' order by transmode_code';

   DMgoAml.ODS_Rep.Open;
  memo1.Text:=  DMgoAml.ODS_Rep.SQL.Text;
  DBGrid1.DataSource:=DMgoAml.DS_Rep;

/// FirstDate := Integer(Trunc(DTPFirstDate.DateTime));
  // LastDate := Integer(Trunc(DTPLastDate.DateTime));
  v_dat := Integer(Trunc(DTP1.Date));
  DMgoAml.ODS_Rep.close;
  DMgoAml.ODS_Rep.SetVariable('v_dat', v_dat);
  DMgoAml.ODS_Rep.Open;
  //showmessage(inttostr(DMgoAml.ODS_Rep.RecordCount));

 { DMgoAml.ODS_MainReport.close;
  DMgoAml.ODS_MainReport.Open;   }
 //

 //DBGrid2.Columns.Items[5].Visible:=False;


case DMgoAml.ODS_Rep.FieldByName('dk').AsInteger of
   1:begin
  DMgoAml.Ods_maindebt.close;
  DMgoAml.Ods_maindebt.SQL.Clear;
  DMgoAml.Ods_maindebt.sql.Text:=
'select * from mmx_rep_car_dbt where transmode_code=:v_transmcode'+
' and transactiondate = :v_dat and report_code=:v_report_code'+#13+#13+#13+ #13+ #13+#13+#13+
' order by  transactionnumber';
  DMgoAml.Ods_maindebt.SetVariable('v_transmcode',DMgoAml.ODS_RepTRANSMODE_CODE.AsString);
  DMgoAml.Ods_maindebt.SetVariable('v_dat', Integer(Trunc(DTP1.Date)));
  DMgoAml.Ods_maindebt.SetVariable('v_report_code',DMgoAml.ODS_RepREPORT_CODE.AsString);

  DMgoAml.Ods_maindebt.SQL[4]:=' and KCUSTID ='+DMgoAml.ODS_RepCUSTID.AsString;
  DMgoAml.Ods_maindebt.SQL[5]:=' and amount_local >=20000';

  DMgoAml.Ods_maindebt.Open;
  DBGridTransactions1.DataSource:=DMgoAml.DS_maindbt;

  end;
2:begin

 DMgoAml.ODS_Main.Close;
  DMgoAml.ODS_Main.SQL.Clear;
  DMgoAml.ODS_Main.sql.Text:=
'select * from mmx_rep_car_credt where transmode_code=:v_transmcode'+
' and transactiondate = :v_dat and report_code=:v_report_code'+#13+#13+#13+ #13+ #13+#13+#13+
' order by  transactionnumber';


  DMgoAml.ODS_Main.SetVariable('v_transmcode',DMgoAml.ODS_RepTRANSMODE_CODE.AsString);
  DMgoAml.ODS_Main.SetVariable('v_dat', Integer(Trunc(DTP1.Date)));
  DMgoAml.ODS_Main.SetVariable('v_report_code',
  DMgoAml.ODS_RepREPORT_CODE.AsString);
  DMgoAml.ODS_Main.SQL[4]:=' and DCUSTID= ' +DMgoAml.ODS_RepCUSTID.AsString;
  DMgoAml.ODS_Main.SQL[5]:=' and amount_local >=20000';

  DMgoAml.ODS_Main.Open;

 // memo1.Text:=  DM_goAml.ODS_Main.SQL.Text;
  DBGridTransactions1.DataSource:=DMgoAml.DS_Main;

end;
end;
end;
end;
end;

procedure TgoAml.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDeactivate;
end;

procedure TgoAml.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDestroy;
end;

procedure TgoAml.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then
    FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TgoAml.mizl1Click(Sender: TObject);
begin
RE_Errors.Clear;
end;

procedure TgoAml.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMouseEnter;
end;

procedure TgoAml.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnMouseLeave;
end;

procedure TgoAml.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPaint;
end;

procedure TgoAml.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TgoAml.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TgoAml.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TgoAml.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TgoAml.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TgoAml.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TgoAml.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TgoAml.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TgoAml.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TgoAml.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TgoAml.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TgoAml.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TgoAml.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TgoAml.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TgoAml.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TgoAml.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TgoAml.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TgoAml.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TgoAml.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TgoAml.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TgoAml.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TgoAml.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TgoAml.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TgoAml.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization

TActiveFormFactory.Create(ComServer, TActiveFormControl, TgoAml, Class_goAml, 1,
  '', OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL, tmApartment);

end.
