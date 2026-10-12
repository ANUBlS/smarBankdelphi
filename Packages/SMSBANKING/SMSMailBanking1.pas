// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.0.126:8080/MessageBanking/SMSMailBanking?WSDL
//  >Import : http://192.168.0.126:8080/MessageBanking/SMSMailBanking?WSDL>0
//  >Import : http://192.168.0.126:8080/MessageBanking/SMSMailBanking?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (09-12-2011 17:15:26 - - $Rev: 34800 $)
// ************************************************************************ //

unit SMSMailBanking1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://sms.messagebanking.smart.az/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SMSMailBankingPortBinding
  // service   : SMSMailBanking
  // port      : SMSMailBankingPort
  // URL       : http://192.168.0.126:8080/MessageBanking/SMSMailBanking
  // ************************************************************************ //
  SMSMailBanking = interface(IInvokable)
  ['{0B325B77-715A-6058-C32F-96188D799F05}']
    function  sendSMSMail(const username: string; const genMD5: string; const distype: Integer; const msgtype: Integer; const target: string; const dateTime: string; 
                          const double1: string; const double2: string; const double3: string; const double4: string; const double5: string;
                          const int1: string; const int2: string; const int3: string; const date1: string; const date2: string;
                          const date3: string; const string1: string; const string2: string; const string3: string): string; stdcall;
    function  hello(const name_: string): string; stdcall;
    function  helloSample(const name_: string): string; stdcall;
  end;

function GetSMSMailBanking(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SMSMailBanking;


implementation
  uses SysUtils;

function GetSMSMailBanking(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SMSMailBanking;
const
  defWSDL = 'http://192.168.0.126:8080/MessageBanking/SMSMailBanking?WSDL';
  defURL  = 'http://192.168.0.126:8080/MessageBanking/SMSMailBanking';
  defSvc  = 'SMSMailBanking';
  defPrt  = 'SMSMailBankingPort';
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
    Result := (RIO as SMSMailBanking);
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


initialization
  { SMSMailBanking }
  InvRegistry.RegisterInterface(TypeInfo(SMSMailBanking), 'http://sms.messagebanking.smart.az/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SMSMailBanking), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SMSMailBanking), ioDocument);
  { SMSMailBanking.sendSMSMail }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'username', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'genMD5', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'distype', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'msgtype', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'target', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'dateTime', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'double1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'double2', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'double3', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'double4', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'double5', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'int1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'int2', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'int3', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'date1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'date2', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'date3', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'string1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'string2', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'string3', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'sendSMSMail', 'return', '',
                                '', IS_UNQL);
  { SMSMailBanking.hello }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSMailBanking), 'hello', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'hello', 'name_', 'name',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'hello', 'return', '',
                                '', IS_UNQL);
  { SMSMailBanking.helloSample }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMSMailBanking), 'helloSample', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'helloSample', 'name_', 'name',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMSMailBanking), 'helloSample', 'return', '',
                                '', IS_UNQL);

end.