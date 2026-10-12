object FrmObl: TFrmObl
  Left = 357
  Top = 135
  Width = 646
  Height = 473
  Caption = 'FrmObl'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 469
    Top = 407
    Width = 74
    Height = 27
    Caption = 'Ямялиййат'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 558
    Top = 407
    Width = 71
    Height = 27
    Caption = 'Баьла'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 383
    Top = 407
    Width = 69
    Height = 27
    Caption = 'Йохламаг'
    OnClick = SpeedButton3Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Тарих'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 34
      Top = 5
      Width = 157
      Height = 21
      CalAlignment = dtaLeft
      Date = 40441.4511338889
      Time = 40441.4511338889
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 638
    Height = 368
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 636
      Height = 366
      Align = alClient
      DataSource = DataSource1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDblClickOptimizeColWidth, dghDialogFind]
      ParentFont = False
      RowHeight = 4
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnColumnMoved = DBGridEh1ColumnMoved
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMBEROFCREDIT'
          Footers = <>
          Title.Caption = 'Мцгавилянин №'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Боржаланын ады  '
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 212
        end
        item
          EditButtons = <>
          FieldName = 'PLOR'
          Footers = <>
          Title.Caption = 'Мцгавилянин битмя тарихи'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 151
        end
        item
          EditButtons = <>
          FieldName = 'REST'
          Footers = <>
          Title.Caption = 'Кредитин галыьы'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 93
        end>
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from cm_obl_tur'
      ''
      'where hdate=:dat and'
      'plor<:dat '
      '')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000050000004844415445010000000000020000004944010000
      0000000E0000004E554D4245524F46435245444954010000000000040000004E
      414D4501000000000004000000504C4F52010000000000040000005245535401
      0000000000}
    Session = CMDataModule.CMSession
    Left = 264
    Top = 105
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 192
    Top = 105
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select * from smart.sysdat')
    Session = CMDataModule.CMSession
    Left = 296
    Top = 193
  end
  object OraclePackage1: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'cm_obl'
    ParameterMode = pmNamed
    Left = 136
    Top = 185
  end
end
