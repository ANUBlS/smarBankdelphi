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
      Name = 'WebActionItem1'
      PathInfo = '/posting'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      MethodType = mtGet
      Name = 'getstores'
      PathInfo = '/stores'
      OnAction = WebModule1getstoresAction
    end
    item
      MethodType = mtPost
      Name = 'CreditPayment'
      PathInfo = '/paycredit'
      OnAction = WebModule1CreditPaymentAction
    end
    item
      MethodType = mtPost
      Name = 'returning'
      PathInfo = '/return'
      OnAction = WebModule1returningAction
    end>
  Height = 491
  Width = 800
  object connection: TOracleSession
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Left = 152
    Top = 152
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
    Left = 152
    Top = 104
  end
  object Insertquery: TOracleDataSet
    SQL.Strings = (
      'declare'
      'B clob;'
      'maxid number;'
      'begin'
      '  b:=:clb;'
      ''
      
        'select nvl(max(ids),0)+1 into maxid from websrv_client_creditit_' +
        'infoes;'
      '  insert into websrv_client_creditit_infoes(id,data,ids)'
      '  values('#39'01'#39',b,maxid);'
      'end;  ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004C0042000A0000000000000000000000}
    Session = connection
    Left = 152
    Top = 208
  end
  object storenames: TOracleDataSet
    SQL.Strings = (
      'select * from report_symbol')
    Optimize = False
    Session = connection
    Left = 152
    Top = 64
  end
  object PaymentCr: TOracleDataSet
    SQL.Strings = (
      
        'select rownum,c.id,c.numberofcredit, a.name,b.birthday,get_accno' +
        '( d.booroweraccid) accno,suBstr(get_accno( d.booroweraccid),8,3)' +
        ' val'
      
        ' from customers a, custinfo b,cm_active_credits c ,cm_accounts d' +
        ' where c.numberofcredit=:crid'
      ' and a.id=b.idcust and a.id=c.boorowerid and c.id=d.creditid ')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00430052004900440005000000000000000000
      0000}
    Session = connection
    Left = 272
    Top = 64
  end
  object inspayment: TOracleQuery
    SQL.Strings = (
      
        'insert into ws_autopay(account,ammount,currency,customer,rrn,sta' +
        'tus,crednumber)values (:v_accno,:v_ammount,:v_curr,:v_cust,:v_rr' +
        'n,0,:v_cred)')
    Session = connection
    Optimize = False
    Variables.Data = {
      0400000006000000100000003A0056005F004100430043004E004F0005000000
      0000000000000000140000003A0056005F0041004D004D004F0055004E005400
      0400000000000000000000000E0000003A0056005F0043005500520052000500
      000000000000000000000E0000003A0056005F00430055005300540005000000
      00000000000000000C0000003A0056005F00520052004E000500000000000000
      000000000E0000003A0056005F00430052004500440005000000000000000000
      0000}
    Left = 264
    Top = 128
  end
  object returnins: TOracleDataSet
    SQL.Strings = (
      'declare'
      'B clob;'
      'maxid number;'
      'begin'
      '  b:=:clb;'
      ''
      'select nvl(max(ids),0)+1 into maxid from websrv_return_request;'
      '  insert into websrv_return_request(id,data,ids)'
      '  values('#39'01'#39',b,maxid);'
      'end;  ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004C0042000A0000000000000000000000}
    Session = connection
    Left = 152
    Top = 256
  end
end
