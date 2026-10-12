object EndCallAddform: TEndCallAddform
  Left = 0
  Top = 0
  ClientHeight = 137
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 232
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 313
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 392
    Height = 105
    Align = alTop
    Caption = 'Faiz v'#601' Gecikmi'#351' faizl'#601'rin hesablanmas'#305'n'#305'n  dayand'#305'r'#305'lmas'#305
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 36
      Height = 13
      Caption = 'M'#252'dd'#601't'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 19
      Height = 13
      Caption = 'Faiz'
    end
    object Label3: TLabel
      Left = 16
      Top = 73
      Width = 60
      Height = 13
      Caption = 'Gecikmi'#351' faiz'
    end
    object CheckBox1: TCheckBox
      Left = 274
      Top = 22
      Width = 110
      Height = 17
      Caption = 'Tam dayand'#305'r'#305'lma'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 93
      Top = 19
      Width = 166
      Height = 21
      DataField = 'ENDDAT'
      DataSource = DefineCalcDatMod.DataSource1
      Enabled = False
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object CheckBox2: TCheckBox
      Left = 96
      Top = 48
      Width = 97
      Height = 17
      Enabled = False
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 96
      Top = 72
      Width = 97
      Height = 17
      Enabled = False
      TabOrder = 3
      OnClick = CheckBox3Click
    end
  end
end
