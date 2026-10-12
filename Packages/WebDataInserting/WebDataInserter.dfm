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
      Name = 'InsertData'
      PathInfo = '/posting'
      OnAction = WebModule1InsertDataAction
    end
    item
      MethodType = mtPost
      Name = 'get_credit_numberofcredit'
      PathInfo = '/get_cred_no'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      MethodType = mtPost
      Name = 'Insert_Payment_decree'
      PathInfo = '/PaymentOrder'
      OnAction = WebModule1Insert_Payment_decreeAction
    end>
  Height = 437
  Width = 567
  object connection: TOracleSession
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Left = 160
    Top = 144
  end
  object Queries: TOracleDataSet
    SQL.Strings = (
      
        'select rownum,c.numberofcredit, a.name,b.birthday,get_accno( d.b' +
        'ooroweraccid) accno,suBstr(get_accno( d.booroweraccid),8,3) val'
      
        ' from customers a, custinfo b,cm_active_credits c ,cm_accounts d' +
        ' where a.id=:cln and to_char(b.birthday,'#39'YYYYMMDD'#39')=:clbirth'
      ' and a.id=b.idcust and a.id=c.boorowerid and c.id=d.creditid')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A0043004C004E00030000000000000000000000
      100000003A0043004C0042004900520054004800050000000000000000000000}
    Session = connection
    Left = 200
    Top = 96
  end
  object Insertquery: TOracleDataSet
    SQL.Strings = (
      'declare'
      'B clob;'
      'maxid number;'
      ''
      'v_custid number;'
      'v_credit varchar2(250);'
      'begin'
      '  b:=:clb;'
      ''
      
        'select nvl(max(ids),0)+1 into maxid from websrv_client_creditit_' +
        'infoes;'
      '  insert into websrv_client_creditit_infoes(id,data,ids)'
      '  values('#39'01'#39',b,maxid);'
      ''
      ''
      'end;  ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004C0042000A0000000000000000000000}
    Session = connection
    Left = 272
    Top = 176
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
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
    Left = 344
    Top = 176
  end
  object pack: TOraclePackage
    Session = connection
    PackageName = 'webservispkg'
    Left = 136
    Top = 264
  end
  object get_crednum: TOracleDataSet
    SQL.Strings = (
      'declare'
      'B clob;'
      'maxid number;'
      ''
      'v_custid number;'
      'v_credit varchar2(250);'
      'begin'
      '  b:=:clb;'
      ''
      
        'select nvl(max(ids),0)+1 into maxid from websrv_rtn_credit_numbe' +
        'r;'
      '  insert into websrv_rtn_credit_number(id,data,ids)'
      '  values('#39'01'#39',b,maxid);'
      ''
      ''
      'end;  ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004C0042000A0000000000000000000000}
    Session = connection
    Left = 264
    Top = 256
  end
  object Pay_order: TOracleDataSet
    SQL.Strings = (
      'declare'
      'B clob;'
      'maxid number;'
      ''
      'v_custid number;'
      'v_credit varchar2(250);'
      'begin'
      '  b:=:clb;'
      ''
      
        'select nvl(max(ids),0)+1 into maxid from websrv_rtn_payment_orde' +
        'r;'
      '  insert into websrv_rtn_payment_order(id,data,ids)'
      '  values('#39'01'#39',b,maxid);'
      ''
      ''
      'end;  ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004C0042000A0000000000000000000000}
    Session = connection
    Left = 272
    Top = 312
  end
end
