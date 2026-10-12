object ReportFrm: TReportFrm
  Left = 0
  Top = 0
  ClientHeight = 171
  ClientWidth = 350
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
  object Label3: TLabel
    Left = 48
    Top = 150
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 186
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 267
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 33
    Width = 350
    Height = 57
    Align = alTop
    Caption = 'Tarix aral'#305#287#305
    TabOrder = 2
    object Label1: TLabel
      Left = 174
      Top = 27
      Width = 12
      Height = 13
      Caption = '__'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 6
      Top = 26
      Width = 166
      Height = 21
      Date = 41311.449640405100000000
      Time = 41311.449640405100000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 188
      Top = 27
      Width = 159
      Height = 21
      Date = 41311.449640405100000000
      Time = 41311.449640405100000000
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 3
    Top = 203
    Width = 339
    Height = 150
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 350
    Height = 33
    Align = alTop
    Caption = 'Faiz se'#231'imi'
    TabOrder = 4
    object Label2: TLabel
      Left = 80
      Top = 12
      Width = 16
      Height = 13
      Caption = '% '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 107
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 90
    Width = 350
    Height = 45
    Align = alTop
    Caption = 'Filial se'#231'imi'
    TabOrder = 5
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 59
      Top = 15
      Width = 232
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DMBudget.DSrcFilial
      TabOrder = 0
    end
  end
end
