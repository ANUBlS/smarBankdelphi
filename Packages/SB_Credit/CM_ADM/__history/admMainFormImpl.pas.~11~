unit admMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, ComCtrls, ToolWin, DBCGrids, StdCtrls, DBCtrls,
  Grids, DBGrids, ActnList, ImgList, DBGridEh, CheckLst, Evanescence,
  Buttons, Menus, DBGridEhGrouping, GridsEh;

resourcestring
  rsDeleteConfirm       = '%s - plug-in silinsinmi?';
  rsUserGrants          = 'Hüquqların idarəolunması (''%s'')';
  rsDeleteConfirmGroup  = '%s qrupu silinsinmi?';

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Pages: TPageControl;
    PluginsSheet: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    PluginsDBGr: TDBGridEh;
    ToolButton1: TToolButton;
    AdmActions: TActionList;
    actShowPluginAdd: TAction;
    admImages: TImageList;
    ToolButton2: TToolButton;
    actShowPluginUpd: TAction;
    UsersSheet: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    actPluginDel: TAction;
    ToolButton4: TToolButton;
    UsersDBGr: TDBGridEh;
    actUserAdd: TAction;
    actUserDel: TAction;
    ToolButton5: TToolButton;
    actUserGrantsForm: TAction;
    ToolButton6: TToolButton;
    GroupsSheet: TTabSheet;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    Splitter1: TSplitter;
    UserInGroupsDBGr: TDBGridEh;
    actGroupAdd: TAction;
    actGroupDel: TAction;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    GroupsDBGr: TDBGridEh;
    ToolButton8: TToolButton;
    actUserAddInGroup: TAction;
    Panel3: TPanel;
    Splitter2: TSplitter;
    GroupUsersDBGr: TDBGridEh;
    CloseButton: TBitBtn;
    actClose: TAction;
    PopupMenu1: TPopupMenu;
    Istifadeciyekreditmutexessisininredakteetmekhuququvermk1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actShowPluginAddExecute(Sender: TObject);
    procedure actShowPluginUpdExecute(Sender: TObject);
    procedure PluginsDBGrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actPluginDelExecute(Sender: TObject);
    procedure actUserAddExecute(Sender: TObject);
    procedure actUserDelExecute(Sender: TObject);
    procedure actUserGrantsFormExecute(Sender: TObject);
    procedure actGroupAddExecute(Sender: TObject);
    procedure actGroupDelExecute(Sender: TObject);
    procedure GroupsDBGrCellClick(Column: TColumnEh);
    procedure UserAddInGroupClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure Istifadeciyekreditmutexessisininredakteetmekhuququvermk1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses admDataModule, admPluginAddImpl, admPluginUpdImpl, admUsersAddImplpas,
  admUsersDelImplpas, admUserGrantsImpl, admGroupAddImpl, admGroupUsersImpl,
  admexpertimpl,SBTranslateProc, sboapiDataModuleImpl, LogReportImpl;

{$R *.DFM}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Pages.ActivePageIndex := 0;
  admDM := TadmDM.Create(Self);
  frmPluginAdd := TfrmPluginAdd.Create(Self);
  frmUpdPlugin := TfrmUpdPlugin.Create(Self);
  frmUsersAdd := TfrmUsersAdd.Create(Self);
  frmUsersDel := TfrmUsersDel.Create(Self);
  frmUserGrants := TfrmUserGrants.Create(Self);
  frmGroupAdd := TfrmGroupAdd.Create(Self);
  frmGroupUsers := TfrmGroupUsers.Create(Self);
  ExpertDel := TExpertDel.Create(Self);
// FrmLogReport:=TFrmLogReport.Create(Self);
    SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfrmMain.actShowPluginAddExecute(Sender: TObject);
begin
  with frmPluginAdd do begin
    cbBPLS.ItemIndex := -1;
    edParamName.Text := '';
    edDescription.Text := '';
    ShowModal;
  end;
end;

procedure TfrmMain.actShowPluginUpdExecute(Sender: TObject);
begin
  with admDM, frmUpdPlugin do begin
    PluginID := PluginsDataSetID.AsInteger;
    cbBPLS.ItemIndex := cbBPLS.Items.IndexOf(
                        PluginsDataSetPLUGINNAME.AsString);
    edParamName.Text := PluginsDataSetPARAMNAME.AsString;
    edDescription.Text := PluginsDataSetDESCRIPTION.AsString;
    cbPluginType.KeyValue := PluginsDataSetTYPEID.AsVariant;
    ShowModal;
  end;
end;

procedure TfrmMain.PluginsDBGrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_RETURN) and (Shift = [])) then
    actShowPluginUpdExecute(Sender);
end;

procedure TfrmMain.actPluginDelExecute(Sender: TObject);
var
  msgres: Integer;
