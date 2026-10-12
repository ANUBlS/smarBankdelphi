object FormUpdWares: TFormUpdWares
  Left = 300
  Top = 153
  BorderStyle = bsDialog
  Caption = 'FormUpdWares'
  ClientHeight = 375
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 375
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clNavy
    TabOrder = 0
    object GBoxPublic: TGroupBox
      Left = 2
      Top = 2
      Width = 317
      Height = 45
      Caption = 'Вясаитин ады '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Edit_Wares_Name: TEdit
        Left = 3
        Top = 20
        Width = 310
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = Edit_Wares_NameKeyPress
      end
    end
    object GroupBoxFXM: TGroupBox
      Left = 2
      Top = 48
      Width = 121
      Height = 41
      Caption = 'Файдалы хидмят мцддяти'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object CBoxFXM: TComboBox
        Left = 4
        Top = 15
        Width = 113
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
    end
    object GroupBoxSector: TGroupBox
      Left = 123
      Top = 48
      Width = 196
      Height = 41
      Caption = 'Сахланылдыьы бюлмя'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Edit_Keeping_Sec: TEdit
        Left = 4
        Top = 15
        Width = 188
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxInvDate: TGroupBox
      Left = 3
      Top = 89
      Width = 244
      Height = 42
      Caption = 'Дахилолма тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object DTP_Inv_Date: TDateTimePicker
        Left = 3
        Top = 16
        Width = 239
        Height = 21
        CalAlignment = dtaLeft
        Date = 38820.2391962963
        Time = 38820.2391962963
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBoxAmortDate: TGroupBox
      Left = 247
      Top = 89
      Width = 241
      Height = 42
      Caption = 'Амортизасийа тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object DTP_Amort_Date: TDateTimePicker
        Left = 3
        Top = 16
        Width = 234
        Height = 21
        CalAlignment = dtaLeft
        Date = 38820.2396656019
        Time = 38820.2396656019
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBoxNB: TGroupBox
      Left = 3
      Top = 133
      Width = 245
      Height = 197
      Caption = 'Милли Банк '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label_First_Price: TLabel
        Left = 6
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Илкин дяйяр'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_Balance_Price: TLabel
        Left = 6
        Top = 64
        Width = 53
        Height = 13
        Caption = 'Галыг дяйяр'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_All_Amort: TLabel
        Left = 6
        Top = 111
        Width = 94
        Height = 13
        Caption = 'Йыьылмыш амортизасийа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_Amort: TLabel
        Left = 6
        Top = 156
        Width = 82
        Height = 13
        Caption = 'Айлыг амортизасийа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit_First_Price: TEdit
        Left = 3
        Top = 34
        Width = 239
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Balance_Price: TEdit
        Left = 3
        Top = 82
        Width = 238
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = Edit_Balance_PriceChange
      end
      object Edit_All_Amort: TEdit
        Left = 2
        Top = 128
        Width = 239
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = Edit_All_AmortChange
      end
      object Edit_Amort: TEdit
        Left = 2
        Top = 173
        Width = 239
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '0'
      end
    end
    object GroupBoxNL: TGroupBox
      Left = 249
      Top = 133
      Width = 239
      Height = 197
      Caption = 'Верэи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label_Tax_First_Price: TLabel
        Left = 6
        Top = 17
        Width = 112
        Height = 13
        Caption = 'Илин яввялиня галыг дяйяри'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label_Tax_Balance_Price: TLabel
        Left = 7
        Top = 66
        Width = 53
        Height = 13
        Caption = 'Галыг дяйяр'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelTax_All_Amort: TLabel
        Left = 6
        Top = 112
        Width = 94
        Height = 13
        Caption = 'Йыьылмыш амортизасийа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelTax_Amort: TLabel
        Left = 6
        Top = 158
        Width = 82
        Height = 13
        Caption = 'Айлыг амортизасийа'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit_Tax_First_Price: TEdit
        Left = 3
        Top = 34
        Width = 232
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit_Tax_Balance_Price: TEdit
        Left = 3
        Top = 81
        Width = 232
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Edit_Tax_All_Amort: TEdit
        Left = 3
        Top = 128
        Width = 232
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Edit_Tax_Amort: TEdit
        Left = 3
        Top = 173
        Width = 232
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '0'
      end
    end
    object BtnOk: TBitBtn
      Left = 413
      Top = 332
      Width = 74
      Height = 41
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BtnOkClick
      Kind = bkOK
    end
    object GroupBoxInv_No: TGroupBox
      Left = 323
      Top = 48
      Width = 165
      Height = 41
      Caption = 'Inventar №'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Edit_Inv_No: TEdit
        Left = 5
        Top = 15
        Width = 155
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 323
      Top = 2
      Width = 164
      Height = 45
      Caption = 'Истифадячи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object Edit_User: TEdit
        Left = 4
        Top = 20
        Width = 156
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object NLSLocalizer: TNLSLocalizer
    Caption = 'Вясаитин редактя едилмяси'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 408
    Top = 152
  end
end
