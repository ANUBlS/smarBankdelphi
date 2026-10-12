unit P_Customers_TLB;

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
// File generated on 09-Nov-2006 9:42:07 AM from Type Library described below.

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
// Type Lib: C:\Documents and Settings\Administrator\Desktop\f_cust\P_Customers.tlb (1)
// IID\LCID: {3F29BCBB-3260-4013-964A-44401599907A}\0
// Helpfile:
// DepndLst:
// (1) v2.0 stdole, (C:\WINNT\system32\stdole2.tlb)
// (2) v4.0 StdVCL, (C:\WINNT\system32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.

interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
// Type Libraries     : LIBID_xxxx
// CoClasses          : CLASS_xxxx
// DISPInterfaces     : DIID_xxxx
// Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  P_CustomersMajorVersion = 1;
  P_CustomersMinorVersion = 0;

  LIBID_P_Customers: TGUID = '{3F29BCBB-3260-4013-964A-44401599907A}';

  IID_IActiveFormX: TGUID = '{E0FD179D-2FA0-4BF6-A006-12746D82C0BA}';
  DIID_IActiveFormXEvents: TGUID = '{116529D0-87C1-45C6-A9AF-83211D6D4B78}';
  CLASS_P_Customers_Form: TGUID = '{831E1831-3FE1-41EA-9D02-ED1F8BB5C6ED}';

  // *********************************************************************//
  // Declaration of Enumerations defined in Type Library
  // *********************************************************************//
  // Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;

const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

  // Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;

const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

  // Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;

