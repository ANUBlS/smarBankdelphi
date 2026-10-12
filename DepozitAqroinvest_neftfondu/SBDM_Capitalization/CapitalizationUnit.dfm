object FrmCapitalization: TFrmCapitalization
  Left = 252
  Top = 194
  ActiveControl = CapitalizationAmountEdit
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Capitalization for Contract є  '
  ClientHeight = 238
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
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
      TabOrder = 1
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
      TabOrder = 0
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
      TabOrder = 2
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
  end
  object Panel6: TPanel
    Left = 0
    Top = 51
    Width = 334
    Height = 44
    Align = alTop
    TabOrder = 1
    object Panel7: TPanel
      Left = 191
      Top = 1
      Width = 140
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText5: TStaticText
        Left = 2
        Top = 2
        Width = 136
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ўесабын жари галыьы'
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
        Width = 136
        Height = 21
        TabStop = False
        DataField = 'FACTICALDEBT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 61
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText6: TStaticText
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
      object DBEdit6: TDBEdit
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
    object Panel9: TPanel
      Left = 62
      Top = 1
      Width = 129
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText7: TStaticText
        Left = 2
        Top = 2
        Width = 125
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
      object DBEdit7: TDBEdit
        Left = 2
        Top = 19
        Width = 124
        Height = 21
        TabStop = False
        DataField = 'CONTRACTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object Panel11: TPanel
    Left = 0
    Top = 44
    Width = 334
    Height = 7
    Align = alTop
    BevelInner = bvSpace
    Color = clBlack
    TabOrder = 2
  end
  object Panel5: TPanel
    Left = 0
    Top = 95
    Width = 334
    Height = 44
    Align = alTop
    TabOrder = 3
    object Panel10: TPanel
      Left = 191
      Top = 1
      Width = 140
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText4: TStaticText
        Left = 2
        Top = 2
        Width = 136
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ўесабын жари галыьы'
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
        Width = 136
        Height = 21
        TabStop = False
        DataField = 'FACTICALINTERESTDEBT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 1
      Width = 61
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
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
      object DBEdit8: TDBEdit
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
    object Panel13: TPanel
      Left = 62
      Top = 1
      Width = 129
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText9: TStaticText
        Left = 2
        Top = 2
        Width = 125
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '‘аиз  ўесабынын є'
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
        Width = 124
        Height = 21
        TabStop = False
        DataField = 'INTERESTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object Panel14: TPanel
    Left = 0
    Top = 139
    Width = 334
    Height = 52
    Align = alTop
    TabOrder = 4
    object StaticText10: TStaticText
      Left = 4
      Top = 6
      Width = 49
      Height = 17
      AutoSize = False
      Caption = '“арих'
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
    object DTPCurentDate: TDateTimePicker
      Left = 3
      Top = 27
      Width = 118
      Height = 21
      CalAlignment = dtaLeft
      Date = 37635.651785787
      Time = 37635.651785787
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      TabStop = False
      OnExit = DTPCurentDateExit
    end
    object StaticText11: TStaticText
      Left = 129
      Top = 6
      Width = 133
      Height = 17
      Caption = ' апитализ€ олунажаг м€бл€ь'
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
    object CapitalizationAmountEdit: TCurrencyEdit
      Left = 128
      Top = 27
      Width = 177
      Height = 21
      TabOrder = 3
      Text = '0'
    end
  end
  object BtnCommit: TButton
    Left = 165
    Top = 202
    Width = 75
    Height = 25
    Caption = '√&€бул'
    TabOrder = 5
    OnClick = BtnCommitClick
  end
  object BtnCancel: TButton
    Left = 252
    Top = 202
    Width = 75
    Height = 25
    Caption = '&»мтина'
    ModalResult = 2
    TabOrder = 6
  end
  object CBUseTransaction: TCheckBox
    Left = 3
    Top = 216
    Width = 150
    Height = 17
    Caption = 'ям€лиййатлар апарылсын'
    TabOrder = 7
  end
  object CapitalizationPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PAYMENT'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 56
    Top = 144
  end
end
