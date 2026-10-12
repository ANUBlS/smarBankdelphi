object AdvInfoForm: TAdvInfoForm
  Left = 404
  Top = 166
  Width = 588
  Height = 337
  ActiveControl = DBLookupComboboxEh1
  BorderIcons = [biSystemMenu]
  Caption = 'Additional Info'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 274
    Width = 580
    Height = 36
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 395
      Top = 6
      Width = 75
      Height = 25
      Action = SaveChanges
      TabOrder = 0
    end
    object Button2: TButton
      Left = 486
      Top = 6
      Width = 75
      Height = 25
      Action = DismisChanges
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 35
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 64
      Height = 33
      Align = alLeft
      Caption = '$'
      TabOrder = 0
      object DBText1: TDBText
        Left = 10
        Top = 14
        Width = 50
        Height = 13
        Alignment = taCenter
        AutoSize = True
        DataField = 'VAL_NAME'
        DataSource = AdvInfoDataModule.DataSrcAddInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 65
      Top = 1
      Width = 512
      Height = 33
      Align = alLeft
      Caption = 'ћцшт€ри'
      TabOrder = 1
      object DBText2: TDBText
        Left = 4
        Top = 13
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NAME'
        DataSource = AdvInfoDataModule.DataSrcAddInfo
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 35
    Width = 580
    Height = 239
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'ћцшт€ри щаггында'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 31
          Height = 13
          Caption = 'ёлк€  :'
        end
        object Label25: TLabel
          Left = 288
          Top = 8
          Width = 78
          Height = 13
          Caption = 'ћцшт€ринин »ƒ - си'
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Tag = 1
          Left = 49
          Top = 4
          Width = 224
          Height = 21
          DataField = 'COUNTRYCODE'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'CODE'
          ListField = 'NAME'
          ListSource = AdvInfoDataModule.DataSrcContrys
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBEditEh3: TDBEditEh
          Tag = 1
          Left = 375
          Top = 4
          Width = 121
          Height = 21
          DataField = 'BOOROWERID'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          EditButtons = <>
          TabOrder = 1
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 30
        Width = 572
        Height = 40
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 14
          Width = 92
          Height = 13
          Caption = 'ћцфлисолма статусу :'
        end
        object Bancruptey_rg: TRadioGroup
          Left = 112
          Top = 2
          Width = 226
          Height = 34
          Columns = 2
          Items.Strings = (
            'ћцфлис дейил'
            'ћцфлисдир')
          TabOrder = 0
          OnClick = Bancruptey_rgClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 70
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        TabStop = True
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 41
          Height = 13
          Caption = 'јдресс  :'
        end
        object Label4: TLabel
          Left = 344
          Top = 8
          Width = 42
          Height = 13
          Caption = '“елефон :'
        end
        object DBEditEh1: TDBEditEh
          Tag = 1
          Left = 57
          Top = 4
          Width = 280
          Height = 21
          DataField = 'ADDRESS'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBEditEh2: TDBEditEh
          Tag = 1
          Left = 390
          Top = 4
          Width = 178
          Height = 21
          DataField = 'PHONENUMBER'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          EditButtons = <>
          TabOrder = 1
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 100
        Width = 572
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label5: TLabel
          Left = 256
          Top = 4
          Width = 47
          Height = 13
          Caption = '“€сисчил€р '
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 120
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 9
          Height = 13
          Caption = '1.'
        end
        object Label9: TLabel
          Left = 32
          Top = 9
          Width = 33
          Height = 13
          Caption = '»ƒ - си :'
        end
        object Label10: TLabel
          Left = 226
          Top = 9
          Width = 21
          Height = 13
          Caption = 'јды :'
        end
        object DBEdit1: TDBEdit
          Tag = 1
          Left = 68
          Top = 4
          Width = 115
          Height = 21
          DataField = 'FIRSTOWNERID'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBEdit2: TDBEdit
          Tag = 1
          Left = 261
          Top = 4
          Width = 307
          Height = 21
          DataField = 'FIRSTOWNERNAME'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 1
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 150
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 5
        object Label7: TLabel
          Left = 8
          Top = 8
          Width = 9
          Height = 13
          Caption = '2.'
        end
        object Label8: TLabel
          Left = 32
          Top = 9
          Width = 33
          Height = 13
          Caption = '»ƒ - си :'
        end
        object Label11: TLabel
          Left = 226
          Top = 9
          Width = 21
          Height = 13
          Caption = 'јды :'
        end
        object DBEdit3: TDBEdit
          Tag = 1
          Left = 68
          Top = 4
          Width = 115
          Height = 21
          DataField = 'SECONDOWNERID'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBEdit4: TDBEdit
          Tag = 1
          Left = 261
          Top = 4
          Width = 307
          Height = 21
          DataField = 'SECONDOWNERNAME'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 1
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 180
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 6
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 9
          Height = 13
          Caption = '3.'
        end
        object Label13: TLabel
          Left = 32
          Top = 9
          Width = 33
          Height = 13
          Caption = '»ƒ - си :'
        end
        object Label14: TLabel
          Left = 226
          Top = 9
          Width = 21
          Height = 13
          Caption = 'јды :'
        end
        object DBEdit5: TDBEdit
          Tag = 1
          Left = 68
          Top = 4
          Width = 115
          Height = 21
          DataField = 'THIRDOWNERID'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBEdit6: TDBEdit
          Tag = 2
          Left = 261
          Top = 4
          Width = 307
          Height = 21
          DataField = 'THIRDOWNERNAME'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 1
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ёиров щаггында'
      ImageIndex = 1
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 572
        Height = 33
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label15: TLabel
          Left = 6
          Top = 10
          Width = 62
          Height = 13
          Caption = 'Ёировун типи : '
        end
        object Label16: TLabel
          Left = 264
          Top = 10
          Width = 63
          Height = 13
          Caption = 'Ёировун ады : '
        end
        object DBEdit7: TDBEdit
          Left = 72
          Top = 6
          Width = 185
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'DESCRIPTION'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Tag = 1
          Left = 328
          Top = 6
          Width = 239
          Height = 21
          DataField = 'PLEDGENAME'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 33
        Width = 572
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label17: TLabel
          Left = 5
          Top = 18
          Width = 108
          Height = 13
          Caption = 'Ёирову сахлайан ш€хс : '
        end
        object DBEdit9: TDBEdit
          Tag = 1
          Left = 123
          Top = 15
          Width = 206
          Height = 21
          DataField = 'HOLDERNAME'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object InUse_rg: TRadioGroup
          Left = 385
          Top = 2
          Width = 185
          Height = 45
          Align = alRight
          Caption = 'Ёиров »стифад€ олунур?'
          Items.Strings = (
            'Ёиров истифд€ олунмур'
            'Ёиров истифд€ олунур')
          TabOrder = 1
          OnClick = InUse_rgClick
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 82
        Width = 572
        Height = 65
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label19: TLabel
          Left = 5
          Top = 3
          Width = 178
          Height = 13
          Caption = 'Ёирову ф€гл€ндир€н ист€нил€н м€лумат : '
        end
        object DBMemo1: TDBMemo
          Tag = 1
          Left = 2
          Top = 18
          Width = 568
          Height = 45
          Align = alBottom
          DataField = 'ANYINFOTODISTING'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 147
        Width = 572
        Height = 33
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object Label20: TLabel
          Left = 31
          Top = 10
          Width = 102
          Height = 13
          Caption = 'Ёировун гейдийат є : '
        end
        object Label18: TLabel
          Left = 279
          Top = 10
          Width = 74
          Height = 13
          Caption = '√ейдийат тарихи : '
        end
        object DBEdit11: TDBEdit
          Tag = 1
          Left = 144
          Top = 6
          Width = 98
          Height = 21
          DataField = 'REGISTRYNO'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Tag = 1
          Left = 366
          Top = 6
          Width = 121
          Height = 21
          DataField = 'REGISTRYDATE'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 180
        Width = 572
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label21: TLabel
          Left = 5
          Top = 10
          Width = 136
          Height = 13
          Caption = '√ейдийатдан кечир€н орган : '
        end
        object DBEdit10: TDBEdit
          Tag = 1
          Left = 142
          Top = 5
          Width = 425
          Height = 21
          DataField = 'REGISTRYAGENCY'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '—ыьорта щаггында'
      ImageIndex = 2
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 572
        Height = 33
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label22: TLabel
          Left = 31
          Top = 10
          Width = 86
          Height = 13
          Caption = '—ыбортанын м€бл€ьи'
        end
        object Label23: TLabel
          Left = 271
          Top = 10
          Width = 69
          Height = 13
          Caption = '—ыьорта тарихи  : '
        end
        object DBEdit12: TDBEdit
          Tag = 1
          Left = 144
          Top = 6
          Width = 98
          Height = 21
          DataField = 'INSURANCEAMOUNT'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object DBDateTimeEditEh2: TDBDateTimeEditEh
          Tag = 1
          Left = 366
          Top = 6
          Width = 121
          Height = 21
          DataField = 'INSURANCEDATE'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 33
        Width = 572
        Height = 33
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label24: TLabel
          Left = 31
          Top = 10
          Width = 97
          Height = 13
          Caption = '—ыьорта ед€н ширк€т : '
        end
        object DBEdit13: TDBEdit
          Tag = 1
          Left = 144
          Top = 6
          Width = 417
          Height = 21
          Color = clInfoBk
          DataField = 'INSURANCEAGENCY'
          DataSource = AdvInfoDataModule.DataSrcAddInfo
          TabOrder = 0
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 448
    Top = 8
  end
  object ActionList1: TActionList
    Left = 168
    Top = 281
    object SaveChanges: TAction
      Caption = '√ейд ет'
      OnExecute = SaveChangesExecute
      OnUpdate = SaveChangesUpdate
    end
    object DismisChanges: TAction
      Caption = '»мтина ет'
      OnExecute = DismisChangesExecute
    end
  end
  object ImageList1: TImageList
    Left = 48
    Top = 274
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C60000FF
      FF00FFFFFF0000FFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF008484840000000000C6C6
      C60000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400C6C6C6000000
      0000C6C6C60000FFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF008484840000FFFF00C6C6
      C60000000000C6C6C60000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0084848400848484008484
      84008484840000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C000000000000000C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0003000000000000000300000000000000000000000000000000000000000000
      000000000000}
  end
end
