object FrmWithDraw: TFrmWithDraw
  Left = 242
  Top = 192
  ActiveControl = MainDebtIncreaseEdit
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Withdraw Money'
  ClientHeight = 196
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 44
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 191
      Top = 1
      Width = 140
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText1: TStaticText
        Left = 2
        Top = 2
        Width = 136
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ћцшт€ри ўесабынын є'
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
      object DBEdit1: TDBEdit
        Left = 2
        Top = 19
        Width = 136
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 130
      Top = 1
      Width = 61
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText2: TStaticText
        Left = 2
        Top = 2
        Width = 57
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '$'
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
      object DBEdit2: TDBEdit
        Left = 2
        Top = 19
        Width = 56
        Height = 21
        TabStop = False
        DataField = 'CLIENTCURRENCY'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 129
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
      object StaticText3: TStaticText
        Left = 2
        Top = 2
        Width = 125
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ћцгавил€нин є'
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
      object DBEdit3: TDBEdit
        Left = 2
        Top = 19
        Width = 124
        Height = 21
        TabStop = False
        DataField = 'CONTRACTNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 331
      Top = 1
      Width = 132
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText4: TStaticText
        Left = 2
        Top = 2
        Width = 128
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '»лкин ћ€бл€ь'
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
      object DBEdit4: TDBEdit
        Left = 2
        Top = 19
        Width = 127
        Height = 21
        TabStop = False
        DataField = 'AMOUNT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 52
    Width = 465
    Height = 45
    Align = alTop
    TabOrder = 1
    object Panel7: TPanel
      Left = 62
      Top = 1
      Width = 130
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText5: TStaticText
        Left = 2
        Top = 2
        Width = 126
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ƒепозит ўесабынын є'
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
      object DBEdit5: TDBEdit
        Left = 2
        Top = 19
        Width = 126
        Height = 21
        TabStop = False
        DataField = 'CONTRACTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel9: TPanel
      Left = 192
      Top = 1
      Width = 143
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText6: TStaticText
        Left = 2
        Top = 2
        Width = 139
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ўесабдакы жари м€бл€ь'
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
      object DBEdit6: TDBEdit
        Left = 2
        Top = 19
        Width = 139
        Height = 21
        TabStop = False
        DataField = 'FACTICALDEBT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel10: TPanel
      Left = 335
      Top = 1
      Width = 128
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText7: TStaticText
        Left = 2
        Top = 2
        Width = 124
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '„ыхарылажаг м€бл€ь'
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
      object MainDebtIncreaseEdit: TCurrencyEdit
        Left = 3
        Top = 19
        Width = 123
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 61
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
      object StaticText8: TStaticText
        Left = 2
        Top = 2
        Width = 57
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '$'
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
      object DBEdit7: TDBEdit
        Left = 2
        Top = 19
        Width = 56
        Height = 21
        TabStop = False
        DataField = 'CONTRACTCURRENCY'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 44
    Width = 465
    Height = 8
    Align = alTop
    BevelInner = bvSpace
    Color = clBlack
    TabOrder = 2
  end
  object Panel12: TPanel
    Left = 0
    Top = 97
    Width = 465
    Height = 45
    Align = alTop
    TabOrder = 3
    object Panel13: TPanel
      Left = 62
      Top = 1
      Width = 130
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText9: TStaticText
        Left = 2
        Top = 2
        Width = 126
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ƒепозит ўесабынын є'
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
      object DBEdit8: TDBEdit
        Left = 2
        Top = 19
        Width = 126
        Height = 21
        TabStop = False
        DataField = 'INTERESTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel14: TPanel
      Left = 192
      Top = 1
      Width = 143
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText10: TStaticText
        Left = 2
        Top = 2
        Width = 139
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ўесабдакы жари м€бл€ь'
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
      object DBEdit9: TDBEdit
        Left = 2
        Top = 19
        Width = 139
        Height = 21
        TabStop = False
        DataField = 'FACTICALINTERESTDEBT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel15: TPanel
      Left = 335
      Top = 1
      Width = 128
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText11: TStaticText
        Left = 2
        Top = 2
        Width = 124
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '„ыхарылажаг м€бл€ь'
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
      object InterestDebtIncreaseEdit: TCurrencyEdit
        Left = 3
        Top = 19
        Width = 122
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object Panel16: TPanel
      Left = 1
      Top = 1
      Width = 61
      Height = 43
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
      object StaticText12: TStaticText
        Left = 2
        Top = 2
        Width = 57
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '$'
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
      object DBEdit10: TDBEdit
        Left = 2
        Top = 19
        Width = 56
        Height = 21
        TabStop = False
        DataField = 'INTERESTCURRENCY'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object BtnCommit: TButton
    Left = 272
    Top = 161
    Width = 75
    Height = 25
    Caption = '√&€бул'
    TabOrder = 5
    OnClick = BtnCommitClick
  end
  object BtnCancel: TButton
    Left = 368
    Top = 161
    Width = 75
    Height = 25
    Caption = '&»мтина'
    ModalResult = 2
    TabOrder = 6
  end
  object CBUseTransactions: TCheckBox
    Left = 6
    Top = 172
    Width = 131
    Height = 17
    Caption = 'ям€лиййат апарылсын'
    TabOrder = 4
  end
  object WithdrawPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PAYMENT'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 112
    Top = 152
  end
end
