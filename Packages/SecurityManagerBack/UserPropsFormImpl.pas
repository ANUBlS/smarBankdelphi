unit UserPropsFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, ExtCtrls, DBCtrls, ToolWin, ComCtrls, Grids, DBGrids, Db,
  ActnList, OracleData, Mask, CustomInst, IniSource, TreeViewIni, HintBox,
  DBCGrids;

type
  TViewMode = (vmEdit, vmNew);
  TUserPropsForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DialogPages: TPageControl;
    PropsPage: TTabSheet;
    UserNameEdit: TEdit;
    Label3: TLabel;
    GroupsPage: TTabSheet;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    Groups: TDataSource;
    SummaryPage: TTabSheet;
    SummaryMemo: TMemo;
    Label4: TLabel;
    Panel2: TPanel;
    ActionList1: TActionList;
    DlgBack: TAction;
    DlgNext: TAction;
    DlgCancel: TAction;
    DlgFinish: TAction;
    BackButton: TButton;
    NextButton: TButton;
    CancelButton: TButton;
    FinishButton: TButton;
    ProgressPage: TTabSheet;
    GroupsData: TOracleDataSet;
    GroupsDataID: TFloatField;
    GroupsDataNAME: TStringField;
    GroupsDataCREATE_DATE: TDateTimeField;
    GroupsDataCREATED_BY_USER: TFloatField;
    GroupsDataFLAGS: TFloatField;
    Bevel1: TBevel;
    PasswordEdit: TMaskEdit;
    RetryPasswordEdit: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    IniSource1: TIniSource;
    HintBox: THintBox;
    GroupsGrid: TDBCtrlGrid;
    HeaderControl1: THeaderControl;
    DBCheckBox1: TDBCheckBox;
    GroupNameText: TDBText;
    GroupsDataMEMBER: TFloatField;
    UserPropsData: TOracleDataSet;
    DescriptionEdit: TEdit;
    Label7: TLabel;
    GroupHintBox: THintBox;
    DBCtrlGrid1: TDBCtrlGrid;
    AccessNameText: TDBText;
    AccessData: TOracleDataSet;
    Access: TDataSource;
    DBCheckBox2: TDBCheckBox;
    HeaderControl2: THeaderControl;
    AccessDataID: TFloatField;
    AccessDataNAME: TStringField;
    AccessDataDESCRIPTION: TStringField;
    AccessDataPARENTID: TFloatField;
    AccessDataASSIGNED: TFloatField;
    procedure DlgBackUpdate(Sender: TObject);
    procedure DlgNextExecute(Sender: TObject);
    procedure DlgNextUpdate(Sender: TObject);
    procedure DlgBackExecute(Sender: TObject);
    procedure DlgFinishUpdate(Sender: TObject);
    procedure SummaryPageShow(Sender: TObject);
    procedure DlgFinishExecute(Sender: TObject);
    procedure DlgCancelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UserNameEditChange(Sender: TObject);
    procedure GroupsDataAfterScroll(DataSet: TDataSet);
    procedure SummaryMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GroupsGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure PasswordEditChange(Sender: TObject);
    procedure GroupsDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure GroupsDataAfterEdit(DataSet: TDataSet);
    procedure AccessDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure AccessDataAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    FCommited: Boolean;
    FModified: Boolean;
    FViewMode: TViewMode;
    FPasswordModified: Boolean;
    FGroupsModified: Boolean;
    FRightsModified: Boolean;
    function GetGroupIDs: String;
    function GetPassword: String;
    function GetDescription: String;
    function GetUserName: String;
    procedure CheckPropsPage;
    procedure CheckGroupsPage;
    function GetRightsIDs: String;
  public
    { Public declarations }
    function Execute(Mode: TViewMode; UserID: Integer): Boolean;
    property Commited: Boolean read FCommited;
    property PasswordModified: Boolean read FPasswordModified;
    property Password: String read GetPassword;
    property GroupIDs: String read GetGroupIDs;
    property GroupsModified: Boolean read FGroupsModified;
    property Description: String read GetDescription;
    property UserName: String read GetUserName;
    property RightsIDs: String read GetRightsIDs;
    property RightsModified: Boolean read FRightsModified;
  end;

var
  UserPropsForm: TUserPropsForm;

implementation

uses sboapiDataModuleImpl, SecurityManagerFormImpl;

{$R *.DFM}

function TUserPropsForm.Execute(Mode: TViewMode; UserID: Integer): Boolean;
begin
  FCommited := False;
  FModified := False;
  FViewMode := Mode;
  FGroupsModified := False;
  FRightsModified := False;

  case Mode of
  vmEdit:
    begin
      PasswordEdit.Text := 'SomePass';
      RetryPasswordEdit.Text := PasswordEdit.Text;
      FPasswordModified := False;

      with UserPropsData do
      begin
        Close;
        SetVariable('UserID', UserID);
        Open;
        UserNameEdit.Text := FieldByName('Name').AsString;
        DescriptionEdit.Text := FieldByName('Description').AsString;
        Close;
      end;

    end;
  vmNew:
    UserID := -1;
  end;

  with GroupsData do
  begin
    Close;
    SetVariable('UserID', UserID);
    Open;
  end;

  with AccessData do
  begin
    Close;
    SetVariable('ClientID', UserID);
    Open;
  end;

  ShowModal;
  Result := FCommited;
end;

procedure TUserPropsForm.DlgBackUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := DialogPages.ActivePageIndex > 0;
end;

