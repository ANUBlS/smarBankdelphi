object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'creditlist'
      PathInfo = '/sendcrlst'
      OnAction = WebModule1creditlistAction
    end>
  Height = 378
  Width = 709
  object OracleSession1: TOracleSession
    LogonUsername = 'smart'
    LogonPassword = 'oracledb'
    LogonDatabase = 'PDBNBC'
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Left = 72
    Top = 144
  end
  object OracleQuery1: TOracleQuery
    SQL.Strings = (
      
        'insert into Emanat_credit_inserts(CONTRACT_SEND_DATE,contactNo,c' +
        'ontractAmount,status) values (:dat,:a1,:a2,0)')
    Session = OracleSession1
    Optimize = False
    Variables.Data = {
      0400000003000000060000003A00410031000500000000000000000000000600
      00003A0041003200050000000000000000000000080000003A00440041005400
      050000000000000000000000}
    Left = 72
    Top = 80
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = True
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 248
    Top = 104
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 432
    Top = 96
  end
end
