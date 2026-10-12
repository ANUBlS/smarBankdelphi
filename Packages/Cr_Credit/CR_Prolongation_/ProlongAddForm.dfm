object frmProlongAdd: TfrmProlongAdd
  Left = 543
  Top = 258
  BorderIcons = [biSystemMenu]
  Caption = 'M'#252'dd'#601'tin uzad'#305'lmas'#305
  ClientHeight = 94
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 272
    Height = 53
    Align = alBottom
    Caption = 'Yeni ba'#287'lanma tarixi'
    TabOrder = 0
    object DTPProlongDate: TDateTimePicker
      Left = 9
      Top = 22
      Width = 164
      Height = 21
      Date = 38442.997874710600000000
      Time = 38442.997874710600000000
      TabOrder = 0
    end
    object ButtonOK: TButton
      Left = 188
      Top = 19
      Width = 81
      Height = 27
      Caption = 'Q'#601'bul'
      TabOrder = 1
      OnClick = ButtonOKClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 272
    Height = 41
    Align = alClient
    Caption = #399'vv'#601'lki ba'#287'lanma m'#601'bl'#287'n'
    TabOrder = 1
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 9
      Top = 15
      Width = 163
      Height = 21
      DataField = 'DUEDATE'
      DataSource = ProlongDataMod.DSCreditInfo
      Enabled = False
      EditButtons = <>
      Kind = dtkDateEh
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
  end
end
