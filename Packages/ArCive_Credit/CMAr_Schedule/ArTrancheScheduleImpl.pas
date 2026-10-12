unit ArTrancheScheduleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask, DBGridEh,
  Buttons, ComCtrls, ActnList, ImgList, ToolWin, CMCurrencyEdit,
  DBGridEhGrouping, GridsEh;

resourcestring
  er_Dublicate = 'Тарих тякрaрланыр';

type
  TTrancheScheduleForm = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit5: TDBEdit;
    ToolBar1: TToolBar;
    SchduleGrid: TDBGridEh;
    ScheludeActionList: TActionList;
    ToolBarImages: TImageList;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExitExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure SchduleGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    procedure ShowTrancheSchedule;
  end;

var
  TrancheScheduleForm: TTrancheScheduleForm;

implementation

uses ArTrancheScheduleDataModuleImpl, ArCommonDecls, ArTrSchedAddImpl,
  ArTrSchedUpdImpl, SbSystem;

{$R *.DFM}

procedure TTrancheScheduleForm.ShowTrancheSchedule;
resourcestring
  rsScheludeCaption = '%s № ли мцгавиля цчцн верилмя планы.';
var
  CreditID : Integer;
begin
  ArTrancheSheduleDataMod := TArTrancheSheduleDataMod.Create(Self);
  frmAddTrSched := TfrmAddTrSched.Create(Self);
  frmUpdTrSched := TfrmUpdTrSched.Create(Self);
  
  Caption := Format(rsScheludeCaption,[Get_SelectedCrdNo]);
  CreditID := Get_SelectedCrdID;

  with ArTrancheSheduleDataMod do begin
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
  ArTrancheSheduleDataMod.TrancheScheduleDataSet.Session.Commit;
end;

procedure TTrancheScheduleForm.actAddExecute(Sender: TObject);
begin
  with frmAddTrSched, ArTrancheSheduleDataMod do begin
    trchDate.Date := Get_CurrentDate;
    trchAmount.Text := '0';
    ShowModal;
  end;
end;

procedure TTrancheScheduleForm.actEditExecute(Sender: TObject);
begin
  with frmUpdTrSched, ArTrancheSheduleDataMod do begin
    trchDate.Date := TrancheScheduleDataSetTRCHDATE.AsDateTime;
    trchAmount.Text := TrancheScheduleDataSetTRCHAMOUNT.AsString;
    ShowModal;
  end;
end;

procedure TTrancheScheduleForm.actDelExecute(Sender: TObject);
resourcestring
  rs_DelTrancheSchedule = '%d нюмряли план силиняжяк. Разысынызмы?';
begin
  with ArTrancheSheduleDataMod , CM_SCHEDULE do begin
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

procedure TTrancheScheduleForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

end.
