unit MainResourceImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ActiveX, AxCtrls, MainResourcePr_TLB, StdVcl, StdCtrls, ComCtrls, ToolWin,
  ImgList, Grids, DBGridEh, Menus, Mask,Unit1,
  DBCtrlsEh, DBSumLst, Tabs, FileCtrl,DB,  QRExport,
  ExtCtrls, DBCtrls, OleServer, ExcelXp, ActnList, PluginPopupMenu,ComObj,
  CMExcelExport, QuickRpt,Dialogs, DBGridEhGrouping, GridsEh;

type
  TMainResource = class(TActiveForm, IMainResource)
    ImageList: TImageList;
    PMenuWares: TPluginPopupMenu;
    NInsertW: TMenuItem;
    NEditW: TMenuItem;
    PMenuGroups: TPluginPopupMenu;
    NWaresTurnOver: TMenuItem;
    NDeleteWares: TMenuItem;
    NAddGroups: TMenuItem;
    NEditGroups: TMenuItem;
    NDeleteGroups: TMenuItem;
    NTurnNB: TMenuItem;
    NTurnNL: TMenuItem;
    PMenuToolBar: TPopupMenu;
    PMenuCurrentTrun: TPopupMenu;
    NQReport: TMenuItem;
    NMilliBank: TMenuItem;
    NVergi: TMenuItem;
    NStop_Calculate: TMenuItem;
    NStop_CalculateNB: TMenuItem;
    NStop_CalculateNL: TMenuItem;
    TimerA: TTimer;
    TimerB: TTimer;
    ImportExcel: TMenuItem;
    NViewTurn: TMenuItem;
    NQReportAll: TMenuItem;
    ExcelExport: TMenuItem;
    NTurnExcelExport: TMenuItem;
    PMenuCalc: TPopupMenu;
    NCalculateMonth: TMenuItem;
    NCalcAbort: TMenuItem;
    PanelTool: TPanel;
    ToolBarMain: TToolBar;
    PanelChange: TPanel;
    RButtonNB: TRadioButton;
    RButtonNL: TRadioButton;
    ToolBtnC: TToolButton;
    CalcAmort: TToolButton;
    ToolBtnD: TToolButton;
    ToolTrans: TToolButton;
    ToolBtnF: TToolButton;
    ToolButtonTurn: TToolButton;
    ToolBtnK: TToolButton;
    ToolButtonTurnGeneral: TToolButton;
    ToolBtnM: TToolButton;
    TButtonOption: TToolButton;
    ToolBtnL: TToolButton;
    TBtnFilter: TToolButton;
    ToolBtnP: TToolButton;
    PMenuTrans: TPopupMenu;
    NTransaction: TMenuItem;
    NTransOut: TMenuItem;
    PopupMenuFilter: TPopupMenu;
    FilterAll: TMenuItem;
    FilterNone: TMenuItem;
    ActionList: TActionList;
    RefreshAll: TAction;
    PExpiredRepar: TPopupMenu;
    PerDeg: TMenuItem;
    ExprWares: TMenuItem;
    aaa1: TMenuItem;
    Excele1: TMenuItem;
    CMExcelExport1: TCMExcelExport;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    kart1: TMenuItem;
    gggh1: TMenuItem;
    GBoxNL: TGroupBox;
    DBGridEhWaresNL: TDBGridEh;
    PanelSumTax: TPanel;
    LabelK: TLabel;
    LabelTaxFirstPrice: TLabel;
    LabelTaxRemainder: TLabel;
    LabelTaxAllAmort: TLabel;
    LabelTaxAmort: TLabel;
    DBEditFP: TDBEdit;
    DBEditTaxFirstPrice: TDBEdit;
    DBEditTaxRemainder: TDBEdit;
    DBEditTaxAllAmort: TDBEdit;
    DBEditTaxAmort: TDBEdit;
    GBoxNB: TGroupBox;
    DBGridWaresNB: TDBGridEh;
    DBGridEhGroupNB: TDBGridEh;
    PanelSum: TPanel;
    LabelFirstPrice: TLabel;
    LabelRemainder: TLabel;
    LabelAllAmort: TLabel;
    LabelAmort: TLabel;
    LabelSum: TLabel;
    LabelRefreshAll: TLabel;
    DBEditFirstPrice: TDBEdit;
    DBRemainder: TDBEdit;
    DBAllAmort: TDBEdit;
    DBEditAmort: TDBEdit;
    PanelSearch: TPanel;
    LabelS: TLabel;
    Search: TLabel;
    LabelSrchName: TLabel;
    LabelSrchFP: TLabel;
    LabelSrchR: TLabel;
    LabelSrchAA: TLabel;
    LabelSrchA: TLabel;
    EditSrchFP: TEdit;
    EditSrchR: TEdit;
    EditSrchAA: TEdit;
    EditSrchName: TEdit;
    EditSrchA: TEdit;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    RadioButton1: TRadioButton;
    Vsaitinalsat1: TMenuItem;
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGridWaresNBDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure DBGridEhWaresNLDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure NInsertWDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure NInsertWClick(Sender: TObject);
    procedure NDeleteWaresClick(Sender: TObject);
    procedure NEditWClick(Sender: TObject);
    procedure NAddGroupsClick(Sender: TObject);
    procedure NDeleteGroupsClick(Sender: TObject);
    procedure PMenuGroupsPopup(Sender: TObject);
    procedure NTurnNBClick(Sender: TObject);
    procedure NTurnNLClick(Sender: TObject);
    procedure NVergiClick(Sender: TObject);
    procedure TButtonDifTransClick(Sender: TObject);
    procedure RButtonNLClick(Sender: TObject);
    procedure RButtonNBClick(Sender: TObject);
    procedure TButtonOptionClick(Sender: TObject);
    procedure NEditGroupsClick(Sender: TObject);
    procedure NStop_CalculateNBClick(Sender: TObject);
    procedure NStop_CalculateNLClick(Sender: TObject);
    procedure DBGridWaresNBTitleClick(Column: TColumnEh);
    procedure LabelSClick(Sender: TObject);
    procedure TimerATimer(Sender: TObject);
    procedure TimerBTimer(Sender: TObject);
    procedure EditSrchNameChange(Sender: TObject);
    procedure EditSrchFPChange(Sender: TObject);
    procedure EditSrchRChange(Sender: TObject);
    procedure EditSrchAAChange(Sender: TObject);
    procedure EditSrchAChange(Sender: TObject);
    procedure ImportExcelClick(Sender: TObject);
    procedure NViewTurnClick(Sender: TObject);
    procedure ExcelExportClick(Sender: TObject);
    procedure NTurnExcelExportClick(Sender: TObject);
    procedure NCalculateMonthClick(Sender: TObject);
    procedure CalcAmortClick(Sender: TObject);
    procedure NTransactionClick(Sender: TObject);
    procedure NTransOutClick(Sender: TObject);
    procedure NCalcAbortClick(Sender: TObject);
    procedure DBGridEhGroupNBTitleClick(Column: TColumnEh);
    procedure NQReportAllClick(Sender: TObject);
    procedure NMilliBankClick(Sender: TObject);
    procedure DBGridEhGroupNLTitleClick(Column: TColumnEh);
    procedure FilterAllClick(Sender: TObject);
    procedure FilterNoneClick(Sender: TObject);
    procedure RefreshAllExecute(Sender: TObject);
    procedure LabelRefreshAllClick(Sender: TObject);
    procedure DBGridEhGroupNBCellClick(Column: TColumnEh);
    procedure PerDegClick(Sender: TObject);
    procedure ExprWaresClick(Sender: TObject);
    procedure aaa1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Excele1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure kart1Click(Sender: TObject);
    procedure gggh1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Vsaitinalsat1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IMainResourceEvents;
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
const
 GPosition     :Integer = 0;
 LastPosition  :Integer = 0;
 row           :Integer=0;

