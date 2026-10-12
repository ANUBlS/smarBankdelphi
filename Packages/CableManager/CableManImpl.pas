unit CableManImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, CableManager_TLB, StdVcl, ExtCtrls, Grids, DBGrids, OracleData,
  DBCtrls, StdCtrls, Buttons, Menus, ActnList, DB, ComCtrls, AppEvnts, sbcore;

type
  TCableMan = class(TActiveForm, ICableMan)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TGroupBox;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel6: TGroupBox;
    DBGrid3: TDBGrid;
    Panel5: TGroupBox;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Splitter2: TSplitter;
    pmAbonent: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ActionList1: TActionList;
    actAbAdd: TAction;
    actAbEd: TAction;
    actAbDel: TAction;
    actAbNewCon: TAction;
    actEditContact: TAction;
    pmContract: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    actContDel: TAction;
    N6: TMenuItem;
    actSAdd: TAction;
    actSEdit: TAction;
    actSDel: TAction;
    Button1: TButton;
    actCommit: TAction;
    edSrcID: TEdit;
    edSrcNAME: TEdit;
    edSrcDOC_NUM: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Label4: TLabel;
    edSrcPHONE: TEdit;
    actRefresh: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Label5: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    lbR1: TLabel;
    lbR: TLabel;
    N11: TMenuItem;
    actAdtToContact: TAction;
    actSetNewCalcDate: TAction;
    EditSrchWorksNum: TEdit;
    Label6: TLabel;
    NAddt: TMenuItem;
    procedure N4DrawItem(Sender: TObject; ACanvas: TCanvas;
                          ARect: TRect; Selected: Boolean);
    procedure OrderByColumn(DataSet: TOracleDataSet; Column: TColumn);
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure actAbNewConExecute(Sender: TObject);
    procedure actEditContactExecute(Sender: TObject);
    procedure actContDelExecute(Sender: TObject);
    procedure actSAddExecute(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure actSDelExecute(Sender: TObject);
    procedure actCommitExecute(Sender: TObject);
    procedure edSrcIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSrcIDExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure actAdtToContactExecute(Sender: TObject);
    procedure actSetNewCalcDateExecute(Sender: TObject);
    procedure EditSrchWorksNumKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: ICableManEvents;
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

implementation

uses ComObj, ComServ, CableManDataModuleImpl, CableManAddEditImpl,
  CableManContractAdd, CableManServAddEdit, qrpCableRep, CableManRepSet, sboapidatamoduleimpl;

{$R *.DFM}

{ TCableMan }

var
  orderbyAD: String[5];

procedure TCableMan.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CableManPage); }
end;

procedure TCableMan.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICableManEvents;
end;

procedure TCableMan.Initialize;
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

