object Constraction: TConstraction
  Left = 192
  Top = 107
  Width = 592
  Height = 438
  Caption = 'Blank'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ConstructionPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 585
    Height = 401
    ActivePage = SECTION1
    TabOrder = 0
    OnChange = ConstructionPageControlChange
    object SECTION1: TTabSheet
      Caption = '—€щиф€1'
      object DatailsGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 577
        Height = 373
        Align = alClient
        Caption = '—ыьорта ≈тдир€н ўаггында ћ€лумат'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 68
          Height = 13
          Caption = '—ыьорта етдир€н'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 52
          Width = 68
          Height = 13
          Caption = '‘айда эютцр€н'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 74
          Width = 115
          Height = 13
          Caption = '»ш ф€алийй€тинин там т€свири'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 100
          Width = 175
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = '—ыьорталанажаг  €млакын йерл€шдийи йер'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 128
          Width = 81
          Height = 13
          Caption = '‘€алийй€т мцдд€ти'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 148
          Width = 325
          Height = 13
          Caption = 
            'явв€лки в€ йа щазырки —ыьортачы в€ гцвв€д€ олан сыьортанын битм€' +
            ' тарихи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 169
          Width = 238
          Height = 13
          Caption = '—он цч ил €рзинд€ олан з€р€рл€р(тарихи,с€б€би,м€бл€ьи)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 193
          Width = 555
          Height = 13
          Caption = 
            '—из€ щ€р щансы сыьортанын йенил€нм€синд€ имтина едилибми в€ сыьо' +
            'рта мцгавил€синин йенил€нм€синд€ €лав€ ш€рт гойулубму?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 242
          Width = 468
          Height = 13
          Caption = 
            '÷чцнжц ш€хсл€р гаршысында мцлки м€сулийй€т цчцн сыьорта т€минаты' +
            ' т€л€б олунурму?(айрыжа €риз€-анкет)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 273
          Width = 453
          Height = 13
          Caption = 
            '—изин риск€ т€сир ед€ бил€ж€к в€ —ыьортачы цчцн мцщцм олан щ€р щ' +
            'ансы башга м€луматыныз вардырмы?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 324
          Width = 76
          Height = 13
          Caption = '—ыьорта мцдд€ти:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbBeginDate: TLabel
          Left = 120
          Top = 300
          Width = 73
          Height = 13
          Caption = 'Ѕашланма тарихи:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbEndDate: TLabel
          Left = 294
          Top = 300
          Width = 53
          Height = 13
          Caption = 'Ѕитм€ тарихи:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Shape1: TShape
          Left = 240
          Top = 328
          Width = 40
          Height = 1
        end
        object FulDescrip: TDBEdit
          Left = 248
          Top = 72
          Width = 325
          Height = 21
          DataField = 'FULLDESCRIPTION'
          DataSource = ConstructionData
          TabOrder = 2
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object Location: TDBEdit
          Left = 248
          Top = 96
          Width = 325
          Height = 21
          DataField = 'LOCATIONOBJ'
          DataSource = ConstructionData
          TabOrder = 3
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object YearsInBus: TDBEdit
          Left = 248
          Top = 120
          Width = 325
          Height = 21
          DataField = 'YEARSINBUSINESS'
          DataSource = ConstructionData
          TabOrder = 4
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object InsLookupComboBox: TDBLookupComboBox
          Left = 248
          Top = 18
          Width = 325
          Height = 21
          DataField = 'KLI_ID'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = CustomersData
          ParentFont = False
          TabOrder = 0
          OnClick = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 248
          Top = 46
          Width = 325
          Height = 21
          DataField = 'PROFITID'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BeneficiarySource
          ParentFont = False
          TabOrder = 1
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object ExpirityDateTimePicker: TDateTimePicker
          Left = 428
          Top = 144
          Width = 145
          Height = 21
          CalAlignment = dtaLeft
          Date = 39040.4507720718
          Time = 39040.4507720718
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 5
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 248
          Top = 168
          Width = 324
          Height = 21
          DataField = 'LOSSHISTORY'
          DataSource = ConstructionData
          TabOrder = 6
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 209
          Width = 563
          Height = 21
          Color = clInfoBk
          DataField = 'RENEWAL'
          DataSource = ConstructionData
          TabOrder = 7
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox12: TDBComboBox
          Left = 492
          Top = 240
          Width = 81
          Height = 21
          DataField = 'THIRDPARTY'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 8
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox13: TDBComboBox
          Left = 492
          Top = 270
          Width = 81
          Height = 21
          DataField = 'OTHERINF'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 9
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object edBeginDate: TDateTimePicker
          Left = 120
          Top = 320
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 39026.6719352199
          Time = 39026.6719352199
          DateFormat = dfShort
          DateMode = dmComboBox
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Kind = dtkDate
          ParseInput = False
          ParentFont = False
          TabOrder = 10
          OnChange = edBeginDateChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object edEndDate: TDateTimePicker
          Left = 293
          Top = 320
          Width = 108
          Height = 21
          CalAlignment = dtaLeft
          Date = 39026.6724766667
          Time = 39026.6724766667
          DateFormat = dfShort
          DateMode = dmComboBox
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Kind = dtkDate
          ParseInput = False
          ParentFont = False
          TabOrder = 11
          OnChange = edBeginDateChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object MonthEdit: TEdit
          Left = 416
          Top = 320
          Width = 45
          Height = 21
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Text = 'MonthEdit'
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
    object SECTION23: TTabSheet
      Caption = '—€щиф€2'
      ImageIndex = 1
      object SecurityGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 577
        Height = 373
        Align = alClient
        Caption = 'ћцщафиз€ ўаггында ћ€лумат'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label25: TLabel
          Left = 8
          Top = 16
          Width = 207
          Height = 13
          Caption = 'ямлак ш€щ€рин тижар€т м€рк€зинд€ йерл€ширми?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 8
          Top = 40
          Width = 118
          Height = 13
          Caption = 'Ѕина мцщафиз€ олунурму?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 120
          Top = 60
          Width = 106
          Height = 13
          Caption = 'ќлунурса, д€гигл€шдирин'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 8
          Top = 80
          Width = 128
          Height = 13
          Caption = 'Ѕинада сигнализасийа вармы?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 8
          Top = 100
          Width = 278
          Height = 13
          Caption = 'Ѕцтцн харижи гапы/п€нж€р€л€рд€ ашаьыда эюст€рил€нл€р вармы?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 8
          Top = 124
          Width = 47
          Height = 13
          Caption = 'јди килидл€р'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 148
          Width = 84
          Height = 13
          Caption = '“€щлцк€сизлик килиди'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 8
          Top = 172
          Width = 57
          Height = 13
          Caption = 'Ѕармаглыглар'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 192
          Width = 375
          Height = 13
          Caption = 
            'Ѕинада щал-щазырда олан сейф,йаньын сюндцр€нл€р в€ с. бу кими мц' +
            'щафиз€ васит€л€ри'
        end
        object Label35: TLabel
          Left = 8
          Top = 208
          Width = 358
          Height = 13
          Caption = 
            'щагда м€лумат.ян йахын полис в€ йаньынсюндцрм€ идар€л€рин€ т€хми' +
            'ни м€саф€'
        end
        object Label36: TLabel
          Left = 8
          Top = 272
          Width = 278
          Height = 13
          Caption = 
            'ўалщазырда бинада т€мир,тикинти в€ йа т€щлцк€ли ишл€р апарылырмы' +
            '?'
        end
        object Label37: TLabel
          Left = 8
          Top = 296
          Width = 131
          Height = 13
          Caption = 'яэ€р апарылырса, д€гигл€шдирин'
        end
        object Label38: TLabel
          Left = 8
          Top = 324
          Width = 206
          Height = 13
          Caption = 'Ѕина исидилирми?яэ€р исидилирс€, щансы васит€ ил€?'
        end
        object ESpecify: TDBEdit
          Left = 144
          Top = 296
          Width = 233
          Height = 21
          DataField = 'REPAIR'
          DataSource = ConstructionData
          TabOrder = 8
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object EHeat: TDBEdit
          Left = 224
          Top = 320
          Width = 153
          Height = 21
          DataField = 'HEATED'
          DataSource = ConstructionData
          TabOrder = 9
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox2: TDBComboBox
          Left = 296
          Top = 20
          Width = 81
          Height = 21
          DataField = 'SITUETED'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 0
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox3: TDBComboBox
          Left = 296
          Top = 48
          Width = 81
          Height = 21
          DataField = 'GUARD'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 1
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox4: TDBComboBox
          Left = 296
          Top = 80
          Width = 81
          Height = 21
          DataField = 'ALARM'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 2
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox6: TDBComboBox
          Left = 296
          Top = 120
          Width = 81
          Height = 21
          DataField = 'LOCKS'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 3
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox7: TDBComboBox
          Left = 296
          Top = 144
          Width = 81
          Height = 21
          DataField = 'SECURITYLOCKS'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 4
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox8: TDBComboBox
          Left = 296
          Top = 168
          Width = 81
          Height = 21
          DataField = 'BARS'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 5
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox9: TDBComboBox
          Left = 296
          Top = 272
          Width = 81
          Height = 21
          DataField = 'REPAIR'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          TabOrder = 7
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBMemo1: TDBMemo
          Left = 8
          Top = 224
          Width = 369
          Height = 41
          Color = clInfoBk
          DataField = 'SETTINGS'
          DataSource = ConstructionData
          TabOrder = 6
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
    object SECTION4: TTabSheet
      Caption = '—€щиф€3'
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 0
        Top = 53
        Width = 577
        Height = 320
        Align = alClient
        Caption = 'Ѕина ўаггында ћ€лумат'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label11: TLabel
          Left = 8
          Top = 20
          Width = 41
          Height = 13
          Caption = '“икилдийи ил'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 8
          Top = 44
          Width = 79
          Height = 13
          Caption = 'ћ€рт€б€л€рин сайы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 8
          Top = 68
          Width = 85
          Height = 13
          Caption = 'ƒиварларын материалы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 8
          Top = 90
          Width = 80
          Height = 13
          Caption = '“аванын материалы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 8
          Top = 120
          Width = 78
          Height = 13
          Caption = 'ёртцйцн материалы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 8
          Top = 142
          Width = 124
          Height = 13
          Caption = '“€хмини цмуми сащ€(кв.м)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label69: TLabel
          Left = 8
          Top = 164
          Width = 156
          Height = 13
          Caption = 'яриз€чи т€р€финд€н истифад€ олунан '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label70: TLabel
          Left = 8
          Top = 176
          Width = 153
          Height = 13
          Caption = 'в€ йа онун йерл€шдийи сащ€(кв.м)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label71: TLabel
          Left = 8
          Top = 196
          Width = 158
          Height = 13
          Caption = 'Ѕинанын в€ структурунун з€лз€л€й€'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 8
          Top = 208
          Width = 142
          Height = 13
          Caption = 'давамлы олмасына даир м€лумат'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label73: TLabel
          Left = 8
          Top = 226
          Width = 146
          Height = 13
          Caption = 'Ѕина(лар)да сахланылан тез алышан'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label74: TLabel
          Left = 8
          Top = 238
          Width = 156
          Height = 13
          Caption = 'в€ т€щлцк€ли мадд€л€р(€э€р варса)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label75: TLabel
          Left = 8
          Top = 256
          Width = 149
          Height = 13
          Caption = 'ятрафдакы тикилил€рл€ баьлы м€лумат'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit3: TDBEdit
          Left = 248
          Top = 40
          Width = 325
          Height = 21
          DataField = 'FLOORSNUM'
          DataSource = ConstructionData
          TabOrder = 1
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 248
          Top = 64
          Width = 325
          Height = 21
          DataField = 'WALLSM'
          DataSource = ConstructionData
          TabOrder = 2
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit5: TDBEdit
          Left = 248
          Top = 88
          Width = 325
          Height = 21
          DataField = 'CEILINGSM'
          DataSource = ConstructionData
          TabOrder = 3
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit6: TDBEdit
          Left = 248
          Top = 114
          Width = 325
          Height = 21
          DataField = 'ROOFM'
          DataSource = ConstructionData
          TabOrder = 4
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit7: TDBEdit
          Left = 248
          Top = 136
          Width = 325
          Height = 21
          DataField = 'AREA'
          DataSource = ConstructionData
          TabOrder = 5
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit8: TDBEdit
          Left = 248
          Top = 160
          Width = 325
          Height = 21
          DataField = 'APPLICANTSPACE'
          DataSource = ConstructionData
          TabOrder = 6
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit9: TDBEdit
          Left = 248
          Top = 192
          Width = 325
          Height = 21
          DataField = 'EARTHQUAKEDETAILS'
          DataSource = ConstructionData
          TabOrder = 7
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit10: TDBEdit
          Left = 248
          Top = 224
          Width = 325
          Height = 21
          DataField = 'FLAMABLE'
          DataSource = ConstructionData
          TabOrder = 8
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit11: TDBEdit
          Left = 248
          Top = 248
          Width = 325
          Height = 21
          DataField = 'SURROINDINGDETAILS'
          DataSource = ConstructionData
          TabOrder = 9
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object ConstYearDateTimePicker: TDateTimePicker
          Left = 248
          Top = 16
          Width = 325
          Height = 21
          CalAlignment = dtaLeft
          Date = 39041.4651559838
          Time = 39041.4651559838
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 577
        Height = 53
        Align = alTop
        Caption = '÷муми м€лумат'
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 24
          Width = 125
          Height = 13
          Caption = 'Ѕина н€ кими истифад€ олунур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBComboBox1: TDBComboBox
          Left = 248
          Top = 16
          Width = 324
          Height = 21
          DataField = 'BUILDINGUSAGE'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            '…ашайыш йери кими'
            ' оммерсийа характерли (маьаза,мещманхана,в€ с.)'
            'Ѕирд€н артыг ижар€чи (ижар€чил€рин ады в€ онларын ф€алийй€ти)'
            'ќфис кими'
            'јнбар кими'
            '‘абрик кими')
          TabOrder = 0
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
    object SECTION5: TTabSheet
      Caption = '—€щиф€5'
      ImageIndex = 4
      object CoverGroupBox: TGroupBox
        Left = 0
        Top = 4
        Width = 265
        Height = 373
        Caption = '“€л€б ќлунан —ыьорта “€минаты'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label17: TLabel
          Left = 8
          Top = 40
          Width = 65
          Height = 13
          Caption = '—ыьорта рискл€ри'
        end
        object DBLookupComboBoxRisk: TDBLookupComboBox
          Left = 8
          Top = 56
          Width = 250
          Height = 21
          DataField = 'RISKID'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = RisksData
          ParentFont = False
          TabOrder = 0
          OnClick = PeriodOinsChange
        end
        object btRisksAdd: TBitBtn
          Left = 8
          Top = 88
          Width = 65
          Height = 20
          Caption = 'ƒиэ€р'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btRisksAddClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FF3333333333333447333333333333377FFF33333333333744473333333
            333337773FF3333333333444447333333333373F773FF3333333334444447333
            33333373F3773FF3333333744444447333333337F333773FF333333444444444
            733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
            999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
            33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
            333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
            33333777333333333333CC333333333333337733333333333333}
          Layout = blGlyphRight
          NumGlyphs = 2
        end
        object memRisk: TMemo
          Left = 8
          Top = 120
          Width = 250
          Height = 137
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 3
          OnChange = PeriodOinsChange
        end
        object cbRisks: TCheckBox
          Left = 88
          Top = 88
          Width = 79
          Height = 17
          Caption = '…адда сахла'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object LossOfProfitGroupBox: TGroupBox
        Left = 264
        Top = 4
        Width = 313
        Height = 181
        Caption = 'Ё€лир »ткисинин —ыьортасы'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label49: TLabel
          Left = 64
          Top = 17
          Width = 229
          Height = 13
          Caption = 'Ё€лир иткисини сыьорта етм€к ист€йирсинизс€,ашаьыдакы '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 64
          Top = 30
          Width = 183
          Height = 13
          Caption = 'суаллара  жаваб верм€йиниз хащиш олунур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 8
          Top = 49
          Width = 57
          Height = 13
          Caption = '»ллик дюврийй€'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 8
          Top = 73
          Width = 85
          Height = 13
          Caption = 'ям€к щаггларынын '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 8
          Top = 105
          Width = 53
          Height = 13
          Caption = '»жар€ щаггы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 8
          Top = 127
          Width = 89
          Height = 13
          Caption = '»шчил€рин цмуми сайы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 8
          Top = 145
          Width = 78
          Height = 13
          Caption = '“€минат мцдд€ти'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 8
          Top = 86
          Width = 83
          Height = 13
          Caption = 'иллик цмуми мигдары'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 8
          Top = 156
          Width = 137
          Height = 13
          Caption = '(ади т€минат мцдд€ти 12 айдыр)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ERent: TDBEdit
          Left = 158
          Top = 99
          Width = 153
          Height = 21
          DataField = 'RENT'
          DataSource = ConstructionData
          TabOrder = 2
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object EAnnual: TDBEdit
          Left = 158
          Top = 49
          Width = 153
          Height = 21
          DataField = 'ANNUAL'
          DataSource = ConstructionData
          TabOrder = 0
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object EWages: TDBEdit
          Left = 158
          Top = 73
          Width = 153
          Height = 21
          DataField = 'WAGES'
          DataSource = ConstructionData
          TabOrder = 1
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object EEmploy: TDBEdit
          Left = 158
          Top = 121
          Width = 153
          Height = 21
          DataField = 'EMPLOYES'
          DataSource = ConstructionData
          TabOrder = 3
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object EIndeminity: TDBEdit
          Left = 158
          Top = 145
          Width = 153
          Height = 21
          DataField = 'INDEMINITY'
          DataSource = ConstructionData
          TabOrder = 4
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 264
        Top = 180
        Width = 313
        Height = 197
        Caption = '—ыьорталанан ямлак'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label20: TLabel
          Left = 128
          Top = 8
          Width = 72
          Height = 13
          Caption = '—ыьорта м€бл€ьи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 8
          Top = 56
          Width = 50
          Height = 13
          Caption = '1. Ѕина(лар)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 8
          Top = 80
          Width = 101
          Height = 13
          Caption = '2. ћцщ€ндис гурьулары'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 104
          Width = 92
          Height = 13
          Caption = '3. ’арижи декорасийа'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 8
          Top = 126
          Width = 91
          Height = 13
          Caption = '4. ƒахили декорасийа'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 144
          Width = 142
          Height = 13
          Caption = '5. …аньын сюндцрм€ системл€ри '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 16
          Top = 157
          Width = 55
          Height = 13
          Caption = 'в€ гурьулары'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit17: TDBEdit
          Left = 160
          Top = 48
          Width = 150
          Height = 21
          DataField = 'BUILDINGS'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit18: TDBEdit
          Left = 160
          Top = 72
          Width = 150
          Height = 21
          DataField = 'ENGINEER'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit19: TDBEdit
          Left = 160
          Top = 96
          Width = 150
          Height = 21
          DataField = 'EXDECO'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit20: TDBEdit
          Left = 160
          Top = 120
          Width = 150
          Height = 21
          DataField = 'INDECO'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit21: TDBEdit
          Left = 160
          Top = 144
          Width = 150
          Height = 21
          DataField = 'FIRESYS'
          DataSource = ConstructionData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox5: TDBComboBox
          Left = 8
          Top = 24
          Width = 301
          Height = 21
          DataField = 'VALUETYPE'
          DataSource = ConstructionData
          ItemHeight = 13
          Items.Strings = (
            'яв€з етм€ д€й€ри'
            'Ѕаланс д€й€ри'
            'ў€гиги д€й€ри'
            'яв€з етм€ д€й€ри,Ѕаланс д€й€ри,ў€гиги д€й€ри'
            'яв€з етм€ д€й€ри,Ѕаланс д€й€ри'
            'яв€з етм€ д€й€ри,ў€гиги д€й€ри'
            'Ѕаланс д€й€ри,ў€гиги д€й€ри'
            ''
            ''
            ''
            '')
          TabOrder = 0
          OnChange = PeriodOinsChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 379
    Width = 584
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Back: TBitBtn
      Left = 170
      Top = 6
      Width = 79
      Height = 24
      Caption = 'явв€лки'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BackClick
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object Next: TBitBtn
      Left = 250
      Top = 6
      Width = 79
      Height = 24
      Caption = 'Ќювб€ти'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NextClick
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 486
      Top = 6
      Width = 81
      Height = 24
      Caption = '»мтина'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000CE0E0000D80E00000001000000000000000000008080
        8000000080000080800000800000808000008000000080008000408080004040
        0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
        FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
        80008000FF004080FF00C0DCC000F0CAA6000008000000000800000808000804
        00000800080008080800130E0800040314001008100010101000151414001311
        1F002525210018133F004E0C11004D1D0F00681C1000561D21006B1C21004A3B
        36005655560077141800741324008F0E2200940F30008818230084292300893C
        400011097E004C4B75005A6B6300666666005A73630065706D00736D6D007373
        73007878730073737B0077777B00945D670096706D007B7B7B00837B8100947B
        73009C7B730084847B008484840084848C0090878700948C8E00948C94008C94
        9400949494009C9494009C9C940094949C009C949C009C9C9C00A80F2300AD18
        2900A9083100A5143500AF102B00AD0C3900BC072B00C10D3600AD1E2900A82C
        2700AD183900A9293100BE1B2900BD183100C01F3100B2154200A9213900B121
        3D00B5214200AB2C3900A9294200A92F4600BB1B4000B5294200BD293900B929
        4600C7184200CC253E00C1254A00CF254E00AC3F3200AB3F4200AE354A00AD4A
        4200C1383D00C6314A00CE314A00BD394A00AD3D4F00BD355200AD475000BD42
        5200C8395100C1425A00CC3F5E00B3524200B5525300B54E5E00B85C5B00C654
        5000D95F5100F6624600B2606A00C15A6B00CC586500CC5D6F00B7848300DD7C
        6E00E89889000C08B5000D0DE1001010EF000000F7000808F7000D0DFC001B1B
        ED003A3AE2002222FB003939FF006E6ECD005656FF007777FF009494A5009C9C
        A500A59CA500A5A5A500ADA5A5009494AD00A5A5AD00ADA5AD00A5A7B500A0A0
        C6009B9BDB008C8CFF009494FF009C9CFF00A5A5FF00B5A5A500BDA5A500B5AD
        A500BDADA500ADADAD00B5ADAD00B5B5AD00B1ADB500C6A7AA00C9B1AE00D6B1
        A900EDB0A900FFAFA200FFB5AD00FFBDAD00B5B5B500BDB5B500BDBDB500ADAD
        BD00B9B5BD00B3B3DB00B1B1FF00C1B9B900BDBDC600CBBBBA00E5BBB700C6C6
        C600DABDC600C1C1D600BDBDFF00D6C6C600DEC6C600CEC6CE00D6C6CE00DEC6
        CE00CECECE00D6CECE00D6D6CE00D2CED600D6D6D600DECECE00DECED600DED6
        D600D6D6DE00DED6DE00F4C8BE00F0CFCB00FFD6C600E7CED600E7D6D600F1D3
        D600FFD6CE00DEDEDE00E7DED600E7E7D600EBD6DE00E7DEDE00FFD6D600FFDE
        D600D2D2EF00C6C6FF00CECEFF00D6D6FF00DEDEE700DEDEFF00E7DEE700E7E7
        E700E7E7FF00EFDEDE00EFE7E700EFE7EF00F7E7E700FFDEDE00FFE7DE00FFE7
        E700EFEFEF00EFEFFF00F7EFEF00F7EFF700FFEFE700FFEFEF000F0F01010F0F
        0F0F0F0F0F0F0F0F0F0F0F100202010F0F0F0F0F10010F0F0F0F0F1002020201
        0F0F0F100202010F0F0F0F1002020202010F1002020202010F0F0F0F10020202
        02010202020202010F0F0F0F0F100202020202020202010F0F0F0F0F0F0F1002
        0202020202010F0F0F0F0F0F0F0F0F0202020202010F0F0F0F0F0F0F0F0F0F10
        02020202010F0F0F0F0F0F0F0F0F100202020202010F0F0F0F0F0F0F0F100202
        0201020202010F0F0F0F0F0F10020202010F10020202010F0F0F0F0F10020201
        0F0F0F10020202010F0F0F0F0F10020F0F0F0F0F100202020F0F0F0F0F0F0F0F
        0F0F0F0F0F1002100F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F}
    end
    object Commit: TBitBtn
      Left = 406
      Top = 6
      Width = 79
      Height = 24
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = CommitClick
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888800000000008888803300008030888880330000803000888033000000303
        0888033333333303000803300000330303080308888803030308030888880303
        0308030888880003030803088888080303080000000000000308880308888808
        0308880000000000000888880308888808088888000000000008}
    end
    object Report: TBitBtn
      Left = 94
      Top = 6
      Width = 75
      Height = 24
      Caption = 'ўесабат'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ReportClick
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Suggest: TBitBtn
      Left = 11
      Top = 6
      Width = 82
      Height = 24
      Caption = '“€клифнам€'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = SuggestClick
      OnKeyPress = InsLookupComboBoxKeyPress
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888800000008888888888888888800000008888888888888888800000008800
        0000000000088000000088888228448118888000000088188228448118888000
        0000888882284481188880000000881882284481188880000000888882284481
        1888800000008818888844811888800000008888888844811888800000008818
        8888448888888000000088888888448888888000000088188888888888888000
        0000888888888888888880000000888888888888888880000000888888888888
        888880000000}
    end
    object btApply: TBitBtn
      Left = 330
      Top = 6
      Width = 75
      Height = 24
      Caption = 'Apply'
      DragCursor = crArrow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btApplyClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
  end
  object ODSRiskType: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_risk_types')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 172
    Top = 100
    object ODSRiskTypeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRiskTypeNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object ConstructionData: TDataSource
    DataSet = ODSConstruction
    Left = 108
    Top = 140
  end
  object CustomersData: TDataSource
    DataSet = ODSCustomers
    Left = 140
    Top = 140
  end
  object RiskTypeData: TDataSource
    DataSet = ODSRiskType
    Left = 172
    Top = 140
  end
  object Risks: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_risks idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 208
    Top = 101
    object RisksID: TFloatField
      FieldName = 'ID'
    end
    object RisksNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object RisksData: TDataSource
    DataSet = Risks
    Left = 208
    Top = 141
  end
  object PINS_CONSTRUCTION: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_CONSTRUCTION'
    ParameterMode = pmNamed
    Left = 208
    Top = 182
  end
  object ODSConstruction: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.*from ins_construction c where c.id=:id')
    Variables.Data = {
      0300000001000000030000003A494404000000080000000000000000C0564000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000002E000000020000004944010000000000060000004B4C495F49440100
      000000000F00000046554C4C4445534352495054494F4E0100000000000B0000
      004C4F434154494F4E4F424A0100000000000F0000005945415253494E425553
      494E4553530100000000000D0000004255494C44494E47555341474501000000
      000009000000434F4E53545945415201000000000009000000464C4F4F52534E
      554D0100000000000600000057414C4C534D010000000000090000004345494C
      494E47534D01000000000005000000524F4F464D010000000000040000004152
      45410100000000000E0000004150504C4943414E545350414345010000000000
      1100000045415254485155414B4544455441494C530100000000000800000046
      4C414D41424C4501000000000012000000535552524F494E44494E4744455441
      494C530100000000000800000053495455455445440100000000000500000047
      5541524401000000000005000000414C41524D010000000000050000004C4F43
      4B530100000000000D00000053454355524954594C4F434B5301000000000004
      00000042415253010000000000050000004F5448455201000000000008000000
      53455454494E4753010000000000060000005245504149520100000000000600
      0000484541544544010000000000060000005249534B49440100000000000600
      0000414E4E55414C010000000000050000005741474553010000000000040000
      0052454E5401000000000008000000454D504C4F594553010000000000080000
      0045585049524954590100000000000B0000004C4F5353484953544F52590100
      000000000700000052454E4557414C0100000000000A00000054484952445041
      525459010000000000080000004F54484552494E460100000000000A00000049
      4E44454D494E4954590100000000000900000056414C55455459504501000000
      0000090000004255494C44494E475301000000000008000000454E47494E4545
      520100000000000600000045584445434F01000000000006000000494E444543
      4F01000000000007000000464952455359530100000000000600000054595045
      49440100000000000800000050524F46495449440100000000000C000000434C
      4F53455F505245464958010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    OnNewRecord = ODSConstructionNewRecord
    Left = 108
    Top = 100
    object ODSConstructionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSConstructionKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSConstructionFULLDESCRIPTION: TStringField
      FieldName = 'FULLDESCRIPTION'
      Size = 1024
    end
    object ODSConstructionLOCATIONOBJ: TStringField
      FieldName = 'LOCATIONOBJ'
      Size = 1024
    end
    object ODSConstructionYEARSINBUSINESS: TStringField
      FieldName = 'YEARSINBUSINESS'
      Size = 32
    end
    object ODSConstructionBUILDINGUSAGE: TStringField
      FieldName = 'BUILDINGUSAGE'
      Size = 128
    end
    object ODSConstructionCONSTYEAR: TDateTimeField
      FieldName = 'CONSTYEAR'
    end
    object ODSConstructionFLOORSNUM: TIntegerField
      FieldName = 'FLOORSNUM'
    end
    object ODSConstructionWALLSM: TStringField
      FieldName = 'WALLSM'
      Size = 128
    end
    object ODSConstructionCEILINGSM: TStringField
      FieldName = 'CEILINGSM'
      Size = 128
    end
    object ODSConstructionROOFM: TStringField
      FieldName = 'ROOFM'
      Size = 128
    end
    object ODSConstructionAREA: TFloatField
      FieldName = 'AREA'
    end
    object ODSConstructionAPPLICANTSPACE: TFloatField
      FieldName = 'APPLICANTSPACE'
    end
    object ODSConstructionEARTHQUAKEDETAILS: TStringField
      FieldName = 'EARTHQUAKEDETAILS'
      Size = 128
    end
    object ODSConstructionFLAMABLE: TStringField
      FieldName = 'FLAMABLE'
      Size = 1024
    end
    object ODSConstructionSURROINDINGDETAILS: TStringField
      FieldName = 'SURROINDINGDETAILS'
      Size = 1024
    end
    object ODSConstructionSITUETED: TStringField
      FieldName = 'SITUETED'
      Size = 32
    end
    object ODSConstructionGUARD: TStringField
      FieldName = 'GUARD'
      Size = 32
    end
    object ODSConstructionALARM: TStringField
      FieldName = 'ALARM'
      Size = 32
    end
    object ODSConstructionLOCKS: TStringField
      FieldName = 'LOCKS'
      Size = 32
    end
    object ODSConstructionSECURITYLOCKS: TStringField
      FieldName = 'SECURITYLOCKS'
      Size = 32
    end
    object ODSConstructionBARS: TStringField
      FieldName = 'BARS'
      Size = 32
    end
    object ODSConstructionOTHER: TStringField
      FieldName = 'OTHER'
      Size = 128
    end
    object ODSConstructionSETTINGS: TStringField
      FieldName = 'SETTINGS'
      Size = 1024
    end
    object ODSConstructionREPAIR: TStringField
      FieldName = 'REPAIR'
      Size = 1024
    end
    object ODSConstructionHEATED: TStringField
      FieldName = 'HEATED'
      Size = 128
    end
    object ODSConstructionRISKID: TFloatField
      FieldName = 'RISKID'
    end
    object ODSConstructionANNUAL: TFloatField
      FieldName = 'ANNUAL'
    end
    object ODSConstructionWAGES: TFloatField
      FieldName = 'WAGES'
    end
    object ODSConstructionRENT: TFloatField
      FieldName = 'RENT'
    end
    object ODSConstructionEMPLOYES: TFloatField
      FieldName = 'EMPLOYES'
    end
    object ODSConstructionEXPIRITY: TDateTimeField
      FieldName = 'EXPIRITY'
    end
    object ODSConstructionLOSSHISTORY: TStringField
      FieldName = 'LOSSHISTORY'
      Size = 1024
    end
    object ODSConstructionRENEWAL: TStringField
      FieldName = 'RENEWAL'
      Size = 1024
    end
    object ODSConstructionTHIRDPARTY: TStringField
      FieldName = 'THIRDPARTY'
      Size = 32
    end
    object ODSConstructionOTHERINF: TStringField
      FieldName = 'OTHERINF'
      Size = 32
    end
    object ODSConstructionINDEMINITY: TStringField
      FieldName = 'INDEMINITY'
      Size = 10
    end
    object ODSConstructionVALUETYPE: TStringField
      FieldName = 'VALUETYPE'
      Size = 128
    end
    object ODSConstructionBUILDINGS: TFloatField
      FieldName = 'BUILDINGS'
    end
    object ODSConstructionENGINEER: TFloatField
      FieldName = 'ENGINEER'
    end
    object ODSConstructionEXDECO: TFloatField
      FieldName = 'EXDECO'
    end
    object ODSConstructionINDECO: TFloatField
      FieldName = 'INDECO'
    end
    object ODSConstructionFIRESYS: TFloatField
      FieldName = 'FIRESYS'
    end
    object ODSConstructionTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ODSConstructionPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
  end
  object ODSCustomers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax,c.contactperson,c.contactper' +
        'sonphone from ins_customers c')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000B0000004D4F42494C4550484F
      4E45010000000000030000004641580100000000000D000000434F4E54414354
      504552534F4E01000000000012000000434F4E54414354504552534F4E50484F
      4E45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 140
    Top = 100
    object ODSCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSCustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object ODSCustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSCustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object ODSCustomersCONTACTPERSON: TStringField
      FieldName = 'CONTACTPERSON'
      Size = 256
    end
    object ODSCustomersCONTACTPERSONPHONE: TStringField
      FieldName = 'CONTACTPERSONPHONE'
      Size = 32
    end
  end
  object PlgSuggest: TPlgModalContainer
    Left = 268
    Top = 140
  end
  object ODSConstructionR: TOracleDataSet
    SQL.Strings = (
      
        'select PINS_FullMotor.returnName(kli_id) as name,Pins_FullMotor.' +
        'returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(kli_' +
        'id) as phone,pins_fullmotor.returnFax(kli_id) as fax,c.*from ins' +
        '_construction c where c.id=:id'
      '')
    Variables.Data = {0300000001000000030000003A494403000000040000001500000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000032000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      000003000000464158010000000000060000004B4C495F49440100000000000F
      00000046554C4C4445534352495054494F4E0100000000000B0000004C4F4341
      54494F4E4F424A0100000000000F0000005945415253494E425553494E455353
      0100000000000D0000004255494C44494E475553414745010000000000090000
      00434F4E53545945415201000000000009000000464C4F4F52534E554D010000
      0000000600000057414C4C534D010000000000090000004345494C494E47534D
      01000000000005000000524F4F464D0100000000000400000041524541010000
      0000000E0000004150504C4943414E5453504143450100000000001100000045
      415254485155414B4544455441494C5301000000000008000000464C414D4142
      4C4501000000000012000000535552524F494E44494E4744455441494C530100
      0000000008000000534954554554454401000000000005000000475541524401
      000000000005000000414C41524D010000000000050000004C4F434B53010000
      0000000D00000053454355524954594C4F434B53010000000000040000004241
      5253010000000000050000004F54484552010000000000080000005345545449
      4E47530100000000000600000052455041495201000000000006000000484541
      544544010000000000060000005249534B494401000000000006000000414E4E
      55414C0100000000000500000057414745530100000000000400000052454E54
      01000000000008000000454D504C4F5945530100000000000800000045585049
      524954590100000000000B0000004C4F5353484953544F525901000000000007
      00000052454E4557414C0100000000000A000000544849524450415254590100
      00000000080000004F54484552494E460100000000000A000000494E44454D49
      4E4954590100000000000900000056414C554554595045010000000000090000
      004255494C44494E475301000000000008000000454E47494E45455201000000
      00000600000045584445434F01000000000006000000494E4445434F01000000
      0000070000004649524553595301000000000006000000545950454944010000
      0000000800000050524F46495449440100000000000C000000434C4F53455F50
      5245464958010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 308
    Top = 140
    object ODSConstructionRNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object ODSConstructionRADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object ODSConstructionRPHONE: TStringField
      FieldName = 'PHONE'
      Size = 4000
    end
    object ODSConstructionRFAX: TStringField
      FieldName = 'FAX'
      Size = 4000
    end
    object ODSConstructionRID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSConstructionRKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSConstructionRFULLDESCRIPTION: TStringField
      FieldName = 'FULLDESCRIPTION'
      Size = 1024
    end
    object ODSConstructionRLOCATIONOBJ: TStringField
      FieldName = 'LOCATIONOBJ'
      Size = 1024
    end
    object ODSConstructionRYEARSINBUSINESS: TStringField
      FieldName = 'YEARSINBUSINESS'
      Size = 32
    end
    object ODSConstructionRBUILDINGUSAGE: TStringField
      FieldName = 'BUILDINGUSAGE'
      Size = 128
    end
    object ODSConstructionRCONSTYEAR: TDateTimeField
      FieldName = 'CONSTYEAR'
    end
    object ODSConstructionRFLOORSNUM: TIntegerField
      FieldName = 'FLOORSNUM'
    end
    object ODSConstructionRWALLSM: TStringField
      FieldName = 'WALLSM'
      Size = 128
    end
    object ODSConstructionRCEILINGSM: TStringField
      FieldName = 'CEILINGSM'
      Size = 128
    end
    object ODSConstructionRROOFM: TStringField
      FieldName = 'ROOFM'
      Size = 128
    end
    object ODSConstructionRAREA: TFloatField
      FieldName = 'AREA'
    end
    object ODSConstructionRAPPLICANTSPACE: TFloatField
      FieldName = 'APPLICANTSPACE'
    end
    object ODSConstructionREARTHQUAKEDETAILS: TStringField
      FieldName = 'EARTHQUAKEDETAILS'
      Size = 128
    end
    object ODSConstructionRFLAMABLE: TStringField
      FieldName = 'FLAMABLE'
      Size = 1024
    end
    object ODSConstructionRSURROINDINGDETAILS: TStringField
      FieldName = 'SURROINDINGDETAILS'
      Size = 1024
    end
    object ODSConstructionRSITUETED: TStringField
      FieldName = 'SITUETED'
      Size = 32
    end
    object ODSConstructionRGUARD: TStringField
      FieldName = 'GUARD'
      Size = 32
    end
    object ODSConstructionRALARM: TStringField
      FieldName = 'ALARM'
      Size = 32
    end
    object ODSConstructionRLOCKS: TStringField
      FieldName = 'LOCKS'
      Size = 32
    end
    object ODSConstructionRSECURITYLOCKS: TStringField
      FieldName = 'SECURITYLOCKS'
      Size = 32
    end
    object ODSConstructionRBARS: TStringField
      FieldName = 'BARS'
      Size = 32
    end
    object ODSConstructionROTHER: TStringField
      FieldName = 'OTHER'
      Size = 128
    end
    object ODSConstructionRSETTINGS: TStringField
      FieldName = 'SETTINGS'
      Size = 1024
    end
    object ODSConstructionRREPAIR: TStringField
      FieldName = 'REPAIR'
      Size = 1024
    end
    object ODSConstructionRHEATED: TStringField
      FieldName = 'HEATED'
      Size = 128
    end
    object ODSConstructionRRISKID: TFloatField
      FieldName = 'RISKID'
    end
    object ODSConstructionRANNUAL: TFloatField
      FieldName = 'ANNUAL'
    end
    object ODSConstructionRWAGES: TFloatField
      FieldName = 'WAGES'
    end
    object ODSConstructionRRENT: TFloatField
      FieldName = 'RENT'
    end
    object ODSConstructionREMPLOYES: TFloatField
      FieldName = 'EMPLOYES'
    end
    object ODSConstructionREXPIRITY: TDateTimeField
      FieldName = 'EXPIRITY'
    end
    object ODSConstructionRLOSSHISTORY: TStringField
      FieldName = 'LOSSHISTORY'
      Size = 1024
    end
    object ODSConstructionRRENEWAL: TStringField
      FieldName = 'RENEWAL'
      Size = 1024
    end
    object ODSConstructionRTHIRDPARTY: TStringField
      FieldName = 'THIRDPARTY'
      Size = 32
    end
    object ODSConstructionROTHERINF: TStringField
      FieldName = 'OTHERINF'
      Size = 32
    end
    object ODSConstructionRINDEMINITY: TStringField
      FieldName = 'INDEMINITY'
      Size = 10
    end
    object ODSConstructionRVALUETYPE: TStringField
      FieldName = 'VALUETYPE'
      Size = 128
    end
    object ODSConstructionRBUILDINGS: TFloatField
      FieldName = 'BUILDINGS'
    end
    object ODSConstructionRENGINEER: TFloatField
      FieldName = 'ENGINEER'
    end
    object ODSConstructionREXDECO: TFloatField
      FieldName = 'EXDECO'
    end
    object ODSConstructionRINDECO: TFloatField
      FieldName = 'INDECO'
    end
    object ODSConstructionRFIRESYS: TFloatField
      FieldName = 'FIRESYS'
    end
    object ODSConstructionRTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ODSConstructionRPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
  end
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 396
    Top = 140
  end
  object DataSource1: TDataSource
    DataSet = ODSConstructionR
    Left = 340
    Top = 140
  end
  object ConstructionExporter: TINSWordExporter
    Left = 432
    Top = 142
  end
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 156
    Top = 56
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select ib.rowid,ib.* from ins_beneficiary ib')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 204
    Top = 56
    object ODSBeneficiaryID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBeneficiaryNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSBeneficiaryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object ODSBeneficiaryPHONE: TStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object ODSBeneficiaryBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 154
    Top = 186
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where blank_id = :blankid'
      'and type_id = 10')
    Variables.Data = {
      0300000001000000080000003A424C414E4B4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000002000000494401000000000007000000545950455F494401
      000000000008000000424C414E4B5F494401000000000007000000535547475F
      494401000000000009000000504F4C4943595F49440100000000000800000049
      4E535F444154450100000000000A000000424547494E5F444154450100000000
      0008000000454E445F444154450100000000000900000056414C5554455F4944
      01000000000007000000414D4D4F554E540100000000000C000000434C4F5345
      5F505245464958010000000000060000004B4C495F49440100000000000A0000
      004C4F414E4143435F49440100000000000A000000435552524143435F494401
      00000000000A000000504F4C4943595F4E554D010000000000}
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 176
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object ODSContractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object ODSContractsSUGG_ID: TFloatField
      FieldName = 'SUGG_ID'
    end
    object ODSContractsPOLICY_ID: TFloatField
      FieldName = 'POLICY_ID'
    end
    object ODSContractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object ODSContractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object ODSContractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object ODSContractsVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSContractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
      Required = True
    end
    object ODSContractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSContractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSContractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSContractsPOLICY_NUM: TStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 296
    Top = 205
  end
end