const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

  // *********************************************************************//
  // Forward declaration of types defined in TypeLibrary
  // *********************************************************************//
  IActiveFormX = interface;
  IActiveFormXDisp = dispinterface;
  IActiveFormXEvents = dispinterface;

  // *********************************************************************//
  // Declaration of CoClasses defined in Type Library
  // (NOTE: Here we map each CoClass to its Default Interface)
  // *********************************************************************//
  P_Customers_Form = IActiveFormX;

  // *********************************************************************//
  // Declaration of structures, unions and aliases.
  // *********************************************************************//
  PPUserType1 = ^IFontDisp; { * }

  // *********************************************************************//
  // Interface: IActiveFormX
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {E0FD179D-2FA0-4BF6-A006-12746D82C0BA}
  // *********************************************************************//
  IActiveFormX = interface(IDispatch)
    ['{E0FD179D-2FA0-4BF6-A006-12746D82C0BA}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle
      write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch
      write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property DoubleBuffered: WordBool read Get_DoubleBuffered
      write Set_DoubleBuffered;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

  // *********************************************************************//
  // DispIntf:  IActiveFormXDisp
  // Flags:     (4416) Dual OleAutomation Dispatchable
  // GUID:      {E0FD179D-2FA0-4BF6-A006-12746D82C0BA}
  // *********************************************************************//
  IActiveFormXDisp = dispinterface
    ['{E0FD179D-2FA0-4BF6-A006-12746D82C0BA}']
    property Visible: WordBool dispid 1;
    property AutoScroll: WordBool dispid 2;
    property AutoSize: WordBool dispid 3;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 4;
    property Caption: WideString dispid - 518;
    property Color: OLE_COLOR dispid - 501;
    property Font: IFontDisp dispid - 512;
    property KeyPreview: WordBool dispid 5;
    property PixelsPerInch: Integer dispid 6;
    property PrintScale: TxPrintScale dispid 7;
    property Scaled: WordBool dispid 8;
    property Active: WordBool readonly dispid 9;
    property DropTarget: WordBool dispid 10;
    property HelpFile: WideString dispid 11;
    property DoubleBuffered: WordBool dispid 12;
    property VisibleDockClientCount: Integer readonly dispid 13;
    property Enabled: WordBool dispid - 514;
    property Cursor: Smallint dispid 14;
  end;

  // *********************************************************************//
  // DispIntf:  IActiveFormXEvents
  // Flags:     (0)
  // GUID:      {116529D0-87C1-45C6-A9AF-83211D6D4B78}
  // *********************************************************************//
  IActiveFormXEvents = dispinterface
    ['{116529D0-87C1-45C6-A9AF-83211D6D4B78}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 5;
    procedure OnDestroy; dispid 6;
    procedure OnDeactivate; dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnPaint; dispid 16;
  end;

  // *********************************************************************//
  // OLE Control Proxy class declaration
  // Control Name     : TP_Customers_Form
  // Help String      : ActiveFormX Control
  // Default Interface: IActiveFormX
  // Def. Intf. DISP? : No
  // Event   Interface: IActiveFormXEvents
  // TypeFlags        : (34) CanCreate Control
  // *********************************************************************//
  TP_Customers_FormOnKeyPress = procedure(Sender: TObject; var Key: Smallint)
    of object;

  TP_Customers_Form = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TP_Customers_FormOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IActiveFormX;
    function GetControlInterface: IActiveFormX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property ControlInterface: IActiveFormX read GetControlInterface;
    property DefaultInterface: IActiveFormX read GetControlInterface;
    property Visible: WordBool index 1 read GetWordBoolProp
      write SetWordBoolProp;
    property Active: WordBool index 9 read GetWordBoolProp;
    property DropTarget: WordBool index 10 read GetWordBoolProp
      write SetWordBoolProp;
    property HelpFile: WideString index 11 read GetWideStringProp
      write SetWideStringProp;
    property DoubleBuffered: WordBool index 12 read GetWordBoolProp
      write SetWordBoolProp;
    property VisibleDockClientCount: Integer index 13 read GetIntegerProp;
    property Enabled: WordBool index - 514 read GetWordBoolProp
      write SetWordBoolProp;
  published
    property AutoScroll: WordBool index 2 read GetWordBoolProp
      write SetWordBoolProp stored False;
    property AutoSize: WordBool index 3 read GetWordBoolProp
      write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 4 read GetTOleEnumProp
      write SetTOleEnumProp stored False;
    property Caption: WideString index - 518 read GetWideStringProp
      write SetWideStringProp stored False;
    property Color: TColor index - 501 read GetTColorProp write SetTColorProp
      stored False;
    property Font: TFont index - 512 read GetTFontProp write SetTFontProp
      stored False;
    property KeyPreview: WordBool index 5 read GetWordBoolProp
      write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 6 read GetIntegerProp
      write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 7 read GetTOleEnumProp
      write SetTOleEnumProp stored False;
    property Scaled: WordBool index 8 read GetWordBoolProp write SetWordBoolProp
      stored False;
    property Cursor: Smallint index 14 read GetSmallintProp
      write SetSmallintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TP_Customers_FormOnKeyPress read FOnKeyPress
      write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

implementation

uses ComObj;

procedure TP_Customers_Form.InitControlData;
const
  CEventDispIDs: array [0 .. 7] of DWORD = ($00000001, $00000002, $00000003,
    $00000005, $00000006, $00000007, $0000000B, $00000010);
  CTFontIDs: array [0 .. 0] of DWORD = ($FFFFFE00);
  CControlData: TControlData2 = (ClassID
    : '{831E1831-3FE1-41EA-9D02-ED1F8BB5C6ED}';
    EventIID: '{116529D0-87C1-45C6-A9AF-83211D6D4B78}'; EventCount: 8;
    EventDispIDs: @CEventDispIDs; LicenseKey: nil (* HR:$80040154 *);
    Flags: $0000001D; Version: 401; FontCount: 1; FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) -
    Cardinal(Self);
end;

procedure TP_Customers_Form.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IActiveFormX;
  end;

begin
  if FIntf = nil then
    DoCreate;
end;

function TP_Customers_Form.GetControlInterface: IActiveFormX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure Register;
begin
  RegisterComponents('ActiveX', [TP_Customers_Form]);
end;

end.
