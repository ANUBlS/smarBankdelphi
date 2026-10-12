object frmBankSet: TfrmBankSet
  Left = 215
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bank Settings'
  ClientHeight = 385
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 738
    Height = 360
    Align = alClient
    DataSource = bSet
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'BANK'
        ReadOnly = True
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Caption = #1065#1077#1089#1072#1073' '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1040#1076#1099
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Caption = #1042#1070#1045#1053
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS'
        Title.Caption = #1041#1072#1085#1082#1099#1085' '#1094#1085#1074#1072#1085#1099
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOSSNAME'
        Title.Caption = #1056#1103#1097#1073#1103#1088' '#1096#1103#1093#1089
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTREESTRNUM'
        Title.Caption = #1057#1086#1085' '#1088#1077#1077#1089#1090#1088' '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrdate'
        Title.Caption = #1052#1094#1075' '#1090#1072#1088#1080#1093#1080
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 74
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 360
    Width = 738
    Height = 25
    DataSource = bSet
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 1
  end
  object BSettings: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid, cm_ip.getbankname(bankid) bank, acc_no, name, inn,' +
        ' address, bossname,lastreestrnum, contrdate'
      '  FROM cm_banksettings '
      'order by bank')
    Optimize = False
    Session = CMDataModule.CMSession
    Left = 248
    Top = 128
  end
  object bSet: TDataSource
    DataSet = BSettings
    Left = 208
    Top = 128
  end
end
