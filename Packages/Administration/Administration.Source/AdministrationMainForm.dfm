object AdministrationForm: TAdministrationForm
  Left = 340
  Top = 184
  Width = 894
  Height = 671
  Caption = 'Administration'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 655
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 644
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 161
      Top = 45
      Width = 4
      Height = 579
      Cursor = crHSplit
      AutoSnap = False
      Color = clBtnFace
      MinSize = 1
      ParentColor = False
      OnMoved = Splitter1Moved
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 884
      Height = 44
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 68
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = ImLToolBar
      Indent = 1
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object tbAddUser: TToolButton
        Left = 1
        Top = 0
        Hint = '»стифад€чинин €лав€ етм€си'
        Action = AddUser
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbDropUser: TToolButton
        Left = 77
        Top = 0
        Hint = '»стифад€чини л€ьв етм€си'
        Action = DropUser
        Caption = 'Ѕаьла'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 145
        Top = 0
        Width = 12
        Caption = 'ToolButton4'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 157
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbPost: TToolButton
        Left = 165
        Top = 0
        Hint = '√€бул'
        Action = PostChng
        Caption = '      √€бул     '
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton10: TToolButton
        Left = 233
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbRefresh: TToolButton
        Left = 241
        Top = 0
        Hint = '…енил€м€к'
        Action = RefreshMd
        Caption = '…енил€м€к'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton5: TToolButton
        Left = 309
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 317
        Top = 0
        Width = 12
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 329
        Top = 0
        Hint = '—инифин €лав€ етм€си'
        Action = ClassCreate
        Caption = 'ялав€'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton12: TToolButton
        Left = 397
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 405
        Top = 0
        Hint = '—инифи л€ьв етм€си'
        Action = ClassDrop
        Caption = 'Ћ€ьв'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton8: TToolButton
        Left = 473
        Top = 0
        Width = 12
        Caption = 'ToolButton8'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 485
        Top = 0
        Hint = '√рупун €лав€ етм€си'
        Action = GroupCreate
        Caption = 'ялав€'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton11: TToolButton
        Left = 553
        Top = 0
        Hint = '√рупу л€ьв етм€си'
        Action = GroupDrop
        Caption = 'Ћ€ьв'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton13: TToolButton
        Left = 621
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 629
        Top = 0
        Hint = '—ащибл€рин д€йишдирилм€си'
        Caption = '—ащибл€р'
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton14Click
      end
      object ToolButton15: TToolButton
        Left = 697
        Top = 0
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 13
        Style = tbsSeparator
      end
      object ToolButton16: TToolButton
        Left = 705
        Top = 0
        Action = actBalAcc
        Visible = False
      end
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 624
      Width = 884
      Height = 19
      Panels = <>
      SimplePanel = False
    end
    object tvMain: TTreeView
      Left = 1
      Top = 45
      Width = 160
      Height = 579
      Align = alLeft
      HideSelection = False
      Images = ImLAdm
      Indent = 21
      ReadOnly = True
      TabOrder = 2
      OnChange = tvMainChange
      OnCustomDraw = tvMainCustomDraw
      OnKeyDown = tvMainKeyDown
      Items.Data = {
        05000000210000000100000001000000FFFFFFFFFFFFFFFF0000000000000000
        08D1E8EDE8F4EBFFF0200000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000007C3F0F3EFEBE0F0260000000200000002000000FFFFFFFFFFFFFF
        FF00000000000000000DC8F1F2E8F4E0E4FFF7E8EBFFF0210000000300000003
        000000FFFFFFFFFFFFFFFF000000000000000008CCEEE4F3EBEBE0F023000000
        0C0000000C000000FFFFFFFFFFFFFFFF00000000000000000AD9E5F1E0E1E0F2
        EBE0F0}
    end
    object pnlOptRef: TPanel
      Left = 165
      Top = 45
      Width = 720
      Height = 579
      Align = alClient
      TabOrder = 3
      object pnlCtrlBr: TPanel
        Left = 1
        Top = 1
        Width = 718
        Height = 472
        Align = alTop
        TabOrder = 0
        object pcMain: TPageControl
          Left = 1
          Top = 1
          Width = 716
          Height = 470
          ActivePage = tbGroup
          Align = alClient
          HotTrack = True
          TabOrder = 0
          OnChange = CBMainChangeExecute
          object tbInfo: TTabSheet
            Caption = '»стифад€чинин информассийасы'
            ImageIndex = 2
            object gbUserInf: TGroupBox
              Left = 0
              Top = 0
              Width = 708
              Height = 442
              Align = alClient
              Caption = '»стифад€чинин информассийасы'
              TabOrder = 0
              object Panel10: TPanel
                Left = 2
                Top = 15
                Width = 704
                Height = 58
                Align = alTop
                BevelInner = bvSpace
                BevelOuter = bvLowered
                TabOrder = 0
                object Panel12: TPanel
                  Left = 2
                  Top = 2
                  Width = 247
                  Height = 54
                  Align = alLeft
                  BevelInner = bvSpace
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object edUsInfName: TEdit
                    Left = 14
                    Top = 24
                    Width = 219
                    Height = 21
                    Color = clCaptionText
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object StaticText5: TStaticText
                    Left = 15
                    Top = 9
                    Width = 36
                    Height = 14
                    AutoSize = False
                    Caption = 'јды'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                  end
                end
                object Panel13: TPanel
                  Left = 249
                  Top = 2
                  Width = 453
                  Height = 54
                  Align = alClient
                  BevelInner = bvSpace
                  BevelOuter = bvLowered
                  TabOrder = 1
                  object edUsInfFName: TEdit
                    Left = 13
                    Top = 24
                    Width = 430
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                  end
                  object StaticText6: TStaticText
                    Left = 13
                    Top = 8
                    Width = 58
                    Height = 13
                    AutoSize = False
                    Caption = '“ам ады'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
              object Panel11: TPanel
                Left = 2
                Top = 73
                Width = 704
                Height = 106
                Align = alTop
                BevelInner = bvSpace
                BevelOuter = bvLowered
                TabOrder = 1
                object Bevel1: TBevel
                  Left = 2
                  Top = 2
                  Width = 700
                  Height = 49
                  Align = alTop
                  Shape = bsFrame
                end
                object Label5: TLabel
                  Left = 16
                  Top = 8
                  Width = 53
                  Height = 13
                  Caption = '“€йиннаты'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edUsInfDescr: TEdit
                  Left = 16
                  Top = 24
                  Width = 675
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object Panel3: TPanel
                  Left = 2
                  Top = 51
                  Width = 582
                  Height = 53
                  Align = alClient
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 1
                  object Label6: TLabel
                    Left = 435
                    Top = 8
                    Width = 27
                    Height = 13
                    Anchors = [akTop, akRight]
                    Caption = '‘илиал'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edUsInfPhone: TMaskEdit
                    Left = 16
                    Top = 24
                    Width = 57
                    Height = 21
                    EditMask = '99-99-99;1;'
                    MaxLength = 8
                    TabOrder = 0
                    Text = '  -  -  '
                  end
                  object StaticText3: TStaticText
                    Left = 16
                    Top = 7
                    Width = 47
                    Height = 14
                    AutoSize = False
                    Caption = '“елефон'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                  end
                  object edUsInfCrDat: TEdit
                    Left = 82
                    Top = 24
                    Width = 223
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    Color = clWhite
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object StaticText2: TStaticText
                    Left = 83
                    Top = 8
                    Width = 90
                    Height = 13
                    AutoSize = False
                    Caption = '…арадылма тарихи'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 3
                  end
                  object edUsInfClass: TSearchCombo
                    Left = 310
                    Top = 23
                    Width = 115
                    Height = 22
                    Anchors = [akTop, akRight]
                    ItemHeight = 16
                    TabOrder = 4
                    DataSource = AdministrationData.Classes
                    ViewField = 'obj'
                    DefaultString = 'No class'
                    DefaultStringUse = True
                    DefaultStringColor = clRed
                  end
                  object StaticText1: TStaticText
                    Left = 310
                    Top = 9
                    Width = 34
                    Height = 12
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '—иниф'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 5
                  end
                  object edUsInfFilial: TSearchCombo
                    Left = 434
                    Top = 23
                    Width = 133
                    Height = 22
                    Anchors = [akTop, akRight]
                    ItemHeight = 16
                    TabOrder = 6
                    DataSource = AdministrationData.Filial
                    ViewField = 'NAME'
                    DefaultStringUse = False
                    DefaultStringColor = clRed
                  end
                end
                object Panel4: TPanel
                  Left = 584
                  Top = 51
                  Width = 118
                  Height = 53
                  Align = alRight
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 2
                  object SpeedButton1: TSpeedButton
                    Left = 41
                    Top = 11
                    Width = 34
                    Height = 30
                    Anchors = [akTop, akRight]
                    Flat = True
                    Glyph.Data = {
                      D6020000424DD60200000000000036000000280000000F0000000E0000000100
                      180000000000A0020000C40E0000C40E00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
                      FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
                      FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF
                      00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF0000
                      00000000FF00FF000000FF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FF000000FF00FF000000
                      000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                      00000000FF00FF000000000000000000FF00FFFF00FF00000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      FF00FFFF00FF0000000000000000000000000000000000000000000000000000
                      00000000000000000000FF00FF000000000000000000000000FF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
                      000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FF000000FF00FF000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF0000
                      00FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000}
                    Layout = blGlyphRight
                    Spacing = 0
                    OnClick = SpeedButton1Click
                  end
                  object sbLock: TSpeedButton
                    Left = 75
                    Top = 11
                    Width = 34
                    Height = 30
                    Action = LockUser
                    AllowAllUp = True
                    Anchors = [akTop, akRight]
                    GroupIndex = 3
                    Enabled = False
                    Flat = True
                    Glyph.Data = {
                      06030000424D060300000000000036000000280000000F0000000F0000000100
                      180000000000D0020000C40E0000C40E00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FF000000FF00FFFF00FF00000000000000000000000000000000
                      0000000000000000000000000000000000FF00FFFF00FF000000FF00FF000000
                      8486848486848486848486848486848486848486848486848486848486848486
                      84000000FF00FF000000FF00FF000000DEDFDEE7E7E7E7E7E7B5B6B5A5615A52
                      00218486849C9E9CC6C7C6C6C7C69C9E9C000000FF00FF000000FF00FF000000
                      DEDFDEE7E7E7E7E7E7B5B6B5A5615A5200218486849C9E9CC6C7C6C6C7C69C9E
                      9C000000FF00FF000000FF00FF000000FFFFFFE7E7E7E7E7E7E7E7E7B5968C63
                      515A9C9E9C9C9E9CC6C7C6C6C7C69C9E9C000000FF00FF000000FF00FF000000
                      FFFFFFE7E7E7E7E7E7B5B6B5A5615A5200218486849C9E9CC6C7C6C6C7C69C9E
                      9C000000FF00FF000000FF00FF000000FFFFFFE7E7E7E7E7E7B5B6B5A5615A52
                      00218486849C9E9CC6C7C6C6C7C69C9E9C000000FF00FF000000FF00FF000000
                      FFFFFFFFFFFFFFFFFFDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDE9C9E
                      9C000000FF00FF000000FF00FFFF00FF00000000000000000000000000000000
                      0000000000000000000000000000000000FF00FFFF00FF000000FF00FFFF00FF
                      FF00FF292029A5A6A5212021FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FF000000FF00FFFF00FFFF00FF181818F7F7F7101010FF00FFFF
                      00FFFF00FF181818000000000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
                      FF00FF101010F7F7F7E7E7E70808080000000000007B797BBDBEBD080808FF00
                      FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF000000FFFFFFDEDFDEDE
                      DFDEC6C7C6B5B6B5000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
                      FF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00FFFF00
                      FFFF00FFFF00FF000000}
                    Visible = False
                  end
                  object SpeedButton2: TSpeedButton
                    Left = 7
                    Top = 11
                    Width = 34
                    Height = 30
                    Action = SetOptions
                    Flat = True
                    Glyph.Data = {
                      36040000424D3604000000000000360000002800000010000000100000000100
                      2000000000000004000000000000000000000000000000000000FF00FF00FF00
                      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
                      FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                      FF000000000000000000FF00FF00FF00FF000000000018109400000000000000
                      00000000000031212100312121003121210029181800FF00FF00FF00FF000000
                      00004A7B000000000000FF00FF00FF00FF00000000001810A500000000004231
                      31006331310039212900312121003921210031212100FF00FF00FF00FF000000
                      0000FFDEE70000000000FF00FF0000000000000000001818BD00000000004A39
                      3900633139004229290039212900FF00FF00FF00FF00FF00FF00FF00FF00FF00
                      FF00FFEFF700000000000000000094525A005A424200312929005A3942007342
                      42006B3939004231310039212900FF00FF00FF00FF00FF00FF00FF00FF000000
                      0000FFFFFF00735252009C6363009C636300945A5A00FFD6DE005A4242007B42
                      4A004A3939004A31310042313100FF00FF00FF00FF00FF00FF0000000000B56B
                      7300FFFFFF007B5A6300AD6B6B000000000000000000FFE7EF00000000005A42
                      4200000000004A39390042313100FF00FF00FF00FF00FF00FF0000000000BD73
                      7300D6BDC6007B63630000000000D6C6C600FFFFFF008C7B7B00847373009484
                      8400000000004A39390042313100FF00FF00FF00FF00FF00FF00000000000000
                      0000FFEFF7000000000000000000FFFFFF00FFFFFF00FFFFFF00FFE7EF000000
                      00005A394200523939004A313100FF00FF00FF00FF00FF00FF00000000000000
                      0000FFFFFF000000000084636300BD737300AD6B6B00A5636B00CE949C000000
                      00009442420000000000734A4A00FF00FF00FF00FF00FF00FF0000000000C67B
                      8400CE848400C67B8400C67B7B00BD737300EFB5BD0000000000AD4A52009C42
                      4A00AD7B8400D6ADB50000000000FF00FF00FF00FF00FF00FF0000000000C67B
                      8400C67B8400C67B8400FFC6CE0000000000C65A5A00BD525A00CE949C00FFD6
                      DE0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000C67B
                      7B00FFC6CE0000000000CE636300CE5A6300E7ADB500FFFFFF0000000000FF00
                      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000D69C
                      A500CE636300CE636300F7BDBD00FFFFFF0000000000FF00FF00FF00FF00FF00
                      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000CE5A
                      6300F7B5BD00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
                      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  end
                end
              end
              object Panel14: TPanel
                Left = 2
                Top = 179
                Width = 704
                Height = 261
                Align = alClient
                BevelInner = bvSpace
                BevelOuter = bvLowered
                TabOrder = 2
                object tsDepSub: TTabSet
                  Left = 2
                  Top = 238
                  Width = 700
                  Height = 21
                  Align = alBottom
                  DitherBackground = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  SelectedColor = 11883563
                  Style = tsOwnerDraw
                  TabHeight = 17
                  Tabs.Strings = (
                    '  √рупларда иштирак едир'
                    '  јсылылар'
                    '  “абе ед€нл€р')
                  TabIndex = 0
                  UnselectedColor = clWhite
                  OnChange = tsDepSubChange
                  OnDrawTab = tsDepSubDrawTab
                end
                object pcDepSub: TPageControl
                  Left = 2
                  Top = 2
                  Width = 700
                  Height = 236
                  ActivePage = tbsUserGroup
                  Align = alClient
                  Style = tsButtons
                  TabOrder = 1
                  object tbsUserGroup: TTabSheet
                    ImageIndex = 2
                    TabVisible = False
                    object DBGrid3: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 692
                      Height = 226
                      Align = alClient
                      DataSource = AdministrationData.UserGroup
                      FixedColor = 11883563
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindow
                      TitleFont.Height = -11
                      TitleFont.Name = 'Azl Sans Serif'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'USERSTATE'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'Azl Sans Serif'
                          Font.Style = []
                          Title.Caption = '»стифад€чинин типи'
                          Width = 103
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'OBJ'
                          Title.Caption = '√рупун ады'
                          Width = 152
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TYPE$'
                          Title.Caption = '√рупун типи'
                          Width = 185
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRIPTION'
                          Title.Caption = '“€йинаты'
                          Width = 500
                          Visible = True
                        end>
                    end
                  end
                  object tbsDepend: TTabSheet
                    Caption = 'tbsDepend'
                    TabVisible = False
                    object DBGrid1: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 596
                      Height = 217
                      Align = alClient
                      DataSource = AdministrationData.Dependences
                      FixedColor = 11883563
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMenuText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      ParentFont = False
                      ParentShowHint = False
                      ReadOnly = True
                      ShowHint = False
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindow
                      TitleFont.Height = -11
                      TitleFont.Name = 'Azl Sans Serif'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NAME'
                          Title.Caption = 'јсыллы »стифад€чил€р'
                          Width = 150
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'OBJ'
                          Title.Caption = '√рупун ады'
                          Width = 200
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TYPE$'
                          Title.Caption = '√рупун типи'
                          Width = 500
                          Visible = True
                        end>
                    end
                  end
                  object tbsSubmis: TTabSheet
                    Caption = 'tbsSubmis'
                    ImageIndex = 1
                    TabVisible = False
                    object DBGrid2: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 596
                      Height = 217
                      Align = alClient
                      DataSource = AdministrationData.Submission
                      FixedColor = 11883563
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindow
                      TitleFont.Height = -11
                      TitleFont.Name = 'Azl Sans Serif'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NAME'
                          Title.Caption = '“абе ед€н истифад€чил€р'
                          Width = 150
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'OBJ'
                          Title.Caption = '√рупун ады'
                          Width = 200
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TYPE$'
                          Title.Caption = '√рупун типи'
                          Width = 500
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
          end
          object tbModules: TTabSheet
            Caption = 'ћодуллар'
            OnResize = tbModulesResize
            object cgrModules: TDBCtrlGrid
              Left = 0
              Top = 17
              Width = 708
              Height = 425
              Align = alClient
              AllowDelete = False
              AllowInsert = False
              ColCount = 1
              DataSource = AdministrationData.UsModules
              PanelHeight = 21
              PanelWidth = 692
              PopupMenu = ModPop
              TabOrder = 0
              RowCount = 20
              SelectedColor = clNavy
              OnKeyDown = cgrModulesKeyDown
              OnPaintPanel = cgrModulesPaintPanel
              object grPan1: TPanel
                Left = 0
                Top = 0
                Width = 201
                Height = 21
                Align = alLeft
                ParentColor = True
                TabOrder = 0
                OnClick = DBText1Click
                object DBText1: TDBText
                  Left = 6
                  Top = 3
                  Width = 193
                  Height = 16
                  DataField = 'TRVDESC'
                  DataSource = AdministrationData.UsModules
                  OnClick = DBText1Click
                end
              end
              object grPan2: TPanel
                Left = 201
                Top = 0
                Width = 335
                Height = 21
                Align = alLeft
                ParentColor = True
                TabOrder = 1
                OnClick = DBText1Click
                object DBText2: TDBText
                  Left = 5
                  Top = 3
                  Width = 326
                  Height = 16
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'DESCRIPTION'
                  DataSource = AdministrationData.UsModules
                  OnClick = DBText1Click
                end
              end
              object grPan3: TPanel
                Left = 536
                Top = 0
                Width = 156
                Height = 21
                Align = alClient
                ParentColor = True
                TabOrder = 2
                OnClick = DBText1Click
                object cbMod: TDBCheckBox
                  Left = 8
                  Top = 3
                  Width = 15
                  Height = 14
                  DataField = 'MODACC'
                  DataSource = AdministrationData.UsModules
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = cbModClick
                  OnMouseUp = cbModMouseUp
                end
              end
            end
            object hcModules: THeaderControl
              Left = 0
              Top = 0
              Width = 708
              Height = 17
              BiDiMode = bdLeftToRight
              DragReorder = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              FullDrag = False
              HotTrack = True
              Images = ImLToolBar
              Sections = <
                item
                  ImageIndex = -1
                  Text = '“€йиннаты'
                  Width = 201
                end
                item
                  ImageIndex = 1
                  Text = 'ћодулун ады'
                  Width = 335
                end
                item
                  BiDiMode = bdLeftToRight
                  ImageIndex = -1
                  ParentBiDiMode = False
                  Text = 'ƒащил етм€к'
                  Width = 500
                end>
              ParentBiDiMode = False
              ParentFont = False
              OnSectionClick = hcModulesSectionClick
              OnSectionResize = hcModulesSectionResize
            end
          end
          object tbTables: TTabSheet
            Caption = ' ялав€ '
            ImageIndex = 1
            object Panel2: TPanel
              Left = 0
              Top = 37
              Width = 708
              Height = 405
              Align = alClient
              TabOrder = 0
              object grAdvan: TDBGrid
                Left = 1
                Top = 1
                Width = 706
                Height = 403
                Align = alClient
                Color = clCaptionText
                DataSource = AdministrationData.UsTables
                FixedColor = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                ImeName = 'ImLGrid'
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
                ParentFont = False
                PopupMenu = TabPopup
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindow
                TitleFont.Height = -11
                TitleFont.Name = 'Azl Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = grAdvanDrawColumnCell
                OnDblClick = grAdvanDblClick
                OnKeyDown = grAdvanKeyDown
                Columns = <
                  item
                    Color = clMenu
                    Expanded = False
                    Width = 18
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'TRVDESC'
                    Title.Caption = '“€йиннаты'
                    Width = 400
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'DESCRIPTION'
                    Title.Caption = 'ћодулун ады'
                    Width = 700
                    Visible = True
                  end>
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 708
              Height = 37
              Align = alTop
              TabOrder = 1
              object gbRights: TGroupBox
                Left = 8
                Top = 1
                Width = 550
                Height = 34
                Anchors = [akLeft, akTop, akRight]
                Caption = 'ўцгуглар'
                TabOrder = 0
                object sbAdvancedGrants: TSpeedButton
                  Left = 375
                  Top = 8
                  Width = 171
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'ялав€ щцгуглар'
                  Flat = True
                  Glyph.Data = {
                    2E060000424D2E06000000000000360400002800000017000000150000000100
                    080000000000F8010000C40E0000C40E00000001000000000000633110008442
                    1800D6732100EF9C21009C5A2900AD633100B5734A00DEA58400F7E7DE00C0C0
                    C000FFFFFF000000000000000000000000000000000000000000000001000000
                    0000000000000000000000001200FAB40000780047000012EB0012E75400FB78
                    0000B40012007C4FF0005046E000FFFF7C0039FFFF007C50450041D4BD00FAB4
                    00006600470000000000134CA80000660000EE0000007C504800000001001098
                    0000300014000017700000004C0011F20000000008003CEE0000177030000000
                    0000000000000000000000000100119C00000400140000000100000000000000
                    0000980000000014100012EE3800006C000030000800003C0000000000004CA8
                    0000800013000044F20047FB6C00F2CE0000FBF0EA00E5E8F200EEE42000ECF3
                    EA00F2EDE5007700E000130000000D48000024001300000000005C3A4300636F
                    4400656D750073746E006E6120005320640074746500676E6900415C7300696D
                    640073696E0061727400726F740065445C00746B730000706F00666E49006D72
                    6F00697461002E6E6F0066696700ABCD0000B8DCBA000012EE00F86A8000F1A8
                    770000001200000000000102F600000C8D0001000000000000000811F200EF14
                    0000D900120077F429000102F60000028D00040000000000000000000600F1A8
                    00007C0012000012F000000000003EC000000000130000000000000409000409
                    00000000000000000000134C3000EF6800000300120000000000133EC000FFFF
                    000000FFFF000000000012F04C0000010000480000000012F000B538EF000000
                    770000000000000000000000000000040000FF002900FFFFFF00000000000000
                    00003600000012020E0000000000000000003000000000134C00020E51000000
                    1200050000000000000012EF94000001000043000000445C3A0075636F006E65
                    6D0020737400646E6100655320006974740073676E0064415C006E696D007473
                    6900746172005C726F00736544006F746B00495C70006F666E00616D72006F69
                    7400672E6E000066690061006F00007200000000640000000000740070000069
                    00006E006F00007300000000000000010000000000000013000000000300F02C
                    00003600120077E264000811F200000000002400000000000000000000000001
                    000020000000000000000000000048EE0000F67C50008D01020000015D004CA8
                    000020001300000001000000120011F20000F20008000008110012F054008191
                    00004077F90077F89600FFFFFF00F064FF00A90012007C4FC100130000000008
                    000018001400000001000000660000660000EE0000007C504800000000000101
                    00000801010000000000E14B7400000077002C0000000012F0000811F200FB78
                    0000B40012007C4FF0004FC42800D1A47C00F200440000081100090909090909
                    090909050505090909090909090909090900090909090909090905070A070509
                    090909090909090909000909090909090905070A0A0A07050909090909090909
                    090009090909090905070A0000000A0705090909090909090900090909090905
                    070A02050404000A070509090909090909000909090905070A02050505050400
                    0A07050909090909090009090905070A0205050A0A0A0804000A070509090909
                    0900090905070A02050505060A08060504000A070509090909000905070A0205
                    050505050A0805050504000A07050909090005070A020505050505050A080505
                    050504000A0705090900050A0A050505050505050A080505050505040A0A0509
                    090005070A030505050505060A080505050504010A07050909000905070A0305
                    0505050A0A0805050504010A070509090900090905070A030505050505050505
                    04010A0705090909090009090905070A0305050508080504010A070509090909
                    09000909090905070A0305050A0805010A070509090909090900090909090905
                    070A03050504010A0705090909090909090009090909090905070A0301010A07
                    050909090909090909000909090909090905070A0A0A07050909090909090909
                    0900090909090909090905070A07050909090909090909090900090909090909
                    090909050505090909090909090909090900}
                  Visible = False
                  OnClick = sbAdvancedGrantsClick
                end
                object cbUpdate: TDBCheckBox
                  Left = 295
                  Top = 13
                  Width = 65
                  Height = 17
                  TabStop = False
                  Caption = 'Update'
                  DataField = 'CAN_UPDATE'
                  DataSource = AdministrationData.UsTables
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = cbInsertClick
                end
                object cbDelete: TDBCheckBox
                  Left = 175
                  Top = 13
                  Width = 65
                  Height = 17
                  TabStop = False
                  Caption = 'Delete'
                  DataField = 'CAN_DELETE'
                  DataSource = AdministrationData.UsTables
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = cbInsertClick
                end
                object cbInsert: TDBCheckBox
                  Left = 56
                  Top = 13
                  Width = 57
                  Height = 17
                  TabStop = False
                  Caption = 'Insert'
                  DataField = 'CAN_INSERT'
                  DataSource = AdministrationData.UsTables
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = cbInsertClick
                end
              end
              object gbSelAll: TGroupBox
                Left = 561
                Top = 1
                Width = 137
                Height = 34
                Anchors = [akTop, akRight]
                TabOrder = 1
                object sbSelAll: TSpeedButton
                  Left = 3
                  Top = 8
                  Width = 65
                  Height = 22
                  Caption = '—ечм€к'
                  Flat = True
                  OnClick = sbSelAllClick
                end
                object sbDeSelAll: TSpeedButton
                  Left = 69
                  Top = 8
                  Width = 65
                  Height = 22
                  Caption = '»нкар етм€к'
                  Flat = True
                  OnClick = sbSelAllClick
                end
              end
            end
          end
          object tbGroup: TTabSheet
            Caption = '√рупун информасийасы'
            ImageIndex = 3
            object Splitter3: TSplitter
              Left = 0
              Top = 171
              Width = 708
              Height = 3
              Cursor = crVSplit
              Align = alTop
              AutoSnap = False
            end
            object pnGroupMan: TPanel
              Left = 0
              Top = 174
              Width = 708
              Height = 268
              Align = alClient
              Color = clMenu
              TabOrder = 0
              OnResize = pnGroupManResize
              object pnQoupSlaveUsers: TPanel
                Left = 1
                Top = 39
                Width = 706
                Height = 228
                Align = alClient
                TabOrder = 0
                object Panel9: TPanel
                  Left = 1
                  Top = 184
                  Width = 704
                  Height = 43
                  Align = alBottom
                  BevelInner = bvSpace
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object Splitter2: TSplitter
                    Left = 321
                    Top = 2
                    Width = 3
                    Height = 39
                    Cursor = crHSplit
                  end
                  object Panel7: TPanel
                    Left = 2
                    Top = 2
                    Width = 319
                    Height = 39
                    Align = alLeft
                    BevelInner = bvSpace
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label3: TLabel
                      Left = 7
                      Top = 2
                      Width = 52
                      Height = 13
                      Caption = '√рупун ады'
                    end
                    object edGroupName: TEdit
                      Left = 7
                      Top = 14
                      Width = 306
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Color = clSilver
                      TabOrder = 0
                    end
                  end
                  object Panel15: TPanel
                    Left = 324
                    Top = 2
                    Width = 378
                    Height = 39
                    Align = alClient
                    BevelInner = bvSpace
                    BevelOuter = bvLowered
                    TabOrder = 1
                    object Label4: TLabel
                      Left = 6
                      Top = 2
                      Width = 43
                      Height = 13
                      Caption = '“€йиннаты'
                    end
                    object edGroupDescr: TEdit
                      Left = 6
                      Top = 14
                      Width = 360
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Color = clSilver
                      TabOrder = 0
                    end
                  end
                end
                object pnQroupPanel: TPanel
                  Left = 1
                  Top = 1
                  Width = 704
                  Height = 183
                  Align = alClient
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 1
                  object hcQroupHead: THeaderControl
                    Left = 2
                    Top = 2
                    Width = 700
                    Height = 17
                    DragReorder = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = []
                    FullDrag = False
                    Sections = <
                      item
                        ImageIndex = -1
                        Text = 'Ѕаш истифад€чи'
                        Width = 200
                      end
                      item
                        ImageIndex = -1
                        Text = '“абе истифад€чи'
                        Width = 200
                      end
                      item
                        ImageIndex = -1
                        Text = 'Ќейтрал истифад€чи'
                        Width = 270
                      end>
                    ParentFont = False
                    OnResize = hcQroupHeadResize
                    OnSectionClick = hcQroupHeadSectionClick
                    OnSectionResize = hcQroupHeadSectionResize
                  end
                  object slGroupGrid: TStringGrid
                    Left = 2
                    Top = 19
                    Width = 700
                    Height = 162
                    Align = alClient
                    Color = clWhite
                    ColCount = 3
                    DefaultRowHeight = 17
                    FixedCols = 0
                    FixedRows = 0
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    GridLineWidth = 0
                    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing]
                    ParentFont = False
                    ScrollBars = ssNone
                    TabOrder = 1
                    OnKeyDown = slGroupGridKeyDown
                    ColWidths = (
                      195
                      201
                      64)
                  end
                end
              end
              object gbGroupType: TGroupBox
                Left = 1
                Top = 1
                Width = 706
                Height = 38
                Align = alTop
                Caption = '√рупун типи'
                Color = clBtnFace
                ParentColor = False
                TabOrder = 1
                object DBText4: TDBText
                  Left = 68
                  Top = 16
                  Width = 54
                  Height = 13
                  AutoSize = True
                  DataField = 'DESCR'
                  DataSource = AdministrationData.Groups
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 8
                  Top = 16
                  Width = 54
                  Height = 13
                  Caption = '√рупун типи:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object sbShowUsTab: TSpeedButton
                  Left = 669
                  Top = 10
                  Width = 30
                  Height = 24
                  Action = ShowUsersTab
                  AllowAllUp = True
                  Anchors = [akTop, akRight]
                  GroupIndex = 1
                  Flat = True
                  Glyph.Data = {
                    42020000424D4202000000000000420000002800000010000000100000000100
                    1000030000000002000000000000000000000000000000000000007C0000E003
                    00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                    1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                    1F7C1F7C1F7C1F7C000000000000000000000000000000000000000000000000
                    000000001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C000000000000000000001F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C000000000000000000001F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C
                    1F7C00001F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C
                    1F7C00001F7C1F7C000000000000000000000000000000000000000000000000
                    000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                    1F7C1F7C1F7C}
                  ParentShowHint = False
                  ShowHint = True
                end
              end
            end
            object gbUserList: TGroupBox
              Left = 0
              Top = 0
              Width = 708
              Height = 171
              Align = alTop
              Caption = 'Ѕцтцн истифад€чил€р'
              TabOrder = 1
              Visible = False
              object pnGroupGrid: TPanel
                Left = 2
                Top = 15
                Width = 704
                Height = 154
                Align = alClient
                TabOrder = 0
                object grGroupUs: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 702
                  Height = 152
                  Align = alClient
                  Color = clWhite
                  DataSource = AdministrationData.Users
                  FixedColor = clNavy
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWhite
                  TitleFont.Height = -11
                  TitleFont.Name = 'Azl Sans Serif'
                  TitleFont.Style = []
                  OnKeyDown = grGroupUsKeyDown
                end
              end
            end
          end
          object tbOrders: TTabSheet
            Caption = 'ўесабатлар'
            ImageIndex = 4
            object pcOrders: TPageControl
              Left = 0
              Top = 0
              Width = 708
              Height = 421
              ActivePage = tbUsersOrder
              Align = alClient
              TabOrder = 0
              object tbQroupsOrder: TTabSheet
                Caption = 'tbQroupsOrder'
                TabVisible = False
                object grQrupsOrder: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 700
                  Height = 411
                  Align = alClient
                  Caption = '√руплар щесабаты'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object GroupBox1: TGroupBox
                    Left = 2
                    Top = 15
                    Width = 135
                    Height = 394
                    Align = alLeft
                    Caption = '—азламалар'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object btGroupOrder: TBitBtn
                      Left = 28
                      Top = 363
                      Width = 75
                      Height = 25
                      Action = ShowGroupsOrder
                      Anchors = [akLeft, akBottom]
                      Caption = '√€бул'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      Glyph.Data = {
                        F6000000424DF600000000000000760000002800000010000000100000000100
                        0400000000008000000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDDDDDDD444444444444444D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D44444444444
                        4444D4F444F444F444F4D444444444444444DDDDDDDDDDDDDDDD}
                    end
                    object rbGroupsAll: TRadioButton
                      Left = 8
                      Top = 16
                      Width = 113
                      Height = 17
                      Caption = 'Ѕцтцн груплар'
                      Checked = True
                      TabOrder = 1
                      TabStop = True
                      OnClick = rbGroupsAllClick
                    end
                    object RadioButton2: TRadioButton
                      Left = 8
                      Top = 32
                      Width = 113
                      Height = 17
                      Caption = '—ечилмиш груплар'
                      TabOrder = 2
                      OnClick = rbGroupsAllClick
                    end
                  end
                  object cbGroupsOrder: TCheckListBox
                    Left = 137
                    Top = 15
                    Width = 561
                    Height = 394
                    Align = alClient
                    Color = clSilver
                    Columns = 4
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = []
                    ItemHeight = 13
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
              object tbUsersOrder: TTabSheet
                Caption = 'tbUsersOrder'
                ImageIndex = 1
                TabVisible = False
                OnShow = tbUsersOrderShow
                object gbUsersOrder: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 700
                  Height = 411
                  Align = alClient
                  Caption = '»стифад€чил€р щесабаты'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object GroupBox2: TGroupBox
                    Left = 2
                    Top = 15
                    Width = 135
                    Height = 394
                    Align = alLeft
                    Caption = '—азламалар'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object Bevel2: TBevel
                      Left = 8
                      Top = 64
                      Width = 121
                      Height = 4
                      Anchors = [akLeft, akTop, akRight]
                      Shape = bsTopLine
                    end
                    object Label7: TLabel
                      Left = 8
                      Top = 96
                      Width = 59
                      Height = 13
                      Caption = 'ўцгугу вар:'
                    end
                    object Label9: TLabel
                      Left = 8
                      Top = 136
                      Width = 60
                      Height = 13
                      Caption = 'ўцгугу йох:'
                    end
                    object Bevel3: TBevel
                      Left = 8
                      Top = 184
                      Width = 121
                      Height = 4
                      Anchors = [akLeft, akTop, akRight]
                      Shape = bsTopLine
                    end
                    object btUsersOrder: TBitBtn
                      Left = 16
                      Top = 331
                      Width = 97
                      Height = 25
                      Action = ShowUsersOrder
                      Anchors = [akLeft, akBottom]
                      Caption = '√€бул             '
                      TabOrder = 0
                      Glyph.Data = {
                        F6000000424DF600000000000000760000002800000010000000100000000100
                        0400000000008000000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDDDDDDD444444444444444D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D44444444444
                        4444D4F444F444F444F4D444444444444444DDDDDDDDDDDDDDDD}
                    end
                    object RadioButton3: TRadioButton
                      Left = 8
                      Top = 32
                      Width = 113
                      Height = 17
                      Caption = '—ечилмиш истифад€чил€р'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      OnClick = rbUsersAllClick
                    end
                    object rbUsersAll: TRadioButton
                      Left = 8
                      Top = 16
                      Width = 113
                      Height = 17
                      Caption = 'Ѕцтцн истифад€чил€р'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Azl Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      TabStop = True
                      OnClick = rbUsersAllClick
                    end
                    object cbUsersStandOrder: TCheckBox
                      Left = 8
                      Top = 72
                      Width = 105
                      Height = 17
                      Caption = '—тандарт щесабат'
                      Checked = True
                      State = cbChecked
                      TabOrder = 3
                      OnClick = cbUsersStandOrderClick
                    end
                    object eduserOrderConst1: TEdit
                      Left = 8
                      Top = 112
                      Width = 113
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Enabled = False
                      TabOrder = 4
                      Text = '+'
                    end
                    object eduserOrderConst2: TEdit
                      Left = 8
                      Top = 152
                      Width = 113
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      Enabled = False
                      TabOrder = 5
                      Text = '-'
                    end
                    object btnUsersAdvGrant: TBitBtn
                      Left = 16
                      Top = 363
                      Width = 97
                      Height = 25
                      Action = ShowUsersOrder
                      Anchors = [akLeft, akBottom]
                      Caption = 'ялав€ щцгулар'
                      TabOrder = 6
                      Glyph.Data = {
                        F6000000424DF600000000000000760000002800000010000000100000000100
                        0400000000008000000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDDDDDDDDDDDDDDDDDD444444444444444D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D4F000F000F0
                        00F4D4FFFFFFFFFFFFF4D4F000F000F000F4D4FFFFFFFFFFFFF4D44444444444
                        4444D4F444F444F444F4D444444444444444DDDDDDDDDDDDDDDD}
                    end
                  end
                  object cbUsersOrder: TCheckListBox
                    Left = 137
                    Top = 15
                    Width = 561
                    Height = 394
                    Align = alClient
                    Color = clSilver
                    Columns = 4
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Azl Sans Serif'
                    Font.Style = []
                    ItemHeight = 13
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
            end
            object tbsOrders: TTabSet
              Left = 0
              Top = 421
              Width = 708
              Height = 21
              Align = alBottom
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              SelectedColor = 11883563
              Style = tsOwnerDraw
              TabHeight = 17
              Tabs.Strings = (
                '√руплар щесабаты'
                '»стифад€чил€р щесабаты')
              TabIndex = 0
              OnChange = tbsOrdersChange
              OnDrawTab = tsDepSubDrawTab
            end
          end
        end
      end
      object pnlGrid: TPanel
        Left = 1
        Top = 473
        Width = 718
        Height = 83
        Align = alClient
        TabOrder = 1
        object grShrcsrMK: TDBGrid
          Left = 1
          Top = 1
          Width = 716
          Height = 81
          Align = alClient
          DataSource = AdministrationData.Modules
          FixedColor = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnDblClick = grShrcsrMKDblClick
          OnKeyDown = grShrcsrMKKeyDown
        end
      end
      object ErrorPanel: TPanel
        Left = 1
        Top = 556
        Width = 718
        Height = 22
        Align = alBottom
        TabOrder = 2
        Visible = False
        object hbErrorBox: THintBox
          Left = 1
          Top = 1
          Width = 716
          Height = 20
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'Error'
          TabOrder = 0
          Visible = False
          HintStyle = hsAlert
          Timeout = 7000
          BeepOnMessage = True
          AfterShow = hbErrorBoxAfterShow
          AfterHide = hbErrorBoxAfterHide
        end
      end
    end
  end
  object ImLAdm: TImageList
    Left = 122
    Top = 51
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B73008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300EFDECE00EFE7D600EFE7D600EFE7D600EFDECE00EFDE
      CE00EFDECE00EFDECE00EFE7D6008C5A5A0000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300EFDED600EFE7DE00EFE7DE00EFE7D600EFE7D600EFE7
      D600EFDECE00EFDECE00EFE7D6008C5A5A000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C310031942900319C3100218421000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5847300EFDED600FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7DEC600EFE7D6008C5A5A00000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300B5847300EFE7DE00F7EFDE00F7E7DE00F7E7D600F7E7D600F7E7
      D600EFE7D600EFE7D600F7E7D6009C6B6300000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7EFDE00EFE7D600EFE7
      D600EFE7D600BD8C8400EFE7DE00F7EFE700F7EFDE00F7E7DE00F7E7D600F7E7
      D600F7E7D600F7E7D600F7E7DE009C6B630000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7EFE700EFE7DE00EFE7
      DE00EFE7D600CE9C8400EFE7E700F7EFDE00F7E7D600F7E7D600F7E7D600F7E7
      D600F7DEC600F7E7D600F7EFDE00A57B73000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300F7EFE700FFE7CE00F7DE
      BD00F7DEBD00DEAD8400F7EFEF00FFF7F700FFF7EF00F7EFEF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A57B7300000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300FFF7EF00F7EFDE00F7E7
      DE00F7E7D600DEAD8400F7EFEF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFF7F700EFE7E700D6D6D600B58473000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD8C8400FFF7F700F7EFE700F7EF
      DE00F7E7DE00E7B58C00F7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      FF00B5847300E7AD7300EFAD5A00BD848400000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F7000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C8400FFFFF700F7EFDE00F7E7
      D600F7E7D600EFBD9400FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5847300F7C67B00EFAD5A000000000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF000000000000000000C6C6
      C6000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8400FFFFFF00FFF7F700FFF7
      EF00F7EFEF00EFBD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400B5847300BD8484000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8400FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7F700FFF7F700FFF7F700EFE7E700BDBDBD00B58473000000
      000000000000000000000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7B58C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00B5847300E7AD7300E79C4200BD8484000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5847300F7C67B00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400B5847300BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000008400000084000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      0000000000000000000000000000000000000000000000000000840000000084
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C310031942900319C3100218421000000
      0000000000000000000000000000000000000000000084000000008400000084
      000000FF00000084000000840000008400008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000008400000084000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      00000000000000000000000000000000000000000000008400000084000000FF
      00000084000000FF000000840000008400000084000084000000000000000000
      0000000000000000000000000000000000000000000000000000840000000084
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      000000000000000000000000000000000000000000000084000000FF00000084
      0000008400000084000000FF0000008400000084000000840000840000000000
      0000000000000000000000000000000000000000000084000000008400000084
      000000FF00000084000000840000008400008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      000000840000008400000084000000FF00000084000000840000008400008400
      00000000000000000000000000000000000000000000008400000084000000FF
      00000000000000FF000000840000008400000084000084000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      00000000000000000000000000000000000084000000008400000084000000FF
      000000FF000000840000008400000084000000FF000000840000008400000084
      000084000000000000000000000000000000000000000084000000FF00000000
      0000000000000000000000FF0000008400000084000000840000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000084000000840000000000000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      00000000000000000000000000000000000000FF00000084000000FF00000000
      00000000000000FF000000840000008400000084000000FF0000008400000084
      0000008400008400000000000000000000000000000000FF0000000000000000
      000000000000000000000000000000FF00000084000000840000008400008400
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      0000000000000000000000000000000000000000000000FF0000000000000000
      0000000000000000000000FF000000840000008400000084000000FF00000084
      0000008400000084000084000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000840000008400000084
      0000840000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      000084000000840000000000000000000000000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000840000008400000084000000FF
      0000008400000084000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      0000008400008400000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      00000000000084000000000000000000000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF00000000000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000840000008400000084
      000000FF00000084000000840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000084
      0000008400000084000084000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE00000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      00008400000000FF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000008400000084000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA500000000000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000084
      0000008400008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF00000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C0000000000000000000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000008400000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      0000000000000000000000000000000000000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C310031942900319C3100218421000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF0000000000000000000000000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF0000000000000000000000000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF0000000000000000000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF008484
      84008484840084848400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF000000000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF00000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      840084848400848484008484840084848400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF00000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD00000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF008484
      840084848400000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000000000000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C310031942900319C310021842100FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE63000000000000C64A2900C6421800CE4A
      2100CE4A2900C64A2900C64A290084736B000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE63000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C2900FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000F7634A00F7634A00FF7B
      6300FF8C6B00EFC69400D66B4200F7634A00D64A290042AD4200218421009CDE
      8C009CDE8C005AD65A0042CE42000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE63000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A53100948C
      8400948C8400FFFFFF00948C840000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7634A00FF7B6300FF8C
      6B00DE6B4200FFDEAD00DE7B4A00FF8C6B00E75A390052B5520084BD7300B5E7
      A5009CDE8C005AD65A005AD65A000000000000000000CE630000F7FFFF0084A5
      840084A5840084A5840084A5840084A5840084A5840084A5840084A5840084A5
      840084A58400F7FFFF00CE6300000000000000000000FFFFFF00FFFFFF0052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200948C8400948C
      8400948C8400FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000D66B4A00EF7B5A00D66B
      4200DE9C8400FFBD8C00E78C5A00FF8C6B00B56B31005AAD5A00EFF7E700A5CE
      A5005AB55A009CDE8C009CDE8C000000000000000000CE630000F7FFFF0084A5
      840084A5840084A5840084A5840084A5840084A5840084A5840084A5840084A5
      840084A58400F7FFFF00CE6300000000000000000000FFFFFF00FFFFFF004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000000000A56342004221
      5A002929940042317300A5524A009463210073D673005AA55A00FFF7E700F7EF
      DE007BAD63009CDE8C005AA55A000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE6300000000000000000000FFFFFF00FFFFFF00217B
      BD002994EF003194FF003194FF002994EF00216B9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000031313100080808001039
      94001842AD001842AD0010399C000000000000000000187B7B002184D600218C
      DE002184D6005A737300000000000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE6300000000000000000000FFFFFF00FFFFFF002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE700948C8400948C8400948C
      8400948C8400FFFFFF00948C840000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000018181800081018001852
      BD00185ABD00185ABD001852BD00737B8C0000000000298CE7003194F7003194
      F7003194F7002173A500000000000000000000000000CE630000F7FFFF0084A5
      840084A5840084A5840084A5840084A5840084A5840084A5840084A5840084A5
      840084A58400F7FFFF00CE6300000000000000000000FFFFFF0063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F700948C8400948C8400948C
      8400948C8400FFFFFF00948C840000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131310021212100297B
      DE00297BE700297BE700297BDE004A5A84000000000042A5FF0042ADFF0042AD
      FF0042A5FF0039A5FF002973A5000000000000000000CE630000F7FFFF005A7B
      5A005A7B5A005A7B5A005A7B5A005A7B5A005A7B5A005A7B5A005A7B5A005A7B
      5A005A7B5A00F7FFFF00CE6300000000000000000000FFFFFF006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000003939390029292900298C
      F7005AADFF00429CFF00298CF700526B8C00000000004AADFF006BBDFF006BBD
      FF006BBDFF0042A5FF00529CC6000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE6300000000000000000000FFFFFF0063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A005252
      520031314200292994002929940000000000000000006BBDFF0042A5DE004AB5
      F7006BBDFF004AADF7002184BD000000000000000000CE630000F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00CE6300000000000000000000FFFFFF0063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA500948C8400948C8400948C
      8400948C8400FFFFFF00948C840000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000393939005A5A5A009C9C
      9C00A5A5A5004A4A4A00313131000000000000000000187BB5003994C600429C
      CE003194CE002984BD00106B9C000000000000000000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B0000DE7B
      0000DE7B0000DE7B0000CE6300000000000000000000FFFFFF00FFFFFF00428C
      B5004294C6009CCEE7008CBDE700106B9C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C840000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00424242007B7B7B000000000000000000000000008CBDD6005AA5D60094C6
      E7007BBDE700529CC60000000000000000000000000000000000D6731000D673
      1000D6731000D6731000D6731000D6731000D6731000D6731000D6731000D673
      1000D6731000D6731000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF006BA5BD00529CBD004A8CAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00948C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CC6DE0094C6
      DE0084B5D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F800FFFF00000000F800C03F00000000
      F800801F00000000F800801F000000000000801F000000000000E01F00000000
      0000E03F000000000000E07F000000000000E040000000000000C04000000000
      0001C040000000000003C04000000000001FC04000000000001FE0ED00000000
      003FF1ED00000000007FFFE100000000F3FFFFFFFFFFFFFFE1FFFFFFFFFFC03F
      C0FFF3FFFFFF801F807FE1FFFFFF801F803FC0FFFFFF801F801F807FE7FFE01F
      800F883FCF83E03F00079C1FDFC3E07F1803BE0FDFE3E07FBC01FF07DFD3C07F
      FE01FF83CF3BC05BFF01FFC1E0FFC043FF83FFE1FFFFC05BFFC3FFF1FFFFE0DB
      FFE3FFFBFFFFF1E7FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFC03FFFFFFFFCFF9F
      801FFFFFF3FFFF0F801FFFFFE1F9FE0F801FFC7FE1F38007E01FFD7FF0E38023
      E03FFD7FF8478033E07FE10FFC0F8039E07FEFEFFE1F803CC07FE10FFC0F803E
      C07FFD7FF84F873FC07FFD7FE0E3803FC07FFC7FC1F1857FE0FFFFFFC7F880FF
      F1FFFFFFFFFF81FFFFFFFFFFFFFFFFFF8001EF00FFFFFFFF8001E000FFFF8001
      8001EF0080FF80018001EF00800180018001EFFF800180018001EF0080018001
      8001E000C00180018001EF00818380018001EF00808380018001EFFF80818001
      800100FF80818001800100FF81818001800100FF81818001800100FFE383C003
      8001FFFFFFC7FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImLToolBar: TImageList
    Left = 120
    Top = 80
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B73008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300EFDECE00EFE7D600EFE7D600EFE7D600EFDECE00EFDE
      CE00EFDECE00EFDECE00EFE7D6008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B7300EFDED600EFE7DE00EFE7DE00EFE7D600EFE7D600EFE7
      D600EFDECE00EFDECE00EFE7D6008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5847300EFDED600FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEBD00F7DEC600EFE7D6008C5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300B5847300EFE7DE00F7EFDE00F7E7DE00F7E7D600F7E7D600F7E7
      D600EFE7D600EFE7D600F7E7D6009C6B63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7EFDE00EFE7D600EFE7
      D600EFE7D600BD8C8400EFE7DE00F7EFE700F7EFDE00F7E7DE00F7E7D600F7E7
      D600F7E7D600F7E7D600F7E7DE009C6B63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7EFE700EFE7DE00EFE7
      DE00EFE7D600CE9C8400EFE7E700F7EFDE00F7E7D600F7E7D600F7E7D600F7E7
      D600F7DEC600F7E7D600F7EFDE00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300F7EFE700FFE7CE00F7DE
      BD00F7DEBD00DEAD8400F7EFEF00FFF7F700FFF7EF00F7EFEF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300FFF7EF00F7EFDE00F7E7
      DE00F7E7D600DEAD8400F7EFEF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7
      F700FFF7F700EFE7E700D6D6D600B58473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD8C8400FFF7F700F7EFE700F7EF
      DE00F7E7DE00E7B58C00F7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      FF00B5847300E7AD7300EFAD5A00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C8400FFFFF700F7EFDE00F7E7
      D600F7E7D600EFBD9400FFF7EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5847300F7C67B00EFAD5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8400FFFFFF00FFF7F700FFF7
      EF00F7EFEF00EFBD9400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD
      8400B5847300BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8400FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7F700FFF7F700FFF7F700EFE7E700BDBDBD00B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7B58C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFFF00B5847300E7AD7300E79C4200BD8484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5847300F7C67B00BD848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400B5847300BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181094000000000000000000000000003121
      21003121210031212100291818000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A7B00000000
      00000000000000000000000000001810A5000000000042313100633131003921
      2900312121003921210031212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000FFDEE7000000
      00000000000000000000000000001818BD00000000004A393900633139004229
      2900392129000000000000000000000000000000000000000000848400008484
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00E7E7
      E700E7E7E700B5B5B500A5635A0052002100848484009C9C9C00C6C6C600C6C6
      C6009C9C9C000000000000000000000000000000000000000000FFEFF7000000
      00000000000094525A005A424200312929005A394200734242006B3939004231
      3100392129000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00E7E7
      E700E7E7E700B5B5B500A5635A0052002100848484009C9C9C00C6C6C600C6C6
      C6009C9C9C000000000000000000000000000000000000000000FFFFFF007352
      52009C6363009C636300945A5A00FFD6DE005A4242007B424A004A3939004A31
      3100423131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00E7E7
      E700E7E7E700E7E7E700B5948C0063525A009C9C9C009C9C9C00C6C6C600C6C6
      C6009C9C9C0000000000000000000000000000000000B56B7300FFFFFF007B5A
      6300AD6B6B000000000000000000FFE7EF00000000005A424200000000004A39
      3900423131000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00E7E7
      E700E7E7E700B5B5B500A5635A0052002100848484009C9C9C00C6C6C600C6C6
      C6009C9C9C0000000000000000000000000000000000BD737300D6BDC6007B63
      630000000000D6C6C600FFFFFF008C7B7B008473730094848400000000004A39
      39004231310000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00E7E7
      E700E7E7E700B5B5B500A5635A0052002100848484009C9C9C00C6C6C600C6C6
      C6009C9C9C000000000000000000000000000000000000000000FFEFF7000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFE7EF00000000005A3942005239
      39004A31310000000000000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE009C9C9C000000000000000000000000000000000000000000FFFFFF000000
      000084636300BD737300AD6B6B00A5636B00CE949C0000000000944242000000
      0000734A4A0000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C67B8400CE848400C67B
      8400C67B7B00BD737300EFB5BD0000000000AD4A52009C424A00AD7B8400D6AD
      B5000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002921
      2900A5A5A5002121210000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C67B8400C67B8400C67B
      8400FFC6CE0000000000C65A5A00BD525A00CE949C00FFD6DE00000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001818
      1800F7F7F7001010100000000000000000000000000018181800000000000000
      00000000000000000000000000000000000000000000C67B7B00FFC6CE000000
      0000CE636300CE5A6300E7ADB500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      1000F7F7F700E7E7E7000808080000000000000000007B7B7B00BDBDBD000808
      08000000000000000000000000000000000000000000D69CA500CE636300CE63
      6300F7BDBD00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00DEDEDE00DEDEDE00C6C6C600B5B5B500000000000000
      00000000000000000000000000000000000000000000CE5A6300F7B5BD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE63000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      00000000000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C31003194290039632900218421000000
      0000000000000000000000000000000000000000000073AD73001084100021A5
      210039AD390039AD390039AD3900319C310031942900218421005A5242000000
      000000000000000000000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      000000000000000000000000000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      000000000000000000000000000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      000000000000000000000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      00000000000000000000000000000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200399439000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000000000000000000CE63
      0000CE630000CE630000CE630000CE630000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      0000000000000000000000000000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD630039943900000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000003994
      390094DE8C00399439000000000000000000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000000000000000000CE63
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000003994
      390094DE8C00399439000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000084
      840000848400008484000000000000000000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F7000021CE009494F7000029
      E7000029E7000029E7000029E7000021CE00000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F700399439005AC65A005AC6
      5A005AC65A005AC65A005AC65A0039943900CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000084
      8400C6840000008484000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF000021CE00B5C6FF009CB5
      FF009CB5FF009CB5FF00638CF7000021CE0000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF003994390094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C0039943900CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000848400008484000084
      8400C6840000008484000084840000848400CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A500000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000000000
      000000000000000000000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000003994
      390094DE8C00399439000000000000000000CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE6300000000000000848400C6840000C684
      0000C6840000C6840000C684000000848400CE630000FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600CE630000000000000021A500526BF700526B
      F700526BF700526BF700526BF7000021A500000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000000000
      000000000000000000000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000003994
      390094DE8C00399439000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000848400008484000084
      8400C6840000008484000084840000848400CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A500000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700296B84000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400C68400000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      00000000000000000000000000000000000000000000000000006B846300319C
      3100319C3100319C3100319C310052634200636B4A00948C8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000073AD73001084100021A5
      210039AD390039AD390039AD3900319C310031942900218421005A5242000000
      0000000000000000000000000000000000000000000073AD73001084100021A5
      210031A5310039AD390039AD3900319C31003194290039632900218421000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      000084000000840000008400000084000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      000000000000000000000000000000000000000000003994390029AD29004ABD
      4A005AC65A0052B5520073B56B004AA54200B5E7A50042BD4200299C29000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      000084000000840000008400000084000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      000000000000000000000000000000000000000000008CBD8C00299C29005AC6
      5A006BCE6B0063A56300F7FFEF0084BD7B00B5E7A50052C6520031A531000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000000000000000000084840000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000848400008484
      0000000000000000000084840000000000000000000000000000000000008400
      00008400000000000000000000000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200399439000000
      00000000000000000000000000000000000000000000000000000000000052B5
      52004A9C4200BDC6C600BDC6C60094B57B007BCE7B0052B55200428439000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD630039943900000000000000
      0000000000000000000000000000000000000000000000000000000000004A8C
      420018734A00217BBD00217BBD004284630063BD6300528C4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084008400000000000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000008400
      000084000000000000000000000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000003994
      390094DE8C00399439000000000000000000000000000000000000000000217B
      BD002994EF003194FF003194FF002994EF00216B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000003994
      390094DE8C003994390000000000000000000000000000000000000000002994
      EF00399CFF00399CFF00399CFF00399CFF00298CE70000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F700399439005AC65A005AC6
      5A005AC65A005AC65A005AC65A0039943900000000000000000063849C0042A5
      FF004AADFF006BBDFF006BBDFF004AADFF0042A5F7000021CE009494F7000029
      E7000029E7000029E7000029E7000021CE0000000000C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000000000000000000000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF003994390094DE8C0094DE
      8C0094DE8C0094DE8C0094DE8C003994390000000000000000006BA5C6004AAD
      FF004AB5FF0052B5FF006BBDFF006BBDFF004AADFF000021CE00B5C6FF009CB5
      FF009CB5FF009CB5FF00638CF7000021CE0000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      000000000000000000000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000003994
      390094DE8C00399439000000000000000000000000000000000063A5C600298C
      CE003194DE002184C600298CC6002984C6002994CE0000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      000000000000000000000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000003994
      390094DE8C00399439000000000000000000000000000000000063849C00428C
      C6004A94C6007BBDEF0063ADF700398CCE00216BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700106B9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000428C
      B5004294C6009CCEE7008CBDE700296B84000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BA5BD00529CBD004A8CAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      84008484840084848400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF0000000000000000000000000000000000000000000000
      00008484840084848400C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF00000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000FFFFFF008484
      840084848400848484008484840084848400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF000000000000000000000000000000
      0000000000008484840084848400C6C6C600C6C6C600FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00C6C6C600C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD0000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000FFFFFF008484
      840084848400000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00F800000000000000F800000000000000
      F800000000000000F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010000000000000003000000000000001F000000000000001F000000000000
      003F000000000000007F000000000000FFFFFFFFFFFFFF67FFFBFFFFFFFFCC01
      80018001C0078C01FFFBBF7D8003880780FFBE3D8003C007CDFFBC1D80038007
      D81FBF7D800300078E3FBF7D800300071E3FBF7D800300070F1FBF7D80030007
      0C1FBF7DC0070007060FBC1DE3FF001F801FBE3DE38F007FC01FBF7DE00F01FF
      F01F8001F01F07FFF83FFFFFF83F1FFFEF00EF00FFFFFFFFE000E000C03FC03F
      EF00EF00801F801FEF00EF00801F801FEFFFEFFF801F801FEF00EF00E01FE01F
      E000E000E03FE03FEF00EF00E07FE063EF00EF00E07FE063EFE3EFFFC000C000
      00E300FFC000C00000800080C07FC06300800080C07FC06300800080E0FFE0FF
      FFE3FFFFF1FFF1FFFFE3FFFFFFFFFFFFFFFFFFFFFFBEFFE7C03FC03FFF3DFFE7
      801F801FFF99FF00801F801FFFC3FF00801F801F80E780E7E01FE01FCDC3CDE7
      E03FE03FD819D807E063E07F8E3C8E3FE063E07F1E3F1E3FC000C0000F1F0F1F
      C000C0000C1F0C1FC063C07F060F060FC063C07F801F801FE0FFE0FFC01FC01F
      F1FFF1FFF01FF01FFFFFFFFFF83FF83FFFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFF
      FF0FFFFFFFFFFFFFFE0FFFFFFFFFFFFF8007FFFFFFFFFFFF8023F00FFE7FE7FF
      8033F00FFC3FCF838039F81FFC3FDFC3803CF81FF81FDFE3803EFC3FF81FDFD3
      873FFC3FF00FCF3B803FFE7FF00FE0FF857FFFFFFFFFFFFF80FFFFFFFFFFFFFF
      81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object AdmAct: TActionList
    Images = ImLToolBar
    Left = 786
    Top = 11
    object PostModChng: TAction
      Category = 'Data'
      Caption = 'PostModChng'
      ImageIndex = 0
      OnExecute = PostModChngExecute
    end
    object PostTableChng: TAction
      Category = 'Data'
      Caption = 'PostTableChng'
      ImageIndex = 0
      OnExecute = PostTableChngExecute
    end
    object ACTSelectAll: TAction
      Category = 'Advanced'
      Caption = 'ACTSelectAll'
    end
    object PostGroupChng: TAction
      Category = 'Data'
      Caption = 'PostGroupChng'
      OnExecute = PostGroupChngExecute
    end
    object PostUserInfoChng: TAction
      Category = 'Data'
      Caption = 'PostUserInfoChng'
      OnExecute = PostUserInfoChngExecute
    end
    object ACTDeselAll: TAction
      Category = 'Advanced'
      Caption = 'ACTDeselAll'
    end
    object PostChng: TAction
      Category = 'Data'
      Caption = 'Post'
      OnExecute = PostChngExecute
    end
    object RefreshMd: TAction
      Category = 'Data'
      Caption = 'RefreshMd'
      OnExecute = RefreshMdExecute
    end
    object CBMainChange: TAction
      Category = 'MainActions'
      Caption = 'CBMainChange'
      OnExecute = CBMainChangeExecute
    end
    object DBRefresh: TAction
      Category = 'Data'
      Caption = 'DBRefresh'
      OnExecute = DBRefreshExecute
    end
    object AddUser: TAction
      Category = 'Data'
      Caption = 'ялав€'
      ImageIndex = 4
      OnExecute = AddUserExecute
    end
    object DropUser: TAction
      Category = 'Data'
      Caption = 'Ћ€гв'
      ImageIndex = 5
      OnExecute = DropUserExecute
    end
    object ClassCreate: TAction
      Category = 'Data'
      Caption = 'ClassCreate'
      OnExecute = ClassCreateExecute
    end
    object ClassDrop: TAction
      Category = 'Data'
      Caption = 'ClassDrop'
      OnExecute = ClassDropExecute
    end
    object GroupCreate: TAction
      Category = 'Data'
      Caption = 'Create group'
      OnExecute = GroupCreateExecute
    end
    object GroupDrop: TAction
      Category = 'Data'
      Caption = 'Group drop'
      OnExecute = GroupDropExecute
    end
    object ShowUsersTab: TAction
      Category = 'MainActions'
      ImageIndex = 13
      OnExecute = ShowUsersTabExecute
    end
    object ShowGroupsOrder: TAction
      Category = 'Orders'
      Caption = 'ShowGroupsOrder'
      OnExecute = ShowGroupsOrderExecute
    end
    object ShowUsersOrder: TAction
      Category = 'Orders'
      Caption = 'ShowUsersOrder'
      OnExecute = ShowUsersOrderExecute
    end
    object RefreshOrders: TAction
      Category = 'Orders'
      Caption = 'RefreshOrders'
      OnExecute = RefreshOrdersExecute
    end
    object LockUser: TAction
      Category = 'MainActions'
      ImageIndex = 14
      OnExecute = LockUserExecute
    end
    object SetOptions: TAction
      Category = 'Data'
      ImageIndex = 15
      OnExecute = SetOptionsExecute
    end
    object actBalAcc: TAction
      Category = 'Data'
      Caption = '»жаз€ли Ѕ.ў.'
      Enabled = False
      ImageIndex = 16
    end
  end
  object ImLGrid: TImageList
    Left = 120
    Top = 112
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084000000000000008400000000000000840000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008400
      0000840000008400000000000000840000000000000084000000000000008400
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      00008400000084000000C6C6C600C6C6C600FFFFFF00FFFFFF00840000000000
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      0000840000008400000084000000C6C6C600FFFFFF0084000000840000008400
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      00008400000084000000FF000000C6C6C600FFFFFF0084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008400000084000000FF00
      000084000000FF00000084000000C6C6C600FFFFFF0084000000840000008400
      0000840000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      0000FF00000084000000FF000000C6C6C600FFFFFF0084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF008400000084000000FF00
      000084000000FF000000C6C6C600C6C6C600C6C6C600FF000000840000008400
      0000840000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000FF0000008400
      0000FF000000FF000000FF000000FF0000008400000084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084000000FF00
      000084000000FF000000FF000000C6C6C600FFFFFF00FF000000840000008400
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      0000FF0000008400000084000000C6C6C600C6C6C60084000000840000008400
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      00008400000084000000FF000000840000008400000084000000840000008400
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00840000008400000084000000840000008400000084000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B00BDBDBD007B7B7B00000000007B7B7B00BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B00BDBDBD007B7B7B00000000007B7B7B00BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD007B7B7B00000000007B7B7B00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD007B7B7B00000000007B7B7B00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00BDBDBD00BDBDBD0000000000BDBDBD00BDBDBD007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00BDBDBD00BDBDBD0000000000BDBDBD00BDBDBD007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000000000000000000084840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008400840000000000C6C6C600000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00000000000000000000FFFF000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000084
      0000008400000084000000000000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      0000008400000000000000000000000000000084000000840000008400000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000084
      0000000000000000000000000000000000000000000000840000008400000084
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF007B7B7B00000000007B7B7B0000FFFF0000FFFF000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008400000084
      00000084000000000000000000000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      00000084000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B00BDBDBD00000000000000000000000000BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000FFFF000000000000FF
      FF0000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      00000000000000000000000000000000000000FFFF00000000000000000000FF
      FF007B7B7B007B7B7B00BDBDBD00000000000000000000000000BDBDBD007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F000000000000FC1FFC1FFFFFFFFFF007F007FFFFFFFF
      E003E003FFFFFFFFC001C001FFFFFFFFC001C001FDFF80FFC001C001F8FFCD1F
      C001C001F07FD81FC0014001E23F8E3FE003A003E71F1E3FF1C7C3C7EF8F0F1F
      F1C70047FFC70C1FF1C7C1C7FFE7060FF007A1C7FFF7801FF80F6007FFFFC01F
      FC1FE80FFFFFF01FFFFFEC1FFFFFF83F00000000000000000000000000000000
      000000000000}
  end
  object ppMod: TPopupMenu
    Images = ImLAdm
    Left = 120
    Top = 144
    object mmUpdate: TMenuItem
      Caption = 'ћодулун д€йишдирилм€си'
      ImageIndex = 7
      OnClick = mmUpdateClick
      OnDrawItem = mmUpdateDrawItem
    end
    object mmInsert: TMenuItem
      Caption = 'ћодулун €лав€ етм€си'
      ImageIndex = 5
      OnClick = mmInsertClick
      OnDrawItem = mmUpdateDrawItem
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mmDelete: TMenuItem
      Caption = 'ћодулун л€ьв етм€си'
      ImageIndex = 6
      OnClick = mmDeleteClick
      OnDrawItem = mmUpdateDrawItem
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = '—инонимл€рин йенил€нм€си'
      ImageIndex = 10
      OnClick = N3Click
      OnDrawItem = mmUpdateDrawItem
    end
  end
  object ModPop: TPopupMenu
    Images = ImLAdm
    Left = 119
    Top = 176
    object miSelAll: TMenuItem
      Caption = 'ўамсыны сечм€к'
      ImageIndex = 8
      OnClick = miSelAllClick
      OnDrawItem = mmUpdateDrawItem
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miDeSelAll: TMenuItem
      Caption = 'ўамсына имтина'
      ImageIndex = 6
      OnClick = miSelAllClick
      OnDrawItem = mmUpdateDrawItem
    end
  end
  object TabPopup: TPopupMenu
    Images = ImLAdm
    Left = 118
    Top = 208
    object miSelTab: TMenuItem
      Caption = '—ечм€к'
      ImageIndex = 9
      OnClick = miSelTabClick
      OnDrawItem = mmUpdateDrawItem
    end
    object miUnSelTab: TMenuItem
      Caption = '»мтина'
      ImageIndex = 6
      OnClick = miSelTabClick
      OnDrawItem = mmUpdateDrawItem
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miAllSelTab: TMenuItem
      Caption = 'ўамсыны сечм€к'
      ImageIndex = 8
      OnClick = miAllSelTabClick
      OnDrawItem = mmUpdateDrawItem
    end
    object miAllUnSelTab: TMenuItem
      Caption = 'ўамсына имтина'
      ImageIndex = 6
      OnClick = miAllSelTabClick
      OnDrawItem = mmUpdateDrawItem
    end
  end
  object ActButtonsImages: TImageList
    Height = 7
    Width = 7
    Left = 816
    Top = 432
    Bitmap = {
      494C010104000900040007000700FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000001C0000001500000001002000000000003009
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000001C0000001500000001000100
      00000000540000000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009FE7F770CFCCE770
      E79E4F70F33F1800E79F1F70CFCE4F709FE4E770000000000000000000000000
      00000000000000000000}
  end
  object ICECrypt: TICECrypt
    Text = 'Crypt'
    CryptType = cHASH_CRC32
    Left = 779
    Top = 431
  end
end
