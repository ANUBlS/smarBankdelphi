object FrmPayments: TFrmPayments
  Left = 219
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Payments for contract є'
  ClientHeight = 390
  ClientWidth = 485
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 60
    Align = alTop
    Color = clMenu
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 65
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '   ћцшт€ринин ўесаб є'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 34
        Width = 134
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModPayments.DataSrcClientAccData
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 64
      Height = 58
      Align = alLeft
      TabOrder = 1
      object StaticText4: TStaticText
        Left = 2
        Top = 15
        Width = 60
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      $'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 34
        Width = 58
        Height = 21
        TabStop = False
        DataField = 'CLIENTCURRENCY'
        DataSource = DataModPayments.DataSrcClientAccData
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 205
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText7: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '        ўесабын јды'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNAME'
        DataSource = DataModPayments.DataSrcClientAccData
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 345
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 3
      object StaticText6: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '  Ќ€з€рд€ “утулан  ћ€бл€ь'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        DataField = 'AMOUNT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 68
    Width = 485
    Height = 60
    Align = alTop
    TabOrder = 1
    object GroupBox17: TGroupBox
      Left = 50
      Top = 1
      Width = 151
      Height = 58
      Align = alLeft
      TabOrder = 0
      object StaticText17: TStaticText
        Left = 2
        Top = 15
        Width = 147
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '   ясас  ўесаб є'
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
      object DBEdit17: TDBEdit
        Left = 3
        Top = 34
        Width = 143
        Height = 21
        TabStop = False
        DataField = 'CONTRACTACCNO'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox18: TGroupBox
      Left = 1
      Top = 1
      Width = 49
      Height = 58
      Align = alLeft
      TabOrder = 1
      object StaticText18: TStaticText
        Left = 2
        Top = 15
        Width = 45
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      $'
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
      object DBEdit18: TDBEdit
        Left = 3
        Top = 34
        Width = 42
        Height = 21
        TabStop = False
        DataField = 'CONTRACTCURRENCY'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox19: TGroupBox
      Left = 201
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText19: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '        ∆ари Ѕорж'
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
      object DBEdit19: TDBEdit
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'FACTICALDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox20: TGroupBox
      Left = 341
      Top = 1
      Width = 142
      Height = 58
      Align = alLeft
      TabOrder = 3
      object StaticText20: TStaticText
        Left = 2
        Top = 15
        Width = 138
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '       ёд€нил€н ћ€бл€ь'
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
      object FacticalDebtPaymentEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 133
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 60
    Width = 485
    Height = 8
    Align = alTop
    BevelInner = bvSpace
    Color = clNavy
    TabOrder = 7
  end
  object Panel3: TPanel
    Left = 0
    Top = 248
    Width = 485
    Height = 60
    Align = alTop
    TabOrder = 4
    object GroupBox2: TGroupBox
      Left = 50
      Top = 1
      Width = 151
      Height = 58
      Align = alLeft
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 2
        Top = 15
        Width = 147
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Ёежикмиш Ѕорж % ўесаб є'
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
        Left = 3
        Top = 34
        Width = 143
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModPayments.DataSrcOInterestAccData
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 49
      Height = 58
      Align = alLeft
      TabOrder = 1
      object StaticText3: TStaticText
        Left = 2
        Top = 15
        Width = 45
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      $'
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
        Left = 3
        Top = 34
        Width = 42
        Height = 21
        TabStop = False
        DataField = 'CLIENTCURRENCY'
        DataSource = DataModPayments.DataSrcOInterestAccData
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 201
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText5: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Ёежикдирилмиш Ѕорж цзр€ %'
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
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'OVERDUEINTERESTDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 341
      Top = 1
      Width = 142
      Height = 58
      Align = alLeft
      TabOrder = 3
      object StaticText8: TStaticText
        Left = 2
        Top = 15
        Width = 138
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '       ёд€нил€н ћ€бл€ь'
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
      object OverdueInterestDebtPaymentEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 134
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 188
    Width = 485
    Height = 60
    Align = alTop
    TabOrder = 3
    object GroupBox9: TGroupBox
      Left = 50
      Top = 1
      Width = 151
      Height = 58
      Align = alLeft
      TabOrder = 0
      object StaticText9: TStaticText
        Left = 2
        Top = 15
        Width = 147
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Ёежикмиш Ѕорж ўесаб є'
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
        Left = 3
        Top = 34
        Width = 143
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModPayments.DataSrcOverdueAccData
        TabOrder = 1
      end
    end
    object GroupBox10: TGroupBox
      Left = 1
      Top = 1
      Width = 49
      Height = 58
      Align = alLeft
      TabOrder = 1
      object StaticText10: TStaticText
        Left = 2
        Top = 15
        Width = 45
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      $'
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
        Left = 3
        Top = 34
        Width = 42
        Height = 21
        TabStop = False
        DataField = 'CLIENTCURRENCY'
        DataSource = DataModPayments.DataSrcOverdueAccData
        TabOrder = 1
      end
    end
    object GroupBox11: TGroupBox
      Left = 201
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText11: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      Ёежикдирилмиш Ѕорж'
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
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'OVERDUEDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox12: TGroupBox
      Left = 341
      Top = 1
      Width = 142
      Height = 58
      Align = alLeft
      TabOrder = 3
      object StaticText12: TStaticText
        Left = 2
        Top = 15
        Width = 138
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '       ёд€нил€н ћ€бл€ь'
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
      object OverdueDebtPaymentEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 133
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 128
    Width = 485
    Height = 60
    Align = alTop
    TabOrder = 2
    object GroupBox13: TGroupBox
      Left = 50
      Top = 1
      Width = 151
      Height = 58
      Align = alLeft
      TabOrder = 0
      object StaticText13: TStaticText
        Left = 2
        Top = 15
        Width = 147
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '   ясас боржун %  ўесаб є'
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
      object DBEdit11: TDBEdit
        Left = 3
        Top = 34
        Width = 143
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModPayments.DataSrcInterestAccData
        TabOrder = 1
      end
    end
    object GroupBox14: TGroupBox
      Left = 1
      Top = 1
      Width = 49
      Height = 58
      Align = alLeft
      TabOrder = 1
      object StaticText14: TStaticText
        Left = 2
        Top = 15
        Width = 45
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '      $'
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
      object DBEdit12: TDBEdit
        Left = 3
        Top = 34
        Width = 42
        Height = 21
        TabStop = False
        DataField = 'CLIENTCURRENCY'
        DataSource = DataModPayments.DataSrcInterestAccData
        TabOrder = 1
      end
    end
    object GroupBox15: TGroupBox
      Left = 201
      Top = 1
      Width = 140
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText15: TStaticText
        Left = 2
        Top = 15
        Width = 136
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '       ясас борждан % '
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
      object DBEdit13: TDBEdit
        Left = 3
        Top = 34
        Width = 133
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'FACTICALINTERESTDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object GroupBox16: TGroupBox
      Left = 341
      Top = 1
      Width = 142
      Height = 58
      Align = alLeft
      TabOrder = 3
      object StaticText16: TStaticText
        Left = 2
        Top = 15
        Width = 138
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '       ёд€нил€н ћ€бл€ь'
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
      object FacticalInterestDebtPaymentEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 134
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object GroupBox21: TGroupBox
    Left = 0
    Top = 308
    Width = 293
    Height = 82
    Align = alLeft
    Caption = 'ћцшт€ри ўесабынын √алыьы'
    TabOrder = 5
    object Label1: TLabel
      Left = 6
      Top = 13
      Width = 47
      Height = 13
      Caption = '¬алйутада'
    end
    object Label2: TLabel
      Left = 146
      Top = 13
      Width = 84
      Height = 13
      Caption = 'ћанат еквиваленти'
    end
    object DBEdit14: TDBEdit
      Left = 8
      Top = 28
      Width = 133
      Height = 21
      TabStop = False
      DataField = 'OSTAT'
      DataSource = DataModPayments.DataSrcRests
      TabOrder = 0
    end
    object DBEdit15: TDBEdit
      Left = 147
      Top = 28
      Width = 138
      Height = 21
      TabStop = False
      DataField = 'POK_OSTAT'
      DataSource = DataModPayments.DataSrcRests
      TabOrder = 1
    end
    object CBUseTransaction: TCheckBox
      Left = 8
      Top = 57
      Width = 126
      Height = 17
      Caption = 'ям€лиййатлар апарылсы'
      TabOrder = 2
    end
  end
  object Panel7: TPanel
    Left = 296
    Top = 354
    Width = 189
    Height = 36
    TabOrder = 6
    object BtnApplyPayment: TButton
      Left = 12
      Top = 6
      Width = 75
      Height = 25
      Caption = '&√€бул'
      TabOrder = 0
      OnClick = BtnApplyPaymentClick
    end
    object BtnClose: TButton
      Left = 106
      Top = 6
      Width = 74
      Height = 25
      Caption = '»мтина'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
