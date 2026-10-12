object CorrectorMainForm: TCorrectorMainForm
  Left = 127
  Top = 164
  BorderIcons = [biSystemMenu]
  ClientHeight = 533
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 495
    Width = 926
    Height = 38
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096
    TabOrder = 0
    object Editnum: TEdit
      Left = 3
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = EditnumKeyPress
    end
    object Button1: TButton
      Left = 666
      Top = 9
      Width = 75
      Height = 25
      Action = ActnOK
      TabOrder = 1
    end
    object Button2: TButton
      Left = 746
      Top = 9
      Width = 75
      Height = 25
      Action = ACTNnook
      TabOrder = 2
    end
    object Button3: TButton
      Left = 837
      Top = 9
      Width = 75
      Height = 25
      Caption = #1041#1072#1100#1083#1072
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 926
    Height = 495
    Align = alClient
    DataSource = CorrectorDataMod.DSCorrectData
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        ReadOnly = True
        Width = 91
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 155
      end
      item
        EditButtons = <>
        FieldName = 'REST'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'INTERESTREST'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'DUEREST'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'DUEINTERESTREST'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'GIVENAMOUNT'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'OBLIGATION'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'PENALTYREST'
        Footers = <>
      end>
  end
  object ActionList1: TActionList
    Left = 472
    Top = 216
    object ActnOK: TAction
      Caption = #1043#1103#1073#1091#1083
      OnExecute = ActnOKExecute
      OnUpdate = ActnOKUpdate
    end
    object ACTNnook: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = ACTNnookExecute
      OnUpdate = ActnOKUpdate
    end
    object ActnSearch: TAction
      Caption = 'ActnSearch'
      OnExecute = ActnSearchExecute
    end
  end
end
