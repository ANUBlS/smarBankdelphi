unit TicketsArchiveImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Quickrpt,
  Menus;

type
  TfrmArchive = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Button3: TButton;
    cbPDCopy: TCheckBox;
    PopupMenu1: TPopupMenu;
    dsf1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dsf1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure dsf1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArchive: TfrmArchive;

implementation

uses DataModTM, TicketsRepImpl, CurrencyToHR_Azeri_Impl, UntSecondReport,
  UntMainReport, uChangeStatus, TicketsManagerImpl;

{$R *.DFM}

procedure TfrmArchive.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmArchive.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Sender as TDBGrid do begin
    Canvas.Font.Color := GridColors[DataModuleTicketMan.ODSArchiveSTATUS.AsInteger];
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmArchive.Button2Click(Sender: TObject);
begin
  with qrpTicket, DataModuleTicketMan, ODSforPrint do begin
    Close;
    ClearVariables;
    SetVariable('ID',ODSArchiveID.AsInteger);
    Open;
    qlbLabel.Caption := ODSSettingsLBLABEL.AsString;
    qlbTitle.Caption := ODSSettingsLBTITLE.AsString;
    qlbDescription.Caption := ODSSettingsLBDESCR.AsString;
    qlbBotNum.Caption := ODSSettingsLBBNUMB.AsString;
    qlbStrAmount.Caption := CurrencyToHR_Azeri(ODSforPrintAMMOUNT.AsFloat,2,[0]);
    qupDate.Mask := ODSSettingsFORMATDAT.AsString;
    qlbtLabel.Caption := ODSSettingsLBLABEL.AsString;
    qlbtTitle.Caption := ODSSettingsLBTITLE.AsString;
    qlbtDescription.Caption := ODSSettingsLBDESCR.AsString;
    qlbtBotNum.Caption := ODSSettingsLBBNUMB.AsString;
    qlbtStrAmount.Caption := CurrencyToHR_Azeri(ODSforPrintAMMOUNT.AsFloat,2,[0]);
    qbtDate.Mask := ODSSettingsFORMATDAT.AsString;
    Preview;
  end;
end;

procedure TfrmArchive.DBLookupComboboxEh2Change(Sender: TObject);
const
  ArchSQL = 'select a.status, a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankcode, a.dbankname,'+#13+#10+
				       'a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccname,'+#13+#10+
				       'a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kbankinn,'+#13+#10+
				       'a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.kaccname,'+#13+#10+
				       'a.kaccinn, a.ammount, a.description, a.information, a.userid, u.name tuser'+#13+#10+
				  'from sba_tm_archive a, user$ u'+#13+#10+
				 'where (u.id=a.userid) and a.status=%s'+#13+#10+
				 'order by a.id';

begin
  with DataModuleTicketMan, ODSArchive do begin
    if active then close;
    ClearVariables;
    if ODSStatusesID.AsInteger = -1 then
      SQL.Text := Format(ArchSQL,['a.status'])
    else
      SQL.Text := Format(ArchSQL,[ODSStatusesID.AsString]);
    Open;
  end;
end;

procedure TfrmArchive.FormCreate(Sender: TObject);
begin
  DBLookupComboboxEh1.KeyValue := 1;
  DBLookupComboboxEh2.KeyValue := -1;
end;

procedure TfrmArchive.Button3Click(Sender: TObject);
begin
  with DataModuleTicketMan, ODSPaymentDecree do begin
    Close;
    ClearVariables;
    SetVariable('ID',ODSArchiveID.AsVariant);
    Open;
    if cbPDCopy.Checked then begin
      if not assigned(QRMainReport) then
        QRMainReport := TQRMainReport.Create(self);
      with QRMainReport do begin
        QRAmmountW1.Caption := CurrencyToHR_Azeri(ODSPaymentDecree.FieldByName('AMMOUNT').AsFloat,2,[]);
        QRAmmountW2.Caption := CurrencyToHR_Azeri(ODSPaymentDecree.FieldByName('AMMOUNT').AsFloat,2,[]);
        Preview;
      end;
    end else begin
      if not assigned(QRCommonReport) then
        QRCommonReport := TQRCommonReport.Create(self);
      with QRCommonReport do begin
        QRAmmountW.Caption := CurrencyToHR_Azeri(ODSPaymentDecree.FieldByName('AMMOUNT').AsFloat,2,[]);
        Preview;
      end;
    end;
  end;
end;

procedure TfrmArchive.dsf1DrawItem(Sender: TObject; ACanvas: TCanvas;
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
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
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

procedure TfrmArchive.dsf1Click(Sender: TObject);
begin
  if not assigned(frmchgstatus) then
    frmChgStatus := TfrmChgStatus.Create(Self);
  if frmChgStatus.ShowModal=iDok then
    with frmChgStatus, DataModuleTicketMan do begin
      TM_MANAGE.CallProcedure('changestatus',[ODSArchiveID.AsVariant, cbStat.KeyValue]);
      ODSArchive.Refresh;
    end;
end;

end.
