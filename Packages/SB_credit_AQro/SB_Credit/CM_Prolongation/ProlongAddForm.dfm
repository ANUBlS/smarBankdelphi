object frmProlongAdd: TfrmProlongAdd
  Left = 610
  Top = 269
  BorderIcons = [biSystemMenu]
  Caption = 'M'#252'qavil'#601'nin uzad'#305'lmas'#305
  ClientHeight = 122
  ClientWidth = 279
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 69
    Width = 279
    Height = 53
    Align = alBottom
    Caption = 'Yeni ba'#287'lanma tarixi'
    TabOrder = 0
    ExplicitTop = 40
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
    Width = 279
    Height = 69
    Align = alClient
    Caption = #399'vv'#601'lki ba'#287'lanma tarixi'
    TabOrder = 1
    ExplicitHeight = 40
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
