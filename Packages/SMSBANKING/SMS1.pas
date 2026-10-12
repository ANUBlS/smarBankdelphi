// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.0.54:8080/MessageBanking/SMS?WSDL
//  >Import : http://192.168.0.54:8080/MessageBanking/SMS?WSDL>0
//  >Import : http://192.168.0.54:8080/MessageBanking/SMS?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (26.02.2013 15:09:08 - - $Rev: 34800 $)
// ************************************************************************ //

unit SMS1;

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
  // Namespace : http://sms.messagebanking/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : SMSPortBinding
  // service   : SMS
  // port      : SMSPort
  // URL       : http://192.168.0.54:8080/MessageBanking/SMS
  // ************************************************************************ //
  SMS = interface(IInvokable)
  ['{AA590EA2-0D21-FE55-A1BA-600197C50FBE}']
    function  sendMail(const username: string; const genMD5: string): string; stdcall;
    function  getSMSStatus(const username: string; const userhash: string; const smsid: string): string; stdcall;
    function  sendSMS(const username: string; const userhash: string; const message_: string; const numberlist: string; const date: string): string; stdcall;
  end;

function GetSMS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SMS;


implementation
  uses SysUtils, IniFiles;

function GetSMS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SMS;

const
{
  defWSDL = 'http://192.168.0.54:8080/MessageBanking/SMS?WSDL';
  defURL  = 'http://192.168.0.54:8080/MessageBanking/SMS';
}
  defSvc  = 'SMS';
  defPrt  = 'SMSPort';
var
  RIO: THTTPRIO;

  //Mine
  Ini     :TIniFile;
  IniFile :String;
  defWSDL :String;
  defURL  :String;
  Result1  :String;
begin
  //Mine
  IniFile :='\SbLocal.ini';
  Ini     :=TIniFile.Create(ExtractFilePath(ParamStr(0))+IniFile);
  Result1 :=Ini.ReadString('DefaultConnection','SMSURL','');
  defWSDL := Result1+'?WSDL';
  defURL  := Result1;

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
    Result := (RIO as SMS);
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
  { SMS }
  InvRegistry.RegisterInterface(TypeInfo(SMS), 'http://sms.messagebanking/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SMS), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(SMS), ioDocument);
  { SMS.sendMail }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMS), 'sendMail', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendMail', 'username', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendMail', 'genMD5', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendMail', 'return', '',
                                '', IS_UNQL);
  { SMS.getSMSStatus }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMS), 'getSMSStatus', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'getSMSStatus', 'username', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'getSMSStatus', 'userhash', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'getSMSStatus', 'smsid', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'getSMSStatus', 'return', '',
                                '', IS_UNQL);
  { SMS.sendSMS }
  InvRegistry.RegisterMethodInfo(TypeInfo(SMS), 'sendSMS', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'username', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'userhash', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'message_', 'message',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'numberlist', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'date', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(SMS), 'sendSMS', 'return', '',
                                '', IS_UNQL);

end.