function TCableMan.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCableMan.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCableMan.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCableMan.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCableMan.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCableMan.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCableMan.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCableMan.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCableMan.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCableMan.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCableMan.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCableMan.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCableMan.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCableMan.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCableMan.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCableMan.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCableMan.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCableMan.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCableMan._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableMan.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCableMan.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCableMan.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCableMan.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCableMan.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCableMan.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCableMan.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCableMan.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCableMan.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCableMan.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCableMan.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCableMan.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCableMan.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCableMan.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCableMan.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCableMan.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCableMan.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCableMan.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableMan.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCableMan.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCableMan.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCableMan.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCableMan.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCableMan.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TCableMan.N4DrawItem(Sender: TObject; ACanvas: TCanvas;
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

procedure TCableMan.OrderByColumn(DataSet: TOracleDataSet; Column: TColumn);
var
  PosT: Integer;
begin
  if (orderbyAD=' desc') then orderbyAD := ' asc' else orderbyAD := ' desc';
  PosT := DataSet.SQL.Add('order by '+ Column.FieldName+orderbyAD);
  DataSet.Close;
  DataSet.Open;
  DataSet.SQL.Delete(PosT);
end;

procedure TCableMan.ActiveFormCreate(Sender: TObject);
begin
  DataModCable := TDataModCable.Create(Self);

  lbR.Caption := IntToStr(DataModCable.odsAbonents.RecordCount);
end;

procedure TCableMan.DBGrid1TitleClick(Column: TColumn);
begin
  OrderByColumn(TOracleDataSet(Column.Grid.DataSource.DataSet),Column);
end;

procedure TCableMan.BitBtn1Click(Sender: TObject);
var
  Res: Integer;
begin
  if not assigned(frmAbonAddEdit) then
    frmAbonAddEdit := TfrmAbonAddEdit.Create(Self);

  with DataModCable, frmAbonAddEdit, odsAbonents do begin
    edName.Text := '';
    edDoc.Text := '';
    edAddr.Text := '';
    edPhon.Text := '';
    edWPhon.Text := '';
    edMobPhone.Text := '';
    edReciever.Text := '1';
    edReg.Date := Now;
    edEngTime.Date := Now;
    edDone.Date := Now;

    edAccRoof.Checked := False;
    edSignal.Checked := false;
    edVAT.Checked := false;
    ChBoxForeigner.Checked := false;

    edDocType.KeyValue := 0;
    edEngineer.KeyValue := 0;
    edStatus.KeyValue := 0;

    if (frmAbonAddEdit.ShowModal = 1) then begin

      Res := CABLE.CallIntegerFunction('abonentadd',
               [
                 edName.Text,
                 Tdatetime(edReg.DateTime),
                 edDocType.KeyValue,
                 edDoc.Text,
                 edAddr.Text,
                 edPhon.Text,
                 edWPhon.Text,
                 Integer(edaccRoof.Checked),
                 Integer(edSignal.Checked),
                 StrToInt(edReciever.Text),
                 Tdatetime(edEngTime.Date),
                 edengineer.KeyValue,
                 Tdatetime(eddone.date),
                 Integer(edVat.checked),
                 edStatus.keyvalue,
                 edMobPhone.Text,
                 Integer(ChBoxForeigner.Checked)
               ]);
      odsAbonents.Close;
      odsAbonents.Open;
      lbR.Caption := IntToStr(odsAbonents.RecordCount);
    end;
  end;
end;

procedure TCableMan.BitBtn2Click(Sender: TObject);
begin
  if (MessageDlg('…азы силин€жк. яминсиниз?',mtWarning, [mbYes, mbNo], 0)=idyes) then
    with DataModCable, frmAbonAddEdit do begin

      CABLE.CallProcedure('abonentdel',
               [
                  odsAbonents.fields[0].AsVariant
               ]);
      odsAbonents.Close;
      odsAbonents.Open;
      lbR.Caption := IntToStr(odsAbonents.RecordCount);
    end;

end;

procedure TCableMan.BitBtn3Click(Sender: TObject);
var
  CID: Integer;
begin    
  if not assigned(frmAbonAddEdit) then
    frmAbonAddEdit := TfrmAbonAddEdit.Create(Self);
  with DataModCable, frmAbonAddEdit, odsAbonents do begin

    CID := Fields[0].AsInteger;

    edName.Text := FieldByName('NAME').AsString;
    edDoc.Text := FieldByName('DOC_NUM').AsString;
    edAddr.Text := FieldByName('ADDRESS').AsString;
    edPhon.Text := FieldByName('PHONE').AsString;
    edMobPhone.Text := FieldByName('PHONE_MOB').AsString;
    edWPhon.Text := FieldByName('PHONE_WK').AsString;
    edReciever.Text := FieldByName('RECEIVER_NUM').AsString;
    if (FieldByName('REG_TIME').AsString='') then
      edReg.Date := Now
    else
      edReg.Date := FieldByName('REG_TIME').AsDateTime;
      
    if (FieldByName('ENG_TIME').AsString='') then
      edEngTime.Date := Now
    else
      edEngTime.Date := FieldByName('ENG_TIME').AsDateTime;

    if (FieldByName('DONE_TIME').AsString='') then
      edDone.Date := Now
    else
      edDone.Date := FieldByName('DONE_TIME').AsDateTime;
       
    edAccRoof.Checked := FieldByName('ACCESS_ROOF').AsBoolean;
    edSignal.Checked := FieldByName('SIGNALLING').AsBoolean;
    edVAT.Checked := FieldByName('VAT').AsBoolean;
    ChBoxForeigner.Checked := FieldByName('FOREIGNER').AsBoolean;  

    edDocType.KeyValue := FieldByName('DOC_ID').AsVariant;
    edEngineer.KeyValue := FieldByName('ENG_ID').AsVariant;
    edStatus.KeyValue := FieldByName('STAT_ID').AsVariant;

    if (frmAbonAddEdit.ShowModal = 1) then begin
      CABLE.CallProcedure('abonentupd',
               [
                 Fields[0].asVariant,
                 edName.Text,
                 Tdatetime(edReg.DateTime),
                 edDocType.KeyValue,
                 edDoc.Text,
                 edAddr.Text,
                 edPhon.Text,
                 edWPhon.Text,
                 Integer(edaccRoof.Checked),
                 Integer(edSignal.Checked),
                 StrToInt(edReciever.Text),
                 Tdatetime(edEngTime.Date),
                 edengineer.KeyValue,
                 Tdatetime(eddone.date),
                 Integer(edVat.checked),
                 edStatus.keyvalue       ,
                 edMobPhone.Text,
                 Integer(ChBoxForeigner.Checked)
               ]);
      odsAbonents.Close;
      odsAbonents.Open;
      lbR.Caption := IntToStr(odsAbonents.RecordCount);
      Locate('ID', CID, []);
    end;
  end;

end;

procedure TCableMan.DBGrid3CellClick(Column: TColumn);
begin
  DataModCable.odsServs.Open;
end;

procedure TCableMan.actAbNewConExecute(Sender: TObject);
var
  Res: Integer;
begin
  if not assigned(frmContractAdd) then
    frmContractAdd := TfrmContractAdd.Create(Self);
  with DataModCable, frmContractAdd, odsContacts do begin
    edcontract_num.Text := '';
    edcard_num.Text := '';
    edserie.Text := '';
    edworks_num.Text := '';
    edreceiver_num.Text := '1';
    edcable_length.Text := '';
    edamount.Text := '';
    eddiscount.Text := '0';
    edDiscDesc.Text := '';

    edinst_date.Date := Now;
    edinst_date.Enabled := false;
    edexp_date.Date := Now;

    edinst_place.itemindex := 0;

    edcurr_code.KeyValue := 0;
    edeng_id.KeyValue := 0;
    edpack_num.Enabled :=true;
    edpack_num.KeyValue := 0;
    edSRV_num.Enabled :=false;
    edSRV_num.KeyValue :=0;
    edAcc_ID.KeyValue := 0;

    edCalcAg.Enabled := true;
    edCalcAg.Checked := false;

    if (frmContractAdd.ShowModal = 1) then begin



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
          Integer(edCalcAg.Checked),
          edDiscDesc.Text,
          Tdatetime(edexp_date.DateTime)
               ]);
      odsContacts.Close;
      odsContacts.Open;
    end;
  end;
