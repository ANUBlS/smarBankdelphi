object TransForm: TTransForm
  Left = 206
  Top = 202
  Width = 639
  Height = 355
  Caption = 'MT102'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 631
    Height = 298
    Align = alTop
    Caption = 'Кючцрмя ямялиййаты (MT102) '
    TabOrder = 0
    object Button_add: TButton
      Left = 4
      Top = 272
      Width = 77
      Height = 22
      Caption = 'Ялавя ет'
      TabOrder = 2
      OnClick = Button_addClick
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 627
      Height = 257
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 314
        Height = 257
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 314
          Height = 255
          Align = alTop
          Caption = 'Юдяйян Банк'
          TabOrder = 0
          object P1: TPanel
            Left = 2
            Top = 15
            Width = 310
            Height = 36
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Эюндярян:'
            TabOrder = 0
            object Edit_Sender: TEdit
              Left = 99
              Top = 8
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
            Top = 51
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Гейдиййат №:'
            TabOrder = 1
            object SpeedButton1: TSpeedButton
              Left = 283
              Top = 4
              Width = 23
              Height = 18
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
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 16
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object P3: TPanel
            Left = 2
            Top = 76
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Ямялиййат коду:'
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
            Top = 101
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын коду:'
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
            Top = 176
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Мцхбир суб щесаб:'
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
            Top = 126
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын мцх.щес.:'
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
            Top = 201
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' S.W.F.I.T. Бик:'
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
            Top = 151
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' ВЮЕН:'
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
            Top = 226
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' КРЕДИТ/ДЕБИТ:'
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
        end
      end
      object Panel3: TPanel
        Left = 314
        Top = 0
        Width = 313
        Height = 257
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 161
          Width = 313
          Height = 94
          Align = alTop
          Caption = 'Тарих, Валйута, Мябляь'
          TabOrder = 1
          object P16: TPanel
            Left = 2
            Top = 65
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Мябляь:'
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
              Color = clBtnFace
              TabOrder = 1
              Text = '0'
            end
          end
          object P15: TPanel
            Left = 2
            Top = 40
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Валйута:'
            TabOrder = 1
            object Combo_valute: TComboBox
              Left = 99
              Top = 2
              Width = 208
              Height = 21
              Style = csDropDownList
              Color = clSilver
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
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Тарих:'
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
              Kind = dtkDate
              ParseInput = False
              TabOrder = 0
            end
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 313
          Height = 161
          Align = alTop
          Caption = 'Юдяйян мцштяри'
          TabOrder = 0
          object P11: TPanel
            Left = 2
            Top = 85
            Width = 309
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Ады:'
            TabOrder = 1
            object Edit_clientName: TEdit
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
              MaxLength = 35
              ParentFont = False
              TabOrder = 0
            end
          end
          object P12: TPanel
            Left = 2
            Top = 109
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Юдямя нювц:'
            TabOrder = 2
            object Edit_Client_code: TEdit
              Left = 99
              Top = 1
              Width = 209
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 35
              ParentFont = False
              TabOrder = 0
              Text = '/'
            end
          end
          object P10: TPanel
            Left = 2
            Top = 15
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Щесаб №:'
            TabOrder = 0
            object AccSearch: TSearchEdit
              Left = 98
              Top = 2
              Width = 209
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 16
              TabOrder = 0
              OnChange = AccSearchChange
              DataSource = DataMod.Account_Source
              SearchField = 'acc_no'
            end
            object Edit_acc_id: TDBEdit
              Left = 64
              Top = 1
              Width = 31
              Height = 21
              DataField = 'ID'
              DataSource = DataMod.Account_Source
              TabOrder = 1
              Visible = False
            end
          end
          object P13: TPanel
            Left = 2
            Top = 134
            Width = 309
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' ВЮЕН:'
            TabOrder = 3
            object DBEdit_Voen: TDBEdit
              Left = 99
              Top = 1
              Width = 208
              Height = 21
              Color = clSilver
              DataField = 'INN'
              DataSource = DataMod.Account_Source
              MaxLength = 35
              ReadOnly = True
              TabOrder = 0
              OnKeyPress = DBEdit_VoenKeyPress
            end
          end
          object P_view: TPanel
            Left = 2
            Top = 67
            Width = 309
            Height = 18
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
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
              DataSource = DataMod.Account_Source
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
              DataSource = DataMod.Account_Source
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
              DataSource = DataMod.Account_Source
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel2: TPanel
            Left = 2
            Top = 40
            Width = 309
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            TabOrder = 4
            object DBText1: TDBText
              Left = 45
              Top = 2
              Width = 262
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
      end
    end
    object Panel20: TPanel
      Left = 376
      Top = 272
      Width = 253
      Height = 24
      Align = alRight
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Юдяйижидян Вясаити алана Мялумат:'
      TabOrder = 1
      object Edit_BNF: TEdit
        Left = 172
        Top = -1
        Width = 79
        Height = 21
        Anchors = [akRight, akBottom]
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
        Text = '/BNF/0'
      end
    end
    object Panel5: TPanel
      Left = 255
      Top = 272
      Width = 121
      Height = 24
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 3
      object RadioButton1: TRadioButton
        Left = 6
        Top = 4
        Width = 53
        Height = 17
        Caption = 'HOX'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 64
        Top = 4
        Width = 54
        Height = 17
        Caption = 'SWIFT'
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 479
    Top = 303
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Йаддаша йаз'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 554
    Top = 303
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Имтина'
    TabOrder = 2
    OnClick = Button2Click
  end
end
