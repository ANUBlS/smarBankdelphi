object CO_TemplAddEditForm: TCO_TemplAddEditForm
  Left = 261
  Top = 317
  Caption = 'Yeni '#350'ablon'
  ClientHeight = 143
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SBOpenDlg: TSpeedButton
    Left = 320
    Top = 72
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = SBOpenDlgClick
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 68
    Height = 14
    Caption = #350'ablonun ad'#305' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 74
    Height = 14
    Caption = #350'ablonun fayl'#305' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 305
    Height = 22
    Color = clWhite
    DataField = 'NAME'
    DataSource = CO_DataMod.DSTemplates
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
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
    DataSource = CO_DataMod.DSTemplates
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
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
    Caption = 'Q'#601'bul'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
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
    Caption = #304'mtina'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 104
    Width = 65
    Height = 22
    DataField = 'CUSTTYPE'
    DataSource = CO_DataMod.DSTemplates
    TabOrder = 4
    Visible = False
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
