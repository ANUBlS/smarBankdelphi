object Web: TWeb
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'otdel'
      PathInfo = '/otdel'
      OnAction = WebotdelAction
    end
    item
      Name = 'kategr'
      PathInfo = '/kategr'
      OnAction = WebkategrAction
    end
    item
      Name = 'kpn'
      PathInfo = '/kpn'
      OnAction = WebkpnAction
    end
    item
      Name = 'prfs'
      PathInfo = '/prfs'
      OnAction = WebprfsAction
    end
    item
      Name = 'dolj'
      PathInfo = '/dolj'
      OnAction = WebdoljAction
    end
    item
      Name = 'razrd'
      PathInfo = '/razrd'
      OnAction = WebrazrdAction
    end
    item
      Name = 'ixtisas'
      PathInfo = '/ixtisas'
      OnAction = WebixtisasAction
    end
    item
      Name = 'budjet'
      PathInfo = '/budjet'
      OnAction = WebbudjetAction
    end
    item
      Name = 'ogran'
      PathInfo = '/ogran'
      OnAction = WebogranAction
    end
    item
      Name = 'vidopl'
      PathInfo = '/vidopl'
      OnAction = WebvidoplAction
    end
    item
      Name = 'podrzd'
      PathInfo = '/podrzd'
      OnAction = WebpodrzdAction
    end
    item
      Name = 'uchzvn'
      PathInfo = '/uchzvn'
      OnAction = WebuchzvnAction
    end
    item
      Name = 'uchstp'
      PathInfo = '/uchstp'
      OnAction = WebuchstpAction
    end
    item
      Name = 'n01p04'
      PathInfo = '/n01p04'
      OnAction = Webn01p04Action
    end
    item
      MethodType = mtGet
      Name = 'tr'
      PathInfo = '/tr'
      OnAction = WebtrAction
    end>
  Height = 230
  Width = 415
  object conn: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=Database Name'
      'User_Name=user'
      'Password=password'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=.')
    Left = 48
    Top = 56
  end
  object queries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conn
    Left = 48
    Top = 104
  end
  object XMLDoc: TXMLDocument
    Left = 64
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 232
    Top = 88
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=pdbnbc'
      'User_Name=salary'
      'Password=salary'
      'ODBCDriver=Oracle in OraClient12Home1_32bit'
      'DataSource=Excel Files'
      'DriverID=ODBC')
    LoginPrompt = False
    Left = 152
    Top = 144
  end
end
