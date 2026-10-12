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
      MethodType = mtPost
      Name = 'Addcustomers'
      PathInfo = '/AddCustomer'
      OnAction = WebModule1WebActionItem1Action
    end
    item
      MethodType = mtGet
      Name = 'custcountry'
      PathInfo = '/custcontry'
      OnAction = WebModule1custqaulityAction
    end
    item
      MethodType = mtGet
      Name = 'citizen'
      PathInfo = '/citizenship'
      OnAction = WebModule1citizenAction
    end
    item
      MethodType = mtGet
      Name = 'doctype'
      PathInfo = '/doctype'
      OnAction = WebModule1doctypeAction
    end>
  Height = 366
  Width = 602
  object Connection: TOracleSession
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Left = 72
    Top = 144
  end
  object oraquery: TOracleDataSet
    Optimize = False
    Session = Connection
    Left = 168
    Top = 88
  end
  object PHYS_FS_CUSTOMERS: TOraclePackage
    Session = Connection
    PackageName = 'webservispkg'
    Left = 288
    Top = 176
  end
end
