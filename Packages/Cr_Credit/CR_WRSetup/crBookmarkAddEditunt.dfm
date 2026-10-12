object BookmarkAddEditForm: TBookmarkAddEditForm
  Left = 441
  Top = 292
  BorderStyle = bsToolWindow
  ClientHeight = 90
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 6
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
    Top = 6
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
  object DBEdit3: TDBEdit
    Left = 171
    Top = 27
    Width = 155
    Height = 23
    Color = clWhite
    DataField = 'BOOKMARKNAME'
    DataSource = WRSetupDataMod.WRBookmarksDataSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 162
    Top = 60
    Width = 80
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
    TabOrder = 1
  end
  object Button2: TButton
    Left = 248
    Top = 60
    Width = 80
    Height = 27
    Action = ActnReject
    Caption = #304'mtina'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
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
    DataSource = WRSetupDataMod.WRBookmarksDataSrc
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = WRSetupDataMod.WRFieldsDataSrc
    TabOrder = 3
    Visible = True
  end
  object ActionList1: TActionList
    Left = 32
    Top = 48
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
