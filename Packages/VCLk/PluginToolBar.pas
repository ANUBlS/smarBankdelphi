unit PluginToolBar;

interface

uses
   Windows, SysUtils, Classes, Controls, Graphics, Menus, IniFiles,
   ImgList,PluginIni,PluginDecls ,ComCtrls ,Sequence,Dialogs;

  type
    TPluginToolBar = class(TToolBar)
    private
      FMenuIni : TMenuIni;
      Plugins : TList;
      FImageList : TImageList;
      Sequence : TSequence;
      FActive : Boolean;
      FBeforeLoadPlugin : TPluginBeforeLoadEvent;
      FPluginsCnt : Integer;
    protected
      procedure Notification(AComponent: TComponent;
        Operation: TOperation);override;
      procedure SetMenuIni(Value : TMenuIni);
      function GetMenuIni : TMenuIni;
      procedure SetActive(const Value : Boolean);
      function GetActive : Boolean;
      procedure OnToolButtonClick(Sender : TObject);
    public
      constructor Create(AOwner : TComponent); override;
      destructor Destroy; override;
      procedure LoadPlugins;virtual;
      procedure UnLoadPlugins;virtual;
      procedure StringToStream(var WStr : String; Stream : TMemoryStream);
      function  LoadInactivePluginIcon(IconStr : String) : Integer;
      function  StreamToString(Stream : TMemoryStream) : String;
      procedure SavePluginIcon(Btn: TToolButton ;
        Icon : TIcon);
    published
      property BeforeLoadPlugin : TPluginBeforeLoadEvent read FBeforeLoadPlugin write FBeforeLoadPlugin;
      property MenuIni : TMenuIni read GetMenuIni write SetMenuIni;
      property Active : Boolean read GetActive write SetActive;
    end;

procedure Register;

implementation

resourcestring
  rsUnassigned = 'Òÿéèí îëóíìàéûá';

procedure TPluginToolBar.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  if (AComponent = MenuIni) then MenuIni := nil;
end;

procedure TPluginToolBar.SetMenuIni(Value : TMenuIni);
begin
    FMenuIni := Value;
    if (FMenuIni <> nil) and ([csLoading] * ComponentState = []) then
      FMenuIni.FreeNotification(Self);
end;

function TPluginToolBar.GetMenuIni : TMenuIni;
begin
  Result := FMenuIni;
end;

constructor TPluginToolBar.Create;
begin
  inherited Create(AOwner);
  Plugins := TList.Create;
  FPluginsCnt := 0;
  if (Images = nil)
  and([csDesigning] * ComponentState = [])
  then
  begin
    FImageList := TImageList.Create(nil);
    Images := FImageList;
  end;
  Sequence := TSequence.Create(Self);
end;

destructor TPluginToolBar.Destroy;
begin
  Plugins.Free;
  Sequence.Free;
 // FImageList.Free;  
  inherited Destroy;
end;

function TPluginToolBar.StreamToString(Stream : TMemoryStream) : string;
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

procedure TPluginToolBar.SavePluginIcon(Btn : TToolButton;Icon : TIcon);
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
    Section := Format('ToolBar\ToolButton%d',[FPluginsCnt - Btn.Tag]);
    Ident := CMenuIcon;
    IconStr := StreamToString(Stream);
    MenuIni.Location.WriteString(Section,Ident,IconStr);
  finally
    Stream.Free;
  end;
end;

procedure TPluginToolBar.StringToStream(var WStr : String; Stream : TMemoryStream);
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

procedure TPluginToolBar.UnLoadPlugins;
var
  I : Integer;
begin
  FPluginsCnt := 0;
  Plugins.Free;
  for I:=0 to ButtonCount - 1 do
    Buttons[I].Free;
end;

procedure TPluginToolBar.LoadPlugins;
var
  S : TStringList;
  I : Integer;
  PluginCaption : String;
  PluginName : String;
  PluginParam : String;
  P : PPlugin;
begin
  S := TStringList.Create;
  try
    with MenuIni ,Location do
    begin
      ReadSections(S);
      FPluginsCnt := S.Count - 1;
      for I := S.Count - 1 downto 0 do
      begin
        PluginCaption := ReadString(S[I], CCaption, rsUnassigned);
        PluginName := ReadString(S[I], CPlugin, '');
        PluginParam := ReadString(S[I], CPluginParam, '');

        with TToolButton.Create(Self) do
        begin
          Parent := Self;
          Tag := S.Count - 1 - I;

          if PluginCaption <> '|' then
          begin
            Style :=tbsButton;
            Width := 23;
            Caption := PluginCaption;
            Hint := PluginCaption;
          end
          else
          begin
            Style := tbsSeparator;
            Width := 8;
          end;

          OnClick := OnToolButtonClick;

          ImageIndex := LoadInactivePluginIcon(ReadString(S[I],CMenuIcon,''));

        end; //with

          New(P);
          with  P^  do
          begin
            Module :=PluginName;
            Param := PluginParam;
            ModuleHandle := 0;
            Plugins.Add(P);
          end;

      end; // For
    end;  // With
  finally
    S.Free;
  end;
end;

function TPluginToolBar.LoadInactivePluginIcon(IconStr : String) : Integer;
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

procedure TPluginToolBar.SetActive(const Value : Boolean);
begin
  if Value <> FActive then
  if [csDesigning] * ComponentState = [] then
  if Value then
    LoadPlugins
  else
    UnLoadPlugins;
  FActive := Value;  
end;

function TPluginToolBar.GetActive : Boolean;
begin
  Result := FActive;
end;

procedure TPluginToolBar.OnToolButtonClick(Sender : TObject);
var
  InitProc    : TPluginInitProc;
  FinFunc     : TPluginFinalizeFunc;
  IconGetFunc : TPluginIconGetProc;
  
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

  Index := (Sender as TComponent).Tag;

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
            (Sender as TToolButton).ImageIndex := Images.AddIcon(Icon);
            SavePluginIcon((Sender as TToolButton),Icon);
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


procedure Register;
begin
  RegisterComponents('CreditsMgr',[TPluginToolBar])
end;

end.