end;

procedure TCableMan.actEditContactExecute(Sender: TObject);
var
  CID: Integer;
begin
  if not assigned(frmContractAdd) then
    frmContractAdd := TfrmContractAdd.Create(Self);
  with DataModCable, frmContractAdd, odsContacts do begin

    CID := Fields[0].AsInteger;

    edcontract_num.Text := odsContacts.FieldByName('CONTRACT_NUM').AsString;
    edcard_num.Text := odsContacts.FieldByName('CARD_NUM').AsString;
    edserie.Text := odsContacts.FieldByName('SERIE').AsString;
    edworks_num.Text := odsContacts.FieldByName('WORKS_NUM').AsString;
    edreceiver_num.Text := odsContacts.FieldByName('RECEIVER_NUM').AsString;
    edcable_length.Text := odsContacts.FieldByName('CABLE_LENGTH').AsString;
    edamount.Text := odsContacts.FieldByName('AMOUNT').AsString;
    eddiscount.Text := odsContacts.FieldByName('DISCOUNT').AsString;
    edDiscDesc.Text := odsContacts.FieldByName('DISCOUNT_DESC').AsString;

    edinst_date.Enabled := true;
    edinst_date.Date := odsContacts.FieldByName('INST_DATE').AsDateTime;
    edexp_date.Date := odsContacts.FieldByName('EXP_DATE').AsDateTime;

    edinst_place.itemindex := odsContacts.FieldByName('INST_PLACE').AsInteger;

    edcurr_code.KeyValue := odsContacts.FieldByName('CURR_CODE').AsVariant;
    edeng_id.KeyValue := odsContacts.FieldByName('ENG_ID').AsVariant;
    edpack_num.Enabled := true;
    edpack_num.KeyValue := odsContacts.FieldByName('PACK_NUM').AsVariant;
    edSRV_num.Enabled := true;
    edAcc_ID.KeyValue := odsContacts.FieldByName('ACC_ID').AsVariant;

    edCalcAg.Enabled := true;
    edCalcAg.Checked := Boolean(odsContacts.FieldByName('CALCAG').AsInteger);

    if (frmContractAdd.ShowModal = 1) then begin

      CABLE.CallProcedure('contractupd',
               [
          odsContacts.Fields[0].AsVariant,
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
          edpack_num.KeyValue ,
          edAcc_ID.KeyValue,
          Integer(edCalcAg.Checked),
          edDiscDesc.Text    ,
          Tdatetime(edexp_date.DateTime)
               ]);
      odsContacts.Close;
      odsContacts.Open;
      Locate('ID', CID, []);
    end;
  end;
