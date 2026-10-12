object TransForm: TTransForm
  Left = 516
  Top = 459
  Width = 636
  Height = 375
  Caption = 'MT102'
  Color = clBtnFace
  Constraints.MinHeight = 368
  Constraints.MinWidth = 636
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 628
    Height = 314
    Align = alTop
    Caption = 'Кючцрмя ямялиййаты (MT102) '
    TabOrder = 0
    object Panel6: TPanel
      Left = 2
      Top = 15
      Width = 314
      Height = 297
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 314
        Height = 297
        Align = alClient
        Caption = 'Юдяйян Банк'
        TabOrder = 0
        object P1: TPanel
          Left = 2
          Top = 67
          Width = 310
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Эюндярян:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Edit_Sender: TEdit
            Left = 99
            Top = 3
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object P2: TPanel
          Left = 2
          Top = 93
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Гейдиййат №:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 283
            Top = 3
            Width = 23
            Height = 19
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButton1Click
          end
          object Edit_Referens: TEdit
            Left = 99
            Top = 2
            Width = 181
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            OnChange = Edit_ReferensChange
            OnKeyPress = Edit_clientNameKeyPress
          end
        end
        object P3: TPanel
          Left = 2
          Top = 118
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Ямялиййат коду:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Edit8: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'CREDIT'
          end
        end
        object P4: TPanel
          Left = 2
          Top = 143
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Банкын коду:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Edit_BankCode: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object P7: TPanel
          Left = 2
          Top = 218
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Мцхбир суб щесаб:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object Edit_account_sub: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 13
            ParentFont = False
            TabOrder = 0
            OnKeyPress = Edit_account_subKeyPress
          end
        end
        object P5: TPanel
          Left = 2
          Top = 168
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Банкын мцх.щес.:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object Edit_Account: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object P8: TPanel
          Left = 2
          Top = 243
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' S.W.F.I.T. Бик:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object Edit_Bik: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object P6: TPanel
          Left = 2
          Top = 193
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' ВЮЕН:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object Edit_voen: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object P9: TPanel
          Left = 2
          Top = 268
          Width = 310
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' КРЕДИТ/ДЕБИТ:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          object ComboBox_CD: TComboBox
            Left = 99
            Top = 2
            Width = 46
            Height = 21
            Style = csDropDownList
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              'D')
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 310
          Height = 52
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          TabOrder = 9
          object LabelFilialName: TLabel
            Left = 1
            Top = 1
            Width = 308
            Height = 50
            Align = alClient
            Color = clBtnFace
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            WordWrap = True
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 316
      Top = 15
      Width = 310
      Height = 297
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 163
        Width = 310
        Height = 94
        Align = alTop
        Caption = 'Тарих, Валйута, Мябляь'
        TabOrder = 1
        object P16: TPanel
          Left = 2
          Top = 65
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Цмуми Мябляь:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Edit_Amount1: TEdit
            Left = 99
            Top = 1
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clBtnFace
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
            Visible = False
          end
          object Edit_amount: TCurrencyEdit
            Left = 99
            Top = 1
            Width = 208
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
        end
        object P15: TPanel
          Left = 2
          Top = 40
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Валйута:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Combo_valute: TComboBox
            Left = 99
            Top = 2
            Width = 208
            Height = 21
            Style = csDropDownList
            Color = clSilver
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object Valute_ID: TListBox
            Left = 160
            Top = 3
            Width = 34
            Height = 18
            ItemHeight = 13
            TabOrder = 1
            Visible = False
          end
        end
        object P14: TPanel
          Left = 2
          Top = 15
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Тарих:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Combo_date: TDateTimePicker
            Left = 99
            Top = 2
            Width = 128
            Height = 21
            CalAlignment = dtaLeft
            Date = 37817.2948244097
            Time = 37817.2948244097
            Color = clSilver
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 310
        Height = 163
        Align = alTop
        Caption = 'Юдяйян мцштяри'
        TabOrder = 0
        object P11: TPanel
          Left = 2
          Top = 85
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Ады:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Edit_clientName: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 35
            ParentFont = False
            TabOrder = 0
            OnChange = Edit_ReferensChange
            OnKeyPress = Edit_clientNameKeyPress
          end
        end
        object P12: TPanel
          Left = 2
          Top = 110
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Юдямя нювц:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Edit_Client_code: TEdit
            Left = 99
            Top = 1
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 35
            ParentFont = False
            TabOrder = 0
            Text = '/'
            OnChange = Edit_ReferensChange
            OnKeyPress = Edit_clientNameKeyPress
          end
        end
        object P10: TPanel
          Left = 2
          Top = 15
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Щесаб №:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object AccSearch: TCMSearchEdit
            Left = 99
            Top = 2
            Width = 205
            Height = 21
            TabOrder = 0
            OnChange = AccSearchChange
            OnKeyPress = AccSearchKeyPress
            KeyField = 'ID'
            ListField = 'acc_no'
            ListSource = DataMod.Account_Source
            ErrorColor = clRed
            BeepOnNotFound = True
          end
        end
        object P13: TPanel
          Left = 2
          Top = 135
          Width = 306
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' ВЮЕН:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Edit_Client_voen: TEdit
            Left = 99
            Top = 2
            Width = 209
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 35
            ParentFont = False
            TabOrder = 0
            Text = '/'
            OnChange = Edit_ReferensChange
            OnKeyPress = Edit_clientNameKeyPress
          end
        end
        object P_view: TPanel
          Left = 2
          Top = 67
          Width = 306
          Height = 18
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 5
          OnEnter = P_viewEnter
          object Label2: TLabel
            Left = 2
            Top = 2
            Width = 30
            Height = 14
            Align = alLeft
            Caption = 'Галыг: '
          end
          object DBText4: TDBText
            Left = 32
            Top = 2
            Width = 115
            Height = 14
            Align = alLeft
          end
          object Label3: TLabel
            Left = 147
            Top = 2
            Width = 56
            Height = 14
            Align = alLeft
            Caption = 'Еквивалент: '
          end
          object DBEdit_ostat: TDBEdit
            Left = 31
            Top = 2
            Width = 115
            Height = 13
            BorderStyle = bsNone
            Color = clSilver
            DataField = 'OSTAT'
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit_pokostat: TDBEdit
            Left = 201
            Top = 2
            Width = 105
            Height = 13
            BorderStyle = bsNone
            Color = clSilver
            DataField = 'POK_OSTAT'
            ReadOnly = True
            TabOrder = 1
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 40
          Width = 306
          Height = 27
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 4
          object DBText1: TDBText
            Left = 45
            Top = 2
            Width = 259
            Height = 23
            Align = alClient
            DataField = 'NAME'
            DataSource = DataMod.Account_Source
            WordWrap = True
          end
          object Panel4: TPanel
            Left = 2
            Top = 2
            Width = 43
            Height = 23
            Align = alLeft
            Alignment = taLeftJustify
            BevelOuter = bvLowered
            Caption = 'Мцштяри:'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object Panel20: TPanel
        Left = 0
        Top = 257
        Width = 310
        Height = 40
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Юдяйижидян Вясаити алана Мялумат:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Edit_BNF: TEdit
          Left = 227
          Top = 11
          Width = 79
          Height = 21
          Anchors = [akRight, akBottom]
          CharCase = ecUpperCase
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '/BNF/0'
        end
      end
    end
  end
  object ButtonPost: TButton
    Left = 477
    Top = 316
    Width = 74
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Йаддаша йаз'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonPostClick
  end
  object Button2: TButton
    Left = 552
    Top = 316
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Имтина'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button_add: TButton
    Left = 3
    Top = 317
    Width = 72
    Height = 22
    Anchors = [akLeft, akBottom]
    Caption = 'Ялавя ет'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = 64
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button_addClick
  end
end
