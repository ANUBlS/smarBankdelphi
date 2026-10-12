unit SecurityManagerFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ActiveX, AxCtrls, UserManager_TLB, StdVcl, ComCtrls, TreeViewIni,
  PluginTreeView, CustomInst, IniSource, ImgList, ExtCtrls, ActnList, Menus,
  Grids, DBGrids, Db, OracleData, StdCtrls, CheckLst, ToolWin, ShellApi,
  SBSecurityBrowser, Dialogs, LDialogs;

type
  TSecurityManagerForm = class(TActiveForm, ISecurityManagerForm)
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    ViewSource: TDataSource;
    GroupsDataSet: TOracleDataSet;
    UsersDataSet: TOracleDataSet;
    GroupsDataSetID: TFloatField;
    GroupsDataSetNAME: TStringField;
    GroupsDataSetCREATE_DATE: TDateTimeField;
    GroupsDataSetCREATED_BY_USER: TFloatField;
    GroupsDataSetFLAGS: TFloatField;
    UsersDataSetID: TFloatField;
    UsersDataSetSYSID: TFloatField;
    UsersDataSetGROUP: TFloatField;
    UsersDataSetGROUP_NAME: TStringField;
    UsersDataSetFLAGS: TFloatField;
    UsersDataSetNAME: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    ViewStatusBar: TStatusBar;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Tree: TTreeView;
    ActionList1: TActionList;
    ListItemAdd: TAction;
    ListItemEdit: TAction;
    ListItemDelete: TAction;
    GroupAdd: TAction;
    GroupEdit: TAction;
    GroupDelete: TAction;
    UserAdd: TAction;
    UserEdit: TAction;
    UserDelete: TAction;
    ListItemAdd1: TMenuItem;
    ListItemEdit1: TMenuItem;
    GroupDelete1: TMenuItem;
    RefreshAction: TAction;
    UserSeparator: TMenuItem;
    SetPassword: TAction;
    SetPassword1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel3: TPanel;
    ViewGrid: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    GroupsDataSetDESCRIPTION: TStringField;
    UsersDataSetDESCRIPTION: TStringField;
    UsersDataSetSID: TFloatField;
    GroupsDataSetSID: TFloatField;
    EditIniSource: TAction;
    ToolButton6: TToolButton;
    OracleDataSet1: TOracleDataSet;
    ModulesDataSet: TOracleDataSet;
    ModulesDataSetID: TFloatField;
    ModulesDataSetDESCRIPTION: TStringField;
    ModulesDataSetSID: TFloatField;
    ModuleAdd: TAction;
    ModuleDrop: TAction;
    ModuleSetAccess: TAction;
    ToolButton7: TToolButton;
    SBSecurityBrowser1: TSBSecurityBrowser;
    UsersDataSetPassword: TStringField;
    UsersDataSetGroupIDs: TStringField;
    UsersDataSetRightIDs: TStringField;
    UserReCreateRepository: TAction;
    UserReCreateRepository1: TMenuItem;
    ToolButton8: TToolButton;
    ModulesDataSetNAME: TStringField;
    ModuleEdit: TAction;
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure GroupsDataSetApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure ListItemAddExecute(Sender: TObject);
    procedure GroupAddExecute(Sender: TObject);
    procedure ListItemEditExecute(Sender: TObject);
    procedure GroupEditExecute(Sender: TObject);
    procedure ViewGridDblClick(Sender: TObject);
    procedure ListItemDeleteExecute(Sender: TObject);
    procedure GroupDeleteExecute(Sender: TObject);
    procedure UserAddExecute(Sender: TObject);
    procedure UsersDataSetApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure UserDeleteExecute(Sender: TObject);
    procedure UserEditExecute(Sender: TObject);
    procedure ListItemAddUpdate(Sender: TObject);
    procedure ListItemEditUpdate(Sender: TObject);
    procedure ListItemDeleteUpdate(Sender: TObject);
    procedure SetPasswordUpdate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SetPasswordExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure RefreshActionUpdate(Sender: TObject);
    procedure EditIniSourceExecute(Sender: TObject);
    procedure EditIniSourceUpdate(Sender: TObject);
    procedure ModuleAddExecute(Sender: TObject);
    procedure ModuleDropExecute(Sender: TObject);
    procedure ModulesDataSetAfterOpen(DataSet: TDataSet);
    procedure ModulesDataSetBeforeOpen(DataSet: TDataSet);
    procedure ModuleSetAccessUpdate(Sender: TObject);
    procedure ModuleSetAccessExecute(Sender: TObject);
    procedure UserReCreateRepositoryUpdate(Sender: TObject);
    procedure UserReCreateRepositoryExecute(Sender: TObject);
    procedure ModuleEditExecute(Sender: TObject);
  private
    { Private declarations }
    FEvents: ISecurityManagerFormEvents;
    FCurrentPassword: String;
    FSavedID: Integer;
    procedure RefreshDataset(Dataset: TDataset);
    procedure ListItemActionUpdate(Action: TAction);
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
    { TODO: Change all instances of type [IUserManagerFormImplEvents] to [IUserManagerFormEvents].}
 { Delphi was not able to update this file to reflect
   The change of the name of your event interface
   because of the presence of instance variables. 
   The type library was updated but you must update 
   this implementation file by hand. }
  { TODO: Change all instances of type [IUserManagerFormEvents] to [ISecurityManagerFormEvents].}
 { Delphi was not able to update this file to reflect
   The change of the name of your event interface
   because of the presence of instance variables.
   The type library was updated but you must update
   this implementation file by hand. }
