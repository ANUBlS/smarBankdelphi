object Azipsn: TAzipsn
  Left = 0
  Top = 0
  Caption = 'Azips'
  ClientHeight = 491
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 68
    Width = 321
    Height = 100
    Caption = 'G'#246'nd'#601'r'#601'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label11: TLabel
      Left = 18
      Top = 13
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
      Left = 11
      Top = 59
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
      Left = 11
      Top = 74
      Width = 200
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object SearchEdit1: TDBLookupComboBox
      Left = 13
      Top = 32
      Width = 198
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ACC_NO'
      ListField = 'ACC_NO'
      ListSource = DataModbpl.acountsource
      ParentFont = False
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 133
      Top = 7
      Width = 185
      Height = 89
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
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 328
    Top = 71
    Width = 326
    Height = 206
    Caption = 'Alan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label8: TLabel
      Left = 11
      Top = 14
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
      Width = 207
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 11
      Top = 80
      Width = 207
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 11
      Top = 133
      Width = 207
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
    end
    object Memo2: TMemo
      Left = 96
      Top = 7
      Width = 185
      Height = 89
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
      Visible = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 275
    Width = 661
    Height = 183
    Caption = 'T'#601'yinat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
      Left = 350
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
      Width = 265
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
      Left = 325
      Top = 61
      Width = 265
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
    Left = 1
    Top = 463
    Width = 86
    Height = 27
    Caption = 'Yadda saxla'
    TabOrder = 3
  end
  object GroupBox4: TGroupBox
    Left = -6
    Top = -1
    Width = 660
    Height = 66
    Caption = 'Bank m'#601'lumat'#305
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Reference'
    end
    object Label4: TLabel
      Left = 138
      Top = 21
      Width = 65
      Height = 13
      Caption = #399'm'#601'liyyat tipi'
    end
    object Label5: TLabel
      Left = 210
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Valyuta'
    end
    object Label6: TLabel
      Left = 254
      Top = 21
      Width = 24
      Height = 13
      Caption = 'Tarix'
    end
    object Label7: TLabel
      Left = 346
      Top = 21
      Width = 33
      Height = 13
      Caption = 'MF71A'
    end
    object referens: TEdit
      Left = 8
      Top = 38
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object mf23b: TEdit
      Left = 138
      Top = 38
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = 'CRED'
    end
    object val: TEdit
      Left = 210
      Top = 38
      Width = 36
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'AZN'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 254
      Top = 38
      Width = 85
      Height = 21
      Date = 41177.498779664350000000
      Time = 41177.498779664350000000
      Enabled = False
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 346
      Top = 37
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = 'OUR'
    end
    object Edit5: TEdit
      Left = 472
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 5
      Visible = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 170
    Width = 321
    Height = 107
    Caption = 'Alan bank'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
    object reciverbic: TSearchEdit
      Left = 11
      Top = 36
      Width = 200
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      SearchField = 'bankcode'
    end
    object SearchCombo2: TComboBox
      Left = 11
      Top = 79
      Width = 200
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
  end
  object Button2: TButton
    Left = 93
    Top = 463
    Width = 93
    Height = 27
    Caption = #350'ablondan y'#252'kl'#601
    TabOrder = 6
  end
  object Button3: TButton
    Left = 192
    Top = 463
    Width = 93
    Height = 27
    Caption = #350'ablonda saxla'
    TabOrder = 7
  end
end
