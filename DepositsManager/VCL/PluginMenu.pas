unit PluginMenu;

interface

uses
   Windows, SysUtils, Classes, Controls, Graphics, Menus, IniFiles,
   Sequence, ImgList,PluginIni,PluginDecls;

  type
    TPluginMainMenuItem = class(TMenuItem)
    private
      FAbsoluteIndex : Word;
    public
      constructor Create(AOwner : TComponent); override;
      destructor Destroy; override;
      procedure Click; override;
      procedure AdvancedDrawItem(ACanvas: TCanvas; ARect: TRect;
        State: TOwnerDrawState; TopLevel: Boolean); override;
      property AbsoluteIndex : Word read FAbsoluteIndex write FAbsoluteIndex default 0;
    end;


    TPluginMainMenu = class(TMainMenu)
    private
      FMenuIni : TMenuIni;
      FSequence : TSequence;
      FImageList : TImageList;
      FActive : Boolean;
      FPluginDir : string;
      FFont : TFont;
      FBeforeLoadPlugin : TPluginBeforeLoadEvent;
    protected
      function  StreamToString(Stream : TMemoryStream) : String;
      procedure StringToStream(var WStr : String; Stream : TMemoryStream);
      procedure PluginMenuItemClick(MenuItem : TPluginMainMenuItem);
      procedure Notification(AComponent: TComponent;
        Operation: TOperation);override;
      procedure SetMenuIni(Value : TMenuIni);
      procedure SetActive(const Value : Boolean);
      procedure SetFont(const Value : TFont);
      function GetActive : Boolean;
    public
      Plugins : TList;
      constructor Create(AOwner : TComponent); override;
      destructor Destroy; override;
      procedure CreatePlugin(PluginMenu : TPluginMainMenuItem;
        ACaption ,AShorCut ,ModuleName ,AParam ,AIconStr : String); virtual;
      procedure LoadPlugins( MenuItem : TPluginMainMenuItem );
      procedure FreePlugins;
      procedure CloseActivePlugins;
      procedure SavePluginIcon(MenuItem : TPluginMainMenuItem ;Icon : TIcon);
      function BuildMenuItemName(Menu : TMenuItem) : string;
      function LoadInactivePluginIcon(MenuItem : TPluginMainMenuItem;IconStr : String) : Integer;
      property Sequence : TSequence read FSequence write FSequence;
    published
      property MenuIni : TMenuIni read FMenuIni write SetMenuIni;
      property Active : Boolean read GetActive write SetActive;
      property Font : TFont read FFont write SetFont;
      property PluginDir : string read  FPluginDir write FPluginDir;
      property BeforeLoadPlugin : TPluginBeforeLoadEvent read FBeforeLoadPlugin write FBeforeLoadPlugin;
    end;


procedure Register;

implementation

resourcestring

  rsUnassigned = 'Òÿéèí îëóíìàéûá';


{TPluginMainMenuItem}

constructor TPluginMainMenuItem.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

destructor TPluginMainMenuItem.Destroy;
begin
  inherited Destroy;
end;


procedure TPluginMainMenuItem.Click;
begin
  inherited Click;
  if [csDesigning] * ComponentState = [] then
   TPluginMainMenu(GetParentMenu).PluginMenuItemClick(Self)
end;

procedure TPluginMainMenuItem.AdvancedDrawItem;
begin
  ACanvas.Font.Name :=TPluginMainMenu(GetParentMenu).Font.Name;
  inherited;
end;

{TPluginMainMenu}

constructor TPluginMainMenu.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  Plugins := TList.Create;
  FFont := TFont.Create;
  if (Images = nil)
  and([csDesigning] * ComponentState = [])
  then
  begin
    FImageList := TImageList.Create(nil);
    Images := FImageList;
  end;
  Sequence := TSequence.Create(Self);
end;

destructor TPluginMainMenu.Destroy;
begin
  CloseActivePlugins;
  Plugins.Free;
  Sequence.Free;
  inherited Destroy;
end;

procedure TPluginMainMenu.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  if (AComponent = MenuIni) then MenuIni := nil;
end;

procedure TPluginMainMenu.SetMenuIni(Value : TMenuIni);
begin
    FMenuIni := Value;
    if (FMenuIni <> nil) and ([csLoading] * ComponentState = []) then
    FMenuIni.FreeNotification(Self);
    if Assigned(FMenuIni) and FMenuIni.Active then SetActive(FActive);
