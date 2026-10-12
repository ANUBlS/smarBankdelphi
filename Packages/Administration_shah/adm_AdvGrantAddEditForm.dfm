object frmAddEditAdvGrants: TfrmAddEditAdvGrants
  Left = 382
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 136
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 61
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'H'#252'ququn ad'#305
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 61
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'S'#601'hv mesaj'#305
  end
  object Label3: TLabel
    Left = 8
    Top = 76
    Width = 61
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'T'#601'yinat'#305
  end
  object edGrantName: TEdit
    Left = 80
    Top = 8
    Width = 300
    Height = 21
    TabOrder = 0
  end
  object edErrorMessage: TEdit
    Left = 80
    Top = 40
    Width = 300
    Height = 21
    TabOrder = 1
  end
  object edDescription: TEdit
    Left = 80
    Top = 72
    Width = 300
    Height = 21
    TabOrder = 2
  end
  object pnMB: TPanel
    Left = 8
    Top = 104
    Width = 193
    Height = 25
    BevelOuter = bvNone
    TabOrder = 3
    object CheckBox1: TCheckBox
      Left = 0
      Top = 4
      Width = 57
      Height = 17
      Caption = 'S'#601'rh'#601'd'
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 72
      Top = 3
      Width = 113
      Height = 21
      TabOrder = 1
      Text = '0'
    end
  end
  object Button1: TButton
    Left = 216
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    TabOrder = 5
    OnClick = Button2Click
  end
end
