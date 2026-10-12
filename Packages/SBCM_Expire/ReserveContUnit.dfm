object FrmReserveCont: TFrmReserveCont
  Left = 235
  Top = 151
  Width = 489
  Height = 348
  Caption = 'Reserve '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 60
    Align = alTop
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
        Caption = '   Мцштяринин Щесаб №'
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
        Color = clSilver
        DataField = 'CLIENTACCNO'
        DataSource = DataModExpire.DataSrcClientAccData
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
        Width = 56
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CLIENTCURRENCY'
        DataSource = DataModExpire.DataSrcClientAccData
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 205
      Top = 1
      Width = 276
      Height = 58
      Align = alLeft
      TabOrder = 2
      object StaticText7: TStaticText
        Left = 2
        Top = 15
        Width = 272
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = '        Щесабын Ады'
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
        Width = 270
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CLIENTACCNAME'
        DataSource = DataModExpire.DataSrcClientAccData
        TabOrder = 1
      end
    end
  end
  object BtnApplyExpire: TButton
    Left = 305
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Гябул'
    TabOrder = 1
    OnClick = BtnApplyExpireClick
  end
  object BtnCancel: TButton
    Left = 393
    Top = 288
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Имтина'
    ModalResult = 2
    TabOrder = 2
  end
  object cbUseTransactions: TCheckBox
    Left = 2
    Top = 297
    Width = 159
    Height = 15
    Caption = 'Ямялиййат апарылсын'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbChangeSecondaryResreve: TCheckBox
    Left = 122
    Top = 268
    Width = 191
    Height = 17
    Caption = 'Эежикдирилмиш ещтиййат фаизи йенилянсин'
    TabOrder = 4
    OnClick = cbChangeSecondaryResreveClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 182
    Width = 481
    Height = 61
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 5
    object GroupBox8: TGroupBox
      Left = 307
      Top = 2
      Width = 172
      Height = 57
      Align = alRight
      TabOrder = 0
      object StaticText8: TStaticText
        Left = 2
        Top = 15
        Width = 168
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Эежикдирилмиш ещтиййат'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object ExpiredReserveEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 164
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
    object GroupBox10: TGroupBox
      Left = 2
      Top = 2
      Width = 303
      Height = 57
      Align = alLeft
      TabOrder = 1
      object StaticText10: TStaticText
        Left = 2
        Top = 15
        Width = 299
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Эежикдирилмиш ещтиййат щесаб №'
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
        Left = 3
        Top = 34
        Width = 134
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModExpire.DataSrcSReserveData
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 142
        Top = 34
        Width = 156
        Height = 21
        DataField = 'OVERDUEDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 2
      end
    end
  end
  object cbChangePrimaryResreve: TCheckBox
    Left = 122
    Top = 247
    Width = 171
    Height = 17
    Caption = 'Илкин ещтиййат фаизи йенилянсин'
    TabOrder = 6
    OnClick = cbChangePrimaryResreveClick
  end
  object Panel4: TPanel
    Left = 0
    Top = 60
    Width = 481
    Height = 61
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 7
    object GroupBox12: TGroupBox
      Left = 161
      Top = 2
      Width = 168
      Height = 57
      Align = alLeft
      TabOrder = 0
      object StaticText11: TStaticText
        Left = 2
        Top = 15
        Width = 164
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Эежикдирилмиш  Ещтиййат эюстярижиси'
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
        Width = 134
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'RELIABILITY'
        DataSource = DataModExpire.DataSrcExpiredReserve
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -5
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit11: TDBEdit
        Left = 138
        Top = 34
        Width = 26
        Height = 21
        DataField = 'PERCENT'
        DataSource = DataModExpire.DataSrcExpiredReserve
        TabOrder = 2
      end
    end
    object GroupBox14: TGroupBox
      Left = 2
      Top = 2
      Width = 159
      Height = 57
      Align = alLeft
      TabOrder = 1
      object StaticText13: TStaticText
        Left = 2
        Top = 15
        Width = 155
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Жари ещтиййат эюстярижиси'
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
        Width = 126
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'RELIABILITY'
        DataSource = DataModExpire.DataSrcMainReserve
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -5
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 129
        Top = 34
        Width = 26
        Height = 21
        DataField = 'PERCENT'
        DataSource = DataModExpire.DataSrcMainReserve
        TabOrder = 2
      end
    end
    object GroupBox6: TGroupBox
      Left = 329
      Top = 2
      Width = 152
      Height = 57
      Align = alLeft
      TabOrder = 2
      object StaticText6: TStaticText
        Left = 2
        Top = 15
        Width = 148
        Height = 17
        Align = alTop
        Alignment = taCenter
        BorderStyle = sbsSunken
        Caption = 'Йени ещтиййат % ляри'
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
      object CBReliabilityPercent: TDBViewComboBox
        Left = 4
        Top = 33
        Width = 70
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        ListSource = DataModExpire.DataSrcReliability
        ListFields = 'Percent'
        FieldInterval = 5
        DropDownOnEnter = False
        FirstAfterOpen = True
      end
      object CBOverdueReliabilityPercent: TDBViewComboBox
        Left = 77
        Top = 33
        Width = 68
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        ListSource = DataModExpire.DataSrcOverdueReserve
        ListFields = 'Percent'
        FieldInterval = 5
        DropDownOnEnter = False
        FirstAfterOpen = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 121
    Width = 481
    Height = 61
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 8
    object GroupBox2: TGroupBox
      Left = 307
      Top = 2
      Width = 172
      Height = 57
      Align = alRight
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 2
        Top = 15
        Width = 168
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Ади Ещтиййат'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object FacticalReserveEdit: TCurrencyEdit
        Left = 4
        Top = 33
        Width = 164
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 2
      Width = 303
      Height = 57
      Align = alLeft
      TabOrder = 1
      object StaticText3: TStaticText
        Left = 2
        Top = 15
        Width = 299
        Height = 17
        Align = alTop
        BorderStyle = sbsSunken
        Caption = 'Ади ещтиййат щесаб №'
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
        Width = 134
        Height = 21
        TabStop = False
        DataField = 'CLIENTACCNO'
        DataSource = DataModExpire.DataSrcPReserveData
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 142
        Top = 34
        Width = 156
        Height = 21
        DataField = 'FACTICALDEBT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 2
      end
    end
  end
end