end;

procedure TCableMan.actContDelExecute(Sender: TObject);
begin
  if (MessageDlg('…азы силин€жк. яминсиниз?',mtWarning, [mbYes, mbNo], 0)=idyes) then
    with DataModCable do begin

      CABLE.CallProcedure('contractdel',
               [
                  odsContacts.fields[0].AsVariant
               ]);
      odsContacts.Close;
      odsContacts.Open;
    end;
end;

procedure TCableMan.actSAddExecute(Sender: TObject);
var
  Res, CID, AccountID: integer;
begin
  if not assigned(frmServAddEdit) then
    frmServAddEdit := TfrmServAddEdit.Create(Self);
  with DataModCable, frmServAddEdit, odsServs do begin
    CurrencyEdit1.Value := 0;

    CID := odsContacts.Fields[0].AsInteger;

    DBLookupComboBox1.KeyValue := 0;
    DBLookupComboBox2.KeyValue := 0;
    tpTime.DateTime := Sb_GetSystemDate;
    cbMeth.ItemIndex := 0;

    ChBoxFrmAnthrAcc.Enabled := true;
    ChBoxFrmAnthrAcc.Checked := false;
    CBoxFrmAnthrAcc.KeyValue := odsContacts.FieldByName('Contract_Num').AsVariant;
    CBoxFrmAnthrAcc.Enabled := false;

    if (frmServAddEdit.ShowModal = 1) then begin
     if ChBoxFrmAnthrAcc.Checked then AccountID := CBoxFrmAnthrAcc.KeyValue
      else AccountID := 0;
                             
      Res := CABLE.CallIntegerFunction('abnservadd',
               [
          odsContacts.Fields[0].AsVariant ,
          null ,
          DBLookupComboBox2.KeyValue ,
          CurrencyEdit1.Value,
          DBLookupComboBox1.KeyValue ,
          0 ,
          tpTime.DateTime,
          cbmeth.itemindex,
          AccountID
               ]);
      odsServs.Close;
      odsServs.Open;
      odsContacts.Close;
      odsContacts.Open;

      odsContacts.Locate('ID', CID, []);
    end;
  end;
end;

procedure TCableMan.BitBtn6Click(Sender: TObject);
var            
  CID: Integer;
