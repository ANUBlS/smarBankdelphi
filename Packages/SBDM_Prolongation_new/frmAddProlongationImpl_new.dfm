object frmAddProlongation_new: TfrmAddProlongation_new
  Left = 0
  Top = 0
  ClientHeight = 136
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnClose: TBitBtn
    Left = 108
    Top = 103
    Width = 80
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtnCloseClick
  end
  object BitBtnOk: TBitBtn
    Left = 22
    Top = 103
    Width = 80
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtnOkClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 212
    Height = 48
    Align = alTop
    Caption = #1071#1074#1074#1103#1083#1082#1080' '#1073#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
    TabOrder = 2
    object DTPLast: TDateTimePicker
      Left = 5
      Top = 17
      Width = 201
      Height = 21
      Date = 39334.443470046300000000
      Time = 39334.443470046300000000
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 48
    Width = 212
    Height = 49
    Align = alTop
    Caption = #1049#1077#1085#1080' '#1073#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
    TabOrder = 3
    object DTPNew: TDateTimePicker
      Left = 5
      Top = 17
      Width = 201
      Height = 21
      Date = 39334.443470046300000000
      Time = 39334.443470046300000000
      TabOrder = 0
    end
  end
end
