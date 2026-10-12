object SBTemplAddEditForm: TSBTemplAddEditForm
  Left = 256
  Top = 218
  Width = 362
  Height = 170
  BorderIcons = [biSystemMenu]
  Caption = 'SBTemplAddEditForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Ўаблонун ады :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 60
    Height = 13
    Caption = 'Ўаблон файлы :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SBOpenDlg: TSpeedButton
    Left = 320
    Top = 72
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = SBOpenDlgClick
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 305
    Height = 21
    Color = clWhite
    DataField = 'NAME'
    DataSource = SBWRSetupDataMod.SBWRTemplatesDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 72
    Width = 305
    Height = 21
    Color = clWhite
    DataField = 'PATH'
    DataSource = SBWRSetupDataMod.SBWRTemplatesDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 192
    Top = 104
    Width = 75
    Height = 25
    Action = ActnAccept
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 272
    Top = 104
    Width = 75
    Height = 25
    Action = ActnReject
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 96
    Top = 104
  end
  object ActionList1: TActionList
    Left = 136
    Top = 104
    object ActnAccept: TAction
      Caption = '√€бул'
      OnExecute = ActnAcceptExecute
    end
    object ActnReject: TAction
      Caption = '»мтина'
      OnExecute = ActnRejectExecute
    end
  end
end
