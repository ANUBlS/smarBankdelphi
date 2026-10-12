unit GroupPropsFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, HintBox, Db, OracleData, DBCtrls, ComCtrls, DBCGrids;

type
  TGroupViewMode = (gvmEdit, gvmNew);
  TGroupPropsForm = class(TForm)
    TitlePanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    AddButton: TButton;
    CancelButton: TButton;
    Roles: TDataSource;
    RolesData: TOracleDataSet;
    RolesDataID: TFloatField;
    RolesDataNAME: TStringField;
    RolesDataMEMBER: TFloatField;
    GroupPropertiesData: TOracleDataSet;
    GroupPropertiesDataID: TFloatField;
    GroupPropertiesDataNAME: TStringField;
    GroupPropertiesDataFLAGS: TFloatField;
    GroupPropertiesDataDESCRIPTION: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    DBCtrlGrid1: TDBCtrlGrid;
    RoleNameText: TDBText;
    DBCheckBox1: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupNameEdit: TEdit;
    DescriptionEdit: TEdit;
    HintBox: THintBox;
    GroupBox3: TGroupBox;
    DBCtrlGrid2: TDBCtrlGrid;
    AccessNameText: TDBText;
    DBCheckBox2: TDBCheckBox;
    HeaderControl2: THeaderControl;
    Access: TDataSource;
    AccessData: TOracleDataSet;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    MembershipCtrlGrid: TDBCtrlGrid;
    GroupNameText: TDBText;
    DBCheckBox3: TDBCheckBox;
    HeaderControl3: THeaderControl;
    MembershipData: TOracleDataSet;
    Membership: TDataSource;
    MembershipDataID: TFloatField;
    MembershipDataNAME: TStringField;
    MembershipDataCREATE_DATE: TDateTimeField;
    MembershipDataCREATED_BY_USER: TFloatField;
    MembershipDataFLAGS: TFloatField;
    MembershipDataMEMBER: TFloatField;
    procedure AddButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure RolesDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AccessDataApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure AccessDataAfterEdit(DataSet: TDataSet);
    procedure MembershipCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure MembershipDataApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
    FResult: String;
    FCommited: Boolean;
    FViewMode: TGroupViewMode;
    FRightsModified: Boolean;
    function GetRoleIDs: String;
    function GetDescription: String;
    function GetRightsIDs: String;
    function GetGroupIDs: String;
  public
    { Public declarations }
    function Execute(Mode: TGroupViewMode; GroupID: Integer): Boolean;
    property Result: String read FResult;
    property Commited: Boolean read FCommited;
    property ViewMode: TGroupViewMode read FViewMode;
    property RoleIDs: String read GetRoleIDs;
    property GroupIDs: String read GetGroupIDs;
    property Description: String read GetDescription;
    property RightsIDs: String read GetRightsIDs;
    property RightsModified: Boolean read FRightsModified;
  end;

var
  GroupPropsForm: TGroupPropsForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

function TGroupPropsForm.Execute(Mode: TGroupViewMode; GroupID: Integer): Boolean;
begin
  FCommited := False;
  FViewMode := Mode;
  FRightsModified := False;

  case Mode of
  gvmEdit:
    begin
      with GroupPropertiesData do
      begin
        Close;
        SetVariable('GroupID', GroupID);
        Open;
        with GroupNameEdit do
        begin
          Text := FieldByName('Name').AsString;
          SelectAll;
        end;
        DescriptionEdit.Text := FieldByName('Description').AsString;
      end;
      Caption := 'Change group parameters';
    end;
  gvmNew:
    begin
      GroupID := -1;
      Caption := 'Create new group';
    end;
  end;

  with MembershipData do
  begin
    Close;
    SetVariable('ClientID', GroupID);
    Open;
  end;

  with RolesData do
  begin
    Close;
    SetVariable('GroupID', GroupID);
    Open;
  end;

  with AccessData do
  begin
    Close;
    SetVariable('ClientID', GroupID);
    Open;
  end;

  ShowModal;
  Result := Commited;
end;

procedure TGroupPropsForm.AddButtonClick(Sender: TObject);
begin
  if GroupNameEdit.Text = '' then
    HintBox.ShowMessage('Группун адыны дахил един йа да "Имтина" дцймясини басын')
  else
  begin
    FCommited := True;
    FResult := GroupNameEdit.Text;
    Close;
  end;
end;

procedure TGroupPropsForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TGroupPropsForm.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = DBCtrlGrid.PanelIndex then
    RoleNameText.Font.Color := clWhite
  else
    RoleNameText.Font.Color := clBlack;
end;

procedure TGroupPropsForm.RolesDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

function TGroupPropsForm.GetRoleIDs: String;
begin
  Result := '';
  with RolesData do
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

function TGroupPropsForm.GetDescription: String;
begin
  Result := DescriptionEdit.Text;
end;

function TGroupPropsForm.GetRightsIDs: String;
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

function TGroupPropsForm.GetGroupIDs: String;
var
  LastBookmark: TBookmark;
begin
  Result := '';
  with MembershipData do
  begin
    DisableControls;
    LastBookmark := GetBookmark;
    try
      First;
      while not Eof do
      begin
        if FieldByName('Member').AsInteger = 1 then
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

procedure TGroupPropsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_ESCAPE) then
    Close;
end;

procedure TGroupPropsForm.AccessDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

procedure TGroupPropsForm.DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = DBCtrlGrid.PanelIndex then
    AccessNameText.Font.Color := clWhite
  else
    AccessNameText.Font.Color := clBlack;
end;

procedure TGroupPropsForm.AccessDataAfterEdit(DataSet: TDataSet);
begin
  FRightsModified := True;
end;

procedure TGroupPropsForm.MembershipCtrlGridPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = MembershipCtrlGrid.PanelIndex then
    GroupNameText.Font.Color := clWhite
  else
    GroupNameText.Font.Color := clBlack;
end;

procedure TGroupPropsForm.MembershipDataApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
begin
  Applied := True;
end;

end.