end;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl, SBSecurity, SBCore,
  GroupPropsFormImpl, UserPropsFormImpl, Unit1,
  InstallationTaskManagerPageImpl, PasswordInputDialogImpl,
  ModulePropsForm_Unit, SecurityBrowserImpl;

{$R *.DFM}

{ TSecurityManagerFormImpl }

procedure TSecurityManagerForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  DefinePropertyPage(Class_InstallationTaskManagerPage);
end;

procedure TSecurityManagerForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISecurityManagerFormEvents;
end;

procedure TSecurityManagerForm.Initialize;
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

function TSecurityManagerForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSecurityManagerForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSecurityManagerForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSecurityManagerForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSecurityManagerForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSecurityManagerForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSecurityManagerForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSecurityManagerForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSecurityManagerForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSecurityManagerForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSecurityManagerForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSecurityManagerForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSecurityManagerForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSecurityManagerForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSecurityManagerForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSecurityManagerForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSecurityManagerForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSecurityManagerForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSecurityManagerForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSecurityManagerForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSecurityManagerForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSecurityManagerForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSecurityManagerForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSecurityManagerForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSecurityManagerForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSecurityManagerForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSecurityManagerForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSecurityManagerForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSecurityManagerForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSecurityManagerForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSecurityManagerForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSecurityManagerForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSecurityManagerForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSecurityManagerForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSecurityManagerForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSecurityManagerForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSecurityManagerForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSecurityManagerForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSecurityManagerForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSecurityManagerForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSecurityManagerForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSecurityManagerForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSecurityManagerForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TSecurityManagerForm.TreeChange(Sender: TObject;
  Node: TTreeNode);

  procedure ConfView(Dataset: TDataset; const FmtMsg: String);
  begin
    ViewSource.Dataset := Dataset;
    ViewGrid.Visible := Dataset <> nil;
    if ViewGrid.Visible then
      ViewStatusBar.Panels[0].Text :=
        Format(FmtMsg, [Dataset.RecordCount])
    else
      ViewStatusBar.Panels[0].Text := '';
  end;

begin
  Case Node.AbsoluteIndex of
    0: ConfView(nil, '');
    1: ConfView(GroupsDataSet, 'Groups: %d objects');
    2: ConfView(UsersDataSet, 'Users: %d objects');
    3: ConfView(nil, '');
    4: ConfView(ModulesDataSet, 'Modules: %d objects');
  end;
  UpdateActions;
end;

procedure TSecurityManagerForm.ListItemAddExecute(Sender: TObject);
begin
  case Tree.Selected.AbsoluteIndex of
    1: GroupAdd.Execute;
    2: UserAdd.Execute;
    4: ModuleAdd.Execute;
  end;
end;

procedure TSecurityManagerForm.ListItemEditExecute(Sender: TObject);
begin
  case Tree.Selected.AbsoluteIndex of
    1: GroupEdit.Execute;
    2: UserEdit.Execute;
    4: ModuleEdit.Execute;
  end;
end;

procedure TSecurityManagerForm.ViewGridDblClick(Sender: TObject);
begin
  ListItemEdit.Execute;
end;

