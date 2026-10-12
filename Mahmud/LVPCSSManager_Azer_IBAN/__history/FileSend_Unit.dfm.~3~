object SendFileForm: TSendFileForm
  Left = 655
  Top = 557
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sent File'
  ClientHeight = 335
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnConstrainedResize = FormConstrainedResize
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  DesignSize = (
    327
    335)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 327
    Height = 281
    Align = alTop
    BorderStyle = bsNone
    Color = clBtnFace
    DataSource = Mt150_DataSource
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = clWhite
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 58
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        Title.Alignment = taCenter
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 20
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'USER_REFERENCE'
        Title.Alignment = taCenter
        Title.Caption = #1043#1077#1081#1076#1080#1081#1081#1072#1090' '#8470
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'TYPE'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087'('#1052#1058'150)'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clWhite
        Expanded = False
        FieldName = 'CREATE_DATE'
        Title.Alignment = taCenter
        Title.Caption = #1058#1072#1088#1080#1093
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 73
        Visible = True
      end>
  end
  object But_cancel: TBitBtn
    Left = 264
    Top = 312
    Width = 58
    Height = 20
    Anchors = [akRight, akBottom]
    Caption = #1063#1099#1093#1099#1096
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = But_cancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 281
    Width = 327
    Height = 24
    Align = alTop
    BevelInner = bvLowered
    Color = clGray
    TabOrder = 2
    object Label1: TLabel
      Left = 106
      Top = 6
      Width = 21
      Height = 13
      Caption = '-'#1076#1103#1085
    end
    object Label2: TLabel
      Left = 226
      Top = 6
      Width = 21
      Height = 13
      Caption = '-'#1076#1103#1082
    end
    object DateTimePicker1: TDateTimePicker
      Left = 0
      Top = 2
      Width = 105
      Height = 21
      Date = 37830.710877662000000000
      Time = 37830.710877662000000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 132
      Top = 2
      Width = 92
      Height = 21
      Date = 37830.710877662000000000
      Time = 37830.710877662000000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 255
      Top = 2
      Width = 69
      Height = 20
      Caption = #1049#1077#1085#1080#1083#1103
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object SentInfo: TOracleDataSet
    SQL.Strings = (
      'select '
      '    *'
      ' from '
      '    XS_SENTINFO'
      'where'
      '    create_date>=:BeginDate  and create_date<=:EndDate'
      ''
      'order by id')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A0042004500470049004E004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 56
  end
  object Mt150_DataSource: TDataSource
    DataSet = SentInfo
    Left = 48
    Top = 88
  end
  object ForCheck: TOracleDataSet
    SQL.Strings = (
      'select out_dir from xs_config')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 72
  end
end
