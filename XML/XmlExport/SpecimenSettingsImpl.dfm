object SpecimenForm: TSpecimenForm
  Left = 67
  Top = 105
  Width = 832
  Height = 521
  Caption = 'Specimen Settings'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object SpecimenGrid: TDBGrid
    Left = 0
    Top = 84
    Width = 824
    Height = 372
    Align = alClient
    DataSource = DataModuleMain.DataSrcTagSettings
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Num'
        Title.Color = clNavy
        Width = 30
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'FieldName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Field Name'
        Title.Color = clNavy
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FieldGroup'
        Title.Caption = 'Field Group'
        Title.Color = clNavy
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TagFirst'
        Title.Caption = 'Tag First'
        Title.Color = clNavy
        Width = 94
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'TagLast'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Tag Last'
        Title.Color = clNavy
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TagPrefix'
        Title.Caption = 'Tag Prefix'
        Title.Color = clNavy
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TagSuffix'
        Title.Caption = 'Tag Suffix'
        Title.Color = clNavy
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AlphaField'
        PickList.Strings = (
          'False'
          'True')
        Title.Caption = 'Can Contain Unicode'
        Title.Color = clNavy
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UseField'
        PickList.Strings = (
          'False'
          'True')
        Title.Caption = 'Export This Field'
        Title.Color = clNavy
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ParentGroup'
        Title.Caption = 'Parent Group'
        Title.Color = clNavy
        Width = 82
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 43
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object SBBrowse: TSpeedButton
      Left = 459
      Top = 17
      Width = 23
      Height = 22
      Hint = 'Browse'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBrowseClick
    end
    object LabeledEditSpecimen: TLabeledEdit
      Left = 5
      Top = 18
      Width = 450
      Height = 21
      Color = clMedGray
      EditLabel.Width = 140
      EditLabel.Height = 13
      EditLabel.Caption = 'Load Specimen Table Fields :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 544
      Top = 2
      Width = 97
      Height = 40
      Caption = 'Auto Generate Tag Last'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 824
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 820
      Height = 37
      DataSource = DataModuleMain.DataSrcTagSettings
      Align = alClient
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 456
    Width = 824
    Height = 38
    Align = alBottom
    TabOrder = 3
    object Panel4: TPanel
      Left = 638
      Top = 1
      Width = 185
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BtnClose: TButton
        Left = 100
        Top = 6
        Width = 79
        Height = 25
        Caption = '&Close'
        ModalResult = 1
        TabOrder = 0
      end
    end
  end
  object OpenDlg: TOpenDialog
    Filter = 'Database files(*.dbf,*.db)|*.dbf;*.db'
    Left = 168
    Top = 184
  end
end
