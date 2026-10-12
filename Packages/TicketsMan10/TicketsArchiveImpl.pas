unit TicketsArchiveImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Mask, Quickrpt,
  DBCtrls;

type
  TfrmArchive = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboboxEh1: TDBLookupComboBox;
    DBLookupComboboxEh2: TDBLookupComboBox;
    Button3: TButton;
    cbPDCopy: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArchive: TfrmArchive;

implementation

uses DataModTM, TicketsRepImpl, CurrencyToHR_Azeri_Impl, UntSecondReport,
  UntMainReport;

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

end.