begin
  if not assigned(frmServAddEdit) then
    frmServAddEdit := TfrmServAddEdit.Create(Self);
  with DataModCable, frmServAddEdit, odsServs do begin
    CurrencyEdit1.Value := odsServs.FieldByName('AMOUNT').AsCurrency;
                                   
    CID := odsContacts.Fields[0].AsInteger;
    DBLookupComboBox1.KeyValue := odsServs.FieldByName('CURR_CODE').AsVariant;
    DBLookupComboBox2.KeyValue := odsServs.FieldByName('SRV_ID').AsVariant;
    tpTime.DateTime := odsServs.FieldByName('DONE_TIME').AsVariant;

    cbmeth.itemindex := odsServs.FieldByName('PAYMETHOD').AsInteger;
    CBoxFrmAnthrAcc.KeyValue := odsServs.FieldByName('FRM_CONTRCT').AsVariant;
    ChBoxFrmAnthrAcc.Enabled := false;
    CBoxFrmAnthrAcc.Enabled := false;
    
    if (frmServAddEdit.ShowModal = 1) then begin

      CABLE.CallProcedure('abnservupd',
               [
          odsServs.Fields[0].AsVariant ,
          odsContacts.Fields[0].AsVariant ,
          null ,
          DBLookupComboBox2.KeyValue ,
          CurrencyEdit1.Value,
          DBLookupComboBox1.KeyValue ,
          null ,
          tpTime.DateTime,
          cbmeth.itemindex
               ]);
      odsServs.Close;
      odsServs.Open;      
      odsContacts.Close;
      odsContacts.Open;      
      odsContacts.Locate('ID', CID, []);
    end;
  end;
end;

procedure TCableMan.actSDelExecute(Sender: TObject);
var
  MsgID: Integer;
  CID: Integer;
begin
  MsgID := MessageDlg('Ёцнцн с€н€дл€ринд€н €м€лиййат силин€ж€к. яминсиниз?',mtWarning, [mbYes, mbNo, mbCancel], 0);
  if (msgid=idyes) then
    with DataModCable do begin      
    CID := odsContacts.Fields[0].AsInteger;
      CABLE.CallProcedure('abnservdel',
               [
                  odsServs.fields[0].AsVariant, 1
               ]);
      odsServs.Close;
      odsServs.Open;
      odsContacts.Close;
      odsContacts.Open;   
      odsContacts.Locate('ID', CID, []);
    end;
  if (msgid=idno) then
    with DataModCable do begin     
    CID := odsContacts.Fields[0].AsInteger;
      CABLE.CallProcedure('abnservdel',
               [
                  odsServs.fields[0].AsVariant, 0
               ]);
      odsServs.Close;
      odsServs.Open;
      odsContacts.Close;
      odsContacts.Open;    
      odsContacts.Locate('ID', CID, []);
    end;

end;

procedure TCableMan.actCommitExecute(Sender: TObject);
begin
  if DataModCable.odsServs.fieldbyname('STATUS').asinteger>0 then begin
    ShowMessage('Ѕу €м€лиййат т€сдиг олунуб');
    exit
  end else
  if (MessageDlg('ям€лиййат т€сдигл€нсин?',mtWarning, [mbYes, mbNo], 0)=idyes) then
    with DataModCable do begin
      CABLE.CallProcedure('abnservcommit',
               [
                  odsServs.fields[0].AsVariant
               ]);
      odsServs.Close;
      odsServs.Open;
      odsContacts.Close;
      odsContacts.Open;
    end;

end;

procedure TCableMan.edSrcIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then begin
    DataModCable.odsAbonents.Locate(copy((sender as tedit).name,6,length((sender as tedit).name)-5),(sender as tedit).text, [loCaseInsensitive]);
  end;
end;

procedure TCableMan.edSrcIDExit(Sender: TObject);
begin
  (sender as tedit).text := '';
end;

procedure TCableMan.Button2Click(Sender: TObject);
var
  a, v: Real;
  ServStr, comma : string;
