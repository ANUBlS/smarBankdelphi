object QueryExporterForm: TQueryExporterForm
  Left = 239
  Top = 175
  Width = 769
  Height = 514
  Caption = 'QueryExporterForm'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 514
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 42
      Width = 767
      Height = 192
      Align = alTop
      DataSource = DataSrcQueryes
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Color = clNavy
          Width = 570
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 234
      Width = 767
      Height = 41
      Align = alTop
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 127
        Top = -4
        Width = 640
        Height = 39
        DataSource = DataSrcQueryes
        TabOrder = 0
      end
      object Button1: TButton
        Left = 7
        Top = 9
        Width = 75
        Height = 25
        Caption = 'SQL'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object DBMemo1: TDBMemo
      Left = 1
      Top = 275
      Width = 767
      Height = 197
      Align = alClient
      Color = clSilver
      DataField = 'QUERY'
      DataSource = DataSrcQueryes
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
      ExplicitWidth = 619
    end
    object Panel3: TPanel
      Left = 1
      Top = 472
      Width = 767
      Height = 41
      Align = alBottom
      TabOrder = 3
      ExplicitWidth = 619
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Caution'
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 767
      Height = 41
      Align = alTop
      TabOrder = 4
      ExplicitTop = 0
      object Label2: TLabel
        Left = 5
        Top = 16
        Width = 86
        Height = 16
        Caption = 'Ba'#351'lan'#287#305'c Tarix'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 234
        Top = 16
        Width = 55
        Height = 16
        Caption = 'Son Tarix'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dtpOpDat: TDateTimePicker
        Left = 97
        Top = 14
        Width = 95
        Height = 21
        Date = 44253.375636701390000000
        Time = 44253.375636701390000000
        TabOrder = 0
        OnEnter = dtpOpDatEnter
      end
      object dtOpDatEnd: TDateTimePicker
        Left = 295
        Top = 14
        Width = 95
        Height = 21
        Date = 44253.375636701390000000
        Time = 44253.375636701390000000
        TabOrder = 1
        OnEnter = dtOpDatEndEnter
      end
    end
  end
  object Queries: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID'
      ' ,Description'
      ' ,Query'
      'From '
      '  SB_Queries'
      ' order by Description')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000160000004400450053004300520049005000540049004F00
      4E000100000000000A00000051005500450052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 544
    Top = 88
    object QueriesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object QueriesQUERY: TWideStringField
      FieldName = 'QUERY'
      Size = 3200
    end
  end
  object DataSrcQueryes: TDataSource
    DataSet = Queries
    Left = 472
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 80
    object RunSelectedQuery1: TMenuItem
      Caption = '&Run Selected Query ...'
      ShortCut = 120
      OnClick = RunSelectedQuery1Click
    end
  end
end
