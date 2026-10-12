object SbdmAddEditForm: TSbdmAddEditForm
  Left = 0
  Top = 0
  Caption = 'SbdmAddEditForm'
  ClientHeight = 169
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 123
    Top = 12
    Width = 121
    Height = 21
    DataField = 'HDATE'
    DataSource = SbdmScheduleDataModule.DataSource2
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object DBEditEh1: TDBEditEh
    Left = 122
    Top = 52
    Width = 169
    Height = 21
    DataField = 'INTEREST'
    DataSource = SbdmScheduleDataModule.DataSource2
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnEnter = DBEditEh1Enter
  end
  object DBEditEh2: TDBEditEh
    Left = 122
    Top = 92
    Width = 169
    Height = 21
    DataField = 'IPINTEREST'
    DataSource = SbdmScheduleDataModule.DataSource2
    EditButtons = <>
    Enabled = False
    TabOrder = 2
    Visible = True
  end
  object StaticText1: TStaticText
    Left = 2
    Top = 16
    Width = 36
    Height = 17
    Caption = 'Tarix:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 2
    Top = 56
    Width = 97
    Height = 17
    Caption = #399'sas m'#601'bl'#601#287'd'#601'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 4
  end
  object StaticText3: TStaticText
    Left = 2
    Top = 96
    Width = 118
    Height = 17
    Caption = 'Hesablanm'#305#351' %-d'#601'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 5
  end
  object Button1: TButton
    Left = 128
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    ModalResult = 1
    TabOrder = 6
  end
  object Button2: TButton
    Left = 209
    Top = 129
    Width = 75
    Height = 25
    Caption = #304'mtina'
    ModalResult = 2
    TabOrder = 7
  end
end