begin
  with frmPrintRep do begin
  if not assigned(frmPrintRep) then
    frmPrintRep := TfrmPrintRep.Create(Self);
    if ShowModal = IDOK then begin
      if not assigned(qrpMain) then
        qrpMain := TqrpMain.Create(Self);
      with qrpMain do begin
       if DataModCable.odsAbonents.FieldByName('FOREIGNER').AsVariant='VAR' then LblForeigner.Caption := 'yerli' else LblForeigner.Caption :='xarici';
        qW1.Caption := edit1.Text;
        qW2.Caption := edit2.Text;
        qW3.Caption := edit3.Text;
        qW4.Caption := edit4.Text;
        qW5.Caption := edit5.Text;
        qW6.Caption := edit6.Text;
        qW7.Caption := edit7.Text;
        qW8.Caption := '';
        LblUserName.Caption:=sboapiDataModule.SBLogon.Session.LogonUsername;
        LblSymb.Caption :=DataModCable.odsContacts.FieldByName('symb').AsString;

        a := CurrencyEdit1.Value+
                                  CurrencyEdit2.Value+
                                  CurrencyEdit3.Value+
                                  CurrencyEdit4.Value+
                                  CurrencyEdit5.Value+
                                  CurrencyEdit6.Value+
                                  CurrencyEdit7.Value;

        qS1.Caption := FormatFloat('#,##0.00',CurrencyEdit1.Value);
        qS2.Caption := FormatFloat('#,##0.00',CurrencyEdit2.Value);
        qS3.Caption := FormatFloat('#,##0.00',CurrencyEdit3.Value);
        qS4.Caption := FormatFloat('#,##0.00',CurrencyEdit4.Value);
        qS5.Caption := FormatFloat('#,##0.00',CurrencyEdit5.Value);
        qS6.Caption := FormatFloat('#,##0.00',CurrencyEdit6.Value);
        qS7.Caption := FormatFloat('#,##0.00',CurrencyEdit7.Value);
        qS8.Caption := FormatFloat('#,##0.00',a);

        if DataModCable.odsAbonents.FieldByName('VAT').AsVariant='Hя' then v :=1 else v :=1.18;

        qE1.Caption := FormatFloat('#,##0.00',(CurrencyEdit1.Value/v));
        qE2.Caption := FormatFloat('#,##0.00',(CurrencyEdit2.Value/v));
        qE3.Caption := FormatFloat('#,##0.00',(CurrencyEdit3.Value/v));
        qE4.Caption := FormatFloat('#,##0.00',(CurrencyEdit4.Value/v));
        qE5.Caption := FormatFloat('#,##0.00',(CurrencyEdit5.Value/v));
        qE6.Caption := FormatFloat('#,##0.00',(CurrencyEdit6.Value/v));
        qE7.Caption := FormatFloat('#,##0.00',(CurrencyEdit7.Value/v));
        qE8.Caption := FormatFloat('#,##0.00',
                                  StrToFloat(qE1.Caption)
                                 +StrToFloat(qE2.Caption)
                                 +StrToFloat(qE3.Caption)
                                 +StrToFloat(qE4.Caption)
                                 +StrToFloat(qE5.Caption)
                                 +StrToFloat(qE6.Caption)
                                 +StrToFloat(qE7.Caption));
        //qE8.Caption := FormatFloat('#,##0.00',(a/v));

        qA1.Caption := FormatFloat('#,##0.00',(CurrencyEdit1.Value - CurrencyEdit1.Value/v));
        qA2.Caption := FormatFloat('#,##0.00',(CurrencyEdit2.Value - CurrencyEdit2.Value/v));
        qA3.Caption := FormatFloat('#,##0.00',(CurrencyEdit3.Value - CurrencyEdit3.Value/v));
        qA4.Caption := FormatFloat('#,##0.00',(CurrencyEdit4.Value - CurrencyEdit4.Value/v));
        qA5.Caption := FormatFloat('#,##0.00',(CurrencyEdit5.Value - CurrencyEdit5.Value/v));
        qA6.Caption := FormatFloat('#,##0.00',(CurrencyEdit6.Value - CurrencyEdit6.Value/v));
        qA7.Caption := FormatFloat('#,##0.00',(CurrencyEdit7.Value - CurrencyEdit7.Value/v));
        qA8.Caption := FormatFloat('#,##0.00',
                                  StrToFloat(qA1.Caption)
                                 +StrToFloat(qA2.Caption)
                                 +StrToFloat(qA3.Caption)
                                 +StrToFloat(qA4.Caption)
                                 +StrToFloat(qA5.Caption)
                                 +StrToFloat(qA6.Caption)
                                 +StrToFloat(qA7.Caption));
        //qA8.Caption := FormatFloat('#,##0.00',(a-a/v));

        ServStr := ''; comma := '';
        if CheckBox1.Checked then begin ServStr := ServStr + comma + CheckBox1.Caption; comma := ','; end;
        if CheckBox2.Checked then begin ServStr := ServStr + comma + CheckBox2.Caption; comma := ','; end;
        if CheckBox3.Checked then begin ServStr := ServStr + comma + CheckBox3.Caption; comma := ','; end;
        if CheckBox4.Checked then begin ServStr := ServStr + comma + CheckBox4.Caption; comma := ','; end;
        if CheckBox5.Checked then begin ServStr := ServStr + comma + CheckBox5.Caption; comma := ','; end;
        if CheckBox6.Checked then begin ServStr := ServStr + comma + CheckBox6.Caption; comma := ','; end;
        if Edt7_1.Text<>'' then begin ServStr := ServStr + comma + Edt7_1.Text; comma := ','; end;
        QRLabelServs.Caption := ServStr;
        preview;
      end;
    end;
  end;
