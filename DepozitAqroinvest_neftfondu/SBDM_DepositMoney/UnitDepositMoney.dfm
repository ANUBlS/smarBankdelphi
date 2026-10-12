object FrmDepositMoney: TFrmDepositMoney
  Left = 296
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Deposit Money Contract є  '
  ClientHeight = 156
  ClientWidth = 346
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 44
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 62
      Top = 1
      Width = 129
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText1: TStaticText
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
      object DBEdit1: TDBEdit
        Left = 2
        Top = 19
        Width = 124
        Height = 21
        DataField = 'CONTRACTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
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
        DataField = 'CONTRACTCURRENCY'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 191
      Top = 1
      Width = 152
      Height = 42
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 2
        Top = 2
        Width = 148
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
      object DBEdit3: TDBEdit
        Left = 2
        Top = 19
        Width = 146
        Height = 21
        DataField = 'AMOUNT'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object ApplyBtn: TButton
    Left = 173
    Top = 122
    Width = 75
    Height = 25
    Caption = '√&€бул'
    TabOrder = 3
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 261
    Top = 122
    Width = 75
    Height = 25
    Caption = '&»мтина'
    ModalResult = 2
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 0
    Top = 44
    Width = 346
    Height = 69
    Align = alTop
    TabOrder = 1
    object PercentLabel: TLabel
      Left = 251
      Top = 41
      Width = 19
      Height = 13
      Caption = '‘аиз'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object StaticText4: TStaticText
      Left = 3
      Top = 8
      Width = 27
      Height = 17
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
    object StaticText5: TStaticText
      Left = 3
      Top = 39
      Width = 39
      Height = 17
      Caption = 'ћ€бл€ь'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object DTPCurrentDate: TDateTimePicker
      Left = 48
      Top = 6
      Width = 125
      Height = 21
      CalAlignment = dtaLeft
      Date = 37632.4604463079
      Time = 37632.4604463079
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnExit = DTPCurrentDateExit
    end
    object AmountEdit: TCurrencyEdit
      Left = 49
      Top = 36
      Width = 123
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object PercentEdit: TCurrencyEdit
      Left = 278
      Top = 36
      Width = 62
      Height = 21
      TabOrder = 4
      Text = '0'
    end
  end
  object CBUseTransaction: TCheckBox
    Left = 4
    Top = 136
    Width = 138
    Height = 17
    Caption = 'ям€лиййатлар апарылсын'
    TabOrder = 2
  end
  object DepositMoneyPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_CREDIT_TRANCHES'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 184
    Top = 56
  end
end
