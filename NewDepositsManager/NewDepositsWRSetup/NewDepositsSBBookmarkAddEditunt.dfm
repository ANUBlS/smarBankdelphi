object NewDepositsSBBookmarkAddEditForm: TNewDepositsSBBookmarkAddEditForm
  Left = 0
  Top = 0
  Caption = 'NewDepositsSBBookmarkAddEditForm'
  ClientHeight = 103
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 8
    Width = 42
    Height = 15
    Caption = 'T'#601'yinat'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 171
    Top = 8
    Width = 79
    Height = 15
    Caption = 'Bukmark'#305'n ad'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 162
    Top = 60
    Width = 80
    Height = 27
    Action = ActnAccept
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 248
    Top = 60
    Width = 80
    Height = 27
    Action = ActnReject
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 169
    Top = 25
    Width = 155
    Height = 22
    Color = clWhite
    DataField = 'BOOKMARKNAME'
    DataSource = NewDepositsSBWRSetupDataMod.SBWRBookmarksDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 1
    Top = 26
    Width = 156
    Height = 21
    Color = clCaptionText
    DataField = 'FIELDID'
    DataSource = NewDepositsSBWRSetupDataMod.SBWRBookmarksDSrc
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = NewDepositsSBWRSetupDataMod.SBWRFieldsDSrc
    TabOrder = 3
    Visible = True
  end
  object ActionList1: TActionList
    Left = 16
    Top = 56
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
