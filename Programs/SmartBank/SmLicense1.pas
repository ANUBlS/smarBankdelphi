// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.2.232:8080/SmartLicense/SmLicense?WSDL
//  >Import : http://192.168.2.232:8080/SmartLicense/SmLicense?WSDL>0
//  >Import : http://192.168.2.232:8080/SmartLicense/SmLicense?xsd=1
// Encoding : UTF-8
// Codegen  : [wfForceSOAP11+]
// Version  : 1.0
// (17.11.2016 17:10:18 - - $Rev: 34800 $)
// ************************************************************************ //

unit SmLicense1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns,SBOInitPkg;

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
  // Namespace : http://ws.vsl.az/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SmLicensePortBinding
  // service   : SmLicense
  // port      : SmLicensePort
  // URL       : http://192.168.2.232:8080/SmartLicense/SmLicense
  // ************************************************************************ //
  SmLicense = interface(IInvokable)
  ['{D0237A22-977F-935D-017F-6B634C52CEFD}']
    function  checkLicense(const xml: string): string; stdcall;
  end;

function GetSmLicense(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SmLicense;


implementation
  uses SysUtils;

function GetSmLicense(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SmLicense;
const
  defWSDL = 'http://192.168.2.232:8080/SmartLicense/SmLicense?WSDL';
  defURL  = 'http://192.168.2.232:8080/SmartLicense/SmLicense';
  defSvc  = 'SmLicense';
  defPrt  = 'SmLicensePort';

var
  RIO: THTTPRIO;   ss:string;
   FSBData: TSBOData;
begin
  with FSBData do
      ss:=UserName;
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
    Result := (RIO as SmLicense);
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
  { SmLicense }
  InvRegistry.RegisterInterface(TypeInfo(SmLicense), 'http://ws.vsl.az/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SmLicense), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SmLicense), ioDocument);
  { SmLicense.checkLicense }
  InvRegistry.RegisterMethodInfo(TypeInfo(SmLicense), 'checkLicense', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmLicense), 'checkLicense', 'xml', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SmLicense), 'checkLicense', 'return', '',
                                '', IS_UNQL);

end.