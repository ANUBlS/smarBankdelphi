unit PluginControlBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, IniSource, PluginSrv, ComCtrls, CustomInst, Menus;

type
  TPluginControlBar = class(TControlBar)
  private
    { Private declarations }
    FIniSource        : TIniSource;
    FPluginManager    : TPluginManager;
    FActions          : TActions;
    FActive           : Boolean;
    FImages           : TImageList;
    procedure SetActive(Value: Boolean);
    procedure SetPluginManager(Value: TPluginManager);
    procedure PluginOpenNotification(Sender, Source: TObject; const EventName: String; const Args: array of const);
  protected
    { Protected declarations }
    procedure AddPluginAction(AAction: TPlgAction); virtual;
    procedure RefreshButtons;
    procedure LoadToolBars;
    procedure LoadButtons;
    procedure AdjustToolbarSize(Toolbar: TToolbar);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    property Actions: TActions read FActions;
    property Images: TImageList read FImages;
  published
    { Published declarations }
    property IniSource: TIniSource read FIniSource write FIniSource;
    property PluginManager: TPluginManager read FPluginManager write SetPluginManager;
    property Active: Boolean read FActive write SetActive;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TPluginControlBar]);
end;

constructor TPluginControlBar.Create(AOwner: TComponent);
begin
  FActions := TActions.Create(TActionCollectionItem);
  FImages := TImageList.Create(nil);
  FImages.Width := 32;
  FImages.Height := 32;
  inherited;
end;

destructor TPluginControlBar.Destroy;
begin
  inherited;
  FActions.Free;
  FImages.Free;
end;

procedure TPluginControlBar.LoadToolBars;
var
  IniSectionName            : String;
  DetailedSectionName       : String;
  i                         : Integer;
begin
  if Assigned(IniSource) then
    if IniSource.Active then
      with IniSource do
      begin
        IniSectionName := Format('%s\Toolbars', [Self.Name]);
        for i:=0 to ReadValue(IniSectionName, 'Count', 0)-1 do
        begin
          DetailedSectionName := Format('%s\Item%d', [IniSectionName, i]);
          with TToolbar.Create(Self) do
          begin
            Parent := Self;
            Name := ReadValue(DetailedSectionName, 'Name', '');
            Caption := ReadValue(DetailedSectionName, 'Caption', '');
            Width := ReadValue(DetailedSectionName, 'Width', 0);
            Height := ReadValue(DetailedSectionName, 'Height', 0);
            Top := ReadValue(DetailedSectionName, 'Top', 0);
            Left := ReadValue(DetailedSectionName, 'Left', 0);
            AutoSize := ReadValue(DetailedSectionName, 'AutoSize', True);
            Images := FImages;
            EdgeBorders := [];
            DragKind := dkDock;
            DragMode := dmAutomatic;
            Transparent := True;
            ShowCaptions := True;
            ParentFont := True;
            Flat := True;
          end;
        end;
      end;
end;

procedure TPluginControlBar.PluginOpenNotification(Sender, Source: TObject; const EventName: String; const Args: array of const);
begin
  {$B-}
  if Source is TPlugin  then
    with Source as TPlugin do
      if (Manager = PluginManager) and (High(args) >= 0) then
        if (args[0].VType = vtObject) and (args[0].VObject is TPlgAction) then
          AddPluginAction(TPlgAction(args[0].VObject));
  {$B+}
end;

procedure TPluginControlBar.SetPluginManager(Value: TPluginManager);
begin
{  if Assigned(PluginManager) then
    GlobalEventManager.DropEventNotification(Event_AfterPluginActionAdd, nil, PluginOpenNotification);}
  FPluginManager := Value;
{  if Assigned(PluginManager) then
    GlobalEventManager.AddEventNotification(Event_AfterPluginActionAdd, nil, PluginOpenNotification);}
end;

procedure TPluginControlBar.AddPluginAction(AAction: TPlgAction);
begin
  with Actions.Add do
    Assign(AAction);
  if AAction.ImageIndex <> -1 then
  begin
    AAction.ImageIndex := Images.Add(AAction.Picture.Bitmap, nil);
    AAction.ActionList.Images := FImages;
  end;
end;

procedure TPluginControlBar.RefreshButtons;
var
  i           : Integer;
  AComponent  : TComponent;
begin
  i := 0;
  while i<ComponentCount do
    if Components[i] is TToolBar then
    begin
      AComponent := Components[i];
      RemoveComponent(AComponent);
      AComponent.Free;
    end
    else
      inc(i);
  FImages.Clear;
  LoadToolBars;
  LoadButtons;
end;

procedure TPluginControlBar.LoadButtons;

  function GetParentToolbar(AAction: TPlgAction): TToolBar;
  var
    i       : Integer;
  begin
    for i:=0 to ComponentCount-1 do
      if Components[i] is TToolBar then
      begin
        Result := Components[i] as TToolBar;
        with Result do
          if Caption = AAction.Category then
            exit;
      end;
    Result := nil;
  end;

  function FindButton(Toolbar: TToolbar; TargetAction: TPlgAction): Integer;
  begin
    with ToolBar do
      for Result:=0 to ButtonCount-1 do
        with Buttons[Result].Action as TPlgAction do
          if (Category = TargetAction.Category) and (Caption = TargetAction.Caption) then
            exit;
    Result := -1;
  end;

