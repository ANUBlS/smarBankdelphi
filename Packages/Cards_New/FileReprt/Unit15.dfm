object Format102: TFormat102
  Left = 0
  Top = 0
  Caption = 'Azips 102'
  ClientHeight = 620
  ClientWidth = 997
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 497
    Height = 153
    Caption = 'G'#246'nd'#601'r'#601'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label19: TLabel
      Left = 13
      Top = 14
      Width = 61
      Height = 13
      Caption = 'M'#252#351't'#601'ri kodu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 13
      Top = 56
      Width = 70
      Height = 13
      Caption = 'Hesab n'#246'mr'#601'si'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 15
      Top = 100
      Width = 34
      Height = 13
      Caption = 'M'#601'bl'#601#287
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object amount: TEdit
      Left = 13
      Top = 116
      Width = 212
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 13
      Top = 33
      Width = 212
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = Edit6KeyPress
    end
    object Memo1: TMemo
      Left = 235
      Top = 11
      Width = 258
      Height = 89
      Color = clGradientInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        ''
        ''
        ''
        '')
      ParentFont = False
      TabOrder = 2
    end
    object searchcombo: TDBLookupComboboxEh
      Left = 13
      Top = 75
      Width = 212
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModbpl.acountsource
      ParentFont = False
      TabOrder = 3
      Visible = True
      OnExit = searchcomboExit
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 0
    Width = 985
    Height = 74
    Caption = 'Bank m'#601'lumat'#305
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 21
      Width = 50
      Height = 13
      Caption = 'Reference'
    end
    object Label4: TLabel
      Left = 140
      Top = 21
      Width = 73
      Height = 13
      Caption = #399'm'#601'liyyat'#305'n tipi'
    end
    object Label5: TLabel
      Left = 254
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Valyuta'
    end
    object Label6: TLabel
      Left = 298
      Top = 21
      Width = 24
      Height = 13
      Caption = 'Tarix'
    end
    object Label7: TLabel
      Left = 386
      Top = 21
      Width = 33
      Height = 13
      Caption = 'MF71A'
    end
    object Label16: TLabel
      Left = 457
      Top = 24
      Width = 87
      Height = 13
      Caption = 'Related reference'
    end
    object referens: TEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      Color = clGradientInactiveCaption
      Enabled = False
      TabOrder = 0
    end
    object mf23b: TEdit
      Left = 139
      Top = 40
      Width = 102
      Height = 21
      Color = clGradientInactiveCaption
      Enabled = False
      TabOrder = 1
      Text = 'CRED'
    end
    object val: TEdit
      Left = 254
      Top = 40
      Width = 36
      Height = 21
      Color = clGradientInactiveCaption
      Enabled = False
      TabOrder = 2
      Text = 'AZN'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 299
      Top = 40
      Width = 85
      Height = 21
      Date = 41177.498779664350000000
      Time = 41177.498779664350000000
      Color = clGradientInactiveCaption
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 386
      Top = 40
      Width = 65
      Height = 21
      Color = clGradientInactiveCaption
      Enabled = False
      TabOrder = 4
      Text = 'OUR'
    end
    object Edit5: TEdit
      Left = 591
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'N'
      Visible = False
    end
    object relatedrf: TEdit
      Left = 457
      Top = 40
      Width = 102
      Height = 21
      Color = clWhite
      TabOrder = 6
      Text = 'NONE REF'
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 238
    Width = 497
    Height = 107
    Caption = 'Alan bank'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label12: TLabel
      Left = 11
      Top = 14
      Width = 57
      Height = 13
      Caption = 'Bank'#305'n kodu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 11
      Top = 60
      Width = 48
      Height = 13
      Caption = 'Bank'#305'n ad'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 271
      Top = 14
      Width = 51
      Height = 13
      Caption = 'Bank'#305'n BIC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object reciverbic: TSearchEdit
      Left = 11
      Top = 33
      Width = 214
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = reciverbicKeyPress
      DataSource = DataModbpl.bankssource
      SearchField = 'bankcode'
    end
    object SearchCombo2: TComboBox
      Left = 11
      Top = 79
      Width = 483
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = SearchCombo2Exit
      Items.Strings = (
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '')
    end
    object SearchEdit2: TSearchEdit
      Left = 252
      Top = 33
      Width = 242
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = SearchEdit2KeyPress
      DataSource = DataModbpl.bankssource
      SearchField = 'Swift'
    end
  end
  object GroupBox2: TGroupBox
    Left = 511
    Top = 80
    Width = 482
    Height = 265
    Caption = 'Alan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label8: TLabel
      Left = 11
      Top = 16
      Width = 70
      Height = 13
      Caption = 'Hesab n'#246'mr'#601'si'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 11
      Top = 61
      Width = 15
      Height = 13
      Caption = 'Ad'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 11
      Top = 114
      Width = 39
      Height = 13
      Caption = 'V.'#214'.E.N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 11
      Top = 35
      Width = 198
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 28
      ParentFont = False
      TabOrder = 0
      OnExit = Edit2Exit
    end
    object Edit3: TEdit
      Left = 11
      Top = 80
      Width = 198
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 35
      ParentFont = False
      TabOrder = 1
      OnExit = Edit3Exit
    end
    object Edit4: TEdit
      Left = 11
      Top = 133
      Width = 198
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      OnExit = Edit4Exit
    end
    object Memo2: TMemo
      Left = 215
      Top = 11
      Width = 258
      Height = 89
      Color = clGradientInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        ''
        ''
        ''
        '')
      ParentFont = False
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 354
    Width = 983
    Height = 209
    Caption = 'T'#601'yinat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 27
      Width = 36
      Height = 13
      Caption = 'T'#601'yinat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 513
      Top = 27
      Width = 70
      Height = 13
      Caption = 'T'#601'yinat('#601'lav'#601')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object OF70_RichEdit: TRichEdit
      Left = 13
      Top = 61
      Width = 466
      Height = 113
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      MaxLength = 148
      ParentFont = False
      TabOrder = 0
    end
    object OF72_RichEdit: TRichEdit
      Left = 513
      Top = 61
      Width = 466
      Height = 113
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 8
    Top = 585
    Width = 86
    Height = 27
    Caption = 'Yadda saxla'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 585
    Width = 86
    Height = 27
    Caption = 'N'#246'vb'#601'ti '#246'd'#601'ni'#351
    TabOrder = 6
    OnClick = Button2Click
  end
end
