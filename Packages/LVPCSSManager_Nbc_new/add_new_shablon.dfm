object Add_new: TAdd_new
  Left = 659
  Top = 609
  AutoSize = True
  Caption = 'Add New'
  ClientHeight = 87
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 199
    Height = 87
    Caption = #350'ablona ad ver'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Edit_New_Shablon_name: TEdit
      Left = 34
      Top = 26
      Width = 131
      Height = 21
      TabOrder = 0
    end
    object Button_New_shablon: TButton
      Left = 60
      Top = 53
      Width = 81
      Height = 27
      Caption = 'T'#601'sdiq et'
      Default = True
      TabOrder = 1
      OnClick = Button_New_shablonClick
    end
  end
end