var
  IniSectionName            : String;
  DetailedSectionName       : String;

  function PushAction(const ActionName: String): TToolButton;
  var
    TargetAction        : TPlgAction;
    Toolbar             : TToolbar;
  begin
    TargetAction := Actions.ActionByName(ActionName);
    Toolbar := GetParentToolbar(TargetAction);
    Result := TToolButton.Create(Toolbar);
    with Result do
    begin
      Action := TargetAction;
      Parent := Toolbar;
      if not TargetAction.Picture.Bitmap.Empty{ImageIndex <> -1} then
        ImageIndex := FImages.AddMasked(TargetAction.Picture.Bitmap, clWhite);
    end;
    Caption := IniSource.ReadValue(DetailedSectionName, 'Caption', '<no data>');
    AdjustToolbarSize(Toolbar);
  end;

  procedure PushDropDownAction(RootButton: TToolButton; const ActionName: String);
  var
    ActionItem        : TMenuItem;
    TargetAction      : TPlgAction;
    RootAction        : TPlgAction;
  begin
    with RootButton do
    begin
      if MenuItem = nil then
      begin
        RootAction := Action as TPlgAction;
        MenuItem := TMenuItem.Create(RootButton);
        ActionItem := TMenuItem.Create(RootButton);
        ActionItem.Action := RootAction;
        Action := nil;
        OnClick := nil;
        MenuItem.Insert(0, ActionItem);
      end;

      TargetAction := Actions.ActionByName(ActionName);
      ActionItem := TMenuItem.Create(RootButton);
      ActionItem.Action := TargetAction;
      MenuItem.Insert(0, ActionItem);

      Caption := IniSource.ReadValue(DetailedSectionName, 'Caption', '<no data>');
    end
  end;

var
  i                         : Integer;
  Button                    : TToolButton;
  ActionNameList            : TStringList;
  ActionIndex               : Integer;

begin

  ActionNameList := TStringList.Create;
  with ActionNameList do
  try

    IniSectionName := Format('%s\Buttons', [Name]);
    with IniSource do
    begin
      For i := ReadValue(IniSectionName, 'Count', 0)-1 downto 0 do
      begin
        DetailedSectionName := Format('%s\Item%d', [IniSectionName, i]);

        CommaText := ReadValue(DetailedSectionName, 'Action', '<no data>');

        Button := nil;
        if Count > 0 then
          Button := PushAction(Strings[0]);
        for ActionIndex:=1 to Count-1 do
          PushDropDownAction(Button, Strings[ActionIndex]);
      end;
    end;

  finally
    ActionNameList.Destroy;
  end;


(*  IniSectionName := Format('%s\Buttons', [Name]);
  with IniSource.IniFile do
  begin
    For i:=ReadInteger(IniSectionName, 'Count', 0)-1 downto 0 do
    begin
      DetailedSectionName := Format('%s\Item%d', [IniSectionName, i]);




      ActionList := ReadString(DetailedSectionName, 'Action', '<no data>');
      TargetAction := Actions.ActionByName(ActionName);
      Toolbar := GetParentToolbar(TargetAction);

      ButtonIndex := FindButton(Toolbar, TargetAction);
      if ButtonIndex <> -1 then
      begin
        Button := Toolbar.Buttons[ButtonIndex];
        with Button do
        begin
          NewMenuItem := TMenuItem.Create(Button);

          ActionItem := TMenuItem.Create(Button);
          ActionItem.Action := Action;
          Action := nil;
          NewMenuItem.Insert(0, ActionItem);

          ActionItem := TMenuItem.Create(Button);
          TargetAction.Caption := ReadString(DetailedSectionName, 'Caption', '<no data>');
          ActionItem.Action := TargetAction;
          NewMenuItem.Insert(NewMenuItem.Count-1, ActionItem);

          Button.MenuItem := NewMenuItem;
          Caption := ReadString(DetailedSectionName, 'ButtonCaption', '<no data>');
        end
      end
      else
        with TToolButton.Create(Toolbar) do
        begin
          Action := TargetAction;
          Parent := Toolbar;
          if not TargetAction.Bitmap.Empty{ImageIndex <> -1} then
            ImageIndex := FImages.AddMasked(TargetAction.Bitmap, clWhite)
          else
            SB_LogMessage(etDebug, 'sbplg', Format('no image in action "%s"', [TargetAction.Name]));
        end;
      AdjustToolbarSize(Toolbar);
    end;
  end;*)
end;

procedure TPluginControlBar.Open;
begin
  RefreshButtons;
  FActive := True;
end;

procedure TPluginControlBar.Close;
begin
  FActive := False;
end;

procedure TPluginControlBar.SetActive(Value: Boolean);
begin
  if Value then
    Open
  else
    Close;
end;

procedure TPluginControlBar.AdjustToolbarSize(Toolbar: TToolbar);
var
  i           : Integer;
  NewWidth    : Integer;
begin
  NewWidth := 0;
  with Toolbar do
  begin
    for i:=0 to ButtonCount-1 do
      NewWidth := NewWidth + Buttons[i].Width;
    Width := NewWidth;
  end;
end;

end.
