unit CRYPTOMODELLib_TLB;

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
// File generated on 11/05/2004 11:47:50 from Type Library described below.

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
// Type Lib: C:\LVPCSS\LVPCSSClients\PKI\DLL\CryptoModel.dll (1)
// IID\LCID: {705C9FA4-11ED-483C-B03A-74AD08C436AA}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\system32\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Hint: Member 'type' of 'tagSTATSTG' changed to 'type_'
//   Error creating palette bitmap of (TCryptoSession) : Server C:\LVPCSS\LVPCSSClients\PKI\DLL\CryptoModel.dll contains no icons
//   Error creating palette bitmap of (TCryptoKey) : Server C:\LVPCSS\LVPCSSClients\PKI\DLL\CryptoModel.dll contains no icons
//   Error creating palette bitmap of (TCryptoKeyBase) : Server C:\LVPCSS\LVPCSSClients\PKI\DLL\CryptoModel.dll contains no icons
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
  CRYPTOMODELLibMajorVersion = 1;
  CRYPTOMODELLibMinorVersion = 0;

  LIBID_CRYPTOMODELLib: TGUID = '{705C9FA4-11ED-483C-B03A-74AD08C436AA}';

  IID_ICryptoSession: TGUID = '{8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}';
  IID_IPiePlugin: TGUID = '{20000611-ADAD-0000-0000-196911213756}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IStream: TGUID = '{0000000C-0000-0000-C000-000000000046}';
  CLASS_CryptoSession: TGUID = '{83AEFBE3-2DE4-476A-B94F-09571D47D63B}';
  IID_ICryptoKey: TGUID = '{29B8E4B2-1184-4781-A99E-A0082B2CA898}';
  CLASS_CryptoKey: TGUID = '{D0CE60B3-6637-47EF-A55D-603E1B727FB5}';
  IID_ICryptoKeyBase: TGUID = '{09375792-0EDE-4F89-8776-C38CEFC04CA8}';
  CLASS_CryptoKeyBase: TGUID = '{8554472B-75C5-4EEE-8C44-03DB5E05229A}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum CryptoErrors
type
  CryptoErrors = TOleEnum;
const
  READ_STREAM = $80041388;
  ABONENT_FOUND = $80041389;
  SESSION_INIT = $8004138A;
  KEY_GENERATE = $8004138B;
  LOAD_KEY = $8004138C;
  INSERTING = $8004138D;
  LOAD_BASE = $8004138E;
  KEY_CORRUPTED = $8004138F;
  KEY_EXPIRED = $80041390;
  CRYPTO_INTERNAL = $80041391;
  RANDOM_GENERATION = $80041392;
  KEY_DISABLED = $80041393;
  CERTIFICATE = $80041394;
  CLOSE_BASE = $80041395;
  DUPLICATE_KEY = $80041396;
  SECRET_INFORMATION = $80041397;
  NOT_CERTIFIED = $80041398;
  ALREADY_CERT = $80041399;
  DEFAULT_SECRET = $8004139A;
  DEFAULT_PUBLIC = $8004139B;
  CERT_KEY = $8004139C;
  ALREADY_INIT = $8004139D;
  ALREADY_LOADED = $8004139E;
  KEY_NOT_LOADED = $8004139F;
  INVALID_FORMAT = $800413A0;
  INIT_TRACING = $800413A1;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICryptoSession = interface;
  ICryptoSessionDisp = dispinterface;
  IPiePlugin = interface;
  ISequentialStream = interface;
  IStream = interface;
  ICryptoKey = interface;
  ICryptoKeyDisp = dispinterface;
  ICryptoKeyBase = interface;
  ICryptoKeyBaseDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CryptoSession = ICryptoSession;
  CryptoKey = ICryptoKey;
  CryptoKeyBase = ICryptoKeyBase;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PByte1 = ^Byte; {*}
  PTDateTime1 = ^TDateTime; {*}

  _LARGE_INTEGER = packed record
    QuadPart: Int64;
  end;

  _ULARGE_INTEGER = packed record
    QuadPart: Largeuint;
  end;

  _FILETIME = packed record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

  tagSTATSTG = packed record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: TGUID;
    mtime: TGUID;
    ctime: TGUID;
    atime: TGUID;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;


