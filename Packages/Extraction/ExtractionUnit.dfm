object ExtractionForm: TExtractionForm
  Left = 92
  Top = 13
  Width = 902
  Height = 478
  Caption = 'Extraction'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 451
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 473
      Height = 451
      Align = alLeft
      TabOrder = 0
      object Button1: TButton
        Left = 337
        Top = 401
        Width = 129
        Height = 25
        Caption = '√€бул'
        Default = True
        TabOrder = 0
        OnClick = Button1Click
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 162
        Width = 469
        Height = 59
        Align = alTop
        Caption = 'ћцшт€ри:'
        TabOrder = 1
        object EditCustomers: TEdit
          Left = 7
          Top = 21
          Width = 221
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EditBalancesKeyPress
        end
        object DBLookupCustomers: TDBLookupComboBox
          Left = 228
          Top = 21
          Width = 237
          Height = 21
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = ExtractionDataModule.DataCustomers
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 221
        Width = 469
        Height = 59
        Align = alTop
        Caption = 'Ѕаланс щесаблары:'
        TabOrder = 2
        object EditBalances: TEdit
          Left = 7
          Top = 21
          Width = 458
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EditBalancesKeyPress
        end
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = 280
        Width = 469
        Height = 59
        Align = alTop
        Caption = 'ўесаб нюмр€л€ри:'
        TabOrder = 3
        object EditAccNumber: TEdit
          Left = 7
          Top = 21
          Width = 458
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 469
        Height = 88
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object GroupBox3: TGroupBox
          Left = 228
          Top = 0
          Width = 241
          Height = 88
          Align = alClient
          Caption = 'Ѕаланс щесаблар планы :'
          TabOrder = 0
          object CBBalancePlane: TComboBox
            Left = 7
            Top = 20
            Width = 230
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 0
            Items.Strings = (
              'I     щесаб планы'
              'II    щесаб планы'
              'III   щесаб планы'
              'IV   щесаб планы')
          end
          object CheckBox1: TCheckBox
            Left = 7
            Top = 56
            Width = 228
            Height = 17
            Caption = '…алныз дюврийй€си олан щесаблар цзр€'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 228
          Height = 88
          Align = alLeft
          Caption = 'ѕериод'
          TabOrder = 1
          object DTPBeginDate: TDateTimePicker
            Left = 93
            Top = 20
            Width = 131
            Height = 21
            CalAlignment = dtaLeft
            Date = 38232.5331317708
            Time = 38232.5331317708
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object DTPEndDate: TDateTimePicker
            Left = 93
            Top = 54
            Width = 131
            Height = 21
            CalAlignment = dtaLeft
            Date = 38232.5331479977
            Time = 38232.5331479977
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
          object StaticText1: TStaticText
            Left = 7
            Top = 22
            Width = 82
            Height = 17
            Caption = 'Ѕашланьыж период'
            TabOrder = 2
          end
          object StaticText2: TStaticText
            Left = 7
            Top = 59
            Width = 55
            Height = 17
            Caption = '—он период'
            TabOrder = 3
          end
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 103
        Width = 469
        Height = 59
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 228
          Height = 59
          Align = alLeft
          Caption = '¬алйута сечими'
          TabOrder = 0
          object DBLookupCurrency: TDBLookupComboBox
            Left = 7
            Top = 21
            Width = 217
            Height = 21
            KeyField = 'VALUTE'
            ListField = 'VALU_NAME'
            ListSource = ExtractionDataModule.DataCurrency
            TabOrder = 0
          end
        end
        object GroupBox8: TGroupBox
          Left = 228
          Top = 0
          Width = 241
          Height = 59
          Align = alClient
          Caption = '‘илиал сечими'
          TabOrder = 1
          object DBLookupBranch: TDBLookupComboBox
            Left = 7
            Top = 21
            Width = 230
            Height = 21
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = ExtractionDataModule.DataBranch
            TabOrder = 0
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 339
        Width = 469
        Height = 59
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
        object RadioGroup1: TRadioGroup
          Left = 228
          Top = 0
          Width = 241
          Height = 59
          Align = alClient
          Caption = 'ям€лиййат типи'
          ItemIndex = 0
          Items.Strings = (
            ' урс ф€ргли'
            ' урс ф€ргсиз')
          TabOrder = 0
        end
        object RadioGroup2: TRadioGroup
          Left = 0
          Top = 0
          Width = 228
          Height = 59
          Align = alLeft
          Caption = '„ап формасы'
          ItemIndex = 0
          Items.Strings = (
            'Ѕир с€щиф€д€ ардыжыл'
            'јйры-айры с€щиф€л€рд€')
          TabOrder = 1
        end
      end
    end
    object Panel5: TPanel
      Left = 473
      Top = 0
      Width = 421
      Height = 451
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LogMemo: TMemo
        Left = 0
        Top = 201
        Width = 421
        Height = 250
        Align = alClient
        Color = clWindowFrame
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 201
        Width = 421
        Height = 250
        Align = alClient
        DataSource = ExtractionDataModule.DataSource2
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 421
        Height = 201
        Align = alTop
        DataSource = ExtractionDataModule.DataSource1
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
      end
    end
  end
end