procedure TSecurityManagerForm.ListItemDeleteExecute(Sender: TObject);
begin
  case Tree.Selected.AbsoluteIndex of
    1: GroupDelete.Execute;
    2: UserDelete.Execute;
    4: ModuleDrop.Execute;
  end;
end;

procedure TSecurityManagerForm.ListItemActionUpdate(Action: TAction);
begin
  with Action do
  {$B-}
    Enabled := (Tree.Selected <> nil) and (Byte(Tree.Selected.AbsoluteIndex) in [1,2,4])
  {B+}
end;

procedure TSecurityManagerForm.ListItemAddUpdate(Sender: TObject);
begin
  ListItemActionUpdate(Sender as TAction);
  with Sender as TAction do
    if Tree.Selected.AbsoluteIndex = 1 then
      Caption := GroupAdd.Caption
    else
    if Tree.Selected.AbsoluteIndex = 2 then
      Caption := UserAdd.Caption
    else
      Caption := ModuleAdd.Caption;
end;

procedure TSecurityManagerForm.ListItemEditUpdate(Sender: TObject);
begin
  ListItemActionUpdate(Sender as TAction);
  with Sender as TAction do
    if Tree.Selected.AbsoluteIndex = 1 then
      Caption := GroupEdit.Caption
    else
    if Tree.Selected.AbsoluteIndex = 2 then
      Caption := UserEdit.Caption
    else
    if Tree.Selected.AbsoluteIndex = 4 then
      Caption := ModuleEdit.Caption;
end;

procedure TSecurityManagerForm.ListItemDeleteUpdate(Sender: TObject);
begin
  ListItemActionUpdate(Sender as TAction);
  with Sender as TAction do
    if Tree.Selected.AbsoluteIndex = 1 then
      Caption := GroupDelete.Caption
    else
    if Tree.Selected.AbsoluteIndex = 2 then
      Caption := UserDelete.Caption;
end;

procedure TSecurityManagerForm.PopupMenu1Popup(Sender: TObject);
begin
end;

  { user management handlers }

procedure TSecurityManagerForm.UserAddExecute(Sender: TObject);
var
  NewUserID: Integer;
begin
  with UsersDataSet, TUserPropsForm.Create(Self) do
  try
    if Execute(vmNew, -1) then
    begin
      Insert;
      FieldByName('Name').AsString := UserName;
      FieldByName('Description').AsString := Description;
      FieldByName('Password').AsString := Password;
      FieldByName('GroupIDs').AsString := GroupIDs;
      FieldByName('RightIDs').AsString := RightsIDs;
      FieldByName('FilialID').AsInteger :=DBLCBfilial.KeyValue; //Amt
      FCurrentPassword := PasswordEdit.Text;
      Post;
      NewUserID := FieldByName('ID').AsInteger;
      RefreshDataset(UsersDataSet);
      Locate('ID', NewUserID, []);
{      Sb_UserSetPassword(FieldByName('ID').AsInteger, Password);
      Sb_GroupMembershipArray(FieldByName('ID').AsInteger, GroupIDs);
      Sb_SidRightsArray(FieldByName('SID#').AsInteger, FieldByName('ID').AsInteger, RightsIDs);}
    end;
  finally
    Release;
  end;
  TreeChange(Tree, Tree.Selected);
  Sb_Commit;
end;

procedure TSecurityManagerForm.UserEditExecute(Sender: TObject);
var
  NewUserID: Integer;
begin
  with UsersDataSet, TUserPropsForm.Create(Self) do
  try
    UserNameEdit.Text := FieldByName('Name').AsString;
    dblcbfilial.KeyValue:=FieldByName('FilialID').AsInteger; //Amt
    if Execute(vmEdit, FieldByName('ID').AsInteger) then
    begin
      Edit;
      FieldByName('Name').AsString := UserName;
      FieldByName('Description').AsString := Description;
      FieldByName('FilialID').AsInteger := dblcbfilial.KeyValue;
      Post;

      NewUserID := FieldByName('ID').AsInteger;
      RefreshDataset(UsersDataSet);
      Locate('ID', NewUserID, []);

      if PasswordModified then
        Sb_UserSetPassword(FieldByName('ID').AsInteger, Password);

      if GroupsModified then
        Sb_GroupMembershipArray(FieldByName('ID').AsInteger, GroupIDs);

      if RightsModified then
        Sb_SidRightsArray(FieldByName('SID#').AsInteger, FieldByName('ID').AsInteger, RightsIDs);

    end;
  finally
    Release;
  end;
  Sb_Commit;
end;