// *********************************************************************//
// Interface: ICryptoSession
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}
// *********************************************************************//
  ICryptoSession = interface(IDispatch)
    ['{8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}']
    procedure Init(const secret_key_path: WideString; const public_key_base_path: WideString); safecall;
    procedure Sign(const pin: IStream; const pout: IStream); safecall;
    procedure Decrypt(const pin: IStream; const pout: IStream); safecall;
    procedure Encrypt(const pin: IStream; const abid: WideString; const pout: IStream); safecall;
    procedure CheckSign(const pin: IStream; const psign: IStream; out abid: WideString; 
                        out result: WordBool); safecall;
    procedure Close; safecall;
    function  Get_Abonent: WideString; safecall;
    procedure CreateStreamOnMemory(out ppstream: IStream); safecall;
    procedure DeleteStreamOnMemory(const pstream: IStream); safecall;
    procedure InitEx(const section: WideString; const ini: WideString); safecall;
    property Abonent: WideString read Get_Abonent;
  end;

// *********************************************************************//
// DispIntf:  ICryptoSessionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}
// *********************************************************************//
  ICryptoSessionDisp = dispinterface
    ['{8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}']
    procedure Init(const secret_key_path: WideString; const public_key_base_path: WideString); dispid 1;
    procedure Sign(const pin: IStream; const pout: IStream); dispid 2;
    procedure Decrypt(const pin: IStream; const pout: IStream); dispid 3;
    procedure Encrypt(const pin: IStream; const abid: WideString; const pout: IStream); dispid 4;
    procedure CheckSign(const pin: IStream; const psign: IStream; out abid: WideString; 
                        out result: WordBool); dispid 5;
    procedure Close; dispid 6;
    property Abonent: WideString readonly dispid 7;
    procedure CreateStreamOnMemory(out ppstream: IStream); dispid 8;
    procedure DeleteStreamOnMemory(const pstream: IStream); dispid 9;
    procedure InitEx(const section: WideString; const ini: WideString); dispid 10;
  end;

// *********************************************************************//
// Interface: IPiePlugin
// Flags:     (0)
// GUID:      {20000611-ADAD-0000-0000-196911213756}
// *********************************************************************//
  IPiePlugin = interface(IUnknown)
    ['{20000611-ADAD-0000-0000-196911213756}']
    function  Initialize(pszInitString: PChar): HResult; stdcall;
    function  Shutdown: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function  RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function  RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IStream
