object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 160
    Top = 248
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 304
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ICEOralogon1: TICEOralogon
    IniSource = 'D:\Smart-Bank\Source\Packages\ICELogon\Test\ICELogon.ini'
    Session = OracleSession1
    ICECrypt = ICECrypt1
    lUsername = 'Username'
    lPassword = 'Password'
    lDatabase = 'Database'
    lOKButton = 'OK'
    lCancelButton = 'Cancel'
    lCaption = 'Oracle Logon'
    lFont.Charset = DEFAULT_CHARSET
    lFont.Color = clWindowText
    lFont.Height = -11
    lFont.Name = 'MS Sans Serif'
    lFont.Style = []
    lSavePassword = 'Save password'
    lSaveUserList = 'Save Userslist'
    PasswordChar = 'x'
    CryptChar = 's'
    Left = 256
    Top = 128
  end
  object ICECrypt1: TICECrypt
    Text = 'Crypt'
    CryptType = cHASH_CRC32
    Left = 328
    Top = 128
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Session = OracleSession1
    Left = 200
    Top = 48
  end
  object OracleSession1: TOracleSession
    Left = 88
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 536
    Top = 152
  end
end
