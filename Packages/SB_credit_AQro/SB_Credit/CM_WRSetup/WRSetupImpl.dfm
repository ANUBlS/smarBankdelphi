object TemplateDeleteEditForm: TTemplateDeleteEditForm
  Left = 355
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 131
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 34
    Top = 9
    Width = 3
    Height = 14
  end
  object DBEdit1: TDBEdit
    Left = 26
    Top = 34
    Width = 242
    Height = 22
    DataField = 'ID'
    DataSource = WRSetupDataMod.WRTemplatesDataSrc
    TabOrder = 0
  end
  object Button1: TButton
    Left = 103
    Top = 86
    Width = 81
    Height = 27
    Action = ActnAccept
    Caption = '√€бул'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 207
    Top = 86
    Width = 81
    Height = 27
    Action = ActnReject
    Cancel = True
    Caption = '»мтина'
    TabOrder = 2
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 272
    Top = 64
  end
  object ActionList1: TActionList
    Left = 48
    Top = 104
    object ActnAccept: TAction
      Caption = 'ActnAccept'
      OnExecute = ActnAcceptExecute
    end
    object ActnReject: TAction
      Caption = 'ActnReject'
      OnExecute = ActnRejectExecute
    end
  end
end