var
MainResource:TMainResource;  
  p_id  :  integer;
v_groups_id              :real;



          New_Or_Calc_Wares_Trans:byte;

implementation

uses  ComServ,
UnitData,
 UnitInsWares,
  UnitWares,
  UnitAddGroups,
  UnitCalcWares, UnitShowTrans, UnitPreview, UnitTraffics, UnitTrafficsNL,
  UnitCurrentRep,
   UnitCurrentRepNL,
    UnitTransOut,
    UnitUpdGroups,
     UnitDat,
  UnitImpXLS, UnitViewTurn, UnitRepGroupNB, UnitFilter, UnitRepGroupNL,
  UnitGroupDat,Oracle,Oracledata,UnitArchiveWares,UnitArWaresSRep,
  UnitChoice, Unit3, Unit4, quickrep, UnitInsert_t, Unit2, Unit22,
  sboapiDataModuleImpl, SBTranslateProc, Unit10, Uniybuysellwares;

{$R *.DFM}


procedure TMainResource.EventSinkChanged(const EventSink: IUnknown);
begin

  FEvents := EventSink as IMainResourceEvents;
end;

procedure TMainResource.Initialize;
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

function TMainResource.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMainResource.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMainResource.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMainResource.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMainResource.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMainResource.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMainResource.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMainResource.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMainResource.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMainResource.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMainResource.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMainResource.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMainResource.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMainResource.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMainResource.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMainResource.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMainResource.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMainResource.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMainResource._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainResource.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMainResource.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMainResource.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMainResource.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMainResource.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMainResource.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMainResource.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMainResource.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMainResource.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMainResource.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMainResource.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMainResource.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMainResource.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMainResource.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMainResource.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMainResource.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMainResource.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMainResource.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainResource.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMainResource.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMainResource.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMainResource.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMainResource.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMainResource.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TMainResource.ActiveFormCreate(Sender: TObject);
var
   TitleName :string;
 begin

FormCurrentRepNL:=TFormCurrentRepNL.Create(Self);
FormCurrentRep:=TFormCurrentRep.Create(Self);
FormFilter:=TFormFilter.Create(Self);
QRepGroupAll:=TQRepGroupAll.Create(Self);
QRepGroupAllNL:=TQRepGroupAllNL.Create(Self);
DataModWares :=TDataModWares.Create(self);
FormMeans:=TFormMeans.Create(Self);
FormChoice:=TFormChoice.Create(Self);
FormInsert_t:=TFormInsert_t.Create(Self);
form2:=Tform2.create(self);

