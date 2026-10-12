object CloseContractForm: TCloseContractForm
  Left = 278
  Top = 234
  BorderIcons = [biSystemMenu]
  Caption = 'CloseContractForm'
  ClientHeight = 101
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 334
    Height = 51
    Align = alTop
    Caption = 'Ba'#287'lanma t'#601'yinat'#305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object EditDescription: TEdit
      Left = 5
      Top = 14
      Width = 319
      Height = 21
      Color = clInfoBk
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 78
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    DoubleBuffered = True
    ModalResult = 1
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 180
    Top = 64
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
