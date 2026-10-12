unit PluginsPakReg;

interface

uses DesignIntf, DesignEditors, Classes, SysUtils, IniFiles, ExtCtrls, SBDecls;

procedure Register;

implementation

uses IniSource, PluginSrv, PluginTreeView, SBCommonReg;

{#R PluginSrv.dcr}

//type
{  TPluginManagerIniSection = class(TIniSectionProperty)
  protected
    function GetIniSource: TIniSource; override;
  end;}

  { TPluginManagerIniSection }

{function TPluginManagerIniSection.GetIniSource: TIniSource;
begin
  Result := (GetComponent(0) as TPluginManager).IniSource;
end;}

  { Registration }

procedure Register;
begin
  RegisterComponents(ComponentRegisterPage, [TPluginTreeView, TPluginManager]);
  RegisterPropertyEditor(TypeInfo(TIniSource), TPluginManager, 'IniSource', TComponentProperty);
//  RegisterPropertyEditor(TypeInfo(String), TPluginManager, 'Section', TPluginManagerIniSection);
//  RegisterPropertyEditor(TypeInfo(String), TPluginTreeView, 'PluginIniSection', TTreeViewIniSectionProperty);
  RegisterPropertyEditor(TypeInfo(TPluginManager), TPluginTreeView, 'PluginManager', TComponentProperty);  
end;

end.
