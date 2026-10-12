unit CM_WRSETUP_TLB;

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

// PASTLWTR : $Revision:   1.88  $
// File generated on 19/01/2005 02:43:08 PM from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: D:\CreditsMgr\Source\Packages\CM_WRSetup\CM_WRSETUP.tlb (1)
// IID\LCID: {7D0041FA-1391-445B-AE3F-DBF2BEAFF0B8}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\system32\stdvcl40.dll)
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
  CM_WRSETUPMajorVersion = 1;
  CM_WRSETUPMinorVersion = 0;

  LIBID_CM_WRSETUP: TGUID = '{7D0041FA-1391-445B-AE3F-DBF2BEAFF0B8}';

  IID_Interface1: TGUID = '{CC324492-F718-4CBD-8054-EDD457FAA75E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Interface1 = interface;
  Interface1Disp = dispinterface;

// *********************************************************************//
// Interface: Interface1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CC324492-F718-4CBD-8054-EDD457FAA75E}
// *********************************************************************//
  Interface1 = interface(IDispatch)
    ['{CC324492-F718-4CBD-8054-EDD457FAA75E}']
    procedure add(x: SYSINT; y: SYSINT); safecall;
  end;

// *********************************************************************//
// DispIntf:  Interface1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CC324492-F718-4CBD-8054-EDD457FAA75E}
// *********************************************************************//
  Interface1Disp = dispinterface
    ['{CC324492-F718-4CBD-8054-EDD457FAA75E}']
    procedure add(x: SYSINT; y: SYSINT); dispid 1;
  end;

implementation

uses ComObj;

end.
