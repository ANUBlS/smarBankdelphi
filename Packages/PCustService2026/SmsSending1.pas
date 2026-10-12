// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.2.218:8080/SmsSending/SmsSending?WSDL
//  >Import : http://192.168.2.218:8080/SmsSending/SmsSending?WSDL>0
//  >Import : http://192.168.2.218:8080/SmsSending/SmsSending?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (16.01.2015 16:57:02 - - $Rev: 34800 $)
// ************************************************************************ //

unit SmsSending1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  stackTraceElement    = class;                 { "http://sms.vsl.az/"[GblCplx] }
  IOException2         = class;                 { "http://sms.vsl.az/"[GblCplx] }
  IOException          = class;                 { "http://sms.vsl.az/"[Flt][GblElm] }
  JAXBException        = class;                 { "http://sms.vsl.az/"[Flt][GblElm] }
  JAXBException2       = class;                 { "http://sms.vsl.az/"[GblCplx] }



  // ************************************************************************ //
  // XML       : stackTraceElement, global, <complexType>
  // Namespace : http://sms.vsl.az/
  // ************************************************************************ //
  stackTraceElement = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : IOException, global, <complexType>
  // Namespace : http://sms.vsl.az/
  // ************************************************************************ //
  IOException2 = class(TRemotable)
  private
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  published
    property message_: string  Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;



  // ************************************************************************ //
  // XML       : IOException, global, <element>
  // Namespace : http://sms.vsl.az/
  // Info      : Fault
  // Base Types: IOException
  // ************************************************************************ //
  IOException = class(ERemotableException)
  private
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  published
    property message_: string  Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;

  throwable  = array of stackTraceElement;      { "http://sms.vsl.az/"[GblCplx] }


  // ************************************************************************ //
  // XML       : JAXBException, global, <element>
  // Namespace : http://sms.vsl.az/
  // Info      : Fault
  // Base Types: JAXBException
  // ************************************************************************ //
  JAXBException = class(ERemotableException)
  private
    FerrorCode: string;
    FerrorCode_Specified: boolean;
    FlinkedException: throwable;
    FlinkedException_Specified: boolean;
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure SeterrorCode(Index: Integer; const Astring: string);
    function  errorCode_Specified(Index: Integer): boolean;
    procedure SetlinkedException(Index: Integer; const Athrowable: throwable);
    function  linkedException_Specified(Index: Integer): boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property errorCode:       string     Index (IS_OPTN or IS_UNQL) read FerrorCode write SeterrorCode stored errorCode_Specified;
    property linkedException: throwable  Index (IS_OPTN or IS_UNQL) read FlinkedException write SetlinkedException stored linkedException_Specified;
    property message_:        string     Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;



  // ************************************************************************ //
  // XML       : JAXBException, global, <complexType>
  // Namespace : http://sms.vsl.az/
  // ************************************************************************ //
  JAXBException2 = class(TRemotable)
  private
    FerrorCode: string;
    FerrorCode_Specified: boolean;
    FlinkedException: throwable;
    FlinkedException_Specified: boolean;
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure SeterrorCode(Index: Integer; const Astring: string);
    function  errorCode_Specified(Index: Integer): boolean;
    procedure SetlinkedException(Index: Integer; const Athrowable: throwable);
    function  linkedException_Specified(Index: Integer): boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property errorCode:       string     Index (IS_OPTN or IS_UNQL) read FerrorCode write SeterrorCode stored errorCode_Specified;
    property linkedException: throwable  Index (IS_OPTN or IS_UNQL) read FlinkedException write SetlinkedException stored linkedException_Specified;
    property message_:        string     Index (IS_OPTN or IS_UNQL) read Fmessage_ write Setmessage_ stored message__Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://sms.vsl.az/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SmsSendingPortBinding
  // service   : SmsSending
  // port      : SmsSendingPort
  // URL       : http://192.168.2.218:8080/SmsSending/SmsSending
  // ************************************************************************ //
  SmsSending = interface(IInvokable)
  ['{389AD8FE-B0CC-57DC-93F7-8AFC9C4E1831}']
    procedure test; stdcall;
    function  send(const xml: string): string; stdcall;
  end;

function GetSmsSending(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SmsSending;


implementation
  uses SysUtils;

function GetSmsSending(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SmsSending;
const
  defWSDL = 'http://192.168.2.218:8080/SmsSending/SmsSending?WSDL';
  defURL  = 'http://192.168.2.218:8080/SmsSending/SmsSending';
  defSvc  = 'SmsSending';
  defPrt  = 'SmsSendingPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SmsSending);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure IOException2.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function IOException2.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

procedure IOException.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function IOException.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

destructor JAXBException.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FlinkedException)-1 do
    SysUtils.FreeAndNil(FlinkedException[I]);
  System.SetLength(FlinkedException, 0);
  inherited Destroy;
end;

procedure JAXBException.SeterrorCode(Index: Integer; const Astring: string);
begin
  FerrorCode := Astring;
  FerrorCode_Specified := True;
end;

function JAXBException.errorCode_Specified(Index: Integer): boolean;
begin
  Result := FerrorCode_Specified;
end;

procedure JAXBException.SetlinkedException(Index: Integer; const Athrowable: throwable);
begin
  FlinkedException := Athrowable;
  FlinkedException_Specified := True;
end;

function JAXBException.linkedException_Specified(Index: Integer): boolean;
begin
  Result := FlinkedException_Specified;
end;

procedure JAXBException.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function JAXBException.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

destructor JAXBException2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FlinkedException)-1 do
    SysUtils.FreeAndNil(FlinkedException[I]);
  System.SetLength(FlinkedException, 0);
  inherited Destroy;
end;

procedure JAXBException2.SeterrorCode(Index: Integer; const Astring: string);
begin
  FerrorCode := Astring;
  FerrorCode_Specified := True;
end;

function JAXBException2.errorCode_Specified(Index: Integer): boolean;
begin
  Result := FerrorCode_Specified;
end;

procedure JAXBException2.SetlinkedException(Index: Integer; const Athrowable: throwable);
begin
  FlinkedException := Athrowable;
  FlinkedException_Specified := True;
end;

function JAXBException2.linkedException_Specified(Index: Integer): boolean;
begin
  Result := FlinkedException_Specified;
end;

procedure JAXBException2.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function JAXBException2.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

initialization
  { SmsSending }
  InvRegistry.RegisterInterface(TypeInfo(SmsSending), 'http://sms.vsl.az/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SmsSending), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SmsSending), ioDocument);
  { SmsSending.send }
  InvRegistry.RegisterMethodInfo(TypeInfo(SmsSending), 'send', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmsSending), 'send', 'xml', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmsSending), 'send', 'return', '',
                                '', IS_UNQL);
  RemClassRegistry.RegisterXSClass(stackTraceElement, 'http://sms.vsl.az/', 'stackTraceElement');
  RemClassRegistry.RegisterXSClass(IOException2, 'http://sms.vsl.az/', 'IOException2', 'IOException');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IOException2), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSClass(IOException, 'http://sms.vsl.az/', 'IOException');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IOException), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(throwable), 'http://sms.vsl.az/', 'throwable');
  RemClassRegistry.RegisterXSClass(JAXBException, 'http://sms.vsl.az/', 'JAXBException');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(JAXBException), 'linkedException', '[ArrayItemName="stackTrace"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(JAXBException), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSClass(JAXBException2, 'http://sms.vsl.az/', 'JAXBException2', 'JAXBException');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(JAXBException2), 'linkedException', '[ArrayItemName="stackTrace"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(JAXBException2), 'message_', '[ExtName="message"]');

end.