// Flags:     (0)
// GUID:      {0000000C-0000-0000-C000-000000000046}
// *********************************************************************//
  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function  RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord; out plibNewPosition: TGUID): HResult; stdcall;
    function  SetSize(libNewSize: TGUID): HResult; stdcall;
    function  RemoteCopyTo(const pstm: IStream; cb: TGUID; out pcbRead: TGUID; out pcbWritten: TGUID): HResult; stdcall;
    function  Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function  Revert: HResult; stdcall;
    function  LockRegion(libOffset: TGUID; cb: TGUID; dwLockType: LongWord): HResult; stdcall;
    function  UnlockRegion(libOffset: TGUID; cb: TGUID; dwLockType: LongWord): HResult; stdcall;
    function  Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult; stdcall;
    function  Clone(out ppstm: IStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICryptoKey
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29B8E4B2-1184-4781-A99E-A0082B2CA898}
// *********************************************************************//
  ICryptoKey = interface(IDispatch)
    ['{29B8E4B2-1184-4781-A99E-A0082B2CA898}']
    procedure Generate(const Abonent: WideString; const description: WideString; 
                       var expiration: TDateTime); safecall;
    procedure LoadFromStream(const stream: IStream); safecall;
    procedure LoadFromFile(const filename: WideString); safecall;
    procedure LoadFromBase(const base: ICryptoKeyBase; const Abonent: WideString); safecall;
    procedure SaveToStream(const stream: IStream); safecall;
    procedure SaveToFile(const filename: WideString); safecall;
    procedure SaveToBase(const base: ICryptoKeyBase); safecall;
    procedure PublicDump(const stream: IStream); safecall;
    procedure GetPublic(out pub_key: ICryptoKey); safecall;
    function  Get_Abonent: WideString; safecall;
    function  Get_description: WideString; safecall;
    function  Get_Secret: Integer; safecall;
    function  Get_expiration: TDateTime; safecall;
    function  Get_Creation: TDateTime; safecall;
    procedure Certify; safecall;
    procedure CheckCertification(out result: WordBool); safecall;
    procedure DeleteCertification; safecall;
    property Abonent: WideString read Get_Abonent;
    property description: WideString read Get_description;
    property Secret: Integer read Get_Secret;
    property expiration: TDateTime read Get_expiration;
    property Creation: TDateTime read Get_Creation;
  end;

// *********************************************************************//
// DispIntf:  ICryptoKeyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {29B8E4B2-1184-4781-A99E-A0082B2CA898}
// *********************************************************************//
  ICryptoKeyDisp = dispinterface
    ['{29B8E4B2-1184-4781-A99E-A0082B2CA898}']
    procedure Generate(const Abonent: WideString; const description: WideString; 
                       var expiration: TDateTime); dispid 1;
    procedure LoadFromStream(const stream: IStream); dispid 2;
    procedure LoadFromFile(const filename: WideString); dispid 3;
    procedure LoadFromBase(const base: ICryptoKeyBase; const Abonent: WideString); dispid 4;
    procedure SaveToStream(const stream: IStream); dispid 5;
    procedure SaveToFile(const filename: WideString); dispid 6;
    procedure SaveToBase(const base: ICryptoKeyBase); dispid 7;
    procedure PublicDump(const stream: IStream); dispid 14;
    procedure GetPublic(out pub_key: ICryptoKey); dispid 8;
    property Abonent: WideString readonly dispid 10;
    property description: WideString readonly dispid 11;
    property Secret: Integer readonly dispid 12;
    property expiration: TDateTime readonly dispid 13;
    property Creation: TDateTime readonly dispid 15;
    procedure Certify; dispid 16;
    procedure CheckCertification(out result: WordBool); dispid 17;
    procedure DeleteCertification; dispid 18;
  end;

// *********************************************************************//
// Interface: ICryptoKeyBase
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09375792-0EDE-4F89-8776-C38CEFC04CA8}
// *********************************************************************//
  ICryptoKeyBase = interface(IDispatch)
    ['{09375792-0EDE-4F89-8776-C38CEFC04CA8}']
    procedure Open(const path: WideString); safecall;
    procedure Close; safecall;
    procedure GetKey(const Abonent: WideString; out ppkey: ICryptoKey); safecall;
    procedure Add(const pikey: ICryptoKey); safecall;
    procedure Remove(const Abonent: WideString); safecall;
    procedure MoveFirst; safecall;
    procedure MoveNext(out ppkey: ICryptoKey); safecall;
    function  Get_Size: Integer; safecall;
    function  Get_Valid(const Abonent: WideString): Integer; safecall;
    procedure Set_Valid(const Abonent: WideString; pVal: Integer); safecall;
    procedure Generate(const path: WideString); safecall;
    procedure Certify(const Abonent: WideString); safecall;
    procedure CheckCertification(const Abonent: WideString; out result: WordBool); safecall;
    procedure DeleteCertification(const Abonent: WideString); safecall;
    procedure OpenExclusive(const path: WideString); safecall;
    property Size: Integer read Get_Size;
    property Valid[const Abonent: WideString]: Integer read Get_Valid write Set_Valid;
  end;