FormQrep:=TFormQrep.Create(Self);
DataModWares.ODSGroups.Open;
DataModWares.ODSWares.Open;
DataModWares.ODSSumWares.Open;
GBoxNB.Visible:=(RButtonNB.Checked=true);
GBoxNL.Visible:=false;

SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);





  TitleName :='INVENTAR_NO';
    with DataModWares.ODSWares do
    begin
     SetVariable('Title',TitleName);
     Refresh;
    end;

end;

procedure TMainResource.Button1Click(Sender: TObject);
var str:string  ;
begin
str := DataModWares.ODSGroups.FieldByName('NAme').AsString ;
ShowMessage(str);
end;

procedure TMainResource.DBGridWaresNBDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
with DBGridWaresNB do
    begin

    IF (DataCol=4) then
      begin
        if DataModWares.ODSWares.FieldByName('close_format').AsFloat=0 then
           begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,28,true);
           end;
        if DataModWares.ODSWares.FieldByName('close_format').AsFloat=1 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,29,true);
          end;

        if DataModWares.ODSWares.FieldByName('close_format').AsFloat=2 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,30,true);
          end;

        if DataModWares.ODSWares.FieldByName('close_format').AsFloat=3 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,35,true);
          end;

        if DataModWares.ODSWares.RecordCount=0 then
          begin
             DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
      end;

     end;
end;

procedure TMainResource.DBGridEhWaresNLDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
with DBGridEhWaresNL do
    begin

    IF (DataCol=4) then
      begin
        if DataModWares.ODSWares.FieldByName('tax_close_format').AsFloat=0 then
           begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,28,true);
           end;
        if DataModWares.ODSWares.FieldByName('tax_close_format').AsFloat=1 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,29,true);
          end;

        if DataModWares.ODSWares.FieldByName('tax_close_format').AsFloat=2 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,30,true);
          end;

        if DataModWares.ODSWares.FieldByName('tax_close_format').AsFloat=3 then
          begin
          ImageList.Draw(Canvas,Rect.left,Rect.top,35,true);
          end;

        if DataModWares.ODSWares.RecordCount=0 then
          begin
             DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
      end;

     end;
end;

