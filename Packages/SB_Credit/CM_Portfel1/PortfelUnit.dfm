object PortfelForm: TPortfelForm
  Left = 210
  Top = 144
  Width = 586
  Height = 545
  BorderIcons = [biSystemMenu]
  Caption = 'Ïîðòôåë öçðÿ òÿhëèë'
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
    Width = 578
    Height = 518
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 574
      Height = 514
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 570
        Height = 510
        Align = alClient
        Caption = 'Filter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Panel4: TPanel
          Left = 283
          Top = 56
          Width = 285
          Height = 220
          Align = alClient
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
            Top = 177
            Width = 281
            Height = 41
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 2
              Top = 2
              Width = 277
              Height = 37
              Align = alClient
              Caption = 'Êðåäèòèí íîâö'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxCreditType: TCheckBox
                Left = 250
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhCreditType: TDBLookupComboboxEh
                Left = 3
                Top = 13
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
            Top = 133
            Width = 281
            Height = 44
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 1
            object GroupBox4: TGroupBox
              Left = 2
              Top = 2
              Width = 277
              Height = 40
              Align = alClient
              Caption = 'Èñòèôàäÿ÷è'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxUser: TCheckBox
                Left = 250
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhUser: TDBLookupComboboxEh
                Left = 3
                Top = 13
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
            Top = 89
            Width = 281
            Height = 44
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 2
            object GroupBox5: TGroupBox
              Left = 2
              Top = 2
              Width = 277
              Height = 40
              Align = alClient
              Caption = 'Èñòèôàäÿ÷è ãðóïó'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxUserGroup: TCheckBox
                Left = 250
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhUserGroup: TDBLookupComboboxEh
                Left = 3
                Top = 13
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
            Top = 48
            Width = 281
            Height = 41
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 3
            object GroupBox6: TGroupBox
              Left = 2
              Top = 2
              Width = 277
              Height = 37
              Align = alClient
              Caption = 'Áîðæàëàíûí êàòåãîðéàñû'
              TabOrder = 0
              object CheckBoxCategorires: TCheckBox
                Left = 250
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhCategories: TDBLookupComboboxEh
                Left = 4
                Top = 13
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
            Top = 5
            Width = 281
            Height = 43
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 4
            object GroupBox7: TGroupBox
              Left = 2
              Top = 2
              Width = 277
              Height = 39
              Align = alClient
              Caption = 'Ýåæèêìèø òÿñíèôàò'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxDSSReserves: TCheckBox
                Left = 249
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhDSSReserves: TDBLookupComboboxEh
                Left = 3
                Top = 13
                Width = 241
                Height = 21
                DropDownBox.Sizable = True
                EditButtons = <>
                KeyField = 'ID'
                ListField = 'DESCRIPTION'
                ListSource = PortfelDataModule.DSSReservesDataSource
                TabOrder = 1
                Visible = True
              end
            end
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 276
          Width = 566
          Height = 43
          Align = alBottom
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
            Width = 562
            Height = 39
            Align = alClient
            Caption = 'Ìöøòÿðè'
            TabOrder = 0
            object CheckBoxCustomers: TCheckBox
              Left = 534
              Top = 14
              Width = 16
              Height = 17
              Caption = 'CheckBox1'
              TabOrder = 0
            end
            object DBLookupComboboxEhCustomers: TDBLookupComboboxEh
              Left = 4
              Top = 13
              Width = 519
              Height = 21
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              KeyField = 'BOOROWERID'
              ListField = 'BOOROWERNAME'
              ListSource = PortfelDataModule.CustomersDataSource
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 56
          Width = 281
          Height = 220
          Align = alLeft
          BevelInner = bvLowered
          TabOrder = 3
          object Panel12: TPanel
            Left = 2
            Top = 175
            Width = 277
            Height = 43
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 39
              Align = alClient
              Caption = 'Ôèëèàë'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxFilial: TCheckBox
                Left = 248
                Top = 14
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhFilial: TDBLookupComboboxEh
                Left = 4
                Top = 12
                Width = 231
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
            Top = 133
            Width = 277
            Height = 42
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 1
            object GroupBox9: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 38
              Align = alClient
              Caption = 'Ýèðîâ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxPledges: TCheckBox
                Left = 248
                Top = 15
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhPledges: TDBLookupComboboxEh
                Left = 4
                Top = 13
                Width = 234
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
            Top = 89
            Width = 277
            Height = 44
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 2
            object GroupBox10: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 40
              Align = alClient
              Caption = 'Áîðæàëàíûí òèïè'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxpersons: TCheckBox
                Left = 248
                Top = 16
                Width = 16
                Height = 14
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhPersons: TDBLookupComboboxEh
                Left = 4
                Top = 13
                Width = 235
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
            Top = 47
            Width = 277
            Height = 42
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 3
            object GroupBox11: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 38
              Align = alClient
              Caption = 'Òÿñíèôàò'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object CheckBoxDSPReserves: TCheckBox
                Left = 248
                Top = 14
                Width = 16
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
              end
              object DBLookupComboboxEhDSPReserves: TDBLookupComboboxEh
                Left = 4
                Top = 13
                Width = 234
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
                ListSource = PortfelDataModule.DSPReservesDatasource
                ParentFont = False
                TabOrder = 1
                Visible = True
              end
            end
          end
          object Panel16: TPanel
            Left = 2
            Top = 4
            Width = 277
            Height = 43
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 4
            object GroupBox12: TGroupBox
              Left = 2
              Top = 2
              Width = 273
              Height = 40
              Caption = 'Valyuta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object DBLookupComboboxValute: TDBLookupComboboxEh
                Left = 4
                Top = 13
                Width = 234
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
                Top = 15
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
          Top = 319
          Width = 566
          Height = 189
          Align = alBottom
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 2
            Top = 2
            Width = 562
            Height = 185
            Align = alClient
            Caption = 'Íÿòècÿëÿð'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Panel22: TPanel
              Left = 2
              Top = 105
              Width = 558
              Height = 39
              Align = alBottom
              BevelInner = bvLowered
              TabOrder = 0
              object GroupBox18: TGroupBox
                Left = 2
                Top = 2
                Width = 554
                Height = 35
                Align = alClient
                Caption = 'Þhtÿëèê'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object EditObligation: TEdit
                  Left = 0
                  Top = 14
                  Width = 541
                  Height = 21
                  ReadOnly = True
                  TabOrder = 0
                  Text = 'Edit1'
                end
              end
            end
            object Panel18: TPanel
              Left = 2
              Top = 15
              Width = 265
              Height = 90
              Align = alLeft
              BevelInner = bvLowered
              TabOrder = 1
              object Panel20: TPanel
                Left = 2
                Top = 2
                Width = 261
                Height = 43
                Align = alLeft
                BevelInner = bvLowered
                TabOrder = 0
                object GroupBox14: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 257
                  Height = 39
                  Align = alClient
                  Caption = 'Qalûq'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Editrests: TEdit
                    Left = 0
                    Top = 14
                    Width = 252
                    Height = 21
                    ReadOnly = True
                    TabOrder = 0
                    Text = 'Editrests'
                  end
                end
              end
              object Panel23: TPanel
                Left = 2
                Top = 45
                Width = 261
                Height = 43
                Align = alBottom
                BevelInner = bvLowered
                TabOrder = 1
                object GroupBox16: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 257
                  Height = 39
                  Align = alClient
                  Caption = 'Faiz qalûq'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object EditInterest: TEdit
                    Left = 0
                    Top = 14
                    Width = 252
                    Height = 21
                    ReadOnly = True
                    TabOrder = 0
                    Text = 'EditInterest'
                  end
                end
              end
            end
            object Panel19: TPanel
              Left = 267
              Top = 15
              Width = 293
              Height = 90
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 2
              object Panel21: TPanel
                Left = 2
                Top = 2
                Width = 283
                Height = 42
                Align = alLeft
                BevelInner = bvLowered
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object GroupBox15: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 279
                  Height = 38
                  Align = alClient
                  Caption = 'Gecikmiø qalûq'
                  TabOrder = 0
                  object EditDueRests: TEdit
                    Left = 0
                    Top = 14
                    Width = 272
                    Height = 21
                    ReadOnly = True
                    TabOrder = 0
                    Text = 'Edit1'
                  end
                end
              end
              object Panel24: TPanel
                Left = 2
                Top = 44
                Width = 289
                Height = 44
                Align = alBottom
                BevelInner = bvLowered
                TabOrder = 1
                object GroupBox17: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 285
                  Height = 40
                  Align = alClient
                  Caption = 'Gecikmiø  faiz qalûq'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object EditDueInRest: TEdit
                    Left = 0
                    Top = 14
                    Width = 275
                    Height = 21
                    ReadOnly = True
                    TabOrder = 0
                    Text = 'Edit1'
                  end
                end
              end
            end
            object Panel17: TPanel
              Left = 2
              Top = 144
              Width = 558
              Height = 39
              Align = alBottom
              BevelInner = bvLowered
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              object SpeedButton1: TSpeedButton
                Left = 10
                Top = 5
                Width = 97
                Height = 29
                Action = ActionFilterAccept
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BF00
                  0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BF000000BF00
                  0000BF000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BF000000BF000000BF00
                  0000BF000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  000000000000000000000000000000000000BF000000BF000000BF000000FFFF
                  FF00BF000000BF000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00BF000000BF000000BF000000FFFFFF000000
                  0000FF00FF00BF000000BF000000FFFFFF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00808080008080800080808000BF000000FFFFFF00FFFFFF000000
                  0000FF00FF00FF00FF00BF000000FFFFFF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                  0000FF00FF00FF00FF00FF00FF00BF000000FFFFFF00FF00FF00FF00FF000000
                  0000FFFFFF008080800080808000808080008080800080808000FFFFFF000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00BF000000FFFFFF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BF000000FF00FF000000
                  0000FFFFFF008080800080808000FF00FF00FF00FF00FF00FF00FFFFFF000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF008080800080808000FF00FF0000000000FF00FF0000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                  00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
              object SpeedButton2: TSpeedButton
                Left = 125
                Top = 7
                Width = 97
                Height = 28
                Action = ActionFilterReject
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00404040006060600080808000808080008080
                  80006060600040404000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00202020002020600020209F000000BF000000BF000000BF002020
                  9F0040408000808080006060600020202000FF00FF00FF00FF00FF00FF00FF00
                  FF000000200020209F000000FF000000FF000000FF000000FF000000FF000000
                  FF000000FF0020209F00606080008080800020202000FF00FF00FF00FF000000
                  20000000DF000000FF000000FF000000FF000000FF000000FF000000FF000000
                  FF000000FF000000FF000000DF006060800060606000FF00FF00FF00FF000000
                  7F000000FF000000FF003F3FFF000000FF000000FF000000FF000000FF000000
                  FF003F3FFF000000FF000000FF0020209F008080800040404000000040000000
                  FF000000FF003F3FFF00FF00FF00BFBFFF000000FF000000FF000000FF00BFBF
                  FF00FF00FF003F3FFF000000FF000000FF00404080006060600000007F000000
                  FF000000FF000000FF00BFBFFF00FF00FF00BFBFFF000000FF00BFBFFF00FF00
                  FF00BFBFFF000000FF000000FF000000FF0020209F00808080000000BF000000
                  FF000000FF000000FF000000FF00BFBFFF00FF00FF00FF00FF00FF00FF00BFBF
                  FF000000FF000000FF000000FF000000FF000000BF00808080000000BF000000
                  FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF000000
                  FF000000FF000000FF000000FF000000FF000000BF00808080000000BF000000
                  FF000000FF000000FF000000FF00BFBFFF00FF00FF00FF00FF00FF00FF00BFBF
                  FF000000FF000000FF000000FF000000FF000000BF006060600000007F000000
                  FF000000FF000000FF00BFBFFF00FF00FF00BFBFFF000000FF00BFBFFF00FF00
                  FF00BFBFFF000000FF000000FF000000FF0020209F0040404000000040000000
                  FF000000FF003F3FFF00FF00FF00BFBFFF000000FF000000FF000000FF00BFBF
                  FF00FF00FF003F3FFF000000FF000000FF0020206000FF00FF00FF00FF000000
                  7F000000FF000000FF003F3FFF000000FF000000FF000000FF000000FF000000
                  FF003F3FFF000000FF000000FF0020209F0020202000FF00FF00FF00FF000000
                  20000000DF000000FF000000FF000000FF000000FF000000FF000000FF000000
                  FF000000FF000000FF000000DF0000002000FF00FF00FF00FF00FF00FF00FF00
                  FF000000200000007F000000FF000000FF000000FF000000FF000000FF000000
                  FF000000FF0000007F0000002000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF000000400000007F000000BF000000BF000000BF000000
                  7F0000004000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              end
              object SpeedButton3: TSpeedButton
                Left = 241
                Top = 7
                Width = 97
                Height = 28
                Caption = 'Áàüëà'
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
                OnClick = SpeedButton3Click
              end
            end
          end
        end
        object Panel25: TPanel
          Left = 2
          Top = 15
          Width = 566
          Height = 41
          Align = alTop
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object GroupBox19: TGroupBox
            Left = 2
            Top = 2
            Width = 562
            Height = 37
            Align = alClient
            Caption = 'Tarix'
            TabOrder = 0
            object DateTimePicker: TDateTimePicker
              Left = 4
              Top = 12
              Width = 186
              Height = 21
              CalAlignment = dtaLeft
              Date = 38439.7482006482
              Time = 38439.7482006482
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 0
            end
            object ChBoxDate: TCheckBox
              Left = 196
              Top = 13
              Width = 17
              Height = 17
              Caption = 'ChBoxDate'
              TabOrder = 1
            end
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
    Left = 296
    Top = 24
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 260
    Top = 20
    object ActionFilterAccept: TAction
      Caption = '  Òÿòáèã      '
      ImageIndex = 2
      OnExecute = ActionFilterAcceptExecute
    end
    object ActionFilterReject: TAction
      Caption = ' Imtina         '
      ImageIndex = 3
      OnExecute = ActionFilterRejectExecute
    end
  end
  object ImageList1: TImageList
    Left = 330
    Top = 23
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004040400060606000808080008080800080808000606060004040
      4000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C0000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D4008080
      8000C8D0D40080808000C8D0D400C8D0D4008080800000000000FFFF0000C8D0
      D400C8D0D40080808000C8D0D400C8D0D4000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000002020
      20002020600020209F000000BF000000BF000000BF0020209F00404080008080
      800060606000202020000000000000000000000000000000000080808000C0C0
      C0000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000080808000C8D0D40080808000C8D0
      D400C8D0D40080808000C8D0D40080808000C8D0D40000000000FFFF00008080
      000080808000C8D0D400C8D0D400808080000000000000000000000000000000
      000000000000000000000000000000000000BF000000BF000000BF000000FFFF
      FF00000000000000000000000000000000000000000000000000000020002020
      9F000000FF000000FF000000FF000000FF000000FF000000FF000000FF002020
      9F00606080008080800020202000000000000000000000000000000000008080
      800080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000FF
      FF00C0C0C000000000000000000000000000C8D0D400C8D0D40080808000C8D0
      D40080808000C8D0D400C8D0D40080808000C8D0D40000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000000000000000
      0000000000000000000000000000BF000000BF000000BF000000BF000000FFFF
      FF000000000000000000000000000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF006060800060606000000000000000000000000000FFFFFF008080
      80000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000FF
      FF00C0C0C000C0C0C0000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D40080808000C8D0D400C8D0D40000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000000000000000
      00000000000000000000BF000000BF000000BF000000FFFFFF00BF000000BF00
      0000FFFFFF000000000000000000000000000000000000007F000000FF000000
      FF003F3FFF000000FF000000FF000000FF000000FF000000FF003F3FFF000000
      FF000000FF0020209F0080808000404040000000000000000000000000008080
      800080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D40000000000000000000000000000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BF000000BF000000BF000000FFFFFF000000000000000000BF00
      0000BF000000FFFFFF000000000000000000000040000000FF000000FF003F3F
      FF0000000000BFBFFF000000FF000000FF000000FF00BFBFFF00000000003F3F
      FF000000FF000000FF0040408000606060000000000000000000FFFFFF008080
      800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000FFFF0000FFFF0000000000C8D0D400C8D0D400C8D0D400C8D0
      D400000000008080800080808000808080008080800000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF008080
      80008080800080808000BF000000FFFFFF00FFFFFF0000000000000000000000
      0000BF000000FFFFFF00000000000000000000007F000000FF000000FF000000
      FF00BFBFFF0000000000BFBFFF000000FF00BFBFFF0000000000BFBFFF000000
      FF000000FF000000FF0020209F00808080000000000000000000808080008080
      800080808000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000C8D0D400C8D0D400C8D0D400C8D0
      D400000000008080000080808000808080008080800000000000FFFF00000000
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BF000000FFFFFF00000000000000BF000000FF000000FF000000
      FF000000FF00BFBFFF00000000000000000000000000BFBFFF000000FF000000
      FF000000FF000000FF000000BF00808080000000000000000000FFFFFF008080
      8000C0C0C000FFFFFF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800000000000C8D0D40080808000808080008080
      800000000000FFFF000080800000808080008080800000000000FFFF0000FFFF
      FF00808000000000000080808000C8D0D4000000000000000000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      00000000000000000000BF000000FFFFFF000000BF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000BF008080800000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00FFFFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000080800000808000008080
      000080800000FFFF0000FFFF0000808000008080800000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BF0000000000BF000000FF000000FF000000
      FF000000FF00BFBFFF00000000000000000000000000BFBFFF000000FF000000
      FF000000FF000000FF000000BF006060600080808000C0C0C000C0C0C000FFFF
      FF00C0C0C0008080800000000000C0C0C00000000000FFFFFF00C0C0C000C0C0
      C0008080800000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFF00000000000000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF008080
      800080808000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000007F000000FF000000FF000000
      FF00BFBFFF0000000000BFBFFF000000FF00BFBFFF0000000000BFBFFF000000
      FF000000FF000000FF0020209F004040400080808000C0C0C000000000008080
      8000C0C0C00000000000C0C0C00080808000FFFFFF00C0C0C000C0C0C0008080
      800000000000000000000000000000000000C8D0D40000000000000000000000
      000000000000FFFFFF00FFFF0000000000008080800000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000040000000FF000000FF003F3F
      FF0000000000BFBFFF000000FF000000FF000000FF00BFBFFF00000000003F3F
      FF000000FF000000FF00202060000000000000000000FFFFFF00C0C0C0000000
      0000808080008080800000000000FFFFFF00FFFFFF00FFFFFF00C0C0C0000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D40000000000FFFF000000000000808080008080800000000000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007F000000FF000000
      FF003F3FFF000000FF000000FF000000FF000000FF000000FF003F3FFF000000
      FF000000FF0020209F0020202000000000000000000000000000808080008080
      800080808000FFFFFF0000000000FFFFFF00C0C0C000C0C0C000FFFFFF000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000080808000808080008080800080808000FFFF00008080
      0000808000000000000080808000C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000020000000DF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DF000000200000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00C0C0C000C0C0C000808080000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D4008080800080808000808080008080800080808000FFFF
      0000808000000000000080808000C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000020000000
      7F000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      7F00000020000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000C0C0C000FFFFFF0080808000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D40080808000808080008080800080808000808080008080
      8000FFFF000000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000400000007F000000BF000000BF000000BF0000007F00000040000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFBF0000FFFFF80FE91F0000FF9FE003
      C00F0000FF0FC001E0070000FE0F8001C003000080078000E001000080230820
      C000000080330440C00000008039038080010000803C038080030000803E0380
      00070000873F0440000F0000803F0821801F0000857F8001C01F000080FF8003
      E01F000081FFC007FC3F0000FFFFF01F00000000000000000000000000000000
      000000000000}
  end
end
