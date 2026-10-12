object frmAddProlongation: TfrmAddProlongation
  Left = 306
  Top = 264
  BorderIcons = [biSystemMenu]
  Caption = 'M'#252'dd'#601'tin uzad'#305'lmas'#305
  ClientHeight = 131
  ClientWidth = 199
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 199
    Height = 45
    Align = alTop
    Caption = #399'vv'#601'lki ba'#287'lanma tarixi'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 197
    object DTPLast: TDateTimePicker
      Left = 5
      Top = 16
      Width = 186
      Height = 21
      Date = 39334.443470046300000000
      Time = 39334.443470046300000000
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 45
    Width = 199
    Height = 45
    Align = alTop
    Caption = 'Yeni ba'#287'lanma tarixi'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 197
    object DTPNew: TDateTimePicker
      Left = 5
      Top = 16
      Width = 186
      Height = 21
      Date = 39334.443470046300000000
      Time = 39334.443470046300000000
      TabOrder = 0
    end
  end
  object BitBtnOk: TBitBtn
    Left = 20
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnOkClick
  end
  object BitBtnClose: TBitBtn
    Left = 100
    Top = 96
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnCloseClick
  end
end
