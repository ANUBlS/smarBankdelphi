unit PluginDecls;

interface

uses
  Windows, SysUtils, Classes, Graphics, IniFiles;

const
  CCount    = 'Count';
  CCaption  = 'Caption';
  CShortCut = 'ShortCut';
  CMenuIcon = 'Icon';
  CPlugin   = 'Plugin';

  CPluginParam = 'PluginParam';
  CSection     = '%s\MenuItem%d';

  CPluginInitProcName     = 'InitPlugin';
  CPluginFinalizeFuncName = 'FinalizePlugin';
  CPluginIconGetFuncName  = 'GetIcon';
  CPluginMenuItemCheckedFunc = 'Checked';
  
  type
  TPlugin = packed record
     Module : STRING;
     Param  : STRING;
     ModuleHandle : HMODULE;
  end;

  PPlugin = ^TPlugin;
  

  TPluginBeforeLoadEvent   = procedure(Sender : TObject;
        Plugin, Param : String; var Load : Boolean) of object;


  TPluginInitProc = procedure (Param : String);

  TPluginFinalizeFunc = function () : Boolean;

  TPluginIconGetProc = procedure (Param : String; Icon : TIcon);

  TPluginMenuItemCheckedFunc = function () : Boolean;

implementation

end.
