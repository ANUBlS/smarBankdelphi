object frmProlongAdd: TfrmProlongAdd
  Left = 284
  Top = 219
  BorderIcons = [biSystemMenu]
  Caption = 'Restrukturizasiya'
  ClientHeight = 265
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 77
    Width = 254
    Height = 49
    Align = alTop
    Caption = 'Sonrak'#305' ba'#287'lanma tarixi'
    TabOrder = 0
    object DTPProlongDate: TDateTimePicker
      Left = 3
      Top = 24
      Width = 152
      Height = 21
      Date = 38442.997874710600000000
      Time = 38442.997874710600000000
      Checked = False
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 34
    Width = 254
    Height = 43
    Align = alTop
    Caption = 'Ba'#287'lanma tarixi'
    TabOrder = 1
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 8
      Top = 14
      Width = 152
      Height = 21
      DataField = 'DUEDATE'
      DataSource = ProlongDataMod.DSCreditInfo
      Enabled = False
      EditButtons = <>
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 254
    Height = 34
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 15
      Width = 86
      Height = 14
      Caption = 'Prolonqasiya :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 98
      Top = 16
      Width = 91
      Height = 16
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object ButtonOK: TButton
    Left = 0
    Top = 234
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    TabOrder = 3
    Visible = False
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 126
    Width = 254
    Height = 35
    Align = alTop
    TabOrder = 4
    object Label2: TLabel
      Left = 7
      Top = 13
      Width = 84
      Height = 14
      Caption = 'Kapitalla'#351'ma :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CheckBox2: TCheckBox
      Left = 98
      Top = 13
      Width = 91
      Height = 16
      TabOrder = 0
      OnClick = CheckBox2Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 161
    Width = 254
    Height = 69
    Align = alTop
    TabOrder = 5
    object Label3: TLabel
      Left = 7
      Top = 16
      Width = 73
      Height = 14
      Caption = #399'lav'#601' '#246'hd'#601'lik:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 43
      Width = 78
      Height = 14
      Caption = 'Tran'#351' m'#601'bl'#601#287'i:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TrancheSumEdit: TCMCurrencyEdit
      Left = 105
      Top = 42
      Width = 122
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0'
    end
    object CMCurrencyEdit1: TCMCurrencyEdit
      Left = 105
      Top = 13
      Width = 122
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0'
    end
  end
  object BitBtn1: TBitBtn
    Left = 105
    Top = 236
    Width = 70
    Height = 23
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 236
    Width = 70
    Height = 23
    Caption = 'Ba'#287'la'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = BitBtn2Click
  end
end