procedure TUserPropsForm.DlgNextExecute(Sender: TObject);
begin
  with DialogPages do
  begin
    case ActivePageIndex of
      0: CheckPropsPage;
      1: CheckGroupsPage;
    end;
    ActivePageIndex := ActivePageIndex + 1;
  end;
end;

procedure TUserPropsForm.DlgNextUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := DialogPages.ActivePageIndex < 3;
end;

procedure TUserPropsForm.DlgBackExecute(Sender: TObject);
begin
  with DialogPages do
    ActivePageIndex := ActivePageIndex - 1;
end;

procedure TUserPropsForm.DlgFinishUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := (FViewMode = vmEdit) or (DialogPages.ActivePageIndex = 3);
end;

procedure TUserPropsForm.SummaryPageShow(Sender: TObject);
  function GroupList: String;
    procedure AddGroup(const NewGroup: String);
    begin
      Result := Result + ', ' + NewGroup;
    end;
  begin
    Result := '';

    with GroupsData do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('Member').AsInteger = 1 then
          AddGroup(FieldByName('Name').AsString);
        Next;
      end;
    end;

    Delete(Result, 1, 2);
  end;
begin
  with SummaryMemo.Lines do
  begin
    Clear;
    Add(Format('User: %s', [UserNameEdit.Text]));
    Add(Format('Groups: %s', [GroupList]));
    Add('If you want commit press "Finish"');
    Add('If not press "Cancel"');
  end;
end;

procedure TUserPropsForm.DlgFinishExecute(Sender: TObject);
begin
  FCommited := True;
  Close;
end;

procedure TUserPropsForm.DlgCancelExecute(Sender: TObject);
begin
  FCommited := False;
  Close;
end;

procedure TUserPropsForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {$B-}
  CanClose := (not FModified) or (FCommited) or (MessageDlg('Диалог баглансынмы?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes);
  {$B+}
end;

procedure TUserPropsForm.UserNameEditChange(Sender: TObject);
begin
  FModified := True;
end;

procedure TUserPropsForm.GroupsDataAfterScroll(DataSet: TDataSet);
begin
{  if GroupsGrid.SelectedRows.Count = 0 then
    GroupsGrid.SelectedRows.CurrentRowSelected := True;}
end;

procedure TUserPropsForm.SummaryMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    DlgFinish.Execute;
end;

procedure TUserPropsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TUserPropsForm.CheckPropsPage;
var
  Passed: Boolean;
begin
  Passed := False;
  if UserNameEdit.Text = '' then
  begin
    HintBox.Control := UserNameEdit;
    HintBox.ShowMessage('Please enter the username');
  end
  else
  if PasswordEdit.Text = '' then
  begin
    HintBox.Control := PasswordEdit;
    HintBox.ShowMessage('Please enter and reenter the password');
  end
  else
  if PasswordEdit.Text <> RetryPasswordEdit.Text then
  begin
    HintBox.Control := RetryPasswordEdit;
    HintBox.ShowMessage('Please reenter the password');
  end
  else
    Passed := True;
  if not Passed then
    Abort;
end;

procedure TUserPropsForm.CheckGroupsPage;
var
  Passed: Boolean;
  LastBookmark: TBookmark;
begin
  Passed := False;
  with GroupsData do
  begin
    LastBookmark := GetBookmark;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if FieldByName('Member').AsInteger <> 0 then
          Passed := True;
        Next;
      end;
    finally
      GotoBookmark(LastBookmark);
      FreeBookmark(LastBookmark);
      EnableControls;
    end;
  end;
  if not Passed then
  begin
    GroupHintBox.ShowMessage('Please check at least one group');
    Abort;
  end;
end;

procedure TUserPropsForm.GroupsGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = DBCtrlGrid.PanelIndex then
    GroupNameText.Font.Color := clWhite
  else
    GroupNameText.Font.Color := clBlack;
end;

procedure TUserPropsForm.PasswordEditChange(Sender: TObject);
begin
  FPasswordModified := True;
end;

function TUserPropsForm.GetPassword: String;
begin
  Result := PasswordEdit.Text;
end;

function TUserPropsForm.GetGroupIDs: String;
begin
  Result := '';
  with GroupsData do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('Member').AsInteger <> 0 then
        Result := Result + ', ' + FieldByName('ID').AsString;
      Next;
    end;
  end;
  System.Delete(Result, 1, 2);
end;

procedure TUserPropsForm.GroupsDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TUserPropsForm.GroupsDataAfterEdit(DataSet: TDataSet);
begin
  FGroupsModified := True;
end;

function TUserPropsForm.GetDescription: String;
begin
  Result := DescriptionEdit.Text;
end;

function TUserPropsForm.GetUserName: String;
begin
  Result := UserNameEdit.Text;
end;

procedure TUserPropsForm.AccessDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TUserPropsForm.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = DBCtrlGrid.PanelIndex then
    AccessNameText.Font.Color := clWhite
  else
    AccessNameText.Font.Color := clBlack;
end;

function TUserPropsForm.GetRightsIDs: String;
var
  LastBookmark: TBookmark;
begin
  Result := '';
  with AccessData do
  begin
    DisableControls;
    LastBookmark := GetBookmark;
    try
      First;
      while not Eof do
      begin
        if FieldByName('Assigned').AsInteger = 1 then
          Result := Result + ',' + FieldByName('ID').AsString;
        Next;
      end;
    finally
      GotoBookmark(LastBookmark);
      EnableControls;
      FreeBookmark(LastBookmark);
    end;
  end;
  System.Delete(Result, 1, 1);
end;

procedure TUserPropsForm.AccessDataAfterEdit(DataSet: TDataSet);
begin
  FRightsModified := True;

end;

end.
