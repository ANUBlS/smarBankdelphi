unit sbplg50_TLB;

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
// File generated on 18/01/2002 14:42:28 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Smart-B\SRC\sbplg50\sbplg50.tlb (1)
// IID\LCID: {FC3C6562-0BFE-11D6-B1B9-00C0262B568B}\0
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
  sbplg50MajorVersion = 1;
  sbplg50MinorVersion = 0;

  LIBID_sbplg50: TGUID = '{FC3C6562-0BFE-11D6-B1B9-00C0262B568B}';

  IID_ISsdPlguin: TGUID = '{FC3C6563-0BFE-11D6-B1B9-00C0262B568B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISsdPlguin = interface;
  ISsdPlguinDisp = dispinterface;

// *********************************************************************//
// Interface: ISsdPlguin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC3C6563-0BFE-11D6-B1B9-00C0262B568B}
// *********************************************************************//
  ISsdPlguin = interface(IDispatch)
    ['{FC3C6563-0BFE-11D6-B1B9-00C0262B568B}']
    procedure Initialize; safecall;
    procedure Finalize; safecall;
    procedure Abort; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISsdPlguinDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FC3C6563-0BFE-11D6-B1B9-00C0262B568B}
// *********************************************************************//
  ISsdPlguinDisp = dispinterface
    ['{FC3C6563-0BFE-11D6-B1B9-00C0262B568B}']
    procedure Initialize; dispid 1;
    procedure Finalize; dispid 2;
    procedure Abort; dispid 3;
  end;

implementation

uses ComObj;

end.
