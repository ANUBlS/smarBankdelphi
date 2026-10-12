object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Biznes Process'
  ClientHeight = 141
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 11
    Width = 69
    Height = 13
    Caption = 'Balans hesab'#305':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 496
    Height = 141
    Align = alTop
    AutoSize = True
    TabOrder = 0
    ExplicitWidth = 554
    object Label1: TLabel
      Left = 11
      Top = 34
      Width = 66
      Height = 13
      Caption = 'Debet balans '
    end
    object Label2: TLabel
      Left = 11
      Top = 61
      Width = 65
      Height = 13
      Caption = 'Kredit balans '
    end
    object Label4: TLabel
      Left = 11
      Top = 91
      Width = 34
      Height = 13
      Caption = 'Mebleg'
    end
    object Label5: TLabel
      Left = 184
      Top = 35
      Width = 62
      Height = 13
      Caption = 'Debet Hesab'
    end
    object Label6: TLabel
      Left = 185
      Top = 61
      Width = 61
      Height = 13
      Caption = 'Kredit Hesab'
    end
    object Label7: TLabel
      Left = 185
      Top = 91
      Width = 36
      Height = 13
      Caption = 'T'#601'yinat'
    end
    object Edit2: TEdit
      Left = 80
      Top = 31
      Width = 94
      Height = 21
      Enabled = False
      TabOrder = 0
      OnKeyPress = Edit2KeyPress
    end
    object Button1: TButton
      Left = 329
      Top = 115
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit4: TEdit
      Left = 79
      Top = 88
      Width = 95
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 2
      OnEnter = Edit4Enter
    end
    object Edit5: TEdit
      Left = 252
      Top = 88
      Width = 242
      Height = 21
      TabOrder = 3
      OnEnter = Edit5Enter
    end
    object Button2: TButton
      Left = 418
      Top = 115
      Width = 75
      Height = 25
      Caption = #304'mtina'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Edit7: TEdit
      Left = 252
      Top = 58
      Width = 242
      Height = 21
      TabOrder = 5
      OnKeyDown = Edit7KeyDown
    end
    object Edit8: TEdit
      Left = 252
      Top = 31
      Width = 242
      Height = 21
      TabOrder = 6
      OnKeyDown = Edit8KeyDown
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 1
      Width = 153
      Height = 21
      TabOrder = 7
      Text = 'Valyuta'
      OnChange = ComboBox1Change
      Items.Strings = (
        'AZN'
        'USD'
        '')
    end
    object Edit1: TEdit
      Left = 200
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 8
      Visible = False
    end
  end
  object Edit3: TEdit
    Left = 80
    Top = 58
    Width = 94
    Height = 21
    Enabled = False
    TabOrder = 1
    OnKeyPress = Edit3KeyPress
  end
end
