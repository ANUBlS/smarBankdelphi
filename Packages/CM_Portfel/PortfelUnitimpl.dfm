object PortfelForm: TPortfelForm
  Left = 160
  Top = 195
  Width = 580
  Height = 455
  BorderIcons = [biSystemMenu]
  Caption = 'Портфел цзря тяhлил'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 428
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 568
      Height = 424
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 564
        Height = 420
        Align = alClient
        Caption = 'Filter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel4: TPanel
          Left = 283
          Top = 15
          Width = 281
          Height = 303
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Panel7: TPanel
            Left = 2
            Top = 230
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Кредитин новц'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxCreditType: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhCreditType: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'DESCRIPTION'
                ListSource = PortfelDataModule.CreditTypeDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel8: TPanel
            Left = 2
            Top = 173
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object GroupBox4: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Истифадячи'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxUser: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhUser: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'NAME'
                ListSource = PortfelDataModule.UsersDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel9: TPanel
            Left = 2
            Top = 116
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 2
            object GroupBox5: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Истифадячи групу'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxUserGroup: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhUserGroup: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'DESCRIPTION'
                ListSource = PortfelDataModule.UserGroupsDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel10: TPanel
            Left = 2
            Top = 59
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 3
            object GroupBox6: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Боржаланын категорйасы'
              TabOrder = 0
              object CheckBoxCategorires: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhCategories: TDBLookupComboboxEh
                Left = 0
                Top = 18
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'DESCRIPTION'
                ListSource = PortfelDataModule.CategoriesDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel11: TPanel
            Left = 2
            Top = 2
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 4
            object GroupBox7: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Эежикмиш тяснифат'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxDSSReserves: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhDSSReserves: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                KeyField = 'ID'
                ListField = 'FULLDESC'
                ListSource = PortfelDataModule.DSSReservesDataSource
                TabOrder = 1
                Visible = True
              end
            end
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 318
          Width = 561
          Height = 52
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object GroupBox13: TGroupBox
            Left = 2
            Top = 2
            Width = 557
            Height = 48
            Align = alClient
            Caption = 'Мцштяри'
            TabOrder = 0
            object CheckBoxCustomers: TCheckBox
              Left = 529
              Top = 20
              Width = 16
              Height = 17
              Caption = 'CheckBox1'
              TabOrder = 0
            end
            object DBLookupComboboxEhCustomers: TDBLookupComboboxEh
              Left = 0
              Top = 16
              Width = 524
              Height = 21
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = PortfelDataModule.CustomersDataSource
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 281
          Height = 303
          BevelInner = bvLowered
          TabOrder = 3
          object Panel12: TPanel
            Left = 2
            Top = 230
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Филиал'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxFilial: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhFilial: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'NAME'
                ListSource = PortfelDataModule.FilialDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel13: TPanel
            Left = 2
            Top = 173
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object GroupBox9: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Эиров'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxPledges: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhPledges: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'DESCRIPTION'
                ListSource = PortfelDataModule.PledgesdataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel14: TPanel
            Left = 2
            Top = 116
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 2
            object GroupBox10: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Боржаланын типи'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxpersons: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhPersons: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'DESCRIPION'
                ListSource = PortfelDataModule.PersonsDataSource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel15: TPanel
            Left = 2
            Top = 59
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 3
            object GroupBox11: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Тяснифат'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxDSPReserves: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhDSPReserves: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'ID'
                ListField = 'FULLDESC'
                ListSource = PortfelDataModule.DSPReservesDatasource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel16: TPanel
            Left = 2
            Top = 2
            Width = 277
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 4
            object GroupBox12: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 53
              Align = alClient
              Caption = 'Valyuta'
              TabOrder = 0
              object DBLookupComboboxValute: TDBLookupComboboxEh
                Left = 0
                Top = 16
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                KeyField = 'VALUTE'
                ListField = 'VALU_NAME'
                ListSource = PortfelDataModule.CurrencysDataSource
                ParentFont = False
                TabOrder = 0
                Visible = True
              end
              object CheckBoxvalute: TCheckBox
                Left = 248
                Top = 20
                Width = 16
                Height = 17
                Caption = 'CheckBoxvalute'
                TabOrder = 1
              end
            end
          end
        end
        object Panel3: TPanel
          Left = 2
          Top = 371
          Width = 560
          Height = 47
          Align = alBottom
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 279
            Top = 10
            Width = 86
            Height = 29
            Action = ActionFilterReject
            Caption = 'Imtina'
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000CE0E0000D80E00000001000000000000000000008080
              8000000080000080800000800000808000008000000080008000408080004040
              0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
              FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
              80008000FF004080FF00C0DCC000F0CAA6000008000000000800000808000804
              00000800080008080800130E0800040314001008100010101000151414001311
              1F002525210018133F004E0C11004D1D0F00681C1000561D21006B1C21004A3B
              36005655560077141800741324008F0E2200940F30008818230084292300893C
              400011097E004C4B75005A6B6300666666005A73630065706D00736D6D007373
              73007878730073737B0077777B00945D670096706D007B7B7B00837B8100947B
              73009C7B730084847B008484840084848C0090878700948C8E00948C94008C94
              9400949494009C9494009C9C940094949C009C949C009C9C9C00A80F2300AD18
              2900A9083100A5143500AF102B00AD0C3900BC072B00C10D3600AD1E2900A82C
              2700AD183900A9293100BE1B2900BD183100C01F3100B2154200A9213900B121
              3D00B5214200AB2C3900A9294200A92F4600BB1B4000B5294200BD293900B929
              4600C7184200CC253E00C1254A00CF254E00AC3F3200AB3F4200AE354A00AD4A
              4200C1383D00C6314A00CE314A00BD394A00AD3D4F00BD355200AD475000BD42
              5200C8395100C1425A00CC3F5E00B3524200B5525300B54E5E00B85C5B00C654
              5000D95F5100F6624600B2606A00C15A6B00CC586500CC5D6F00B7848300DD7C
              6E00E89889000C08B5000D0DE1001010EF000000F7000808F7000D0DFC001B1B
              ED003A3AE2002222FB003939FF006E6ECD005656FF007777FF009494A5009C9C
              A500A59CA500A5A5A500ADA5A5009494AD00A5A5AD00ADA5AD00A5A7B500A0A0
              C6009B9BDB008C8CFF009494FF009C9CFF00A5A5FF00B5A5A500BDA5A500B5AD
              A500BDADA500ADADAD00B5ADAD00B5B5AD00B1ADB500C6A7AA00C9B1AE00D6B1
              A900EDB0A900FFAFA200FFB5AD00FFBDAD00B5B5B500BDB5B500BDBDB500ADAD
              BD00B9B5BD00B3B3DB00B1B1FF00C1B9B900BDBDC600CBBBBA00E5BBB700C6C6
              C600DABDC600C1C1D600BDBDFF00D6C6C600DEC6C600CEC6CE00D6C6CE00DEC6
              CE00CECECE00D6CECE00D6D6CE00D2CED600D6D6D600DECECE00DECED600DED6
              D600D6D6DE00DED6DE00F4C8BE00F0CFCB00FFD6C600E7CED600E7D6D600F1D3
              D600FFD6CE00DEDEDE00E7DED600E7E7D600EBD6DE00E7DEDE00FFD6D600FFDE
              D600D2D2EF00C6C6FF00CECEFF00D6D6FF00DEDEE700DEDEFF00E7DEE700E7E7
              E700E7E7FF00EFDEDE00EFE7E700EFE7EF00F7E7E700FFDEDE00FFE7DE00FFE7
              E700EFEFEF00EFEFFF00F7EFEF00F7EFF700FFEFE700FFEFEF000F0F01010F0F
              0F0F0F0F0F0F0F0F0F0F0F100202010F0F0F0F0F10010F0F0F0F0F1002020201
              0F0F0F100202010F0F0F0F1002020202010F1002020202010F0F0F0F10020202
              02010202020202010F0F0F0F0F100202020202020202010F0F0F0F0F0F0F1002
              0202020202010F0F0F0F0F0F0F0F0F0202020202010F0F0F0F0F0F0F0F0F0F10
              02020202010F0F0F0F0F0F0F0F0F100202020202010F0F0F0F0F0F0F0F100202
              0201020202010F0F0F0F0F0F10020202010F10020202010F0F0F0F0F10020201
              0F0F0F10020202010F0F0F0F0F10020F0F0F0F0F100202020F0F0F0F0F0F0F0F
              0F0F0F0F0F1002100F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F}
          end
          object SpeedButton2: TSpeedButton
            Left = 181
            Top = 10
            Width = 86
            Height = 29
            Action = ActionFilterAccept
            Caption = 'Тятбиг'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF804F8FFFFFFFFFFFFFFFFFFFFFFF804
              04F8FFFFFFFFFFFFFFFFFFFFFFFF0404F8FFFFFFFFFFFFFFFFFFFFFFFFF804F8
              FFFFFFFFFFFFFFFFFFFFFFFFFF0404FFFFFFFFFFFFFFFFFFFFFFFFFFFF0404FF
              FFFF0404040404FFFFFFFFFFFF0404F8FFFFFFF8040404FFFFFFFFFFFFF80404
              F8FFF804040404FFFFFFFFFFFFFF04040404040404F804FFFFFFFFFFFFFFFFF8
              040404F8FFFF04FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
          end
          object SpeedButton3: TSpeedButton
            Left = 374
            Top = 10
            Width = 86
            Height = 29
            Caption = 'Нятиcя'
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777774F77777700000007777
              7777444F77777000000077777774444F777770000000700000444F44F7777000
              000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
              74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
              8777F07777774000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            OnClick = SpeedButton3Click
          end
          object SpeedButton4: TSpeedButton
            Left = 470
            Top = 10
            Width = 86
            Height = 29
            Caption = 'Баьла'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFF0000000000000000000000000000000000000000000000000000000000
              00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000CB0000CB0000CB0000CB00
              00CB0000CB0000CB0000CB0000CB0000CB000000FFFFFFFFFFFFFFFFFF000000
              0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000
              CB0000CB000000FFFFFF0000000000CB0000CBFEFEFEFEFEFE0000CB0000CB00
              00CB0000CB0000CB0000CBFEFEFEFEFEFE0000CB0000CB0000000000000000CB
              0000CBFEFEFEFEFEFEFEFEFE0000CB0000CB0000CB0000CBFEFEFEFEFEFEFEFE
              FE0000CB0000CB0000000000000000CB0000CB0000CBFEFEFEFEFEFEFEFEFE00
              00CB0000CBFEFEFEFEFEFEFEFEFE0000CB0000CB0000CB0000000000000000CB
              0000CB0000CB0000CBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000CB0000
              CB0000CB0000CB0000000000000000CB0000CB0000CB0000CB0000CBFEFEFEFE
              FEFEFEFEFEFEFEFE0000CB0000CB0000CB0000CB0000CB0000000000000000CB
              0000CB0000CB0000CB0000CBFEFEFEFEFEFEFEFEFEFEFEFE0000CB0000CB0000
              CB0000CB0000CB0000000000000000CB0000CB0000CB0000CBFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFE0000CB0000CB0000CB0000CB0000000000000000CB
              0000CB0000CBFEFEFEFEFEFEFEFEFE0000CB0000CBFEFEFEFEFEFEFEFEFE0000
              CB0000CB0000CB0000000000000000CB0000CBFEFEFEFEFEFEFEFEFE0000CB00
              00CB0000CB0000CBFEFEFEFEFEFEFEFEFE0000CB0000CB0000000000000000CB
              0000CBFEFEFEFEFEFE0000CB0000CB0000CB0000CB0000CB0000CBFEFEFEFEFE
              FE0000CB0000CB000000FFFFFF0000000000CB0000CB0000CB0000CB0000CB00
              00CB0000CB0000CB0000CB0000CB0000CB0000CB000000FFFFFFFFFFFFFFFFFF
              0000000000CB0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000CB0000
              CB000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton4Click
          end
        end
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 416
    Top = 288
  end
  object ActionList1: TActionList
    Left = 308
    Top = 284
    object ActionFilterAccept: TAction
      Caption = 'ActionFilterAccept'
      OnExecute = ActionFilterAcceptExecute
    end
    object ActionFilterReject: TAction
      Caption = 'ActionFilterReject'
      OnExecute = ActionFilterRejectExecute
    end
  end
end
