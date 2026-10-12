object FrmPrint: TFrmPrint
  Left = 359
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Print'
  ClientHeight = 178
  ClientWidth = 159
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 159
    Height = 178
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 157
      Height = 103
      Align = alTop
      TabOrder = 0
      TabStop = True
      object RBWares: TRadioButton
        Left = 8
        Top = 32
        Width = 113
        Height = 17
        Caption = 'ясас в€саитл€р'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = RBWaresClick
      end
      object RBGroups: TRadioButton
        Left = 8
        Top = 8
        Width = 113
        Height = 17
        Caption = '√руплар'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RBGroupsClick
      end
      object RBDepartments: TRadioButton
        Left = 8
        Top = 55
        Width = 113
        Height = 17
        Caption = '—ахландыьы бюлм€'
        TabOrder = 2
        OnClick = RBDepartmentsClick
      end
      object RBDifferenceReport: TRadioButton
        Left = 8
        Top = 79
        Width = 113
        Height = 17
        Caption = '‘€рг щесабаты'
        TabOrder = 3
        OnClick = RBGroupsClick
      end
    end
    object CBGroupsFilter: TComboBox
      Left = 1
      Top = 107
      Width = 157
      Height = 19
      Style = csOwnerDrawFixed
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnChange = CBGroupsFilterChange
    end
    object CHBCopyOff: TCheckBox
      Left = 2
      Top = 127
      Width = 136
      Height = 17
      Caption = 'ўесабдан силинмишл€р ил€'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 3
      Top = 146
      Width = 75
      Height = 25
      Caption = '√€бул'
      Default = True
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 81
      Top = 146
      Width = 75
      Height = 25
      Caption = '»мтина'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 118
    Top = 9
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 118
    Top = 41
  end
end