end;

procedure TPluginMainMenu.SetActive(const Value : Boolean);
begin
  FActive := Value; 
  if not (csDesigning in ComponentState) then
    if  FActive and
        Assigned(MenuIni) and
        MenuIni.Active
    then
      LoadPlugins(nil)
    else
      FreePlugins;
end;

function TPluginMainMenu.GetActive : Boolean;
begin
  Result := FActive;
end;

procedure TPluginMainMenu.SetFont(const Value : TFont);
begin
  FFont.Assign(Value);
end;

function TPluginMainMenu.BuildMenuItemName(Menu : TMenuItem) : string;
begin
  Result := '';
  if Menu <> nil then
  while (Menu.Parent <> nil) do
  begin
    Result := Format('MenuItem%d\%s', [Menu.MenuIndex, Result]);
    Menu := Menu.Parent;
  end;
  Result := Format('%s\MenuItems\%s', [MenuIni.IniSection, Result]);
  System.Delete(Result, Length(Result), 1);
end;

procedure TPluginMainMenu.CreatePlugin(PluginMenu : TPluginMainMenuItem;
  ACaption ,AShorCut ,ModuleName ,AParam ,AIconStr : String);

    function GetPluginDir() : string;
    begin
      Result := PluginDir;
      if Result <> '' then  Result := Result + '\';
    end;
             
var
  Plugin : PPlugin;

begin

  with PluginMenu do
  begin
    AbsoluteIndex := Sequence.NextValue;
    Caption := ACaption;
    ShortCut := TextToShortCut(AShorCut);
    ImageIndex := LoadInactivePluginIcon(PluginMenu,AIconStr);
  end;

  New( Plugin );

  with  Plugin^  do
  begin
    Module :=GetPluginDir + ModuleName;
    Param := AParam;
    ModuleHandle := 0;
    Plugins.Add(Plugin);
  end;

end;

procedure TPluginMainMenu.LoadPlugins(MenuItem: TPluginMainMenuItem);
var
  Index : Integer;
  CurrentSection : String;
  NewSection : String;
  NewItem : TPluginMainMenuItem;
begin
  CurrentSection := BuildMenuItemName(MenuItem);

  with MenuIni.Location do
  for Index := 0 to MenuIni.Location.ReadInteger(CurrentSection, cCount , 0) - 1 do
  begin
    NewSection := Format('%s\MenuItem%d', [CurrentSection, Index]);
    NewItem := TPluginMainMenuItem.Create(MenuItem);

    CreatePlugin(
          NewItem
         ,ReadString(NewSection, cCaption , rsUnassigned)
         ,ReadString(NewSection, cShortCut, '')
         ,ReadString(NewSection, cPlugin  , '')
         ,ReadString(NewSection, cPluginParam , '')
         ,ReadString(NewSection, cMenuIcon    , '')
         );

    if MenuItem = nil then
      Items.Add(NewItem)
    else
      MenuItem.Add(NewItem);

    // Call Recurcive Himself To Create other plugins
    
    LoadPlugins(NewItem);
    
  end;
end;

procedure TPluginMainMenu.FreePlugins;
begin
  CloseActivePlugins;
  Items.Clear;
end;

function TPluginMainMenu.StreamToString(Stream : TMemoryStream) : string;
var
  Index: Integer;
  CH: Byte;
  Count: Integer;
begin
  Result := '';
  Stream.Seek(0,soFromBeginning);
  Count := Stream.Size;
  for Index := 0 to Count - 1 do
  begin
    Stream.Read(Ch, 1);
    Result := Result + IntToStr(Ch) + ' ';
  end;
  System.Delete(Result, Length(Result), 1);
end;

procedure TPluginMainMenu.StringToStream(var WStr : String; Stream : TMemoryStream);
var
  P: Integer;
  Ch: Char;
begin
  while WStr <> '' do
  begin
    P := Pos(' ', WStr);
    if P = 0 then
      P := Length(WStr)+1;
    Ch := Chr(StrToInt(Copy(WStr, 1, P-1)));
    System.Delete(WStr, 1, P);
    Stream.Write(Ch, 1);
  end;
end;

procedure TPluginMainMenu.SavePluginIcon(MenuItem : TPluginMainMenuItem ;Icon : TIcon);
var
  Stream : TMemoryStream;
  Section : string;
  Ident   : string;
  IconStr : String;
