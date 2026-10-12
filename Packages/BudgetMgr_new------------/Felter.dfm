object FrmReportFilter: TFrmReportFilter
  Left = 919
  Top = 254
  ClientHeight = 333
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 278
    Height = 32
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitTop = 275
    object Button1: TButton
      Left = 117
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 196
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 278
    Height = 75
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 36
      Top = 14
      Width = 53
      Height = 14
      Caption = #304'li se'#231'in :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object challValute: TButton
      Left = 6
      Top = 53
      Width = 83
      Height = 18
      Caption = 'Hams'#305'n'#305' se'#231
      TabOrder = 0
      OnClick = challValuteClick
    end
    object unchallValute: TButton
      Left = 93
      Top = 53
      Width = 72
      Height = 18
      Caption = 'T'#601'mizl'#601
      TabOrder = 1
      OnClick = unchallValuteClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 99
      Top = 13
      Width = 145
      Height = 21
      KeyField = 'YEAR'
      ListField = 'YEAR'
      ListSource = DmBudcet.DataSource7
      TabOrder = 2
    end
  end
  object Even: TEvanescence
    Tag = 3112
    Left = 0
    Top = 75
    Width = 278
    Height = 226
    Align = alClient
    HeaderBackgroundColor = clWindow
    ItemHeight = 13
    TabOrder = 2
    DataSource = DmBudcet.FIXINGSrc
    ListField = 'name'
    KeyField = 'id'
    ExplicitTop = 30
    ExplicitHeight = 245
  end
end
