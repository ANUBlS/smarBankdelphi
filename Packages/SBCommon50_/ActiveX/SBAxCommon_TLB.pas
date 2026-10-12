unit SBAxCommon_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 05/02/2002 12:48:27 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Smart-B\SRC\SBCommon50\ActiveX\SBAxCommon.tlb (1)
// IID\LCID: {0616C846-0E6B-11D6-B1BB-00C0262B568B}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SBAxCommonMajorVersion = 1;
  SBAxCommonMinorVersion = 0;

  LIBID_SBAxCommon: TGUID = '{0616C846-0E6B-11D6-B1BB-00C0262B568B}';

  IID_IItemList: TGUID = '{0616C85B-0E6B-11D6-B1BB-00C0262B568B}';
  DIID_IItemListEvents: TGUID = '{0616C85D-0E6B-11D6-B1BB-00C0262B568B}';
  CLASS_ItemList: TGUID = '{0616C85F-0E6B-11D6-B1BB-00C0262B568B}';
  IID_IActionList: TGUID = '{0616C861-0E6B-11D6-B1BB-00C0262B568B}';
  DIID_IActionListEvents: TGUID = '{0616C863-0E6B-11D6-B1BB-00C0262B568B}';
  CLASS_ActionList: TGUID = '{0616C865-0E6B-11D6-B1BB-00C0262B568B}';
  IID_IAction: TGUID = '{0616C867-0E6B-11D6-B1BB-00C0262B568B}';
  DIID_IActionEvents: TGUID = '{0616C869-0E6B-11D6-B1BB-00C0262B568B}';
  CLASS_Action: TGUID = '{0616C86B-0E6B-11D6-B1BB-00C0262B568B}';
  IID_IPlugin: TGUID = '{51FBD361-1A11-11D6-B1E3-00C0262B568B}';
  DIID_IPluginEvents: TGUID = '{51FBD363-1A11-11D6-B1E3-00C0262B568B}';
  CLASS_Plugin: TGUID = '{51FBD365-1A11-11D6-B1E3-00C0262B568B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IItemList = interface;
  IItemListDisp = dispinterface;
  IItemListEvents = dispinterface;
  IActionList = interface;
  IActionListDisp = dispinterface;
  IActionListEvents = dispinterface;
  IAction = interface;
  IActionDisp = dispinterface;
  IActionEvents = dispinterface;
  IPlugin = interface;
  IPluginDisp = dispinterface;
  IPluginEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ItemList = IItemList;
  ActionList = IActionList;
  Action = IAction;
  Plugin = IPlugin;


// *********************************************************************//
// Interface: IItemList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C85B-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IItemList = interface(IDispatch)
    ['{0616C85B-0E6B-11D6-B1BB-00C0262B568B}']
    function  Add(Item: OleVariant): Integer; safecall;
    function  Get(Index: Integer): OleVariant; safecall;
    function  Get_Count: Integer; safecall;
    procedure Clear; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IItemListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C85B-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IItemListDisp = dispinterface
    ['{0616C85B-0E6B-11D6-B1BB-00C0262B568B}']
    function  Add(Item: OleVariant): Integer; dispid 1;
    function  Get(Index: Integer): OleVariant; dispid 2;
    property Count: Integer readonly dispid 3;
    procedure Clear; dispid 6;
  end;

// *********************************************************************//
// DispIntf:  IItemListEvents
// Flags:     (4096) Dispatchable
// GUID:      {0616C85D-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IItemListEvents = dispinterface
    ['{0616C85D-0E6B-11D6-B1BB-00C0262B568B}']
  end;

// *********************************************************************//
// Interface: IActionList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C861-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IActionList = interface(IItemList)
    ['{0616C861-0E6B-11D6-B1BB-00C0262B568B}']
    procedure ExecuteAll; safecall;
    function  AddAction(const Action: IAction): Integer; safecall;
    function  GetAction(Index: Integer): IAction; safecall;
  end;

// *********************************************************************//
// DispIntf:  IActionListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C861-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IActionListDisp = dispinterface
    ['{0616C861-0E6B-11D6-B1BB-00C0262B568B}']
    procedure ExecuteAll; dispid 4;
    function  AddAction(const Action: IAction): Integer; dispid 5;
    function  GetAction(Index: Integer): IAction; dispid 7;
    function  Add(Item: OleVariant): Integer; dispid 1;
    function  Get(Index: Integer): OleVariant; dispid 2;
    property Count: Integer readonly dispid 3;
    procedure Clear; dispid 6;
  end;

// *********************************************************************//
// DispIntf:  IActionListEvents
// Flags:     (4096) Dispatchable
// GUID:      {0616C863-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IActionListEvents = dispinterface
    ['{0616C863-0E6B-11D6-B1BB-00C0262B568B}']
  end;

