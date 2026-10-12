unit ipTrancheScheduleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask, DBGridEh,
  Buttons, ComCtrls, ActnList, ImgList, ToolWin, CMCurrencyEdit,
  CMExcelExport;

resourcestring
  er_Dublicate = 'Òàğèõ òÿêğağëàíûğ';

type
  TTrancheScheduleForm = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit5: TDBEdit;
    ToolBar1: TToolBar;
    SchduleGrid: TDBGridEh;
    ScheludeActionList: TActionList;
    ToolBarImages: TImageList;
    Localizer: TNLSLocalizer;
    actSave: TAction;
    actExit: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    ToolButton4: TToolButton;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    actprint: TAction;
    CMExcelExport: TCMExcelExport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExitExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure SchduleGridKeyPress(Sender: TObject; var Key: Char);
    procedure actprintExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowTrancheSchedule;
  end;

var
  TrancheScheduleForm: TTrancheScheduleForm;

implementation

uses ipTrancheScheduleDataModuleImpl, CommonDecls, ipTrSchedAddImpl,
  ipTrSchedUpdImpl, SystemState;

{$R *.DFM}

procedure TTrancheScheduleForm.ShowTrancheSchedule;
resourcestring
  rsScheludeCaption = '%s ¹ ëè ìöãàâèëÿ ö÷öí âåğèëìÿ ïëàíû.';
var
  CreditID : Integer;
begin
  TrancheSheduleDataMod := TTrancheSheduleDataMod.Create(Self);
  frmAddTrSched := TfrmAddTrSched.Create(Self);
  frmUpdTrSched := TfrmUpdTrSched.Create(Self);
  
  Localizer.Caption := Format(rsScheludeCaption,[Get_SelectedCrdNo]);
  CreditID := Get_SelectedCrdID;

  with TrancheSheduleDataMod do begin
    AboutContractDataSet.SetVariable('ID', CreditID);
    AboutContractDataSet.Open;
    TrancheScheduleDataSet.SetVariable('CREDITID', CreditID);
    TrancheScheduleDataSet.Open;
  end;
 
  ShowModal;
end;

procedure TTrancheScheduleForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
  begin
    Key := #0;
    Close;
  end;
end;

procedure TTrancheScheduleForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TTrancheScheduleForm.actSaveExecute(Sender: TObject);
begin
  TrancheSheduleDataMod.TrancheScheduleDataSet.Session.Commit;
end;

procedure TTrancheScheduleForm.actAddExecute(Sender: TObject);
begin
  with frmAddTrSched, TrancheSheduleDataMod do begin
    trchDate.Date := Get_CurrentDate;
    trchAmount.Text := '0';
    ShowModal;
  end;
end;

procedure TTrancheScheduleForm.actEditExecute(Sender: TObject);
begin
  with frmUpdTrSched, TrancheSheduleDataMod do begin
    trchDate.Date := TrancheScheduleDataSetTRCHDATE.AsDateTime;
    trchAmount.Text := TrancheScheduleDataSetTRCHAMOUNT.AsString;
    ShowModal;
  end;
end;

procedure TTrancheScheduleForm.actDelExecute(Sender: TObject);
resourcestring
  rs_DelTrancheSchedule = '%d íşìğÿëè ïëàí ñèëèíÿæÿê. ÿìèíñèíèçìè?';
begin
  with TrancheSheduleDataMod , CM_SCHEDULE do begin
    if MessageDlg (Format(rs_DelTrancheSchedule, [TrancheScheduleDataSetID.AsInteger]),
                 mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
      CallProcedure('TrSchedule_Del', [TrancheScheduleDataSetID.AsVariant]);
      Session.Commit;
      TrancheScheduleDataSet.Refresh;
    end;  
  end;
end;

procedure TTrancheScheduleForm.SchduleGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(key)=VK_RETURN then
    actEditExecute(Sender);
end;

procedure TTrancheScheduleForm.actprintExecute(Sender: TObject);
begin
   with CMExcelExport do
   begin
      Connect;
      ExportDataset(TrancheSheduleDataMod.TrancheScheduleDataSet,'Âåğèëìÿ ïëàíû',true);
      Disconnect;
   end;
end;

procedure TTrancheScheduleForm.actSaveUpdate(Sender: TObject);
begin
  with TrancheSheduleDataMod,TrancheScheduleDataSet do
  (Sender as TAction).Enabled := Active and (RecordCount > 0)
end;

end.