// *********************************************************************//
// DispIntf:  ICryptoKeyBaseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09375792-0EDE-4F89-8776-C38CEFC04CA8}
// *********************************************************************//
  ICryptoKeyBaseDisp = dispinterface
    ['{09375792-0EDE-4F89-8776-C38CEFC04CA8}']
    procedure Open(const path: WideString); dispid 1;
    procedure Close; dispid 2;
    procedure GetKey(const Abonent: WideString; out ppkey: ICryptoKey); dispid 3;
    procedure Add(const pikey: ICryptoKey); dispid 4;
    procedure Remove(const Abonent: WideString); dispid 5;
    procedure MoveFirst; dispid 6;
    procedure MoveNext(out ppkey: ICryptoKey); dispid 7;
    property Size: Integer readonly dispid 9;
    property Valid[const Abonent: WideString]: Integer dispid 10;
    procedure Generate(const path: WideString); dispid 12;
    procedure Certify(const Abonent: WideString); dispid 13;
    procedure CheckCertification(const Abonent: WideString; out result: WordBool); dispid 14;
    procedure DeleteCertification(const Abonent: WideString); dispid 15;
    procedure OpenExclusive(const path: WideString); dispid 16;
  end;

// *********************************************************************//
// The Class CoCryptoSession provides a Create and CreateRemote method to          
// create instances of the default interface ICryptoSession exposed by              
// the CoClass CryptoSession. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCryptoSession = class
    class function Create: ICryptoSession;
    class function CreateRemote(const MachineName: string): ICryptoSession;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCryptoSession
// Help String      : CryptoSession Class
// Default Interface: ICryptoSession
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCryptoSessionProperties= class;
{$ENDIF}
  TCryptoSession = class(TOleServer)
  private
    FIntf:        ICryptoSession;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCryptoSessionProperties;
    function      GetServerProperties: TCryptoSessionProperties;
{$ENDIF}
    function      GetDefaultInterface: ICryptoSession;
  protected
    procedure InitServerData; override;
    function  Get_Abonent: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICryptoSession);
    procedure Disconnect; override;
    procedure Init(const secret_key_path: WideString; const public_key_base_path: WideString);
    procedure Sign(const pin: IStream; const pout: IStream);
    procedure Decrypt(const pin: IStream; const pout: IStream);
    procedure Encrypt(const pin: IStream; const abid: WideString; const pout: IStream);
    procedure CheckSign(const pin: IStream; const psign: IStream; out abid: WideString; 
                        out result: WordBool);
    procedure Close;
    procedure CreateStreamOnMemory(out ppstream: IStream);
    procedure DeleteStreamOnMemory(const pstream: IStream);
    procedure InitEx(const section: WideString; const ini: WideString);
    property  DefaultInterface: ICryptoSession read GetDefaultInterface;
    property Abonent: WideString read Get_Abonent;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCryptoSessionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCryptoSession
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCryptoSessionProperties = class(TPersistent)
  private
    FServer:    TCryptoSession;
    function    GetDefaultInterface: ICryptoSession;
    constructor Create(AServer: TCryptoSession);
  protected
    function  Get_Abonent: WideString;
  public
    property DefaultInterface: ICryptoSession read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCryptoKey provides a Create and CreateRemote method to          
// create instances of the default interface ICryptoKey exposed by              
// the CoClass CryptoKey. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCryptoKey = class
    class function Create: ICryptoKey;
    class function CreateRemote(const MachineName: string): ICryptoKey;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCryptoKey
// Help String      : CryptoKey Class
// Default Interface: ICryptoKey
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCryptoKeyProperties= class;
{$ENDIF}
  TCryptoKey = class(TOleServer)
  private
    FIntf:        ICryptoKey;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCryptoKeyProperties;
    function      GetServerProperties: TCryptoKeyProperties;
{$ENDIF}
    function      GetDefaultInterface: ICryptoKey;
  protected
    procedure InitServerData; override;
    function  Get_Abonent: WideString;
    function  Get_description: WideString;
    function  Get_Secret: Integer;
    function  Get_expiration: TDateTime;
    function  Get_Creation: TDateTime;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICryptoKey);
    procedure Disconnect; override;
    procedure Generate(const Abonent: WideString; const description: WideString; 
                       var expiration: TDateTime);
    procedure LoadFromStream(const stream: IStream);
    procedure LoadFromFile(const filename: WideString);
    procedure LoadFromBase(const base: ICryptoKeyBase; const Abonent: WideString);
    procedure SaveToStream(const stream: IStream);
    procedure SaveToFile(const filename: WideString);
    procedure SaveToBase(const base: ICryptoKeyBase);
    procedure PublicDump(const stream: IStream);
    procedure GetPublic(out pub_key: ICryptoKey);
    procedure Certify;
    procedure CheckCertification(out result: WordBool);
    procedure DeleteCertification;
    property  DefaultInterface: ICryptoKey read GetDefaultInterface;
    property Abonent: WideString read Get_Abonent;
    property description: WideString read Get_description;
    property Secret: Integer read Get_Secret;
    property expiration: TDateTime read Get_expiration;
    property Creation: TDateTime read Get_Creation;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCryptoKeyProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCryptoKey
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCryptoKeyProperties = class(TPersistent)
  private
    FServer:    TCryptoKey;
    function    GetDefaultInterface: ICryptoKey;
    constructor Create(AServer: TCryptoKey);
  protected
    function  Get_Abonent: WideString;
    function  Get_description: WideString;
    function  Get_Secret: Integer;
    function  Get_expiration: TDateTime;
    function  Get_Creation: TDateTime;
  public
    property DefaultInterface: ICryptoKey read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCryptoKeyBase provides a Create and CreateRemote method to          
// create instances of the default interface ICryptoKeyBase exposed by              
// the CoClass CryptoKeyBase. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCryptoKeyBase = class
    class function Create: ICryptoKeyBase;
    class function CreateRemote(const MachineName: string): ICryptoKeyBase;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCryptoKeyBase
// Help String      : CryptoKeyBase Class
// Default Interface: ICryptoKeyBase
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCryptoKeyBaseProperties= class;
{$ENDIF}
  TCryptoKeyBase = class(TOleServer)
  private
    FIntf:        ICryptoKeyBase;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCryptoKeyBaseProperties;
    function      GetServerProperties: TCryptoKeyBaseProperties;
{$ENDIF}
    function      GetDefaultInterface: ICryptoKeyBase;
  protected
    procedure InitServerData; override;
    function  Get_Size: Integer;
    function  Get_Valid(const Abonent: WideString): Integer;
    procedure Set_Valid(const Abonent: WideString; pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICryptoKeyBase);
    procedure Disconnect; override;
    procedure Open(const path: WideString);
    procedure Close;
    procedure GetKey(const Abonent: WideString; out ppkey: ICryptoKey);
    procedure Add(const pikey: ICryptoKey);
    procedure Remove(const Abonent: WideString);
    procedure MoveFirst;
    procedure MoveNext(out ppkey: ICryptoKey);
    procedure Generate(const path: WideString);
    procedure Certify(const Abonent: WideString);
    procedure CheckCertification(const Abonent: WideString; out result: WordBool);
    procedure DeleteCertification(const Abonent: WideString);
    procedure OpenExclusive(const path: WideString);
    property  DefaultInterface: ICryptoKeyBase read GetDefaultInterface;
    property Size: Integer read Get_Size;
    property Valid[const Abonent: WideString]: Integer read Get_Valid write Set_Valid;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCryptoKeyBaseProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCryptoKeyBase
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCryptoKeyBaseProperties = class(TPersistent)
  private
    FServer:    TCryptoKeyBase;
    function    GetDefaultInterface: ICryptoKeyBase;
    constructor Create(AServer: TCryptoKeyBase);
  protected
    function  Get_Size: Integer;
    function  Get_Valid(const Abonent: WideString): Integer;
    procedure Set_Valid(const Abonent: WideString; pVal: Integer);
  public
    property DefaultInterface: ICryptoKeyBase read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoCryptoSession.Create: ICryptoSession;