procedure TSecurityManagerForm.UserDeleteExecute(Sender: TObject);
begin
  if
    MessageDlg(
      Format(
        'ям€лиййатчы ''%s'' силинсинми?',
        [UsersDataSet.FieldByName('Name').AsString]),
      mtConfirmation,
      [mbYes, mbCancel],
      0) = mrYes
  then
  begin
    UsersDataSet.Delete;
    TreeChange(Tree, Tree.Selected);
  end;
  RefreshDataset(UsersDataSet);
  Sb_Commit;
end;

procedure TSecurityManagerForm.UsersDataSetApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  Applied := True;
  with Sender do
    case Action of
    'I':
      try
        Sender.FieldByName('ID').AsInteger :=
          Sb_AddUser
         (
          FieldByName('Name').AsString,
          FieldByName('Description').AsString,
          0,
          FCurrentPassword, True, True,
          FieldByName('GroupIDs').AsString,
          FieldByName('RightIDs').AsString
          //FieldByName('FilialID').AsInteger // Amt
         );
      except
        Sender.Cancel;
        raise;
      end;
    'U':
      Sb_EditUser
      (
        FieldByName('ID').AsInteger
       ,FieldByName('Name').AsString
       ,FieldByName('Description').AsString
      //,FieldByName('FilialID').AsInteger // Amt
       );
    'D': Sb_DeleteUser(FieldByName('ID').AsInteger);
    'C', 'L':
    else
      Applied := False;
    end;
end;

procedure TSecurityManagerForm.SetPasswordExecute(Sender: TObject);
begin
  with TPasswordInputDialog.Create(Self) do
  try
    if Execute then
      Sb_UserSetPassword(UsersDataSet.FieldByName('ID').AsInteger, Password);
  finally
    Release;
  end;
  Sb_Commit;
end;

procedure TSecurityManagerForm.SetPasswordUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := Tree.Selected.AbsoluteIndex = 2;
  Sb_Commit;
end;

  { group management handlers }

procedure TSecurityManagerForm.GroupAddExecute(Sender: TObject);
var
  NewGroupID: Integer;
begin
  with TGroupPropsForm.Create(Self) do
  try
    if Execute(gvmNew, -1) then
      with GroupsDataSet do
      begin
        Insert;
        FieldByName('NAME').AsString := Result;
        Post;

        NewGroupID := FieldByName('ID').AsInteger;
        Sb_AssignGroupRoles(NewGroupID, RoleIDs);
        Sb_GroupMembershipArray(NewGroupID, GroupIDs);
        
        RefreshDataset(GroupsDataSet);
        Locate('ID', NewGroupID, []);

        Sb_SidRightsArray(FieldByName('SID#').AsInteger, FieldByName('ID').AsInteger, RightsIDs);
        
      end;
  finally
    Release;
  end;
  TreeChange(Tree, Tree.Selected);
  Sb_Commit;
end;

procedure TSecurityManagerForm.GroupEditExecute(Sender: TObject);
begin
  with TGroupPropsForm.Create(Self), GroupsDataSet do
  try
    if Execute(gvmEdit, FieldByName('ID').AsInteger) then
    begin
      Edit;
      FieldByName('NAME').AsString := Result;
      FieldByName('Description').AsString := Description;
      Post;
      Sb_AssignGroupRoles(FieldByName('ID').AsInteger, RoleIDs);
      Sb_GroupMembershipArray(FieldByName('ID').AsInteger, GroupIDs);
      if RightsModified then
        Sb_SidRightsArray(FieldByName('SID#').AsInteger, FieldByName('ID').AsInteger, RightsIDs);
      RefreshDataset(GroupsDataSet);
    end;
  finally
    Release;
  end;
  Sb_Commit;
end;

procedure TSecurityManagerForm.GroupDeleteExecute(Sender: TObject);
begin
  if
    MessageDlg(
      Format(
        'ямалиййатчынын групу ''%s'' силинсинми?',
        [GroupsDataSet.FieldByName('Name').AsString]),
      mtConfirmation,
      [mbYes, mbCancel],
      0) = mrYes
  then
  begin
    GroupsDataSet.Delete;
    RefreshDataset(GroupsDataSet);
    TreeChange(Tree, Tree.Selected);
  end;
  Sb_Commit;
end;