procedure TMainResource.NInsertWDrawItem(Sender: TObject; ACanvas: TCanvas;
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
      Name := 'Tahoma';
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

procedure TMainResource.NInsertWClick(Sender: TObject);
begin
FormInsert:=TFormInsert.Create(Self);
FormInsert.ShowModal;
end;

procedure TMainResource.NDeleteWaresClick(Sender: TObject);
var
v_wares_id,
 v_groups_id,
     v_first_price :real;
v_debt,v_cred      :integer;
v_trans_name       :string;
v_wares_name       :string;

begin

New_Or_Calc_Wares_Trans:=3;
v_groups_id:=DataModWares.ODSGroups.fieldbyname('id').AsFloat;
v_wares_id:=DataModWares.ODSWares.fieldbyname('wares_id').AsFloat;
v_first_price:=DataModWares.ODSWares.fieldbyname('first_price').AsFloat;
v_wares_name:=DataModWares.ODSWares.fieldbyname('wares_name').AsString;
if MessageDlg('Bu vəsaiti silməyə əminsiniz?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
DataModWares.SB_MAIN_RESOURCE.CallProcedure('Delete_Wares',[v_wares_id]);
DataModWares.ODSWares.Refresh;
 {if MessageDlg('Ləğv edilmiş vəsaitin ödənişini  '+#13+' günün sənədlərinə göndərim?',mtConfirmation,mbYesNoCancel,0)=mrYes then
           begin
              with DataModWares.SB_MAIN_RESOURCE do
               begin
                CallProcedure('del_wares_trans_acc',[v_groups_id,parInteger,parInteger]);
                v_debt:=GetParameter(1);
                v_cred:=GetParameter(2);
                            v_trans_name:=v_wares_name+' vəsaitin ləğv edilməsi ';
                CallProcedure('deleted_wares_trans',
                                [v_groups_id  ,
                                v_first_price ,
                                v_debt        ,
                                v_cred        ,
                                v_trans_name  ]
                                );

               end;


                                 FormShowTrans:=TFormShowTrans.Create(self);
                                 FormShowTrans.ShowModal;

           end;
           }
end;

end;

procedure TMainResource.NEditWClick(Sender: TObject);
begin
  FormUpdWares:=TFormUpdWares.Create(Self);
  FormUpdWares.ShowModal;
end;

procedure TMainResource.NAddGroupsClick(Sender: TObject);
begin
try
FormAddGroups:=TFormAddGroups.Create(Self);
FormAddGroups.ShowModal;
finally
 //FormAddGroups.Free;
end;
end;

procedure TMainResource.NDeleteGroupsClick(Sender: TObject);

begin
v_groups_id:=DataModWares.ODSGroups.fieldbyname('id').AsFloat;
if MessageDlg('Bu qrupu silməyə əminsiniz?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
DataModWares.SB_MAIN_RESOURCE.CallProcedure('Delete_Groups',[v_groups_id]);
DataModWares.ODSGroups.Refresh;
end;
end;

procedure TMainResource.PMenuGroupsPopup(Sender: TObject);
begin
NDeleteGroups.Enabled:=DataModWares.SB_MAIN_RESOURCE.CallBooleanFunction('Enable_Delete_Groups',[DataModWares.ODSGroups.fieldbyname('id').AsFloat]);
end;

procedure TMainResource.NTurnNBClick(Sender: TObject);
begin
 if (DataModWares.ODSWares.IsEmpty) then Exit;
 FormTraffics :=TFormTraffics.Create(self);
  with FormTraffics.QuickRep, DataModWares.ODSTraffics do
   try
    Close;
    SetVariable('WaresID',DataModWares.ODSWares.FieldByName('wares_ID').AsInteger);
    Open;
    Preview;
   finally
    FormTraffics.Free;
    Close;
   end;
end;

procedure TMainResource.NTurnNLClick(Sender: TObject);
begin
 if (DataModWares.ODSWares.IsEmpty) then Exit;
 FormTrafficsNL :=TFormTrafficsNL.Create(self);
  with FormTrafficsNL.QuickRep, DataModWares.ODSTraffics do
   try
    Close;
    SetVariable('WaresID',DataModWares.ODSWares.FieldByName('wares_ID').AsInteger);
    Open;
    Preview;
   finally
    FormTrafficsNL.Free;
    Close;
   end;
end;

procedure TMainResource.NVergiClick(Sender: TObject);
var
    andFilter  ,  aRightSymbol ,  aLeftSymbol ,bRightSymbol ,  bLeftSymbol ,
    GroupFilter , SectorFilter :string;
begin
      andFilter:=' and ';
      aRightSymbol:=')';
      aLeftSymbol:='(';
      bRightSymbol:=')';
      bLeftSymbol:='(';
        GroupFilter:=DataModWares.ODSGroups.Filter;
        SectorFilter:=DataModWares.ODSWares.Filter;

        if  GroupFilter='' then
         begin
               andFilter:='';
               aLeftSymbol:='';
               aRightSymbol:='';
         end;

        if  SectorFilter='' then
         begin
               andFilter:='';
               bLeftSymbol:='';
               bRightSymbol:='';
         end;


with
  DataModWares.ODSReport
     do
     begin
     Close;
      SQL.Clear;
      SQL.Add('select g.name,g.id,w.* from groups g,wares_all w where g.id=w.groups_id  order by g.id');
    if  (GroupFilter<>'') or (SectorFilter<>'') then
     begin
      Filtered:=false;
      Filter:=aLeftSymbol+GroupFilter+aRightSymbol+andFilter+bLeftSymbol+SectorFilter+bRightSymbol;
      Filtered:=true;
    end;
      Open;
   end;



          FormCurrentRepNL.QuickRepNL.Preview;
end;

procedure TMainResource.TButtonDifTransClick(Sender: TObject);
begin
FormTransOut:=TFormTransOut.Create(Self);
FormTransOut.ShowModal;
end;

procedure TMainResource.RButtonNLClick(Sender: TObject);
begin
GBoxNL.Visible:=(RButtonNL.Checked=true);
GBoxNB.Visible:=false;
end;

procedure TMainResource.RButtonNBClick(Sender: TObject);
begin
GBoxNB.Visible:=(RButtonNB.Checked=true);
GBoxNL.Visible:=false;
end;

procedure TMainResource.TButtonOptionClick(Sender: TObject);
begin
if MessageDlg('Növbəti ilə keçmək üçün qalıq dəyərini təyin edim?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
DataModWares.SB_MAIN_RESOURCE.CallProcedure('repair_wares',[]);
DataModWares.ODSWares.Refresh;
ShowMessage('Əməliyyat yerinə yetirildi!');
end;
end;

procedure TMainResource.NEditGroupsClick(Sender: TObject);
begin
   try
   Screen.Cursor:=crSQLWait;
     FormUpdGroups:=TFormUpdGroups.Create(Self);
   finally
     FormUpdGroups.ShowModal;
     Screen.Cursor:=crDefault;
   end;
end;

procedure TMainResource.NStop_CalculateNBClick(Sender: TObject);
var
v_wares_id,rh:real;
begin
v_wares_id:=DataModWares.ODSWares.fieldbyname('wares_id').AsFloat;
if MessageDlg('Hesablamanı dayandırım?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
DataModWares.SB_MAIN_RESOURCE.CallProcedure('Stop_Calculate',['nb',v_wares_id]);
rh:=v_wares_id;
DataModWares.ODSWares.Refresh;
DBGridWaresNB.DataSource.DataSet.Locate('wares_id',rh,[]);
end;

end;

procedure TMainResource.NStop_CalculateNLClick(Sender: TObject);
var
v_wares_id,rh :real;
begin
v_wares_id:=DataModWares.ODSWares.fieldbyname('wares_id').AsFloat;
if MessageDlg('Hesablamanı dayandırım?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
DataModWares.SB_MAIN_RESOURCE.CallProcedure('Stop_Calculate',['nl',v_wares_id]);
rh:=v_wares_id;
DataModWares.ODSWares.Refresh;
DBGridEhWaresNL.DataSource.DataSet.Locate('wares_id',rh,[]);
end;

end;

procedure TMainResource.DBGridWaresNBTitleClick(Column: TColumnEh);
var
   TitleName :string;
begin
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with DataModWares.ODSWares do
    begin
     SetVariable('Title',TitleName);
     Refresh;
    end;
  finally
   Screen.Cursor := crDefault;
  end;

end;

procedure TMainResource.LabelSClick(Sender: TObject);
begin
       if LabelS.Caption='<' then
        begin

           TimerA.Enabled:=True;
              TimerB.Enabled:=False;
          end
           else
            begin
           TimerB.Enabled:=True;
            TimerA.Enabled:=False;
          end;
end;

procedure TMainResource.TimerATimer(Sender: TObject);
begin
        if PanelSearch.Width<PanelSum.Width-4 then
        begin
        PanelSearch.Width:=PanelSearch.Width+10;
        Application.ProcessMessages;
        LabelS.Caption:='>';
        end;
end;

procedure TMainResource.TimerBTimer(Sender: TObject);
begin
         if PanelSearch.Width>16+10 then
        begin
        PanelSearch.Width:=PanelSearch.Width-10;
        Application.ProcessMessages;
        LabelS.Caption:='<';
        end;
end;

procedure TMainResource.Vsaitinalsat1Click(Sender: TObject);
begin

          Formbuysellwares:=TFormbuysellwares.Create(self);
             Formbuysellwares.ShowModal;
end;

procedure TMainResource.EditSrchNameChange(Sender: TObject);
begin
  if EditSrchName.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('wares_name',EditSrchName.Text,[loCaseInsensitive,loPartialKey]);
         DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;
end;

procedure TMainResource.EditSrchFPChange(Sender: TObject);
begin
  if EditSrchFP.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('first_price',EditSrchFP.Text,[loCaseInsensitive,loPartialKey]);
                  DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;
end;

procedure TMainResource.EditSrchRChange(Sender: TObject);
begin
  if EditSrchR.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
           Locate('remainder',EditSrchR.Text,[loCaseInsensitive,loPartialKey]);
                DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;       
   end;
end;

procedure TMainResource.EditSrchAAChange(Sender: TObject);
begin
  if EditSrchAA.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('all_amort',EditSrchAA.Text,[loCaseInsensitive,loPartialKey]);
                      DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;
end;

procedure TMainResource.EditSrchAChange(Sender: TObject);
begin
  if EditSrchA.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('amort',EditSrchA.Text,[loCaseInsensitive,loPartialKey]);
                      DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;
end;

procedure TMainResource.ImportExcelClick(Sender: TObject);
begin
FormImpXLS:=TFormImpXLS.Create(Self);
FormImpXLS.ShowModal;
end;

procedure TMainResource.NViewTurnClick(Sender: TObject);
begin
FormViewTurn:=TFormViewTurn.Create(Self);
FormViewTurn.ShowModal;

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


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;



procedure TMainResource.ExcelExportClick(Sender: TObject);
const
f=3;
dd=2;
var
i , j , k ,m  :Integer;

e_First_Price,e_Remainder,e_Amort,e_All_Amort,
e_Tax_First_Price,e_Tax_Remainder,e_Tax_Amort,e_Tax_All_Amort
 :real;

bash  : string;
begin
try
             with DataModWares do
              begin
                 if  ODSGroups.Filter<>'' then
                  begin
                        ODSGroupXLS.Filtered:=false;
                        ODSGroupXLS.Filter:=ODSGroups.Filter;
                        ODSGroupXLS.Filtered:=true;
                  end;

                    ODSGroupXLS.Open;
                    ODSGroupXLS.First;

                 if  ODSWares.Filter<>'' then
                  begin

                        ODSWaresXLSALL.Filtered:=false;
                        ODSWaresXLSALL.Filter:=ODSWares.Filter;
                        ODSWaresXLSALL.Filtered:=true;
                  end;

                    ODSWaresXLSALL.Open;
                    ODSWaresXLSALL.First;
                  end;


Screen.Cursor:=crSQLWait;
    CreateSheet;


        k:=0;
  with DataModWares do
   begin
                  Exl.WorkBooks[1].WorkSheets[1].name := ' Milli Bank ';
        for i:=1 to  ODSGroupXLS.RecordCount do
        begin
           bash:=inttostr(i+k);
          Sheet.Cells[i+k,1]:=' Grup :';
          Sheet.Cells[i+k,1].Font.Bold :=true;
          Sheet.Cells[i+k,2]:=ODSGroupXLS.FieldByName('Name').AsString;
          Sheet.Cells[i+k,2].Font.Bold :=true;
          Sheet.Cells[i+k,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,1]:='Vəsaitin adı';
          Sheet.Cells[i+k+1,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2].Value:='Faiz';
          Sheet.Cells[i+k+1,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3]:='Invent тар.';
          Sheet.Cells[i+k+1,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,4]:='İlkin dəyəri';
          Sheet.Cells[i+k+1,4].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,5]:='Qalıq dəyəri';
          Sheet.Cells[i+k+1,5].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:='Amortizasiya';
          Sheet.Cells[i+k+1,6].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,6].Font.Bold :=true;
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:='Yığ. Amort';
          Sheet.Cells[i+k+1,7].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,7].Font.Bold :=true;
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8].Value:='Vergi faiz';
          Sheet.Cells[i+k+1,8].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,8].Font.Bold :=true;
          Sheet.Cells[i+k+1,8].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,9]:='İlin əvv. dəyər';
          Sheet.Cells[i+k+1,9].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,9].Font.Bold :=true;
          Sheet.Cells[i+k+1,9].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,10]:='Qalıq dəyəri';
          Sheet.Cells[i+k+1,10].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,10].Font.Bold :=true;
          Sheet.Cells[i+k+1,10].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,11]:='Amortizasiya';
          Sheet.Cells[i+k+1,11].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,11].Font.Bold :=true;
          Sheet.Cells[i+k+1,11].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,12]:='Yığ. Amort';
          Sheet.Cells[i+k+1,12].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,12].Font.Bold :=true;
          Sheet.Cells[i+k+1,12].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,13]:='Amort tar.';
          Sheet.Cells[i+k+1,13].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,13].Font.Bold :=true;
          Sheet.Cells[i+k+1,13].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,14]:='Inventar №';
          Sheet.Cells[i+k+1,14].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,14].Font.Bold :=true;
          Sheet.Cells[i+k+1,14].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,15]:='Istifadçinin adı';
          Sheet.Cells[i+k+1,15].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,15].Font.Bold :=true;
          Sheet.Cells[i+k+1,15].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,16]:='Vesaitin Id';
          Sheet.Cells[i+k+1,16].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,16].Font.Bold :=true;
          Sheet.Cells[i+k+1,16].Font.Color:=clBlue;







                             e_First_Price:=0;
                             e_Remainder:=0;
                             e_All_Amort:=0;
                             e_Amort:=0;

                             e_Tax_First_Price:=0;
                             e_Tax_Remainder:=0;
                             e_Tax_All_Amort:=0;
                             e_Tax_Amort:=0;

         for j:=1 to ODSWaresXLSALL.RecordCount do begin

         e_First_Price:=e_First_Price+ODSWaresXLSALL.FieldByName('First_Price').AsFloat;
         e_Remainder:=e_Remainder+ODSWaresXLSALL.FieldByName('Remainder').AsFloat;
         e_Amort:=e_Amort+ODSWaresXLSALL.FieldByName('Amort').AsFloat;
         e_All_Amort:=e_All_Amort+ODSWaresXLSALL.FieldByName('All_Amort').AsFloat;

         e_Tax_First_Price:=e_Tax_First_Price+ODSWaresXLSALL.FieldByName('Tax_First_Price').AsFloat;
         e_Tax_Remainder:=e_Tax_Remainder+ODSWaresXLSALL.FieldByName('Tax_Remainder').AsFloat;
         e_Tax_Amort:=e_Tax_Amort+ODSWaresXLSALL.FieldByName('Tax_Amort').AsFloat;
         e_Tax_All_Amort:=e_Tax_All_Amort+ODSWaresXLSALL.FieldByName('Tax_All_Amort').AsFloat;


          Sheet.Cells[i+k+j+1,1]:=ODSWaresXLSALL.FieldByName('wares_name').AsString;
          Sheet.Cells[i+k+j+1,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+j+1,2]:=ODSWaresXLSALL.FieldByName('percent').AsFloat;
          Sheet.Cells[i+k+j+1,3]:=ODSWaresXLSALL.FieldByName('inventar_date').AsDateTime;

          Sheet.Cells[i+k+j+1,4]:=ODSWaresXLSALL.FieldByName('first_price').AsFloat;
          Sheet.Cells[i+k+j+1,5]:=ODSWaresXLSALL.FieldByName('remainder').AsFloat;
          Sheet.Cells[i+k+j+1,6]:=ODSWaresXLSALL.FieldByName('amort').AsFloat;
          Sheet.Cells[i+k+j+1,7]:=ODSWaresXLSALL.FieldByName('all_amort').AsFloat;
          Sheet.Cells[i+k+j+1,8]:=ODSWaresXLSALL.FieldByName('tax_percent').AsFloat;
          Sheet.Cells[i+k+j+1,9]:=ODSWaresXLSALL.FieldByName('tax_first_price').AsFloat;
          Sheet.Cells[i+k+j+1,10]:=ODSWaresXLSALL.FieldByName('tax_remainder').AsFloat;
          Sheet.Cells[i+k+j+1,11]:=ODSWaresXLSALL.FieldByName('tax_amort').AsFloat;
          Sheet.Cells[i+k+j+1,12]:=ODSWaresXLSALL.FieldByName('tax_all_amort').AsFloat;
          Sheet.Cells[i+k+j+1,13]:=ODSWaresXLSALL.FieldByName('amort_date').AsDateTime;
          Sheet.Cells[i+k+j+1,14]:=ODSWaresXLSALL.FieldByName('inventar_no').AsString;
          Sheet.Cells[i+k+j+1,15]:=ODSWaresXLSALL.FieldByName('user_name').AsString;
          Sheet.Cells[i+k+j+1,16]:=ODSWaresXLSALL.FieldByName('wares_id').AsInteger;
             ODSWaresXLSALL.Next;
            end;

           m:=ODSWaresXLSALL.RecordCount;

               Sheet.Cells[i+k+m+2,4]:=FormatFloat('#,##0.00',e_First_Price);
               Sheet.Cells[i+k+m+2,5]:=FormatFloat('#,##0.00',e_Remainder);
               Sheet.Cells[i+k+m+2,6]:=FormatFloat('#,##0.00',e_Amort);
               Sheet.Cells[i+k+m+2,7]:=FormatFloat('#,##0.00',e_All_Amort);

               Sheet.Cells[i+k+m+2,9]:=FormatFloat('#,##0.00',e_Tax_First_Price);
               Sheet.Cells[i+k+m+2,10]:=FormatFloat('#,##0.00',e_Tax_Remainder);
               Sheet.Cells[i+k+m+2,11]:=FormatFloat('#,##0.00',e_Tax_Amort);
               Sheet.Cells[i+k+m+2,12]:=FormatFloat('#,##0.00',e_Tax_All_Amort);


               Exl.Range['A'+bash+':P'+inttostr(i+k+m+2)].select;
               Exl.Selection.Interior.ColorIndex := 6;
               Sheet.Range['A'+bash+':P'+inttostr(i+k+m+2)].Borders.Color:=clRed;
               Exl.Range['A'+Inttostr(i+k+m+3)+':P'+Inttostr(i+k+m+3)].Select;
               Exl.Selection.Interior.ColorIndex := 8;

            k:=k+m+3;
          ODSGroupXLS.Next;
      end;{for}


