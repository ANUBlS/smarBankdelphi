object Ph_CO_BookmarkAddEditForm: TPh_CO_BookmarkAddEditForm
  Left = 287
  Top = 352
  ClientHeight = 94
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 8
    Width = 50
    Height = 14
    Caption = #1058#1103#1081#1080#1085#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 159
    Top = 6
    Width = 80
    Height = 14
    Caption = #1041#1091#1082#1084#1072#1088#1082#1099#1085' '#1072#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit3: TDBEdit
    Left = 159
    Top = 25
    Width = 144
    Height = 22
    Color = clWhite
    DataField = 'BOOKMARKNAME'
    DataSource = DataModPCustService.DSBookmarks
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 150
    Top = 56
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
    TabOrder = 1
  end
  object Button2: TButton
    Left = 230
    Top = 56
    Width = 75
    Height = 25
    Action = ActnReject
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 1
    Top = 25
    Width = 145
    Height = 21
    DataField = 'FIELDID'
    DataSource = DataModPCustService.DSBookmarks
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = DataModPCustService.DSFileds
    TabOrder = 3
  end
  object ActionList1: TActionList
    Top = 48
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