procedure TSecurityManagerForm.GroupsDataSetApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
  Applied := True;
  with Sender do
    case Action of
    'I':
      Sender.FieldByName('ID').AsInteger :=
        Sb_AddGroup(
          FieldByName('NAME').AsString,
          FieldByName('Description').AsString);
    'U': Sb_EditGroup(
      FieldByName('ID').AsInteger,
      FieldByName('NAME').AsString,
      FieldByName('Description').AsString);
    'D': Sb_DeleteGroup(FieldByName('ID').AsInteger);
(*
    'C', 'L':
      begin
        {Lock and check performed in stored procedure}
      end;
*)      
    else
      Applied := False;
    end;
end;

procedure TSecurityManagerForm.RefreshDataset(Dataset: TDataset);
var
  LastRecNo: Integer;
begin
  with DataSet do
//    if RecordCount <> 0 then
    begin
      LastRecNo := RecNo;
      Close;
      Open;
      if LastRecNo > RecordCount then
        Last
      else
        RecNo := LastRecNo;
    end;
end;

procedure TSecurityManagerForm.RefreshActionExecute(Sender: TObject);
begin
  with Sender as TAction do
    case Tree.Selected.AbsoluteIndex of
      1: RefreshDataset(GroupsDataSet);
      2: RefreshDataset(UsersDataSet);
      4: RefreshDataset(ModulesDataSet);
    end;
end;

procedure TSecurityManagerForm.RefreshActionUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := Assigned(Tree.Selected) and (Tree.Selected.AbsoluteIndex in [1, 2, 4]);
end;

procedure TSecurityManagerForm.EditIniSourceExecute(Sender: TObject);
begin
  with sboapiDataModule.SBSession do
    ShellExecute(
      0,
      nil,
      'IniSourceEditor.exe',
      PChar(
        Format(
          'ora:SmartBankIni %s %s',
          [LogonUsername, LogonDatabase])
      ),
      nil,
      SW_SHOWNORMAL);
end;

procedure TSecurityManagerForm.EditIniSourceUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := Assigned(Tree.Selected) and (Tree.Selected.AbsoluteIndex = 1);
end;

procedure TSecurityManagerForm.ModuleAddExecute(Sender: TObject);
begin
  with TModulePropsForm.Create(Self) do
  try
    if View() then
    begin
      Sb_AddModule(ModuleName, Description);
      RefreshAction.Execute;
    end;
  finally
    Release;
  end;
end;

procedure TSecurityManagerForm.ModuleDropExecute(Sender: TObject);
begin
  Sb_DropModule(ModulesDataSet.FieldByName('ID').AsInteger);
  RefreshAction.Execute;
end;

procedure TSecurityManagerForm.ModulesDataSetAfterOpen(DataSet: TDataSet);
begin
  if FSavedID <> 0 then
    DataSet.Locate('ID', FSavedID, []);
end;

procedure TSecurityManagerForm.ModulesDataSetBeforeOpen(DataSet: TDataSet);
begin
  FSavedID := DataSet.FieldByName('ID').AsInteger;
end;

procedure TSecurityManagerForm.ModuleSetAccessUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := Assigned(Tree.Selected) and (Tree.Selected.AbsoluteIndex = 4);
end;

procedure TSecurityManagerForm.ModuleSetAccessExecute(Sender: TObject);
begin
  with TSecurityBrowserForm.Create(Self) do
  try
    View(ModulesDataSet.FieldByName('Sid#').AsInteger, False);
  finally
    Release;
  end;
end;

procedure TSecurityManagerForm.UserReCreateRepositoryUpdate(
  Sender: TObject);
begin
  with Sender as TAction do
    Enabled := Assigned(Tree.Selected) and (Tree.Selected.AbsoluteIndex = 2) and (UsersDataSet.RecordCount > 0);
end;

procedure TSecurityManagerForm.UserReCreateRepositoryExecute(
  Sender: TObject);
begin
  if MessageDlg('Sure to rebuild user''s repository?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Sb_UserReCreateRepository(UsersDataSet.FieldByName('ID').AsInteger);
    MessageDlg('Repository was successfully rebuilt', mtInformation, [mbOk], 0);
  end;
end;

procedure TSecurityManagerForm.ModuleEditExecute(Sender: TObject);
begin
  with TModulePropsForm.Create(Self) do
  try
    NameEdit.Text := ModulesDataSet.FieldByName('Name').AsString;
    DescriptionEdit.Text := ModulesDataSet.FieldByName('Description').AsString;
    if View() then
      RefreshDataset(ModulesDataSet);
  finally
    Release;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSecurityManagerForm,
    Class_SecurityManagerForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