end;

    ShowSheet;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
end;

end;

procedure TMainResource.NTurnExcelExportClick(Sender: TObject);
begin
        FormDat:=TFormDat.Create(self);
        FormDat.ShowModal;
end;

procedure TMainResource.NCalculateMonthClick(Sender: TObject);
begin
//DataModWares.SB_ACA.CallProcedure('CheckAdvancedObjectAccess',['calc']);


if not assigned (FormCalcWares) then
FormCalcWares:=TFormCalcWares.Create(Self);
FormCalcWares.ShowModal;
RadioButton1.Checked:=true;
end;

procedure TMainResource.CalcAmortClick(Sender: TObject);
begin
    CalcAmort.Down:=false;
end;

procedure TMainResource.NTransactionClick(Sender: TObject);
var a  :variant;

begin
//if RadioButton1.Checked then


               begin
                 if RButtonNB.Checked=true then
                  begin
            New_Or_Calc_Wares_Trans:=1;
             FormShowTrans:=TFormShowTrans.Create(self);
             FormShowTrans.ShowModal;
             RadioButton1.Checked:=false ;

               end

              else
              begin
                  New_Or_Calc_Wares_Trans:=2;
             FormShowTrans:=TFormShowTrans.Create(self);
             FormShowTrans.ShowModal;
             RadioButton1.Checked:=false ;
              end;

               end;
               //ShowMessage('!!!!!!!!!!!!!!!!            ');