begin
  Result := CreateComObject(CLASS_CryptoSession) as ICryptoSession;
end;

class function CoCryptoSession.CreateRemote(const MachineName: string): ICryptoSession;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CryptoSession) as ICryptoSession;
end;

procedure TCryptoSession.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{83AEFBE3-2DE4-476A-B94F-09571D47D63B}';
    IntfIID:   '{8B2939AE-2F5B-4D00-86A5-5EFD43BAEC76}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCryptoSession.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICryptoSession;
  end;
end;

procedure TCryptoSession.ConnectTo(svrIntf: ICryptoSession);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCryptoSession.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCryptoSession.GetDefaultInterface: ICryptoSession;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCryptoSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCryptoSessionProperties.Create(Self);
{$ENDIF}
end;

destructor TCryptoSession.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCryptoSession.GetServerProperties: TCryptoSessionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TCryptoSession.Get_Abonent: WideString;
begin
  Result := DefaultInterface.Get_Abonent;
end;

procedure TCryptoSession.Init(const secret_key_path: WideString; 
                              const public_key_base_path: WideString);
begin
  DefaultInterface.Init(secret_key_path, public_key_base_path);
end;

procedure TCryptoSession.Sign(const pin: IStream; const pout: IStream);
begin
  DefaultInterface.Sign(pin, pout);
end;

procedure TCryptoSession.Decrypt(const pin: IStream; const pout: IStream);
begin
  DefaultInterface.Decrypt(pin, pout);
end;

procedure TCryptoSession.Encrypt(const pin: IStream; const abid: WideString; const pout: IStream);
begin
  DefaultInterface.Encrypt(pin, abid, pout);
end;

procedure TCryptoSession.CheckSign(const pin: IStream; const psign: IStream; out abid: WideString; 
                                   out result: WordBool);
begin
  DefaultInterface.CheckSign(pin, psign, abid, result);
end;

procedure TCryptoSession.Close;
begin
  DefaultInterface.Close;
end;

procedure TCryptoSession.CreateStreamOnMemory(out ppstream: IStream);
begin
  DefaultInterface.CreateStreamOnMemory(ppstream);
end;

procedure TCryptoSession.DeleteStreamOnMemory(const pstream: IStream);
begin
  DefaultInterface.DeleteStreamOnMemory(pstream);
end;

procedure TCryptoSession.InitEx(const section: WideString; const ini: WideString);
begin
  DefaultInterface.InitEx(section, ini);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCryptoSessionProperties.Create(AServer: TCryptoSession);
begin
  inherited Create;
  FServer := AServer;
end;

function TCryptoSessionProperties.GetDefaultInterface: ICryptoSession;
begin
  Result := FServer.DefaultInterface;
end;

function  TCryptoSessionProperties.Get_Abonent: WideString;
begin
  Result := DefaultInterface.Get_Abonent;
end;

{$ENDIF}

class function CoCryptoKey.Create: ICryptoKey;
begin
  Result := CreateComObject(CLASS_CryptoKey) as ICryptoKey;
end;

class function CoCryptoKey.CreateRemote(const MachineName: string): ICryptoKey;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CryptoKey) as ICryptoKey;
end;

procedure TCryptoKey.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D0CE60B3-6637-47EF-A55D-603E1B727FB5}';
    IntfIID:   '{29B8E4B2-1184-4781-A99E-A0082B2CA898}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCryptoKey.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICryptoKey;
  end;
