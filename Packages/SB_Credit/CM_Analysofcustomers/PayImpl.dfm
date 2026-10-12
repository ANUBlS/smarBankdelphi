object PayForm: TPayForm
  Left = 746
  Top = 255
  Caption = 'Pay form'
  ClientHeight = 213
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 16
    Caption = #399'sas borcdan '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 30
    Width = 85
    Height = 16
    Caption = 'Faiz borcdan '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 108
    Height = 16
    Caption = 'G .'#399'sas borcdan '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 73
    Width = 101
    Height = 16
    Caption = 'G .Faiz borcdan '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 92
    Width = 131
    Height = 16
    Caption = 'Hesablanm'#305#351' c'#601'rim'#601' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 114
    Width = 151
    Height = 16
    Caption = 'C'#601'mi '#246'd'#601'nilm'#601'li m'#601'bl'#601#287' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 161
    Width = 123
    Height = 16
    Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 269
    Top = 10
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 269
    Top = 31
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 269
    Top = 53
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 269
    Top = 74
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 269
    Top = 93
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 269
    Top = 115
    Width = 40
    Height = 14
    Caption = 'Label8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 9
    Top = 137
    Width = 93
    Height = 16
    Caption = 'Kassa/M'#252'xbir '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Button1: TButton
    Left = 30
    Top = 186
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul viza'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 246
    Top = 186
    Width = 75
    Height = 25
    Caption = 'close'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CMCurrencyEdit1: TCMCurrencyEdit
    Left = 147
    Top = 161
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 103
    Top = 134
    Width = 206
    Height = 21
    DropDownAlign = daCenter
    DropDownRows = 10
    DropDownWidth = 600
    KeyField = 'ID'
    ListField = 'ACC_NO'
    ListSource = CustAnalysDataModule.BNK_src
    TabOrder = 3
  end
  object Button3: TButton
    Left = 165
    Top = 186
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    TabOrder = 4
    OnClick = Button3Click
  end
end
