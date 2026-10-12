unit CableContractsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, CableContracts_TLB, StdVcl, ExtCtrls, ToolWin, ComCtrls,
  Grids, DBGrids, OracleData, ActnList, ImgList, Menus, DB, CMExcelExport,
  DBCtrls, StdCtrls, AppEvnts;

type
  TCableContractsX = class(TActiveForm, ICableContractsX)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    actsMain: TActionList;
    imgsMain: TImageList;
    actContAdd: TAction;
    actContEdit: TAction;
    actContErase: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actRefresh: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    actCommitAll: TAction;
    ToolButton7: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actCommitOne: TAction;
    ExcelExp: TCMExcelExport;
    ToolButton8: TToolButton;
    actExport: TAction;
    ToolButton9: TToolButton;
    pnFilter: TPanel;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Splitter1: TSplitter;
    cbfAbn: TDBLookupComboBox;
    cbfEng: TDBLookupComboBox;
    cbfPack: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbfCalc: TComboBox;
    cbfAcc: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label6: TLabel;
    chf1: TCheckBox;
    chf2: TCheckBox;
    chf3: TCheckBox;
    chf4: TCheckBox;
    chf5: TCheckBox;
    Action1: TAction;
    ApplicationEvents1: TApplicationEvents;
    actCommitMonAll: TAction;
    actCommitMonOne: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actSetNewCalcDate: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    BtnDeletedConts: TToolButton;
    procedure N4DrawItem(Sender: TObject; ACanvas: TCanvas;
                         ARect: TRect; Selected: Boolean);
    procedure OrderByColumn(DataSet: TOracleDataSet; Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ActiveFormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actContAddExecute(Sender: TObject);
    procedure actContEditExecute(Sender: TObject);
    procedure actContEraseExecute(Sender: TObject);
    procedure actCommitOneExecute(Sender: TObject);
    procedure actCommitAllExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure actCommitMonOneExecute(Sender: TObject);
    procedure actCommitMonAllExecute(Sender: TObject);
    procedure actSetNewCalcDateExecute(Sender: TObject);
    procedure BtnDeletedContsClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: ICableContractsXEvents;
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
    function getlastdate(fromdate: TDateTime; amount: Double; monprice: Double): TDateTime;
  end;



implementation

uses ComObj, ComServ, DataModCableContr, CableContractsAddEdit, UnitDeletedConts;

{$R *.DFM}

var
  OrderbyAD: String[5];

{ TCableContractsX }

function TCableContractsX.getlastdate;
var
  moncnt: Integer;
  restamt: Double;
  lastmon: TDateTime;
begin
  moncnt := StrToInt(FloatToStr(Int(amount/monprice)));
  restamt := amount - moncnt * monprice;
  lastmon := IncMonth(fromdate, moncnt);
  Result := lastmon + Int(restamt/((monprice*12)/365));
end;

procedure TCableContractsX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CableContractsXPage); }
end;

procedure TCableContractsX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICableContractsXEvents;
end;

procedure TCableContractsX.Initialize;
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

function TCableContractsX.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCableContractsX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCableContractsX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCableContractsX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCableContractsX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCableContractsX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCableContractsX.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCableContractsX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCableContractsX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCableContractsX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCableContractsX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCableContractsX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCableContractsX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCableContractsX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCableContractsX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCableContractsX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCableContractsX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCableContractsX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCableContractsX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableContractsX.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCableContractsX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCableContractsX.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCableContractsX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCableContractsX.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCableContractsX.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCableContractsX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCableContractsX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCableContractsX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCableContractsX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCableContractsX.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCableContractsX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCableContractsX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCableContractsX.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCableContractsX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCableContractsX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCableContractsX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCableContractsX.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableContractsX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCableContractsX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCableContractsX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCableContractsX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCableContractsX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCableContractsX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
                             