end;

procedure TCableMan.actRefreshExecute(Sender: TObject);
begin
  with DataModCable do begin
    odsAbonents.Close;
    odsAbonents.Open;
    lbR.Caption := IntToStr(odsAbonents.RecordCount);
    odsEngineers.Close;
    odsEngineers.Open;
    odsContacts.Close;
    odsContacts.Open;
    odsServs.Close;
    odsServs.Open;
    odsDocTypes.Close;
    odsDocTypes.Open;
    odsStatuses.Close;
    odsStatuses.Open;
    odsAccs.Close;
    odsAccs.Open;   
    odsServices.Close;
    odsServices.Open;
    odsPacks.Close;
    odsPacks.Open;
    odsValutes.Close;
    odsValutes.Open;
  end;
end;

procedure TCableMan.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin  
  if (copy(E.Message, 5, 5)='12899') then
    ShowMessage('…азы сащ€й€ йерл€шмир.')
  else
    ShowMessage('ћ€лумат с€щв даxил олунур в€ йа нам€лум с€щв '+copy(E.Message, 5, 5));
end;

procedure TCableMan.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  funcname: String;
begin

  if Key=VK_RETURN then begin
  if (checkbox1 as tcheckbox).checked then
    funcname := 'getabonidbycard'
  else
    funcname := 'getabonidbycontract';
    DataModCable.odsAbonents.Locate('ID',DataModCable.CABLE.CallIntegerFunction(funcname,[(sender as tedit).text]), [loCaseInsensitive]);
  end;
end;

procedure TCableMan.CheckBox1Click(Sender: TObject);
begin
  if (sender as tcheckbox).checked then
    label5.Caption := 'Kart'
  else
    label5.Caption := 'ћцгавил€'
end;

procedure TCableMan.actAdtToContactExecute(Sender: TObject);
var
  CID: Integer;
begin

  if not assigned(frmContractAdd) then
    frmContractAdd := TfrmContractAdd.Create(Self);
  with DataModCable, frmContractAdd, odsContacts do begin

    CID := Fields[0].AsInteger;

    edcontract_num.Text := odsContacts.FieldByName('CONTRACT_NUM').AsString;
    edcard_num.Text := odsContacts.FieldByName('CARD_NUM').AsString;
    edserie.Text := odsContacts.FieldByName('SERIE').AsString;
    edworks_num.Text := odsContacts.FieldByName('WORKS_NUM').AsString;
    edreceiver_num.Text := odsContacts.FieldByName('RECEIVER_NUM').AsString;
    edcable_length.Text := odsContacts.FieldByName('CABLE_LENGTH').AsString;
    edamount.Text := odsContacts.FieldByName('AMOUNT').AsString;
    eddiscount.Text := odsContacts.FieldByName('DISCOUNT').AsString;
    edDiscDesc.Text := odsContacts.FieldByName('DISCOUNT_DESC').AsString;

    edinst_date.Date := odsContacts.FieldByName('INST_DATE').AsDateTime;
    edexp_date.Date := odsContacts.FieldByName('EXP_DATE').AsDateTime;

    edinst_place.itemindex := odsContacts.FieldByName('INST_PLACE').AsInteger;

    edcurr_code.KeyValue := odsContacts.FieldByName('CURR_CODE').AsVariant;
    edeng_id.KeyValue := odsContacts.FieldByName('ENG_ID').AsVariant;
    edpack_num.KeyValue := odsContacts.FieldByName('PACK_NUM').AsVariant;
    edSRV_num.Enabled :=true;
    edAcc_ID.KeyValue := odsContacts.FieldByName('ACC_ID').AsVariant;;

    edCalcAg.Checked := Boolean(odsContacts.FieldByName('CALCAG').AsInteger);
    ShowMessage('not completed'); 
    if (frmContractAdd.ShowModal = 1) then begin

      CABLE.CallProcedure('contractupd',
               [
          odsContacts.Fields[0].AsVariant,
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
          edpack_num.KeyValue ,
          edAcc_ID.KeyValue,
          Integer(edCalcAg.Checked),
          edDiscDesc.Text    ,
          Tdatetime(edexp_date.DateTime)
               ]);
      odsContacts.Close;
      odsContacts.Open;
      Locate('ID', CID, []);
    end;
  end;