end;

procedure TMainResource.NTransOutClick(Sender: TObject);
begin
             FormTransOut:=TFormTransOut.Create(self);
             FormTransOut.ShowModal;
end;

procedure TMainResource.NCalcAbortClick(Sender: TObject);
begin
// DataModWares.OraclePackage1.CallProcedure('checkadvancedobjectaccess',['Restore']);
try
 with  DataModWares do
    begin
       if MessageDlg('Hesablamanı ləğv etməyə əminsiniz?'+#13+
                    FormatDateTime('dd-mmm-yyyy',SB_MAIN_RESOURCE.CallDateFunction('first_amort_date',[]))+' -'+
                    'tarixinə qayıdacaq!!!!'
                    ,mtConfirmation
                    ,mbYesNoCancel
                    ,0)=mrYes  then
             begin
                 Screen.Cursor:=crSQLWait;
                 Application.ProcessMessages;
                 SB_MAIN_RESOURCE.CallProcedure('restore_calculate',[]);
                 ODSWares.Refresh;
                  ShowMessage('Hesablama ləğv olundu!!!');
              end;
            end;
         finally
          Screen.Cursor:=crDefault;
     end;
end;

procedure TMainResource.DBGridEhGroupNBTitleClick(Column: TColumnEh);
var
   TitleName :string;
