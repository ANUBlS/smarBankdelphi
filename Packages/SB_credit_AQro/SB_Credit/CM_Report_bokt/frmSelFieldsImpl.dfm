object frmSelFields: TfrmSelFields
  Left = 391
  Top = 237
  Width = 333
  Height = 349
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 322
    Align = alClient
    TabOrder = 0
    object CheckExportList: TCheckListBox
      Left = 1
      Top = 21
      Width = 323
      Height = 257
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
    end
    object Button1: TButton
      Left = 235
      Top = 288
      Width = 75
      Height = 25
      Action = Action1
      Caption = 'OK'
      Default = True
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 323
      Height = 20
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 2
      object CheckBox1: TCheckBox
        Left = 4
        Top = 1
        Width = 149
        Height = 17
        Caption = 'ўамысыны сечм€к'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = '»храж олунажаг сащ€л€рин сечилм€си'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 72
    Top = 288
  end
  object ActionList1: TActionList
    Left = 184
    Top = 288
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
  end
end