end;

procedure TCableMan.actSetNewCalcDateExecute(Sender: TObject);
var
  nt: Integer;
begin
    with DataModCable do begin
      nt := odsContacts.fields[0].AsVariant;
      CABLE.CallProcedure('contractsetlastdate',
               [
                  odsContacts.fields[0].AsVariant
               ]);
      odsContacts.Close;
      odsContacts.Open;
      odsContacts.Locate('id', nt, []);
    end;

end;

procedure TCableMan.EditSrchWorksNumKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
   DataModCable.odsAbonents.Locate
    ('ID',DataModCable.CABLE.CallIntegerFunction('GetAbonIdByWorksNum',[(Sender as TEdit).text]), [loCaseInsensitive]);
end;

procedure TCableMan.N12Click(Sender: TObject);
var
  r, CID: Integer;
begin
  if not assigned(frmContractAdd) then
    frmContractAdd := TfrmContractAdd.Create(Self);
  with DataModCable, frmContractAdd, odsContacts do begin
    CID := Fields[0].AsInteger;

    edcontract_num.Text := '';
    edcontract_num.Text := odsContacts.FieldByName('Contract_Num').AsString;
    edcard_num.Text := odsContacts.FieldByName('CARD_NUM').AsString;
    edserie.Text := odsContacts.FieldByName('SERIE').AsString;
    edworks_num.Text := odsContacts.FieldByName('WORKS_NUM').AsString;
    edreceiver_num.Text := odsContacts.FieldByName('RECEIVER_NUM').AsString;
    edcable_length.Text := odsContacts.FieldByName('CABLE_LENGTH').AsString;
    edamount.Text := odsContacts.FieldByName('AMOUNT').AsString;
    eddiscount.Text := odsContacts.FieldByName('DISCOUNT').AsString;
    edDiscDesc.Text := odsContacts.FieldByName('DISCOUNT_DESC').AsString;

    edinst_date.Enabled := true;
    edinst_date.Date := odsContacts.FieldByName('INST_DATE').AsDateTime;
    //edexp_date.Date := odsContacts.FieldByName('EXP_DATE').AsDateTime;

    edinst_place.itemindex := odsContacts.FieldByName('INST_PLACE').AsInteger;

    edcurr_code.KeyValue := odsContacts.FieldByName('CURR_CODE').AsVariant;
    edeng_id.KeyValue := 0;
    edpack_num.KeyValue := odsContacts.FieldByName('PACK_NUM').AsVariant;
    edpack_num.Enabled := false;
    edSRV_num.Enabled := true;
    edAcc_ID.KeyValue := 0;

    edCalcAg.Checked := true;
    edCalcAg.Enabled := false;

    if (frmContractAdd.ShowModal = 1) then begin
      
    r := CABLE.CallIntegerFunction('ContractAdditional',
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
          edpack_num.KeyValue ,
          edAcc_ID.KeyValue,
          Integer(edCalcAg.Checked),
          edDiscDesc.Text    ,
          Tdatetime(edexp_date.DateTime),
          CID,
          edSRV_num.KeyValue
               ]);
      odsContacts.Close;
      odsContacts.Open;
      Locate('ID', CID, []);
    end;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCableMan,
    Class_CableMan,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
