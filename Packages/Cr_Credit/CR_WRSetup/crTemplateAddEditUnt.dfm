object TemplAddEditForm: TTemplAddEditForm
  Left = 653
  Top = 327
  BorderIcons = [biSystemMenu]
  ClientHeight = 144
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 9
    Width = 79
    Height = 15
    Caption = #350'ablonun ad'#305' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 60
    Width = 69
    Height = 15
    Caption = #350'ablon fayl'#305' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SBOpenDlg: TSpeedButton
    Left = 345
    Top = 78
    Width = 24
    Height = 23
    Caption = '...'
    OnClick = SBOpenDlgClick
  end
  object DBEdit1: TDBEdit
    Left = 9
    Top = 26
    Width = 328
    Height = 23
    Color = clWhite
    DataField = 'NAME'
    DataSource = WRSetupDataMod.WRTemplatesDataSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 9
    Top = 78
    Width = 328
    Height = 23
    Color = clWhite
    DataField = 'PATH'
    DataSource = WRSetupDataMod.WRTemplatesDataSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 207
    Top = 112
    Width = 81
    Height = 27
    Action = ActnAccept
    Caption = 'Q'#601'bul'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 293
    Top = 112
    Width = 81
    Height = 27
    Action = ActnReject
    Caption = #304'mtina'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 136
    Top = 104
    object ActnAccept: TAction
      Caption = #195#255#225#243#235
      OnExecute = ActnAcceptExecute
    end
    object ActnReject: TAction
      Caption = #200#236#242#232#237#224
      OnExecute = ActnRejectExecute
    end
  end
end
