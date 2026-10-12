object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 235
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 235
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 91
      Height = 13
      Caption = 'Qiym'#601'tli Ka'#287#305'z'#305'n ad'#305
    end
    object Label2: TLabel
      Left = 5
      Top = 48
      Width = 65
      Height = 13
      Caption = 'Balans hesabi'
    end
    object Label3: TLabel
      Left = 5
      Top = 90
      Width = 21
      Height = 13
      Caption = #304'S'#304'N'
    end
    object Label4: TLabel
      Left = 5
      Top = 132
      Width = 36
      Height = 13
      Caption = 'Valyuta'
    end
    object Label5: TLabel
      Left = 200
      Top = 5
      Width = 60
      Height = 13
      Caption = 'Al'#305'nma Tarixi'
    end
    object Label6: TLabel
      Left = 200
      Top = 48
      Width = 79
      Height = 13
      Caption = 'Qaytar'#305'lma tarixi'
    end
    object Label7: TLabel
      Left = 200
      Top = 90
      Width = 74
      Height = 13
      Caption = 'Nominal m'#601'bl'#601#287
    end
    object Label8: TLabel
      Left = 200
      Top = 132
      Width = 110
      Height = 13
      Caption = 'Balansdan silinm'#601' tarixi'
    end
    object Label9: TLabel
      Left = 99
      Top = 5
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 76
      Top = 48
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 32
      Top = 90
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 45
      Top = 133
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 107
      Top = 20
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 266
      Top = 5
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 285
      Top = 48
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 281
      Top = 90
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 316
      Top = 132
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 120
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      ImageIndex = 7
      Images = Dmexpired_sec.ImageList
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 197
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      ImageIndex = 2
      Images = Dmexpired_sec.ImageList
      TabOrder = 1
      OnClick = Button2Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 5
      Top = 148
      Width = 150
      Height = 21
      KeyField = 'VAL_NAME'
      ListField = 'VAL_NAME'
      ListSource = Dmexpired_sec.dsravalute
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 5
      Top = 21
      Width = 150
      Height = 21
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 5
      Top = 63
      Width = 150
      Height = 21
      TabOrder = 4
    end
    object Edit3: TEdit
      Left = 5
      Top = 109
      Width = 150
      Height = 21
      TabOrder = 5
    end
    object Edit4: TEdit
      Left = 200
      Top = 109
      Width = 150
      Height = 21
      TabOrder = 6
      OnKeyPress = Edit4KeyPress
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 200
      Top = 24
      Width = 150
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 7
      Visible = True
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 200
      Top = 63
      Width = 150
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 8
      Visible = True
    end
    object DBDateTimeEditEh3: TDBDateTimeEditEh
      Left = 200
      Top = 151
      Width = 150
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 9
      Visible = True
    end
  end
end