procedure TCableContractsX.N4DrawItem(Sender: TObject; ACanvas: TCanvas;
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
      Inc(Bar.Left, 20);
      FillRect(Bar);
      TextOut(ARect.Left+{17}20, ARect.Top+1, Caption);
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
            Bar.Right := Bar.Left + 22;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 22;

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

procedure TCableContractsX.OrderByColumn(DataSet: TOracleDataSet; Column: TColumn);
var
  PosT: Integer;
begin
  if (orderbyAD=' asc') then orderbyAD := ' desc' else orderbyAD := ' asc';
  PosT := DataSet.SQL.Add('order by '+ Column.FieldName+orderbyAD);
  try
  DataSet.Close;
  DataSet.Open;
  finally
  DataSet.SQL.Delete(PosT);
  end;
end;

procedure TCableContractsX.DBGrid1TitleClick(Column: TColumn);
begin
  if Column.Field.FieldKind<>fkCalculated then
  OrderByColumn(DataModC.odsContracts, Column);
end;

procedure TCableContractsX.ActiveFormCreate(Sender: TObject);
begin
  DataModC := TDataModC.Create(Self);
  OrderByColumn(DataModC.odsContracts, DBGrid1.Columns[0]);
end;

procedure TCableContractsX.actRefreshExecute(Sender: TObject);
begin
  with DataModC do begin
    OrderbyAD := ' desc';
    OrderByColumn(odsContracts, DBGrid1.Columns[0]);

    odsAccs.Close;
    odsAccs.Open;
    odsServices.Close;
    odsServices.Open;
    odsPacks.Close;
    odsPacks.Open;
    odsValutes.Close;
    odsValutes.Open;
    odsEngineers.Close;
    odsEngineers.Open;
    odsAbonents.Close;
    odsAbonents.Open;

  end;
end;

procedure TCableContractsX.actContAddExecute(Sender: TObject);
var
  Res: Integer;
begin
  if not assigned(frmContractAddEdit) then
    frmContractAddEdit := TfrmContractAddEdit.Create(Self);
  with DataModC, frmContractAddEdit, odsContracts do begin
    edcontract_num.Text := '';
    edcard_num.Text := '';
    edserie.Text := '';
    edworks_num.Text := '';
    edreceiver_num.Text := '';
    edcable_length.Text := '';
    edamount.Text := '';
    eddiscount.Text := '';
    edDiscDesc.Text := '';

    edinst_date.Date := Now;
    edexp_date.Date := Now;

    edinst_place.itemindex := 0;

    edcurr_code.KeyValue := 0;
    edeng_id.KeyValue := 0;
    edpack_num.KeyValue := 0;
    edAcc_ID.KeyValue := 0;  
    edABN_ID.KeyValue := 0;

    edCalcAg.Checked := False;

    if (frmContractAddEdit.ShowModal = 1) then begin

      Res := CABLE.CallIntegerFunction('contractadd',
               [
          edcontract_num.Text ,
          edcard_num.Text ,
          odsAbonents.Fields[0].AsVariant,
          Tdatetime(edinst_date.DateTime) ,
          edinst_place.itemindex ,
          edserie.Text ,
          edworks_num.Text ,
          edreceiver_num.Text ,
          edcable_length.Text ,
          edamount.value ,
          edcurr_code.KeyValue ,
          eddiscount.Text ,
          edeng_id.KeyValue ,
          edpack_num.KeyValue,
          edAcc_ID.KeyValue,
          Integer(edCalcAg.Checked) ,
          edDiscDesc.Text,
          Tdatetime(edexp_date.DateTime)
               ]);
      actRefreshExecute(Sender);
    end;
  end;
end;

procedure TCableContractsX.actContEditExecute(Sender: TObject);
var
  nt: Integer;
begin
  if not assigned(frmContractAddEdit) then
    frmContractAddEdit := TfrmContractAddEdit.Create(Self);
  with DataModC, frmContractAddEdit, odsContracts do begin
    edcontract_num.Text := odsContracts.FieldByName('CONTRACT_NUM').AsString;
    edcard_num.Text := odsContracts.FieldByName('CARD_NUM').AsString;;
    edserie.Text := odsContracts.FieldByName('SERIE').AsString;;
    edworks_num.Text := odsContracts.FieldByName('WORKS_NUM').AsString;;
    edreceiver_num.Text := odsContracts.FieldByName('RECEIVER_NUM').AsString;;
    edcable_length.Text := odsContracts.FieldByName('CABLE_LENGTH').AsString;;
    edamount.Text := odsContracts.FieldByName('AMOUNT').AsString;;
    eddiscount.Text := odsContracts.FieldByName('DISCOUNT').AsString;
    edDiscDesc.Text := odsContracts.FieldByName('DISCOUNT_DESC').AsString;

    edinst_date.Date := odsContracts.FieldByName('INST_DATE').AsDateTime;
    edexp_date.Date := odsContracts.FieldByName('EXP_DATE').AsDateTime;

    edinst_place.itemindex := odsContracts.FieldByName('INST_PLACE').AsInteger;

    edcurr_code.KeyValue := odsContracts.FieldByName('CURR_CODE').AsVariant;
    edeng_id.KeyValue := odsContracts.FieldByName('ENG_ID').AsVariant;
    edpack_num.KeyValue := odsContracts.FieldByName('PACK_NUM').AsVariant;
    edAcc_ID.KeyValue := odsContracts.FieldByName('ACC_ID').AsVariant;
    edABN_ID.KeyValue := odsContracts.FieldByName('ABN_ID').AsVariant;

    edCalcAg.Checked := Boolean(odsContracts.FieldByName('CALCAG').AsInteger);
                               
    nt := odsContracts.Fields[0].AsInteger;
    if (frmContractAddEdit.ShowModal = 1) then begin

      CABLE.CallProcedure('contractupd',
               [
          odsContracts.Fields[0].AsVariant,
          edcontract_num.Text ,
          edcard_num.Text ,
          odsAbonents.Fields[0].AsVariant,
          Tdatetime(edinst_date.DateTime) ,
          edinst_place.itemindex ,
          edserie.Text ,
          edworks_num.Text ,
          edreceiver_num.Text ,
          edcable_length.Text ,
          edamount.value ,
          edcurr_code.KeyValue ,
          eddiscount.Text ,
          edeng_id.KeyValue ,
          edpack_num.KeyValue,
          edAcc_ID.KeyValue,
          Integer(edCalcAg.Checked) ,
          edDiscDesc.Text  ,
          Tdatetime(edexp_date.DateTime)
               ]);
      actRefreshExecute(Sender);
      odsContracts.Locate('id',nt,[]);
    end;
  end;
end;

procedure TCableContractsX.actContEraseExecute(Sender: TObject);
begin
  if (MessageDlg('…азы силин€жк. яминсиниз?',mtWarning, [mbYes, mbNo], 0)=idyes) then
    with DataModC, frmContractAddEdit do begin

      CABLE.CallProcedure('contractdel',
               [
                  odsContracts.fields[0].AsVariant
               ]);
      actRefreshExecute(Sender);
    end;
end;

procedure TCableContractsX.actCommitOneExecute(Sender: TObject);
var
  i: Integer;
begin
 with dbgrid1, SelectedRows, DataSource.DataSet, DataModC, CABLE do begin
    for i:=0 to Count-1 do begin
      GotoBookmark(TBookmark(Items[i]));
      CallProcedure('calconecontract',[odsContracts.Fields[0].AsVariant,0]);
    end;
    actRefreshExecute(Sender);
  end;
end;

procedure TCableContractsX.actCommitAllExecute(Sender: TObject);
begin
  with DataModC,CABLE do begin
    CallProcedure('calccontracts',[0]);
    actRefreshExecute(Sender);
  end;
end;

procedure TCableContractsX.actExportExecute(Sender: TObject);
begin
  with ExcelExp do begin
    Connect;
    ExportDataset(DataModC.odsContracts,'Contracts', True);
  end;
end;

procedure TCableContractsX.ToolButton11Click(Sender: TObject);
begin
  pnFilter.Visible := not pnFilter.Visible;
  ToolButton11.Down := pnFilter.Visible;
end;

procedure TCableContractsX.Button2Click(Sender: TObject);
begin
  cbfAbn.KeyValue := 0;
  cbfEng.KeyValue := 0;
  cbfPack.KeyValue := 0;
  cbfAcc.KeyValue := 0;
  cbfCalc.ItemIndex := -1;

  chf1.Checked := false;
  chf2.Checked := false;
  chf3.Checked := false;
  chf4.Checked := false;
  chf5.Checked := false;

  with DataModC, odsContracts do begin
    Filtered := False;
    OrderByColumn(odsContracts, DBGrid1.Columns[0]);
  end;
end;

procedure TCableContractsX.Button1Click(Sender: TObject);
var
  Filt : string;
begin


  with DataModC, odsContracts do begin
    Filt := '1=1';
    if chf1.Checked then Filt := Filt+' and (abn_id='+String(cbfAbn.KeyValue)+')';
    if chf2.Checked then Filt := Filt+' and (eng_id='+String(cbfEng.KeyValue)+')';
    if chf3.Checked then Filt := Filt+' and (pack_num='+String(cbfPack.KeyValue)+')';
    if chf4.Checked then Filt := Filt+' and (acc_id='+String(cbfAcc.KeyValue)+')';
    if chf5.Checked then Filt := Filt+' and (calcag='+IntToStr(cbfCalc.ItemIndex)+')';

    Filter := Filt;
    Filtered := True;

    Close;
    Open;
  end;
end;

procedure TCableContractsX.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

   with Sender as TDBGrid do begin
    if datasource.DataSet.fieldbyname('REST').AsFloat<0 then begin
      Canvas.Font.Color := clRed;
    end;
    if datasource.DataSet.fieldbyname('REST').AsFloat=0 then
      Canvas.Font.Color := clBlue;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TCableContractsX.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin                 
  if (copy(E.Message, 5, 5)='12899') then
    ShowMessage('…азы сащ€й€ йерл€шмир.')
  else
    ShowMessage('ћ€лумат с€щв даxил олунур в€ йа нам€лум с€щв '+copy(E.Message, 5, 5));
end;

procedure TCableContractsX.actCommitMonOneExecute(Sender: TObject);
var
  i: Integer;
begin
 with dbgrid1, SelectedRows, DataSource.DataSet, DataModC, CABLE do begin
    for i:=0 to Count-1 do begin
      GotoBookmark(TBookmark(Items[i]));
      CallProcedure('calconecontract',[odsContracts.Fields[0].AsVariant,1]);
    end;
    actRefreshExecute(Sender);
  end;
end;

procedure TCableContractsX.actCommitMonAllExecute(Sender: TObject);
begin   
  with DataModC,CABLE do begin
    CallProcedure('calccontracts',[1]);
    actRefreshExecute(Sender);
  end;
end;

procedure TCableContractsX.actSetNewCalcDateExecute(Sender: TObject);

var
  nt: Integer;
begin
    with DataModC do begin
      nt := odsContracts.fields[0].AsVariant;
      CABLE.CallProcedure('contractsetlastdate',
               [
                  odsContracts.fields[0].AsVariant
               ]);
      odsContracts.Close;
      odsContracts.Open;
      actRefreshExecute(Sender);
      odsContracts.Locate('id',nt,[]);
    end;
end;

procedure TCableContractsX.BtnDeletedContsClick(Sender: TObject);
begin    
  if not Assigned(FrmDeletedConts) then
   FrmDeletedConts := TFrmDeletedConts.Create(Self);
  FrmDeletedConts.ShowModal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCableContractsX,
    Class_CableContractsX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