end;

procedure TCryptoKey.ConnectTo(svrIntf: ICryptoKey);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCryptoKey.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCryptoKey.GetDefaultInterface: ICryptoKey;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCryptoKey.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCryptoKeyProperties.Create(Self);
{$ENDIF}
end;

destructor TCryptoKey.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCryptoKey.GetServerProperties: TCryptoKeyProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TCryptoKey.Get_Abonent: WideString;
begin
  Result := DefaultInterface.Get_Abonent;
end;

function  TCryptoKey.Get_description: WideString;
begin
  Result := DefaultInterface.Get_description;
end;

function  TCryptoKey.Get_Secret: Integer;
begin
  Result := DefaultInterface.Get_Secret;
end;

function  TCryptoKey.Get_expiration: TDateTime;
begin
  Result := DefaultInterface.Get_expiration;
end;

function  TCryptoKey.Get_Creation: TDateTime;
begin
  Result := DefaultInterface.Get_Creation;
end;

procedure TCryptoKey.Generate(const Abonent: WideString; const description: WideString; 
                              var expiration: TDateTime);
begin
  DefaultInterface.Generate(Abonent, description, expiration);
end;

procedure TCryptoKey.LoadFromStream(const stream: IStream);
begin
  DefaultInterface.LoadFromStream(stream);
end;

procedure TCryptoKey.LoadFromFile(const filename: WideString);
begin
  DefaultInterface.LoadFromFile(filename);
end;

procedure TCryptoKey.LoadFromBase(const base: ICryptoKeyBase; const Abonent: WideString);
begin
  DefaultInterface.LoadFromBase(base, Abonent);
end;

procedure TCryptoKey.SaveToStream(const stream: IStream);
begin
  DefaultInterface.SaveToStream(stream);
end;

procedure TCryptoKey.SaveToFile(const filename: WideString);
begin
  DefaultInterface.SaveToFile(filename);
end;

procedure TCryptoKey.SaveToBase(const base: ICryptoKeyBase);
begin
  DefaultInterface.SaveToBase(base);
end;

procedure TCryptoKey.PublicDump(const stream: IStream);
begin
  DefaultInterface.PublicDump(stream);
end;

procedure TCryptoKey.GetPublic(out pub_key: ICryptoKey);
begin
  DefaultInterface.GetPublic(pub_key);
end;

procedure TCryptoKey.Certify;
begin
  DefaultInterface.Certify;
end;

procedure TCryptoKey.CheckCertification(out result: WordBool);
begin
  DefaultInterface.CheckCertification(result);
end;

procedure TCryptoKey.DeleteCertification;
begin
  DefaultInterface.DeleteCertification;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCryptoKeyProperties.Create(AServer: TCryptoKey);
begin
  inherited Create;
  FServer := AServer;
end;

function TCryptoKeyProperties.GetDefaultInterface: ICryptoKey;
begin
  Result := FServer.DefaultInterface;
end;

function  TCryptoKeyProperties.Get_Abonent: WideString;
begin
  Result := DefaultInterface.Get_Abonent;
end;

function  TCryptoKeyProperties.Get_description: WideString;
begin
  Result := DefaultInterface.Get_description;
end;

function  TCryptoKeyProperties.Get_Secret: Integer;
begin
  Result := DefaultInterface.Get_Secret;
end;

function  TCryptoKeyProperties.Get_expiration: TDateTime;
begin
  Result := DefaultInterface.Get_expiration;
end;

function  TCryptoKeyProperties.Get_Creation: TDateTime;
begin
  Result := DefaultInterface.Get_Creation;
end;

{$ENDIF}

class function CoCryptoKeyBase.Create: ICryptoKeyBase;
begin
  Result := CreateComObject(CLASS_CryptoKeyBase) as ICryptoKeyBase;
end;

