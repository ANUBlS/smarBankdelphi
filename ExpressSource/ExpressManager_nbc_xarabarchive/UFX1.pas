// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.4.175:8080/UFXOnline/UFX?WSDL
//  >Import : http://192.168.4.175:8080/UFXOnline/UFX?WSDL>0
//  >Import : http://192.168.4.175:8080/UFXOnline/UFX?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (03.10.2017 12:31:27 - - $Rev: 34800 $)
// ************************************************************************ //

unit UFX1;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://ws.smart.vsl.az/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : UFXPortBinding
  // service   : UFX
  // port      : UFXPort
  // URL       : http://192.168.4.175:8080/UFXOnline/UFX
  // ************************************************************************ //
  UFX = interface(IInvokable)
  ['{141513FE-DD2D-97E5-AF28-B996657ABB7F}']
    function  balance(const cardType: string; const cardNumber: string; const currency: string; const amount: string; const description: string): string; stdcall;
  end;

function GetUFX(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): UFX;


implementation
  uses SysUtils;

function GetUFX(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): UFX;
const
  defWSDL = 'http://smart191:8080/UFXOnline/UFX?WSDL';
  defURL  = 'http://smart191:8080/UFXOnline/UFX';
  defSvc  = 'UFX';
  defPrt  = 'UFXPort';
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
    Result := (RIO as UFX);
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
  { UFX }
  InvRegistry.RegisterInterface(TypeInfo(UFX), 'http://ws.smart.vsl.az/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(UFX), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(UFX), ioDocument);
  { UFX.balance }
  InvRegistry.RegisterMethodInfo(TypeInfo(UFX), 'balance', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'cardType', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'cardNumber', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'currency', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'amount', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'description', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(UFX), 'balance', 'return', '',
                                '', IS_UNQL);

end.