begin
  Stream := TMemoryStream.Create;
  with Icon do
  try
    Icon.SaveToStream(Stream);
    Section := BuildMenuItemName(MenuItem);
    Ident := CMenuIcon;
    IconStr := StreamToString(Stream);
    MenuIni.Location.WriteString(Section,Ident,IconStr);
  finally
    Stream.Free;
  end;
end;

function  TPluginMainMenu.LoadInactivePluginIcon(MenuItem : TPluginMainMenuItem;IconStr : String) : Integer;
var
  Stream : TMemoryStream;
  Icon : TIcon;
begin
  Result := -1;
  if IconStr <> '' then
  begin
  Stream := TMemoryStream.Create;
  Icon := TIcon.Create;
    try
      StringToStream(IconStr,Stream);
      Stream.Seek(0,soFromBeginning);
      Icon.LoadFromStream(Stream);
      if not Icon.Empty then
        Result := Images.AddIcon(Icon)
      else
        Result := -1;    
    finally
      Stream.Free;
      Icon.Free;
    end;
  end;
end;

procedure TPluginMainMenu.PluginMenuItemClick(MenuItem : TPluginMainMenuItem);
var
  InitProc    : TPluginInitProc;
  FinFunc     : TPluginFinalizeFunc;
  IconGetFunc : TPluginIconGetProc;
  CheckedFunc : TPluginMenuItemCheckedFunc;
  
  PtrPlugin   : PPlugin;
  PluginReady : Boolean;

  StrParam  : String;
  StrPlugin : String;

  PluginHandle      : HMODULE;
  CanFinalizePlugin : Boolean;
  
  Index : Integer;
  Icon  : TIcon;

  ProcessLoadPlugin : Boolean;
  
begin

  ProcessLoadPlugin := True;

  Index := MenuItem.AbsoluteIndex;

  PtrPlugin := Plugins[Index];

  with PtrPlugin^ do
  begin
    StrPlugin := Module;
    StrParam  := Param;
    PluginHandle := ModuleHandle;
    PluginReady  := ( PluginHandle = 0 ) and ( Module <> '' );
  end;

  if  PluginReady  then
  begin

    ProcessLoadPlugin :=True;
    
    if Assigned(BeforeLoadPlugin) then
    BeforeLoadPlugin(Self, StrPlugin, StrParam, ProcessLoadPlugin);

    if not ProcessLoadPlugin then
      Exit;

    PluginHandle := LoadPackage(StrPlugin);
    PtrPlugin^.ModuleHandle := PluginHandle;
    if PluginHandle <> 0 then
    begin
    @IconGetFunc := GetProcAddress(PluginHandle,CPluginIconGetFuncName);
      if @IconGetFunc <> nil then
      begin
      Icon := TIcon.Create;
        try
          IconGetFunc(StrParam,Icon);
          if not Icon.Empty then
          try
            MenuItem.ImageIndex := Images.AddIcon(Icon);
            SavePluginIcon(MenuItem,Icon);
          except
            // Do nothing
          end;
        finally
          Icon.Free;
        end;
      end;
    end;
  end;

  if PluginHandle <> 0 then
  begin
    // Call the Plugin Initialization Function
    @InitProc := GetProcAddress(PluginHandle,cPluginInitProcName);
    if @InitProc <> nil then
      InitProc(StrParam);

    // Call the Plugin Check (Uncheck) Function
    @CheckedFunc := GetProcAddress(PluginHandle,CPluginMenuItemCheckedFunc);
    MenuItem.Checked := (@CheckedFunc <> nil) and CheckedFunc;

    // Call the Plugin Finalize Function
    @FinFunc := GetProcAddress(PluginHandle,cPluginFinalizeFuncName);
    CanFinalizePlugin := ( @FinFunc <> nil );
    
    if CanFinalizePlugin and FinFunc then
    begin
      UnloadPackage(PluginHandle);
      PtrPlugin^.ModuleHandle :=0;
    end;
  end;

  Plugins[Index] := PtrPlugin;
end;

procedure TPluginMainMenu.CloseActivePlugins;
var
  PtrPlugin : PPlugin;
  Index : Integer;
begin
  for Index := 0 to Plugins.Count - 1 do
  begin
    PtrPlugin := Plugins.Items[Index];
    with PtrPlugin^ do
    if ModuleHandle <> 0 then
      UnloadPackage(ModuleHandle);
  end;

end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TPluginMainMenu])
end;

end.
