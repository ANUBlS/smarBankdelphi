object Ph_CO_TemplAddEditForm: TPh_CO_TemplAddEditForm
  Left = 369
  Top = 223
  ClientHeight = 140
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 14
    Caption = #1064#1072#1073#1083#1086#1085#1091#1085' '#1072#1076#1099' :'
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
    Width = 83
    Height = 14
    Caption = #1064#1072#1073#1083#1086#1085' '#1092#1072#1081#1083#1099' :'
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
    Height = 22
    Color = clWhite
    DataField = 'NAME'
    DataSource = P_DataModule.DSTemplates
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
    Height = 22
    Color = clWhite
    DataField = 'PATH'
    DataSource = P_DataModule.DSTemplates
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 104
    Width = 65
    Height = 21
    DataField = 'CUSTTYPE'
    DataSource = P_DataModule.DSTemplates
    TabOrder = 2
    Visible = False
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
    TabOrder = 3
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
    TabOrder = 4
  end
  object ActionList1: TActionList
    Left = 136
    Top = 104
    object ActnAccept: TAction
      Caption = #1043#1103#1073#1091#1083
      OnExecute = ActnAcceptExecute
    end
    object ActnReject: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = ActnRejectExecute
    end
  end
end