begin
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with DataModWares.ODSGroups do
    begin
     SetVariable('Title',TitleName);
     Refresh;
    end;
  finally
   Screen.Cursor := crDefault;
  end;

end;


procedure TMainResource.NQReportAllClick(Sender: TObject);
begin
try
    Screen.Cursor:=crSQLWait;
    FormGroupDat:=TFormGroupDat.Create(Self);
    FormGroupDat.ShowModal;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TMainResource.NMilliBankClick(Sender: TObject);
var
andFilter  ,  aRightSymbol ,  aLeftSymbol ,bRightSymbol ,  bLeftSymbol ,
    GroupFilter , SectorFilter :string;
begin
    andFilter:=' and ';
      aRightSymbol:=')';
      aLeftSymbol:='(';
      bRightSymbol:=')';
      bLeftSymbol:='(';
        GroupFilter:=DataModWares.ODSGroups.Filter;
        SectorFilter:=DataModWares.ODSWares.Filter;

        if  GroupFilter='' then
         begin
               andFilter:='';
               aLeftSymbol:='';
               aRightSymbol:='';
         end;

        if  SectorFilter='' then
         begin
               andFilter:='';
               bLeftSymbol:='';
               bRightSymbol:='';
         end;


with
  DataModWares.ODSReport
     do
     begin
     Close;
      SQL.Clear;
      SQL.Add('select g.name,g.id,w.* from groups g,wares_all w where g.id=w.groups_id  order by g.id');
    if  (GroupFilter<>'') or (SectorFilter<>'') then
     begin
      Filtered:=false;
      Filter:=aLeftSymbol+GroupFilter+aRightSymbol+andFilter+bLeftSymbol+SectorFilter+bRightSymbol;
      Filtered:=true;
    end;
      Open;
   end;
{with DataModWares do
 begin
     ODSGroups.First;
     ODSWares.Close;
     ODSWares.SetVariable('Title','user_name');
     ODSWares.Open;
     ODSWares.First;
end;    }

           FormCurrentRep.QuickRep.Preview;

