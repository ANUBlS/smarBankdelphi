unit Budcet_new_TLB;

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

// $Rev: 34747 $
// File generated on 02.09.2013 10:23:09 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Smart-Bank\Source\Packages\BudgetMgr_new\Budcet_new (1)
// LIBID: {136432AB-2A3E-454E-9F92-3E6E324F7DBC}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\Program Files\Embarcadero\RAD Studio\8.0\bin\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Budcet_newMajorVersion = 1;
  Budcet_newMinorVersion = 0;

  LIBID_Budcet_new: TGUID = '{136432AB-2A3E-454E-9F92-3E6E324F7DBC}';

  IID_IBudcet_new: TGUID = '{AA10F262-7192-43DF-8C03-7012AE034B15}';
  DIID_IBudcet_newEvents: TGUID = '{2380C0F3-5054-4292-9637-644CF7A2CA64}';
  CLASS_Budcet_new_: TGUID = '{51514C8F-E2A6-4075-98AF-C61B1AB4CB5F}';
  IID_IMainForm: TGUID = '{4DF0AE85-32ED-4DF2-A2FC-45C8DA476D96}';
  DIID_IMainFormEvents: TGUID = '{2EE39C1D-430B-4249-B420-EC62D20C8EE8}';
  CLASS_MainForm: TGUID = '{6932F898-EC43-4C97-AC7A-85699F2CE8A8}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum TxDragMode
type
  TxDragMode = TOleEnum;
const
  dmManual = $00000000;
  dmAutomatic = $00000001;

// Constants for enum TxBitBtnKind
type
  TxBitBtnKind = TOleEnum;
const
  bkCustom = $00000000;
  bkOK = $00000001;
  bkCancel = $00000002;
  bkHelp = $00000003;
  bkYes = $00000004;
  bkNo = $00000005;
  bkClose = $00000006;
  bkAbort = $00000007;
  bkRetry = $00000008;
  bkIgnore = $00000009;
  bkAll = $0000000A;

// Constants for enum TxButtonLayout
type
  TxButtonLayout = TOleEnum;
const
  blGlyphLeft = $00000000;
  blGlyphRight = $00000001;
  blGlyphTop = $00000002;
  blGlyphBottom = $00000003;

// Constants for enum TxButtonStyle
type
  TxButtonStyle = TOleEnum;
const
  bsAutoDetect = $00000000;
  bsWin31 = $00000001;
  bsNew = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

// Constants for enum TxImageAlignment
type
  TxImageAlignment = TOleEnum;
const
  iaLeft = $00000000;
  iaRight = $00000001;
  iaTop = $00000002;
  iaBottom = $00000003;
  iaCenter = $00000004;

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

// Constants for enum TxPopupMode
type
  TxPopupMode = TOleEnum;
const
  pmNone = $00000000;
  pmAuto = $00000001;
  pmExplicit = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IBudcet_new = interface;
  IBudcet_newDisp = dispinterface;
  IBudcet_newEvents = dispinterface;
  IMainForm = interface;
  IMainFormDisp = dispinterface;
  IMainFormEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  Budcet_new_ = IBudcet_new;
  MainForm = IMainForm;


// *********************************************************************//
// Declaration of structures, unions and aliases.
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}


