object frmAddExtractMoney: TfrmAddExtractMoney
  Left = 279
  Top = 195
  BorderIcons = [biSystemMenu]
  Caption = #1044#1077#1087#1086#1079#1080#1090#1080#1085' '#1102#1076#1103#1085#1080#1083#1084#1103#1089#1080
  ClientHeight = 196
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 45
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 328
      Top = 4
      Width = 23
      Height = 13
      Caption = #1058#1072#1088#1080#1093
    end
    object DTPOperation: TDateTimePicker
      Left = 326
      Top = 17
      Width = 90
      Height = 21
      Date = 39601.653433518500000000
      Time = 39601.653433518500000000
      TabOrder = 0
    end
    object Panel9: TPanel
      Left = 2
      Top = 2
      Width = 322
      Height = 41
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object AccnameLictCb: TDBLookupComboboxEh
        Left = 160
        Top = 18
        Width = 159
        Height = 21
        Alignment = taLeftJustify
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DMExtractMoney.CreditAccsDatSrc
        TabOrder = 0
        Visible = True
        OnChange = AccnameLictCbChange
      end
      object AccountListCB: TDBLookupComboboxEh
        Left = 1
        Top = 18
        Width = 159
        Height = 21
        TabStop = False
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DMExtractMoney.CreditAccsDatSrc
        TabOrder = 1
        Visible = True
        OnChange = AccountListCBChange
      end
      object StaticText3: TStaticText
        Left = 2
        Top = 2
        Width = 318
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1052#1094#1096#1090#1103#1088#1080' '#1065#1077#1089#1072#1073
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 45
    Width = 430
    Height = 118
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object GroupBox5: TGroupBox
      Left = 2
      Top = 58
      Width = 426
      Height = 56
      Align = alTop
      Caption = #1060#1072#1080#1079' '#1084#1103#1073#1083#1103#1100#1080
      TabOrder = 0
      object Panel4: TPanel
        Left = 2
        Top = 15
        Width = 170
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText2: TStaticText
          Left = 2
          Top = 2
          Width = 166
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh3: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'INTERESTACCNO'
          DataSource = DMExtractMoney.CustAccDatSrc
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel5: TPanel
        Left = 172
        Top = 15
        Width = 114
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh4: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'FACTICALINTERESTDEBT'
          DataSource = DMExtractMoney.DepositInfoDatSrc
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel6: TPanel
        Left = 286
        Top = 15
        Width = 134
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText4: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object EdIntDebit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 426
      Height = 56
      Align = alTop
      Caption = #1071#1089#1072#1089' '#1084#1103#1073#1083#1103#1100
      TabOrder = 1
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 170
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 2
          Top = 2
          Width = 166
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh1: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'CONTRACTACCNO'
          DataSource = DMExtractMoney.CustAccDatSrc
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel7: TPanel
        Left = 172
        Top = 15
        Width = 115
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 2
          Top = 2
          Width = 111
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh2: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'FACTICALDEBT'
          DataSource = DMExtractMoney.DepositInfoDatSrc
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel8: TPanel
        Left = 287
        Top = 15
        Width = 134
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText7: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object EdMainDebit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
  end
  object Button1: TButton
    Left = 263
    Top = 169
    Width = 75
    Height = 25
    Action = Actiontr
    Caption = #1043#1103#1073#1091#1083
    TabOrder = 2
  end
  object Button2: TButton
    Left = 343
    Top = 169
    Width = 75
    Height = 25
    Caption = #1048#1084#1090#1080#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
  object ActionList1: TActionList
    Left = 40
    Top = 168
    object Actiontr: TAction
      Caption = 'Actiontr'
      OnExecute = ActiontrExecute
      OnUpdate = ActiontrUpdate
    end
  end
end