begin
  with admDM do begin
    msgres := MessageDlg(Format(rsDeleteConfirm, [PluginsDataSetDescription.AsString]),
                         mtConfirmation,
                         [mbYes, mbNo],
                         0
                         );
    if msgres = IDYES then begin
      CM_ADMIN.CallProcedure('deleteplugin', [PluginsDataSetID.AsInteger]);
      RefreshDataSet(PluginsDataSet);
    end;
  end;
end;

procedure TfrmMain.actUserAddExecute(Sender: TObject);
begin
  with admDM, frmUsersAdd do begin
    RefreshDataSet(SmartUsersDataSet);
    lOtherUsers.RefreshList;
    ShowModal;
  end;
end;

procedure TfrmMain.actUserDelExecute(Sender: TObject);
begin
  with admDM, frmUsersDel do begin
    RefreshDataSet(CredUsersDataSet);
    lCredUsers.RefreshList;
    ShowModal;
  end;
end;

procedure TfrmMain.actUserGrantsFormExecute(Sender: TObject);
begin
  with admDM, frmUserGrants do begin
    OtherGrantsDataSet.SetVariable('usid', CredUsersDataSetSYSTEMID.AsInteger);
    UserGrantsDataSet.SetVariable('usid', CredUsersDataSetSYSTEMID.AsInteger);
    RefreshDataSet(OtherGrantsDataSet);
    RefreshDataSet(UserGrantsDataSet);
    lOtherGrants.Open;
    lUserGrants.Open;
    Caption := Format(rsUserGrants, [CredUsersDataSetNAME.AsString]);
    cbFullControl.Checked := UserTypeDataSetTYPEID.AsInteger = 1;
    ShowModal;
  end;
end;

procedure TfrmMain.actGroupAddExecute(Sender: TObject);
begin
  with frmGroupAdd do begin
    edGroupName.Text := '';
    edDescription.Text := '';
    cbGroupType.KeyValue := 0;
    ShowModal;
  end;
end;

procedure TfrmMain.actGroupDelExecute(Sender: TObject);
var
  msgres : Integer;
begin
  with admDM do begin
    msgres := MessageDlg(Format(rsDeleteConfirmGroup,
                               [GroupsDataSetName.AsString])
                         ,mtConfirmation, [mbYes, mbNo], -1);
    if msgres = IDYES then begin
      CM_ADMIN.CallProcedure('grmdelgroup', [GroupsDataSetID.AsVariant]);
      RefreshDataSet(GroupsDataSet);
    end;
  end;
end;

procedure TfrmMain.GroupsDBGrCellClick(Column: TColumnEh);
begin
  with admDM do begin
    //GroupUsersDataSet.SetVariable('grid', GroupsDataSetID.AsInteger);
    //RefreshDataSet(GroupUsersDataSet);
  end;
end;

procedure TfrmMain.UserAddInGroupClick(Sender: TObject);
var
  i: Integer;
begin
  with admDM, frmGroupUsers, GroupUsersGrid do begin
  
    RefreshDataSet(GrMasterUsers);
    RefreshDataSet(GrSlaveUsers);
    RefreshDataSet(GrNeutralUsers);
    
    GrMasterUsers.FindFirst;
    GrSlaveUsers.FindFirst;
    GrNeutralUsers.FindFirst;

    for i:=0 to RowCount-1 do begin
      Cells[0, i] := EmptyStr;
      Cells[1, i] := EmptyStr;
      Cells[2, i] := EmptyStr;
    end;

    i := 0;
    while not GrMasterUsers.Eof do begin
      if RowCount < i+1 then RowCount := RowCount + 1;
      Cells[0, i] := GrMasterUsersNAME.AsString;
      inc(i);
      GrMasterUsers.Next;
    end;

    i := 0;
    while not GrSlaveUsers.Eof do begin
      if RowCount < i+1 then RowCount := RowCount + 1;
      Cells[1, i] := GrSlaveUsersNAME.AsString;
      inc(i);
      GrSlaveUsers.Next;
    end;

    i := 0;
    while not GrNeutralUsers.Eof do begin
      if RowCount < i+1 then RowCount := RowCount + 1;
      Cells[2, i] := GrNeutralUsersNAME.AsString;
      inc(i);
      GrNeutralUsers.Next;
    end;

    ReinitializeRows(GroupUsersGrid);

    ShowModal;
  end;
end;

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Istifadeciyekreditmutexessisininredakteetmekhuququvermk1Click(
  Sender: TObject);
begin
with   admDM,ExpertDel do begin
   AdditionDSet.SetVariable('usid', admDM.CredUsersDataSetSYSTEMID.AsInteger);
   AdditionSrcGRDSet.SetVariable('usid', admDM.CredUsersDataSetSYSTEMID.AsInteger);
    RefreshDataSet(AdditionDSet);
    RefreshDataSet(AdditionSrcGRDSet);
    lAdditionGrants.Open;
    AUserGrants.Open;
ExpertDel.showmodal;

end;
end;
end.