// *********************************************************************//
// Interface: IBudcet_new
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AA10F262-7192-43DF-8C03-7012AE034B15}
// *********************************************************************//
  IBudcet_new = interface(IDispatch)
    ['{AA10F262-7192-43DF-8C03-7012AE034B15}']
    function Get_Cancel: WordBool; safecall;
    procedure Set_Cancel(Value: WordBool); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Default: WordBool; safecall;
    procedure Set_Default(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_Kind: TxBitBtnKind; safecall;
    procedure Set_Kind(Value: TxBitBtnKind); safecall;
    function Get_Layout: TxButtonLayout; safecall;
    procedure Set_Layout(Value: TxButtonLayout); safecall;
    function Get_Margin: Integer; safecall;
    procedure Set_Margin(Value: Integer); safecall;
    function Get_NumGlyphs: Smallint; safecall;
    procedure Set_NumGlyphs(Value: Smallint); safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    function Get_Style: TxButtonStyle; safecall;
    procedure Set_Style(Value: TxButtonStyle); safecall;
    function Get_Spacing: Integer; safecall;
    procedure Set_Spacing(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_WordWrap: WordBool; safecall;
    procedure Set_WordWrap(Value: WordBool); safecall;
    function Get_CommandLinkHint: WideString; safecall;
    procedure Set_CommandLinkHint(const Value: WideString); safecall;
    function Get_DisabledImageIndex: Integer; safecall;
    procedure Set_DisabledImageIndex(Value: Integer); safecall;
    function Get_ElevationRequired: WordBool; safecall;
    procedure Set_ElevationRequired(Value: WordBool); safecall;
    function Get_HotImageIndex: Integer; safecall;
    procedure Set_HotImageIndex(Value: Integer); safecall;
    function Get_ImageAlignment: TxImageAlignment; safecall;
    procedure Set_ImageAlignment(Value: TxImageAlignment); safecall;
    function Get_ImageIndex: Integer; safecall;
    procedure Set_ImageIndex(Value: Integer); safecall;
    function Get_PressedImageIndex: Integer; safecall;
    procedure Set_PressedImageIndex(Value: Integer); safecall;
    function Get_SelectedImageIndex: Integer; safecall;
    procedure Set_SelectedImageIndex(Value: Integer); safecall;
    function Get_StylusHotImageIndex: Integer; safecall;
    procedure Set_StylusHotImageIndex(Value: Integer); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure SetDesignVisible(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure SetSubComponent(IsSubComponent: WordBool); safecall;
    property Cancel: WordBool read Get_Cancel write Set_Cancel;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Default: WordBool read Get_Default write Set_Default;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write Set_Font;
    property Kind: TxBitBtnKind read Get_Kind write Set_Kind;
    property Layout: TxButtonLayout read Get_Layout write Set_Layout;
    property Margin: Integer read Get_Margin write Set_Margin;
    property NumGlyphs: Smallint read Get_NumGlyphs write Set_NumGlyphs;
    property ParentDoubleBuffered: WordBool read Get_ParentDoubleBuffered write Set_ParentDoubleBuffered;
    property Style: TxButtonStyle read Get_Style write Set_Style;
    property Spacing: Integer read Get_Spacing write Set_Spacing;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property WordWrap: WordBool read Get_WordWrap write Set_WordWrap;
    property CommandLinkHint: WideString read Get_CommandLinkHint write Set_CommandLinkHint;
    property DisabledImageIndex: Integer read Get_DisabledImageIndex write Set_DisabledImageIndex;
    property ElevationRequired: WordBool read Get_ElevationRequired write Set_ElevationRequired;
    property HotImageIndex: Integer read Get_HotImageIndex write Set_HotImageIndex;
    property ImageAlignment: TxImageAlignment read Get_ImageAlignment write Set_ImageAlignment;
    property ImageIndex: Integer read Get_ImageIndex write Set_ImageIndex;
    property PressedImageIndex: Integer read Get_PressedImageIndex write Set_PressedImageIndex;
    property SelectedImageIndex: Integer read Get_SelectedImageIndex write Set_SelectedImageIndex;
    property StylusHotImageIndex: Integer read Get_StylusHotImageIndex write Set_StylusHotImageIndex;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property MouseInClient: WordBool read Get_MouseInClient;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property UseDockManager: WordBool read Get_UseDockManager write Set_UseDockManager;
    property ExplicitLeft: Integer read Get_ExplicitLeft;
    property ExplicitTop: Integer read Get_ExplicitTop;
    property ExplicitWidth: Integer read Get_ExplicitWidth;
    property ExplicitHeight: Integer read Get_ExplicitHeight;
    property AlignWithMargins: WordBool read Get_AlignWithMargins write Set_AlignWithMargins;
    property ParentCustomHint: WordBool read Get_ParentCustomHint write Set_ParentCustomHint;
  end;

// *********************************************************************//
// DispIntf:  IBudcet_newDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AA10F262-7192-43DF-8C03-7012AE034B15}
// *********************************************************************//
  IBudcet_newDisp = dispinterface
    ['{AA10F262-7192-43DF-8C03-7012AE034B15}']
    property Cancel: WordBool dispid 201;
    property Caption: WideString dispid -518;
    property Default: WordBool dispid 202;
    property DoubleBuffered: WordBool dispid 203;
    property DragCursor: Smallint dispid 204;
    property DragMode: TxDragMode dispid 205;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property Kind: TxBitBtnKind dispid 206;
    property Layout: TxButtonLayout dispid 207;
    property Margin: Integer dispid 208;
    property NumGlyphs: Smallint dispid 209;
    property ParentDoubleBuffered: WordBool dispid 210;
    property Style: TxButtonStyle dispid 211;
    property Spacing: Integer dispid 212;
    property Visible: WordBool dispid 213;
    property WordWrap: WordBool dispid 214;
    property CommandLinkHint: WideString dispid 215;
    property DisabledImageIndex: Integer dispid 216;
    property ElevationRequired: WordBool dispid 217;
    property HotImageIndex: Integer dispid 218;
    property ImageAlignment: TxImageAlignment dispid 219;
    property ImageIndex: Integer dispid 220;
    property PressedImageIndex: Integer dispid 221;
    property SelectedImageIndex: Integer dispid 222;
    property StylusHotImageIndex: Integer dispid 223;
    property DockSite: WordBool dispid 224;
    procedure SetDesignVisible(Value: WordBool); dispid 225;
    property AlignDisabled: WordBool readonly dispid 226;
    property MouseInClient: WordBool readonly dispid 227;
    property VisibleDockClientCount: Integer readonly dispid 228;
    property UseDockManager: WordBool dispid 229;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 230;
    procedure InitiateAction; dispid 231;
    function IsRightToLeft: WordBool; dispid 232;
    function UseRightToLeftReading: WordBool; dispid 233;
    function UseRightToLeftScrollBar: WordBool; dispid 234;
    property ExplicitLeft: Integer readonly dispid 235;
    property ExplicitTop: Integer readonly dispid 236;
    property ExplicitWidth: Integer readonly dispid 237;
    property ExplicitHeight: Integer readonly dispid 238;
    property AlignWithMargins: WordBool dispid 239;
    property ParentCustomHint: WordBool dispid 240;
    procedure SetSubComponent(IsSubComponent: WordBool); dispid 241;
  end;

// *********************************************************************//
// DispIntf:  IBudcet_newEvents
// Flags:     (0)
// GUID:      {2380C0F3-5054-4292-9637-644CF7A2CA64}
// *********************************************************************//
  IBudcet_newEvents = dispinterface
    ['{2380C0F3-5054-4292-9637-644CF7A2CA64}']
    procedure OnClick; dispid 201;
    procedure OnKeyPress(var Key: Smallint); dispid 202;
    procedure OnMouseEnter; dispid 203;
    procedure OnMouseLeave; dispid 204;
  end;

// *********************************************************************//
// Interface: IMainForm
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DF0AE85-32ED-4DF2-A2FC-45C8DA476D96}
// *********************************************************************//
  IMainForm = interface(IDispatch)
    ['{4DF0AE85-32ED-4DF2-A2FC-45C8DA476D96}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_BorderWidth: Integer; safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
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
    function Get_PopupMode: TxPopupMode; safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    function Get_UseDockManager: WordBool; safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property BorderWidth: Integer read Get_BorderWidth write Set_BorderWidth;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property PopupMode: TxPopupMode read Get_PopupMode write Set_PopupMode;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property MouseInClient: WordBool read Get_MouseInClient;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property ParentDoubleBuffered: WordBool read Get_ParentDoubleBuffered write Set_ParentDoubleBuffered;
    property UseDockManager: WordBool read Get_UseDockManager write Set_UseDockManager;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property ExplicitLeft: Integer read Get_ExplicitLeft;
    property ExplicitTop: Integer read Get_ExplicitTop;
    property ExplicitWidth: Integer read Get_ExplicitWidth;
    property ExplicitHeight: Integer read Get_ExplicitHeight;
    property AlignWithMargins: WordBool read Get_AlignWithMargins write Set_AlignWithMargins;
    property ParentCustomHint: WordBool read Get_ParentCustomHint write Set_ParentCustomHint;
  end;

// *********************************************************************//
// DispIntf:  IMainFormDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DF0AE85-32ED-4DF2-A2FC-45C8DA476D96}
// *********************************************************************//
  IMainFormDisp = dispinterface
    ['{4DF0AE85-32ED-4DF2-A2FC-45C8DA476D96}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property BorderWidth: Integer dispid 205;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 206;
    property PixelsPerInch: Integer dispid 207;
    property PrintScale: TxPrintScale dispid 208;
    property Scaled: WordBool dispid 209;
    property Active: WordBool readonly dispid 210;
    property DropTarget: WordBool dispid 211;
    property HelpFile: WideString dispid 212;
    property PopupMode: TxPopupMode dispid 213;
    property ScreenSnap: WordBool dispid 214;
    property SnapBuffer: Integer dispid 215;
    property DockSite: WordBool dispid 216;
    property DoubleBuffered: WordBool dispid 217;
    property AlignDisabled: WordBool readonly dispid 218;
    property MouseInClient: WordBool readonly dispid 219;
    property VisibleDockClientCount: Integer readonly dispid 220;
    property ParentDoubleBuffered: WordBool dispid 221;
    property UseDockManager: WordBool dispid 222;
    property Enabled: WordBool dispid -514;
    property ExplicitLeft: Integer readonly dispid 223;
    property ExplicitTop: Integer readonly dispid 224;
    property ExplicitWidth: Integer readonly dispid 225;
    property ExplicitHeight: Integer readonly dispid 226;
    property AlignWithMargins: WordBool dispid 227;
    property ParentCustomHint: WordBool dispid 228;
  end;

// *********************************************************************//
// DispIntf:  IMainFormEvents
// Flags:     (0)
// GUID:      {2EE39C1D-430B-4249-B420-EC62D20C8EE8}
// *********************************************************************//
  IMainFormEvents = dispinterface
    ['{2EE39C1D-430B-4249-B420-EC62D20C8EE8}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnMouseEnter; dispid 208;
    procedure OnMouseLeave; dispid 209;
    procedure OnPaint; dispid 210;
  end;

implementation

uses ComObj;

end.