end;

procedure TMainResource.DBGridEhGroupNLTitleClick(Column: TColumnEh);
var
   TitleName :string;
begin
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with DataModWares.ODSGroups do
    begin
     SetVariable('Title',TitleName);
     Refresh;
    end;
  finally
   Screen.Cursor := crDefault;
  end;

end;

procedure TMainResource.FilterAllClick(Sender: TObject);
begin
  try
     Screen.Cursor:=crSQLWait;
     FormFilter.ShowModal;
  finally
     Screen.Cursor:=crDefault;
  end;
end;

procedure TMainResource.FilterNoneClick(Sender: TObject);
var
   a :byte;
begin
 try
  Screen.Cursor:=crSQLWait;
       with DataModWares do
        begin
              for a:=0 to ComponentCount-1 do
               begin
                      if Components[a].ClassName='TOracleDataSet' then
                       begin
                             TOracleDataSet( Components[a] ).Filtered:=false;
                             TOracleDataSet( Components[a] ).Filter:=EmptyStr;
                             TOracleDataSet( Components[a] ).Filtered:=true;
                       end;
               end;
        end;
   finally
    Screen.Cursor:=crDefault;
   end;

end;


procedure Refresh_All_DataSet;
 var
   i :byte;
begin
  try
    Screen.Cursor:=crSQLWait;
      with DataModWares do
       begin
            for i:=0  to ComponentCount-1 do
             begin
                   if Components[ i ].ClassName='TOracleDataSet' then
                    begin
                           if TOracleDataSet( Components[ i ] ).Active = true then
                            begin
                                  TOracleDataSet( Components[ i ] ).Refresh;
                            end;
                    end;
             end;
       end;
     finally
      Screen.Cursor:=crDefault;
     end;
end;

procedure TMainResource.RefreshAllExecute(Sender: TObject);
begin
Refresh_All_DataSet;
end;

procedure TMainResource.LabelRefreshAllClick(Sender: TObject);
begin
Refresh_All_DataSet;
end;

procedure TMainResource.DBGridEhGroupNBCellClick(Column: TColumnEh);
begin
v_groups_id:=datamodwares.ODSGroups.fieldbyname('id').AsInteger;
end;

procedure TMainResource.PerDegClick(Sender: TObject);
var
  InputString,z: string;
begin
  DataModWares.ODSet_WExp.Refresh;
  z:=DataModWares.ODSet_WExp.FieldByName('VALUE').AsString;
  InputString:= InputBox('Vergi',z,'');
  if InputString<>'' then
  DataModWares.SB_MAIN_RESOURCE.CallProcedure('update_wares_ar_per',[InputString]);

end;

procedure TMainResource.ExprWaresClick(Sender: TObject);
begin
ArchiveWares:=TArchiveWares.Create(Self);
ArchiveWares.ShowModal;
{if MessageDlg('Arxive atilsin?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    MessageDlg('Arxive atildi.', mtInformation,
      [mbOk], 0);
  end;      }
end;

procedure TMainResource.aaa1Click(Sender: TObject);
begin
ArWaresSRep:=TArWaresSRep.Create(Self);
ArWaresSRep.QuickRep.Preview;
end;

procedure TMainResource.N3Click(Sender: TObject);
begin
FormMeans.Show;
end;

procedure TMainResource.Excele1Click(Sender: TObject);
begin
FormChoice.show;
end;

procedure TMainResource.N1Click(Sender: TObject);
begin
Application.CreateForm(TForm_enter, Form_enter);
  Form_enter.ShowModal;
//Form_enter.Show;

 {   DataModWares.OracleDataSet3.open;
   with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( DataModWares.OracleDataSet3,'Vergi',True);
      Disconnect;
   end  ;  }

end;

procedure TMainResource.N2Click(Sender: TObject);
begin
Application.CreateForm(TFormDeleted, FormDeleted);
  FormDeleted.ShowModal;
//FormDeleted.Show;
 { DataModWares.OracleDataSet2.open;
   with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( DataModWares.OracleDataSet2,'Maliyye',True);
      Disconnect;
   end  ;      }

end;

procedure TMainResource.kart1Click(Sender: TObject);
begin
formQrep.QuickRep1.Preview;
end;

procedure TMainResource.gggh1Click(Sender: TObject);
begin
//form2.ShowModal;

//if not assigned (form2) then
// form2:=Tform2.Create(Self);
form2.ShowModal;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMainResource,
    Class_MainResource,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
