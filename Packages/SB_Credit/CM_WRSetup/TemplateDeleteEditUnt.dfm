object TemplateDeleteEditForm: TTemplateDeleteEditForm
  Left = 402
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 135
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 34
    Top = 9
    Width = 3
    Height = 14
  end
  object Label2: TLabel
    Left = 24
    Top = 16
    Width = 35
    Height = 14
    Caption = 'Íþìðÿ'
  end
  object DBEdit1: TDBEdit
    Left = 26
    Top = 34
    Width = 242
    Height = 22
    Color = clWhite
    DataField = 'ID'
    DataSource = WRSetupDataMod.WRTemplatesDataSrc
    TabOrder = 0
  end
  object Button1: TButton
    Left = 119
    Top = 86
    Width = 81
    Height = 27
    Action = ActnAccept
    TabOrder = 1
  end
  object Button2: TButton
    Left = 207
    Top = 86
    Width = 81
    Height = 27
    Action = ActnReject
    Cancel = True
    Caption = 'Èìòèíà'
    TabOrder = 2
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 56
    Top = 80
  end
  object ActionList1: TActionList
    Left = 16
    Top = 80
    object ActnAccept: TAction
      Caption = 'Ãÿáóë'
      OnExecute = ActnAcceptExecute
    end
    object ActnReject: TAction
      Caption = 'ActnReject'
      OnExecute = ActnRejectExecute
    end
  end
end
