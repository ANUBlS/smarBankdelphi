object PaymentDetalsForm: TPaymentDetalsForm
  Left = 165
  Top = 124
  Width = 642
  Height = 475
  Caption = 'Payment Detals'
  Color = clBtnFace
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
    Width = 634
    Height = 417
    Align = alTop
    Caption = 'Кючцрмя ямялиййатына ялавя'
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 630
      Height = 284
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 314
        Height = 282
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 167
          Width = 314
          Height = 116
          Align = alTop
          Caption = 'Юдяниш Тапшырыьы'
          TabOrder = 1
          object P13: TPanel
            Left = 2
            Top = 15
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Гейдиййат №:'
            TabOrder = 0
            object SpeedButton2: TSpeedButton
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
              OnClick = SpeedButton2Click
            end
            object Edit_Referens: TEdit
              Left = 99
              Top = 2
              Width = 182
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
              TabOrder = 0
            end
          end
          object P14: TPanel
            Left = 2
            Top = 40
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Валйута:'
            TabOrder = 1
            object Combo_Valute: TComboBox
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
              OnChange = Edit_BankName_SelfChange
            end
            object Valute_ID: TListBox
              Left = 200
              Top = 3
              Width = 34
              Height = 18
              ItemHeight = 13
              TabOrder = 1
              Visible = False
            end
          end
          object P16: TPanel
            Left = 2
            Top = 90
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Юдяниш нюв. коду:'
            TabOrder = 3
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
            object Edit_TransCode: TEdit
              Left = 99
              Top = 1
              Width = 54
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P15: TPanel
            Left = 2
            Top = 65
            Width = 310
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
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 0
              Visible = False
              OnKeyPress = Edit_Amount1KeyPress
            end
            object Edit_amount: TCurrencyEdit
              Left = 98
              Top = 1
              Width = 209
              Height = 21
              Color = clSilver
              MaxLength = 15
              TabOrder = 1
              Text = '0'
              OnChange = Edit_BankName_SelfChange
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 314
          Height = 167
          Align = alTop
          Caption = 'Юдяйян Банк'
          TabOrder = 0
          object P2: TPanel
            Left = 2
            Top = 39
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын коду:'
            TabOrder = 1
            object Edit_BankCode_Self: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P3: TPanel
            Left = 2
            Top = 64
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын мцх.щес.:'
            TabOrder = 2
            object Edit_account_Self: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P4: TPanel
            Left = 2
            Top = 89
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' ВЮЕН:'
            TabOrder = 3
            object Edit_Voen_Self: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P5: TPanel
            Left = 2
            Top = 114
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Мцхбир суб щесаб:'
            TabOrder = 4
            object Edit_account_sub_Self: TEdit
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
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_account_sub_SelfKeyPress
            end
          end
          object P6: TPanel
            Left = 2
            Top = 139
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' S.W.F.I.T. Бик:'
            TabOrder = 5
            object Edit_BIK_Self: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P1: TPanel
            Left = 2
            Top = 15
            Width = 310
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын ады:'
            TabOrder = 0
            object Edit_BankName_Self: TEdit
              Left = 99
              Top = 1
              Width = 209
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 315
        Top = 1
        Width = 314
        Height = 282
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 0
          Top = 167
          Width = 314
          Height = 116
          Align = alTop
          Caption = 'Алан мцштяри'
          TabOrder = 1
          object P18: TPanel
            Left = 2
            Top = 40
            Width = 310
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Ады:'
            TabOrder = 1
            object Edit_Client_Name: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P19: TPanel
            Left = 2
            Top = 64
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Коду:'
            TabOrder = 2
            object Edit_Client_Code: TEdit
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P17: TPanel
            Left = 2
            Top = 15
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Щесаб №:'
            TabOrder = 0
            object Edit_Client_acc_no: TEdit
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
              MaxLength = 34
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P20: TPanel
            Left = 2
            Top = 89
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' ВЮЕН:'
            TabOrder = 3
            object Edit_Client_Voen: TEdit
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
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_Client_VoenKeyPress
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 314
          Height = 167
          Align = alTop
          Caption = 'Алан Банк'
          TabOrder = 0
          object P7: TPanel
            Left = 2
            Top = 15
            Width = 310
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын ады:'
            TabOrder = 0
            object Combo_BankName: TComboBox
              Left = 98
              Top = 2
              Width = 210
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
              OnChange = Combo_BankNameChange
            end
            object Bank_ID: TListBox
              Left = 58
              Top = 3
              Width = 34
              Height = 17
              ItemHeight = 13
              TabOrder = 1
              Visible = False
            end
          end
          object P12: TPanel
            Left = 2
            Top = 139
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' S.W.F.I.T. Бик:'
            TabOrder = 5
            object Edit_Bik: TEdit
              Left = 98
              Top = 1
              Width = 210
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P11: TPanel
            Left = 2
            Top = 114
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Мцхбир суб щесаб:'
            TabOrder = 4
            object Edit_Account_Sub: TEdit
              Left = 98
              Top = 2
              Width = 210
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
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_account_sub_SelfKeyPress
            end
          end
          object P8: TPanel
            Left = 2
            Top = 39
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын коду:'
            TabOrder = 1
            object Edit_BankCode: TEdit
              Left = 98
              Top = 2
              Width = 210
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P9: TPanel
            Left = 2
            Top = 64
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' Банкын мцх.щес.:'
            TabOrder = 2
            object Edit_account: TEdit
              Left = 98
              Top = 2
              Width = 210
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
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P10: TPanel
            Left = 2
            Top = 89
            Width = 310
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            Caption = ' ВЮЕН:'
            TabOrder = 3
            object Edit_Voen: TEdit
              Left = 98
              Top = 2
              Width = 210
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
              OnChange = Edit_BankName_SelfChange
            end
          end
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 299
      Width = 315
      Height = 116
      Align = alLeft
      Caption = 'Юдянишин тяйинаты вя ясасы'
      TabOrder = 1
      object Edit_tey1: TEdit
        Left = 5
        Top = 17
        Width = 304
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
        OnChange = Edit_BankName_SelfChange
      end
      object Edit_tey2: TEdit
        Left = 5
        Top = 41
        Width = 304
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
        TabOrder = 1
        OnChange = Edit_BankName_SelfChange
      end
      object Edit_tey3: TEdit
        Left = 5
        Top = 65
        Width = 304
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
        TabOrder = 2
        OnChange = Edit_BankName_SelfChange
      end
      object Edit_tey4: TEdit
        Left = 5
        Top = 89
        Width = 304
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
        TabOrder = 3
        OnChange = Edit_BankName_SelfChange
      end
    end
    object GroupBox6: TGroupBox
      Left = 317
      Top = 299
      Width = 315
      Height = 116
      Align = alClient
      Caption = 'Ялавя мялумат'
      TabOrder = 2
      object Edit_inf1: TEdit
        Left = 4
        Top = 17
        Width = 307
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
        OnChange = Edit_BankName_SelfChange
      end
      object Edit_inf2: TEdit
        Left = 4
        Top = 41
        Width = 307
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
        TabOrder = 1
        OnChange = Edit_BankName_SelfChange
      end
      object Edit_inf3: TEdit
        Left = 4
        Top = 65
        Width = 307
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
        TabOrder = 2
        OnChange = Edit_BankName_SelfChange
      end
    end
  end
  object Button4: TButton
    Left = 272
    Top = 423
    Width = 113
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Ялявя вя нювбяти  >>'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 388
    Top = 423
    Width = 82
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'СОН'
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 470
    Top = 423
    Width = 82
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Имтина'
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 552
    Top = 423
    Width = 82
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Чыхыш'
    TabOrder = 4
    OnClick = Button3Click
  end
end
