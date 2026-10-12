object FrmUntimelyWithdraw: TFrmUntimelyWithdraw
  Left = 223
  Top = 143
  ActiveControl = TotalCalcedPercentsEdit
  BorderStyle = bsDialog
  Caption = 'Untimely Withdraw for contract є  '
  ClientHeight = 384
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 543
    Height = 105
    Align = alTop
    Caption = 'ћцгавил€ щаггында ћ€лумат'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 57
      Width = 539
      Height = 45
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 1
        Top = 1
        Width = 537
        Height = 43
        Align = alClient
        Caption = 'ћцшт€ринин ады'
        TabOrder = 0
        object DBEdit1: TDBEdit
          Left = 5
          Top = 18
          Width = 524
          Height = 21
          TabStop = False
          DataField = 'CONTRACTACCNAME'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 15
      Width = 539
      Height = 42
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 234
        Top = 1
        Width = 304
        Height = 40
        Align = alClient
        Caption = 'ћцгавил€нин нювц'
        TabOrder = 0
        object DBEdit3: TDBEdit
          Left = 4
          Top = 15
          Width = 293
          Height = 21
          TabStop = False
          DataField = 'TYPEDISCRIPTION'
          DataSource = UWDataModule.DataSrcContractType
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 1
        Top = 1
        Width = 48
        Height = 40
        Align = alLeft
        Caption = '    $    '
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 3
          Top = 15
          Width = 39
          Height = 21
          TabStop = False
          DataField = 'CONTRACTCURRENCY'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 49
        Top = 1
        Width = 185
        Height = 40
        Align = alLeft
        Caption = 'ƒепозит ўесабынын є'
        TabOrder = 2
        object DBEdit4: TDBEdit
          Left = 4
          Top = 15
          Width = 175
          Height = 21
          TabStop = False
          DataField = 'CONTRACTACCNO'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 0
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 543
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BtnCancel: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = '»мтина'
      ModalResult = 2
      TabOrder = 2
    end
    object BtnOk: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = '√€бул'
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 20
      Width = 257
      Height = 17
      Caption = 'ям€лиййат апарылсын '
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 543
    Height = 238
    Align = alClient
    TabOrder = 2
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 539
      Height = 56
      Align = alTop
      TabOrder = 0
      object GroupBox10: TGroupBox
        Left = 363
        Top = 1
        Width = 175
        Height = 54
        Align = alClient
        TabOrder = 0
        object StaticText4: TStaticText
          Left = 2
          Top = 15
          Width = 171
          Height = 17
          Align = alTop
          Caption = 'яман€тин —ахландыьы мцдд€т (эцнл€) '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object EditDaysInterval: TStaticText
          Left = 44
          Top = 33
          Width = 123
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox11: TGroupBox
        Left = 98
        Top = 1
        Width = 125
        Height = 54
        Align = alLeft
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 2
          Top = 15
          Width = 121
          Height = 17
          Align = alTop
          Caption = 'ћ.÷. јчылма тарихи'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 2
          Top = 31
          Width = 120
          Height = 21
          TabStop = False
          DataField = 'OPENDATE'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 1
        end
      end
      object GroupBox12: TGroupBox
        Left = 223
        Top = 1
        Width = 140
        Height = 54
        Align = alLeft
        TabOrder = 2
        object StaticText7: TStaticText
          Left = 2
          Top = 15
          Width = 136
          Height = 17
          Align = alTop
          Caption = 'ћ.÷. Ѕаьланма тарихи'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 2
          Top = 31
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'CLOSEDATE'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 1
        Top = 1
        Width = 97
        Height = 54
        Align = alLeft
        TabOrder = 3
        object StaticText1: TStaticText
          Left = 2
          Top = 15
          Width = 93
          Height = 17
          Align = alTop
          Caption = 'Ѕанк эцнц.'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object CurrentDateEdit: TEdit
          Left = 3
          Top = 31
          Width = 90
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 179
      Width = 539
      Height = 56
      Align = alTop
      TabOrder = 4
      object GroupBox14: TGroupBox
        Left = 1
        Top = 1
        Width = 216
        Height = 54
        Align = alLeft
        TabOrder = 0
        object StaticText8: TStaticText
          Left = 2
          Top = 15
          Width = 212
          Height = 17
          Align = alTop
          Caption = '÷.….‘ д€н мцшт€рий€ верил€ж€к щисс€ (фаизл€)'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 3
          Top = 31
          Width = 102
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
      object GroupBox15: TGroupBox
        Left = 371
        Top = 1
        Width = 167
        Height = 54
        Align = alClient
        TabOrder = 2
        object StaticText9: TStaticText
          Left = 2
          Top = 15
          Width = 163
          Height = 17
          Align = alTop
          Caption = 'ћцшт€рий€ верил€ж€к м€бл€ь.'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object PaidAmountEdit: TCurrencyEdit
          Left = 2
          Top = 31
          Width = 161
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
      object GroupBox13: TGroupBox
        Left = 217
        Top = 1
        Width = 154
        Height = 54
        Align = alLeft
        TabOrder = 1
        object StaticText5: TStaticText
          Left = 2
          Top = 15
          Width = 150
          Height = 17
          Align = alTop
          Caption = 'Ѕакын хидм€т щаггы (€э€р варса)'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object CurrencyEdit3: TCurrencyEdit
          Left = 2
          Top = 31
          Width = 150
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object Panel7: TPanel
      Left = 2
      Top = 127
      Width = 539
      Height = 7
      Align = alTop
      Color = clNavy
      TabOrder = 1
    end
    object Panel8: TPanel
      Left = 2
      Top = 71
      Width = 539
      Height = 56
      Align = alTop
      TabOrder = 2
      object GroupBox16: TGroupBox
        Left = 139
        Top = 1
        Width = 190
        Height = 54
        Align = alLeft
        TabOrder = 0
        object StaticText11: TStaticText
          Left = 2
          Top = 15
          Width = 186
          Height = 17
          Align = alTop
          Caption = 'ƒиэ€р йатырымларын(…ыьымларыын) ж€ми.'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object OtherDepositsDBEdit: TDBEdit
          Left = 1
          Top = 31
          Width = 187
          Height = 21
          TabStop = False
          DataField = 'TOTALDEPOSITS'
          DataSource = UWDataModule.DataSrcOtherDeposit
          TabOrder = 1
        end
      end
      object GroupBox17: TGroupBox
        Left = 1
        Top = 1
        Width = 138
        Height = 54
        Align = alLeft
        TabOrder = 1
        object StaticText12: TStaticText
          Left = 2
          Top = 15
          Width = 134
          Height = 17
          Align = alTop
          Caption = 'јна м€бл€ь(»лкин йатырылмыш)'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 2
          Top = 31
          Width = 133
          Height = 21
          TabStop = False
          DataField = 'AMOUNT'
          DataSource = DepositDataModule.DataSrcDeposit
          TabOrder = 1
        end
      end
      object GroupBox18: TGroupBox
        Left = 329
        Top = 1
        Width = 209
        Height = 54
        Align = alClient
        TabOrder = 2
        object StaticText13: TStaticText
          Left = 2
          Top = 15
          Width = 205
          Height = 17
          Align = alTop
          Caption = '∆€ми йатырылмыш м€бл€ь( ап . дахил олмагла)'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object TotalDebtCurrencyEdit: TCurrencyEdit
          Left = 3
          Top = 31
          Width = 202
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 134
      Width = 539
      Height = 45
      Align = alTop
      TabOrder = 3
      object GroupBox7: TGroupBox
        Left = 1
        Top = 1
        Width = 537
        Height = 43
        Align = alClient
        Caption = '…ыьылмыш цмуми фаиз ( ап . дахил олмагла)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TotalCalcedPercentsEdit: TCurrencyEdit
          Left = 3
          Top = 19
          Width = 230
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnKeyPress = TotalCalcedPercentsEditKeyPress
        end
      end
    end
  end
end
