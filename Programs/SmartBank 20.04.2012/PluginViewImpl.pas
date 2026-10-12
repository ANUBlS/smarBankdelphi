unit PluginViewImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PluginSrv,
  Menus, SBPlgAx50_TLB, olectrls, AxLoader, ExtCtrls, StdCtrls;

type
  TPluginViewForm = class(TForm)
    PluginMainMenu: TMainMenu;
    Timer1: TTimer;
    AccessDeniedPanel: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FPlugin: TInPlacePlugin;
    FParamsAsString: String;
    FIgnoreSecurity: Boolean;
    procedure ActivatePlugin(Plugin: TInPlacePlugin);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    procedure FormActivate;
    property Plugin: TInPlacePlugin read FPlugin write FPlugin;
    property ParamsAsString: String read FParamsAsString write FParamsAsString;
    property IgnoreSecurity: Boolean read FIgnoreSecurity write FIgnoreSecurity;
    procedure AddParam(const Name, Value: String);
    procedure ReleasePlugin;
  end;

var
  PluginViewForm: TPluginViewForm;

function ViewPlugin(APlugin: TInPlacePlugin; const AParamsAsString: String;
  AIgnoreSecurity: Boolean): TPluginViewForm;

implementation

{$R *.DFM}

uses ActiveX, sbMainForm_Unit, SBSecurity, ComObj;

function ViewPlugin(APlugin: TInPlacePlugin; const AParamsAsString: String;
  AIgnoreSecurity: Boolean): TPluginViewForm;
begin
  Result := TPluginViewForm.Create(nil);
  with Result do
  begin
    ParamsAsString := AParamsAsString;
    IgnoreSecurity := AIgnoreSecurity;

    Plugin := APlugin;
    FormActivate;
  end;
end;

procedure TPluginViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  if sbMainForm.Mode = modeNormal then
  begin
    sbMainForm.PluginHide(Self);
    Plugin.InPlaceTarget := nil;
    Action := caFree;
  end
  else
    Action := caNone;
end;


procedure TPluginViewForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
end;

procedure TPluginViewForm.ReleasePlugin;
begin
  Plugin := nil;
end;

procedure TPluginViewForm.FormCreate(Sender: TObject);
begin
  sbMainForm.PluginShow(Self);
end;

procedure TPluginViewForm.FormActivate;
begin
//  if IgnoreSecurity or Sb_CheckModuleAccess(GuidToString(Plugin.ClassID)) then
    ActivatePlugin(Plugin)
{  else
    with AccessDeniedPanel do
    begin
      Visible := True;
      Align := alClient;
    end;
}end;

procedure TPluginViewForm.Timer1Timer(Sender: TObject);
begin
  if Assigned(Plugin) and (sbMainForm.Mode = modeNormal) then
    Caption := Plugin.OleObject.OleObject.Caption;
end;

procedure TPluginViewForm.AddParam(const Name, Value: String);
begin
  if ParamsAsString <> '' then
    FParamsAsString := FParamsAsString + ',';
  FParamsAsString := Format('%s%s=%s', [FParamsAsString, Name, Value]);
end;

procedure TPluginViewForm.ActivatePlugin(Plugin: TInPlacePlugin);
var
  UIObject: IUIObject;
  MenuExporter: IMenuExporter;
  W: TOleMenuGroupWidths;
  za: integer;
begin
if Assigned(Plugin) then
  begin
    Plugin.InPlaceTarget := Self;
    Caption := Plugin.Caption;

    if IUnknown(TVarData(Plugin.OleObject.OleObject).VUnknown).QueryInterface(IID_IMenuExporter, MenuExporter) = S_OK then
//      PluginMainMenu.PopulateOle2Menu(MenuExporter.SharedMenu, [0,2,4], W.width);

  end;
  if Assigned(FPlugin) then
    if IUnknown(TVarData(FPlugin.OleObject.OleObject).VUnknown).QueryInterface(IID_IUIObject, UIObject) = S_OK then
       UIObject.Activate;


  
end;

end.