class function CoCryptoKeyBase.CreateRemote(const MachineName: string): ICryptoKeyBase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CryptoKeyBase) as ICryptoKeyBase;
end;

procedure TCryptoKeyBase.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8554472B-75C5-4EEE-8C44-03DB5E05229A}';
    IntfIID:   '{09375792-0EDE-4F89-8776-C38CEFC04CA8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCryptoKeyBase.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICryptoKeyBase;
  end;
end;

procedure TCryptoKeyBase.ConnectTo(svrIntf: ICryptoKeyBase);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCryptoKeyBase.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCryptoKeyBase.GetDefaultInterface: ICryptoKeyBase;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCryptoKeyBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCryptoKeyBaseProperties.Create(Self);
{$ENDIF}
end;

destructor TCryptoKeyBase.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCryptoKeyBase.GetServerProperties: TCryptoKeyBaseProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TCryptoKeyBase.Get_Size: Integer;
begin
  Result := DefaultInterface.Get_Size;
end;

function  TCryptoKeyBase.Get_Valid(const Abonent: WideString): Integer;
begin
  Result := DefaultInterface.Get_Valid(Abonent);
end;

procedure TCryptoKeyBase.Set_Valid(const Abonent: WideString; pVal: Integer);
begin
  DefaultInterface.Set_Valid(Abonent, pVal);
end;

procedure TCryptoKeyBase.Open(const path: WideString);
begin
  DefaultInterface.Open(path);
end;

procedure TCryptoKeyBase.Close;
begin
  DefaultInterface.Close;
end;

procedure TCryptoKeyBase.GetKey(const Abonent: WideString; out ppkey: ICryptoKey);
begin
  DefaultInterface.GetKey(Abonent, ppkey);
end;

procedure TCryptoKeyBase.Add(const pikey: ICryptoKey);
begin
  DefaultInterface.Add(pikey);
end;

procedure TCryptoKeyBase.Remove(const Abonent: WideString);
begin
  DefaultInterface.Remove(Abonent);
end;

procedure TCryptoKeyBase.MoveFirst;
begin
  DefaultInterface.MoveFirst;
end;

procedure TCryptoKeyBase.MoveNext(out ppkey: ICryptoKey);
begin
  DefaultInterface.MoveNext(ppkey);
end;

procedure TCryptoKeyBase.Generate(const path: WideString);
begin
  DefaultInterface.Generate(path);
end;

procedure TCryptoKeyBase.Certify(const Abonent: WideString);
begin
  DefaultInterface.Certify(Abonent);
end;

procedure TCryptoKeyBase.CheckCertification(const Abonent: WideString; out result: WordBool);
begin
  DefaultInterface.CheckCertification(Abonent, result);
end;

procedure TCryptoKeyBase.DeleteCertification(const Abonent: WideString);
begin
  DefaultInterface.DeleteCertification(Abonent);
end;

procedure TCryptoKeyBase.OpenExclusive(const path: WideString);
begin
  DefaultInterface.OpenExclusive(path);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCryptoKeyBaseProperties.Create(AServer: TCryptoKeyBase);
begin
  inherited Create;
  FServer := AServer;
end;

function TCryptoKeyBaseProperties.GetDefaultInterface: ICryptoKeyBase;
begin
  Result := FServer.DefaultInterface;
end;

function  TCryptoKeyBaseProperties.Get_Size: Integer;
begin
  Result := DefaultInterface.Get_Size;
end;

function  TCryptoKeyBaseProperties.Get_Valid(const Abonent: WideString): Integer;
begin
  Result := DefaultInterface.Get_Valid(Abonent);
end;

procedure TCryptoKeyBaseProperties.Set_Valid(const Abonent: WideString; pVal: Integer);
begin
  DefaultInterface.Set_Valid(Abonent, pVal);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Smart',[TCryptoSession, TCryptoKey, TCryptoKeyBase]);
end;

end.
