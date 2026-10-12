object PortMainForm: TPortMainForm
  Left = 240
  Top = 213
  Width = 667
  Height = 169
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 101
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 368
      Top = 2
      Width = 183
      Height = 97
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 2
        Top = 49
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Боржаланын катеэорийасы'
        TabOrder = 0
        object DBLookupComboboxEhCategories: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'CUSTOMERTYPE'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = PortDatMod.CategoryDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckBoxCategorires: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 2
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Боржаланын типи'
        TabOrder = 1
        object DBLookupComboboxEhPersons: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'PERSONALTYPE'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = PortDatMod.PersonsDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckboxPersons: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 185
      Top = 2
      Width = 183
      Height = 97
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 2
        Top = 49
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Kreditin tipi'
        TabOrder = 0
        object DBLookupComboboxEhCreditType: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'CREDITTYPE'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = PortDatMod.CrdTypeDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckboxCreditType: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 2
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Истифадячи эрупу'
        TabOrder = 1
        object DBLookupComboboxEhUserGroup: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'USRGROUP'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = PortDatMod.UsGrDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckboxUserGroup: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 183
      Height = 97
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 2
      object GroupBox5: TGroupBox
        Left = 2
        Top = 49
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Филиал'
        TabOrder = 0
        object DBLookupComboboxEhFilial: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'BRANCHID'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = PortDatMod.FilialDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckboxFilial: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = 2
        Width = 179
        Height = 47
        Align = alTop
        Caption = 'Валйута'
        TabOrder = 1
        object DBLookupComboboxValute: TDBLookupComboboxEh
          Left = 5
          Top = 16
          Width = 143
          Height = 21
          DataField = 'CURRENCY'
          DataSource = PortDatMod.CrdDatSrc
          EditButtons = <>
          KeyField = 'VALUTE'
          ListField = 'VAL_NAME'
          ListSource = PortDatMod.AvaluteDatSrc
          TabOrder = 0
          Visible = True
        end
        object CheckboxValute: TCheckBox
          Left = 154
          Top = 17
          Width = 15
          Height = 17
          TabOrder = 1
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 551
      Top = 2
      Width = 106
      Height = 97
      Align = alClient
      Caption = 'Tarix'
      TabOrder = 3
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 35
        Width = 82
        Height = 21
        CalAlignment = dtaLeft
        Date = 38514.7628701852
        Time = 38514.7628701852
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 458
    Top = 106
    Width = 85
    Height = 29
    Caption = 'Гябул'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 565
    Top = 106
    Width = 85
    Height = 29
    Caption = 'Имтина'
    TabOrder = 2
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 16
    Top = 160
  end
end