// *********************************************************************//
// Interface: IAction
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C867-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IAction = interface(IDispatch)
    ['{0616C867-0E6B-11D6-B1BB-00C0262B568B}']
    procedure Execute; safecall;
    procedure Update; safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function  Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function  Get_Description: WideString; safecall;
    procedure Set_Description(const Value: WideString); safecall;
    function  Get_FullDescription: WideString; safecall;
    procedure Set_FullDescription(const Value: WideString); safecall;
    function  Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function  Get_Checked: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    function  Get_Default: WordBool; safecall;
    procedure Set_Default(Value: WordBool); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Description: WideString read Get_Description write Set_Description;
    property FullDescription: WideString read Get_FullDescription write Set_FullDescription;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Checked: WordBool read Get_Checked write Set_Checked;
    property Default: WordBool read Get_Default write Set_Default;
  end;

// *********************************************************************//
// DispIntf:  IActionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0616C867-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IActionDisp = dispinterface
    ['{0616C867-0E6B-11D6-B1BB-00C0262B568B}']
    procedure Execute; dispid 1;
    procedure Update; dispid 2;
    property Name: WideString dispid 3;
    property Caption: WideString dispid 4;
    property Description: WideString dispid 5;
    property FullDescription: WideString dispid 6;
    property Enabled: WordBool dispid 7;
    property Checked: WordBool dispid 8;
    property Default: WordBool dispid 9;
  end;

// *********************************************************************//
// DispIntf:  IActionEvents
// Flags:     (4096) Dispatchable
// GUID:      {0616C869-0E6B-11D6-B1BB-00C0262B568B}
// *********************************************************************//
  IActionEvents = dispinterface
    ['{0616C869-0E6B-11D6-B1BB-00C0262B568B}']
    procedure Execute; dispid 1;
    procedure Update; dispid 2;
  end;

// *********************************************************************//
// Interface: IPlugin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51FBD361-1A11-11D6-B1E3-00C0262B568B}
// *********************************************************************//
  IPlugin = interface(IDispatch)
    ['{51FBD361-1A11-11D6-B1E3-00C0262B568B}']
    function  Get_Actions: Integer; safecall;
    procedure InitializePlugin; safecall;
    procedure Cleanup; safecall;
    procedure Activate; safecall;
    procedure Deactivate; safecall;
    function  Get_Name: Integer; safecall;
    function  Get_DislpayName: Integer; safecall;
    property Actions: Integer read Get_Actions;
    property Name: Integer read Get_Name;
    property DislpayName: Integer read Get_DislpayName;
  end;

// *********************************************************************//
// DispIntf:  IPluginDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51FBD361-1A11-11D6-B1E3-00C0262B568B}
// *********************************************************************//
  IPluginDisp = dispinterface
    ['{51FBD361-1A11-11D6-B1E3-00C0262B568B}']
    property Actions: Integer readonly dispid 1;
    procedure InitializePlugin; dispid 2;
    procedure Cleanup; dispid 3;
    procedure Activate; dispid 4;
    procedure Deactivate; dispid 5;
    property Name: Integer readonly dispid 6;
    property DislpayName: Integer readonly dispid 7;
  end;

// *********************************************************************//
// DispIntf:  IPluginEvents
// Flags:     (0)
// GUID:      {51FBD363-1A11-11D6-B1E3-00C0262B568B}
// *********************************************************************//
  IPluginEvents = dispinterface
    ['{51FBD363-1A11-11D6-B1E3-00C0262B568B}']
  end;

// *********************************************************************//
// The Class CoItemList provides a Create and CreateRemote method to          
// create instances of the default interface IItemList exposed by              
// the CoClass ItemList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoItemList = class
    class function Create: IItemList;
    class function CreateRemote(const MachineName: string): IItemList;
  end;

// *********************************************************************//
// The Class CoActionList provides a Create and CreateRemote method to          
// create instances of the default interface IActionList exposed by              
// the CoClass ActionList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoActionList = class
    class function Create: IActionList;
    class function CreateRemote(const MachineName: string): IActionList;
  end;

// *********************************************************************//
// The Class CoAction provides a Create and CreateRemote method to          
// create instances of the default interface IAction exposed by              
// the CoClass Action. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAction = class
    class function Create: IAction;
    class function CreateRemote(const MachineName: string): IAction;
  end;

// *********************************************************************//
// The Class CoPlugin provides a Create and CreateRemote method to          
// create instances of the default interface IPlugin exposed by              
// the CoClass Plugin. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPlugin = class
    class function Create: IPlugin;
    class function CreateRemote(const MachineName: string): IPlugin;
  end;

implementation

uses ComObj;

class function CoItemList.Create: IItemList;
begin
  Result := CreateComObject(CLASS_ItemList) as IItemList;
end;

class function CoItemList.CreateRemote(const MachineName: string): IItemList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ItemList) as IItemList;
end;

class function CoActionList.Create: IActionList;
begin
  Result := CreateComObject(CLASS_ActionList) as IActionList;
end;

class function CoActionList.CreateRemote(const MachineName: string): IActionList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ActionList) as IActionList;
end;

class function CoAction.Create: IAction;
begin
  Result := CreateComObject(CLASS_Action) as IAction;
end;

class function CoAction.CreateRemote(const MachineName: string): IAction;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Action) as IAction;
end;

class function CoPlugin.Create: IPlugin;
begin
  Result := CreateComObject(CLASS_Plugin) as IPlugin;
end;

class function CoPlugin.CreateRemote(const MachineName: string): IPlugin;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Plugin) as IPlugin;
end;

end.
