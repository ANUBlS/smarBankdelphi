object FormTr: TFormTr
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 119
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 263
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 73
      Height = 13
      Caption = 'Ba'#351'lan'#287#305'c tarix:'
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Son tarix:'
    end
    object StartDateEdit: TDateTimePicker
      Left = 104
      Top = 22
      Width = 137
      Height = 21
      Date = 37359.759652256900000000
      Time = 37359.759652256900000000
      TabOrder = 0
      OnChange = StartDateEditChange
    end
    object EndDateEdit: TDateTimePicker
      Left = 104
      Top = 46
      Width = 137
      Height = 21
      Date = 37359.759652256900000000
      Time = 37359.759652256900000000
      TabOrder = 1
      OnChange = EndDateEditChange
    end
  end
  object OkButton: TButton
    Left = 72
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 152
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#304'mtina'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
