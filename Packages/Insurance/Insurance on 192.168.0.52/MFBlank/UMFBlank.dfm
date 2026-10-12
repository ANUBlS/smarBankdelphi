object MFBlank: TMFBlank
  Left = 192
  Top = 107
  Width = 609
  Height = 292
  Caption = 'Blank'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MotorAppPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 233
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnChange = MotorAppPageControlChange
    object TabSheet1: TTabSheet
      Caption = 'Сящифя1'
      ParentShowHint = False
      ShowHint = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 205
        Align = alClient
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 68
          Height = 13
          Caption = 'Сыьорта етдирян'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 46
          Width = 52
          Height = 13
          Caption = 'Мясул шяхс'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 70
          Width = 74
          Height = 13
          Caption = 'Банк реквизитляри'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 96
          Width = 65
          Height = 13
          Caption = 'Файдаэютцрян'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 116
          Width = 28
          Height = 13
          Caption = 'Аэент'
        end
        object Label7: TLabel
          Left = 8
          Top = 141
          Width = 88
          Height = 13
          Caption = 'Сигнализасийа вармы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 208
          Top = 144
          Width = 133
          Height = 13
          Caption = 'Автомобилин истифадя характери'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 160
          Width = 93
          Height = 13
          Caption = 'Диэярляри (гейд един)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 208
          Top = 176
          Width = 76
          Height = 13
          Caption = 'Сыьорта мцддяти:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbBeginDate: TLabel
          Left = 296
          Top = 160
          Width = 73
          Height = 13
          Caption = 'Башланма тарихи:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbEndDate: TLabel
          Left = 406
          Top = 160
          Width = 53
          Height = 13
          Caption = 'Битмя тарихи:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEditBanking: TDBEdit
          Left = 208
          Top = 64
          Width = 385
          Height = 21
          DataField = 'BANKING_DETAILS'
          DataSource = Ins_MotorFullData
          TabOrder = 1
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object InsLookupComboBox: TDBLookupComboBox
          Left = 208
          Top = 16
          Width = 385
          Height = 21
          DataField = 'KLI_ID'
          DataSource = Ins_MotorFullData
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
          OnClick = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object lbBookmarks: TListBox
          Left = 64
          Top = 112
          Width = 129
          Height = 25
          ItemHeight = 13
          Items.Strings = (
            'Insured'
            'Address'
            'Tel'
            'fax'
            'BankingD'
            'Model'
            'Type'
            'Plate'
            'Colour'
            'Year'
            'Seats'
            'Nmotor'
            'Nchassis'
            'Avalue'
            'Transmission'
            'Alarm'
            'Usage'
            'Splace'
            'Edamage'
            'Geo')
          TabOrder = 10
          Visible = False
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 207
          Top = 112
          Width = 385
          Height = 21
          DataField = 'BROKER'
          DataSource = Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = AgentsSource
          ParentFont = False
          TabOrder = 3
          OnClick = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 208
          Top = 88
          Width = 385
          Height = 21
          DataField = 'PROFITID'
          DataSource = Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BeneficiarySource
          ParentFont = False
          TabOrder = 2
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox2: TDBComboBox
          Left = 104
          Top = 139
          Width = 97
          Height = 21
          DataField = 'PRESENCE_ALARM'
          DataSource = Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'Бяли'
            'Хейр')
          ParentFont = False
          TabOrder = 4
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBComboBox1: TDBComboBox
          Left = 352
          Top = 136
          Width = 241
          Height = 21
          DataField = 'MOTOR_USAGE'
          DataSource = Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'Шяхси'
            'Ишэцзар : сцрцжц иля'
            'Ишэцзар : сцрцжцсцз'
            'Ижаря : сцрцжц иля'
            'Ижаря: сцрцжцсцз'
            'Ижтимаи няглиййат : такси'
            'Ижтимаи няглиййат : микроавтобус'
            'Ижтимаи няглиййат : автобус')
          ParentFont = False
          TabOrder = 5
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 176
          Width = 193
          Height = 21
          Color = clInfoBk
          DataField = 'MOTOR_USAGE'
          DataSource = Ins_MotorFullData
          TabOrder = 6
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object edBeginDate: TDateTimePicker
          Left = 296
          Top = 176
          Width = 92
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
          TabOrder = 7
          OnChange = edBeginDateChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object edEndDate: TDateTimePicker
          Left = 405
          Top = 176
          Width = 92
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
          TabOrder = 8
          OnChange = edBeginDateChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object CPLookupComboBox: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 385
          Height = 21
          DataField = 'KLI_ID'
          DataSource = Ins_MotorFullData
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'CONTACTPERSON'
          ListSource = CustomersData
          ParentFont = False
          TabOrder = 11
          OnClick = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object MonthEdit: TEdit
          Left = 504
          Top = 176
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
          TabOrder = 9
          Text = 'MonthEdit'
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Сящифя2'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 205
        Align = alClient
        Caption = 'Автоняглиййат Васитяси Щаггында Мялумат'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label8: TLabel
          Left = 8
          Top = 20
          Width = 78
          Height = 13
          Caption = 'Марка вя модели'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 40
          Width = 17
          Height = 13
          Caption = 'Типи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 8
          Top = 64
          Width = 55
          Height = 13
          Caption = 'Дювлят №-си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 84
          Width = 28
          Height = 13
          Caption = 'Рянэи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 110
          Width = 47
          Height = 13
          Caption = 'Бурахылыш или'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 134
          Width = 84
          Height = 13
          Caption = 'Отуражагларын сайы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 288
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Мцщяррикин №си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 288
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Шасси №си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 288
          Top = 64
          Width = 99
          Height = 13
          Caption = 'Щазырки дяйяри (АБШ$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 288
          Top = 84
          Width = 94
          Height = 13
          Caption = 'Сцрят гутусунун типи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 288
          Top = 110
          Width = 40
          Height = 13
          Caption = 'Бан №си'
        end
        object Label19: TLabel
          Left = 8
          Top = 152
          Width = 215
          Height = 13
          Caption = 'Автомобил истифадя олунмадыгда сахланылдыьы йер'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 288
          Top = 134
          Width = 88
          Height = 13
          Caption = 'Мювжуд олан зядя'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 288
          Top = 152
          Width = 158
          Height = 13
          Caption = 'Сыьорта тяминатынын жоьрафи ящатяси'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEditModel: TDBEdit
          Left = 120
          Top = 16
          Width = 150
          Height = 21
          DataField = 'INSUREDMODEL'
          DataSource = Ins_MotorFullData
          TabOrder = 0
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditType: TDBEdit
          Left = 120
          Top = 38
          Width = 150
          Height = 21
          DataField = 'INSUREDTYPE'
          DataSource = Ins_MotorFullData
          TabOrder = 1
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit1StateNum: TDBEdit
          Left = 120
          Top = 60
          Width = 150
          Height = 21
          DataField = 'INSUREDSTATENUM'
          DataSource = Ins_MotorFullData
          TabOrder = 2
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditColor: TDBEdit
          Left = 120
          Top = 82
          Width = 150
          Height = 21
          DataField = 'INSUREDCOLOR'
          DataSource = Ins_MotorFullData
          TabOrder = 3
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditOutputYear: TDBEdit
          Left = 120
          Top = 104
          Width = 150
          Height = 21
          DataField = 'INSUREDOUTPUTYEAR'
          DataSource = Ins_MotorFullData
          TabOrder = 4
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditSeatCount: TDBEdit
          Left = 120
          Top = 128
          Width = 150
          Height = 21
          DataField = 'INSUREDNUMSEATS'
          DataSource = Ins_MotorFullData
          TabOrder = 5
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditEnginNum: TDBEdit
          Left = 400
          Top = 16
          Width = 150
          Height = 21
          DataField = 'INSUREDENGINENUM'
          DataSource = Ins_MotorFullData
          TabOrder = 7
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditChassisNum: TDBEdit
          Left = 400
          Top = 38
          Width = 150
          Height = 21
          DataField = 'INSUREDCHASSISNUM'
          DataSource = Ins_MotorFullData
          TabOrder = 8
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditActualValue: TDBEdit
          Left = 400
          Top = 60
          Width = 150
          Height = 21
          DataField = 'INSUREDACTUALVALUE'
          DataSource = Ins_MotorFullData
          TabOrder = 9
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEditTransmission: TDBEdit
          Left = 400
          Top = 82
          Width = 150
          Height = 21
          DataField = 'TRANSMISSION_TYPE'
          DataSource = Ins_MotorFullData
          TabOrder = 10
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 400
          Top = 104
          Width = 150
          Height = 21
          DataField = 'INSUREDBODY'
          DataSource = Ins_MotorFullData
          TabOrder = 11
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit22: TDBEdit
          Left = 8
          Top = 168
          Width = 263
          Height = 21
          DataField = 'MOTORSTORAGEPLACE'
          DataSource = Ins_MotorFullData
          TabOrder = 6
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 400
          Top = 128
          Width = 151
          Height = 21
          DataField = 'EXISTINGDAMAGE'
          DataSource = Ins_MotorFullData
          TabOrder = 12
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 288
          Top = 168
          Width = 264
          Height = 21
          DataField = 'INSURANCEGEOGRAPHICALLIMIT'
          DataSource = Ins_MotorFullData
          TabOrder = 13
          OnChange = DBEditContactPersonChange
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Сящифя3'
      ImageIndex = 4
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 205
        Align = alClient
        Color = clMenu
        ParentColor = False
        TabOrder = 0
        object Label21: TLabel
          Left = 8
          Top = 8
          Width = 340
          Height = 13
          Caption = 
            'Аксессуарлар вя ялавя аваданлыглар (типи,маркасы,дяйяри вя гураш' +
            'дырылмаьы):'
        end
        object Label22: TLabel
          Left = 8
          Top = 104
          Width = 497
          Height = 13
          Caption = 
            'Яэяр автомобил бирдян чох сцрцжц тяряфиндян идаря едиляжякся,щяр' +
            ' бир сцрцжц щаггында мялумат (ады,сойады'
        end
        object Label23: TLabel
          Left = 8
          Top = 120
          Width = 175
          Height = 13
          Caption = ',атасынын ады,йашы,сцрцжцлцк тяжрцбяси)'
        end
        object DBNavigator1: TDBNavigator
          Left = 360
          Top = 12
          Width = 240
          Height = 18
          DataSource = AccesoriesData
          Hints.Strings = (
            'Биринжи'
            'Яввялки'
            'Сонракы'
            'Ахырынжы'
            'Ялавя'
            'Ляьв'
            'Редактя'
            'Тясдиг етмяк'
            'Имтина'
            'Йенилямяк')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object DBNavigator2: TDBNavigator
          Left = 360
          Top = 120
          Width = 240
          Height = 18
          DataSource = MoreThanOneData
          Hints.Strings = (
            'Биринжи'
            'Яввялки'
            'Сонракы'
            'Ахырынжы'
            'Ялавя'
            'Ляьв'
            'Редактя'
            'Тясдиг етмяк'
            'Имтина'
            'Йенилямяк')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object AccesoriesDBGrid: TDBGrid
          Left = 2
          Top = 36
          Width = 589
          Height = 61
          DataSource = AccesoriesData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyPress = InsLookupComboBoxKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'TYPE'
              Title.Caption = 'Типи'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAKE'
              Title.Caption = 'Маркасы'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALUE'
              Title.Caption = 'Дяйяри'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOWCREATED'
              PickList.Strings = (
                'Истещсалчы гурашдыран'
                'Сонрадан гурашдырылан')
              Title.Caption = 'Нежя гурашдырылыб'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 191
              Visible = True
            end>
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 140
          Width = 589
          Height = 65
          DataSource = MoreThanOneData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyPress = InsLookupComboBoxKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Ады'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SURNAME'
              Title.Caption = 'Сойады'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FATHERNAME'
              Title.Caption = 'Атасынын ады'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGE'
              Title.Caption = 'Йашы'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXPERIENCE'
              Title.Caption = 'Тяжрцбяси'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORY'
              Title.Caption = 'Щадисяляр щаггында мялумят'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 170
              Visible = True
            end>
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Сящифя4'
      ImageIndex = 5
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 205
        Align = alClient
        Caption = 'Тяляб Олунан Сыьорта Тяминатлары'
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label27: TLabel
          Left = 8
          Top = 24
          Width = 65
          Height = 13
          Caption = 'Тяминат нювц'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 152
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Тяляб олунур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 248
          Top = 24
          Width = 67
          Height = 13
          Caption = 'Тяляб олунмур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 352
          Top = 24
          Width = 72
          Height = 13
          Caption = 'Сыьорта мябляьи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 488
          Top = 24
          Width = 39
          Height = 13
          Caption = 'Франшиза'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 8
          Top = 48
          Width = 80
          Height = 13
          Caption = '1.Каско сыьортасы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 8
          Top = 72
          Width = 85
          Height = 13
          Caption = '2.Ялавя тяминатлар'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 8
          Top = 96
          Width = 135
          Height = 13
          Caption = '3.Цчцнжц шяхсляр гаршысында '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 8
          Top = 112
          Width = 89
          Height = 13
          Caption = 'мясулиййят сыьортасы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 8
          Top = 144
          Width = 115
          Height = 13
          Caption = '4.Сцрцжц вя сярнишинлярин'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 8
          Top = 160
          Width = 87
          Height = 13
          Caption = 'фярди гяза сыьортасы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 448
          Top = 120
          Width = 72
          Height = 13
          Caption = 'Сыьорта мябляьи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 352
          Top = 136
          Width = 61
          Height = 13
          Caption = 'Адам башына'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 488
          Top = 136
          Width = 59
          Height = 13
          Caption = 'Гяза башына'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit6: TDBEdit
          Left = 152
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 0
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit7: TDBEdit
          Left = 248
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 1
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit8: TDBEdit
          Left = 352
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 2
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit9: TDBEdit
          Left = 488
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 3
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit10: TDBEdit
          Left = 152
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 4
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit11: TDBEdit
          Left = 248
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 5
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit12: TDBEdit
          Left = 352
          Top = 70
          Width = 97
          Height = 21
          TabOrder = 6
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit13: TDBEdit
          Left = 488
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 7
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit14: TDBEdit
          Left = 152
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 8
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit15: TDBEdit
          Left = 248
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 9
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit16: TDBEdit
          Left = 352
          Top = 96
          Width = 97
          Height = 21
          TabOrder = 10
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit17: TDBEdit
          Left = 488
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 11
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit18: TDBEdit
          Left = 152
          Top = 152
          Width = 89
          Height = 21
          TabOrder = 12
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit19: TDBEdit
          Left = 248
          Top = 152
          Width = 89
          Height = 21
          TabOrder = 13
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit20: TDBEdit
          Left = 352
          Top = 152
          Width = 97
          Height = 21
          TabOrder = 14
          OnKeyPress = InsLookupComboBoxKeyPress
        end
        object DBEdit21: TDBEdit
          Left = 488
          Top = 152
          Width = 89
          Height = 21
          TabOrder = 15
          OnKeyPress = InsLookupComboBoxKeyPress
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 601
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Back: TBitBtn
      Left = 186
      Top = 4
      Width = 84
      Height = 24
      Caption = 'Яввялки'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BackClick
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
      Left = 271
      Top = 4
      Width = 84
      Height = 24
      Caption = 'Нювбяти'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NextClick
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
      Left = 507
      Top = 4
      Width = 75
      Height = 24
      Caption = 'Имтина'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
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
      Left = 432
      Top = 4
      Width = 74
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
      Left = 110
      Top = 4
      Width = 75
      Height = 24
      Caption = 'Щесабат'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ReportClick
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
      Left = 26
      Top = 4
      Width = 83
      Height = 24
      Caption = 'Тяклифнамя'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = SuggestClick
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
      Left = 356
      Top = 4
      Width = 75
      Height = 24
      Caption = 'Apply'
      Enabled = False
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
  object Ins_MotorFullData: TDataSource
    DataSet = Ins_MotorFull
    Left = 88
    Top = 24
  end
  object Ins_MotorFull: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select  im.rowid,im.* from ins_motorfull im ORDER BY  :title'
      '')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006B6C695F6964
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000060000004B4C495F49440100
      000000000E000000434F4E544143545F504552534F4E0100000000000F000000
      42414E4B494E475F44455441494C530100000000000C000000494E5355524544
      4D4F44454C0100000000000B000000494E535552454454595045010000000000
      0F000000494E535552454453544154454E554D0100000000000C000000494E53
      55524544434F4C4F5201000000000011000000494E53555245444F5554505554
      594541520100000000000F000000494E53555245444E554D5345415453010000
      00000010000000494E5355524544454E47494E454E554D010000000000110000
      00494E5355524544434841535349534E554D01000000000012000000494E5355
      52454441435455414C56414C5545010000000000110000005452414E534D4953
      53494F4E5F545950450100000000000E00000050524553454E43455F414C4152
      4D0100000000000B0000004D4F544F525F555341474501000000000011000000
      4D4F544F5253544F52414745504C4143450100000000000E0000004558495354
      494E4744414D4147450100000000001A000000494E535552414E434547454F47
      524150484943414C4C494D49540100000000000600000042524F4B4552010000
      0000000B000000494E5355524544424F44590100000000000600000054595045
      49440100000000000800000050524F46495449440100000000000C000000434C
      4F53455F505245464958010000000000}
    CountAllRecords = True
    OnApplyRecord = Ins_MotorFullApplyRecord
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 24
    object Ins_MotorFullID: TFloatField
      FieldName = 'ID'
    end
    object Ins_MotorFullKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object Ins_MotorFullBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_MotorFullINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object Ins_MotorFullINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object Ins_MotorFullINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_MotorFullINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_MotorFullINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_MotorFullTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_MotorFullPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_MotorFullMOTOR_USAGE: TStringField
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_MotorFullMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_MotorFullEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_MotorFullBROKER: TFloatField
      FieldName = 'BROKER'
    end
    object Ins_MotorFullINSUREDBODY: TStringField
      FieldName = 'INSUREDBODY'
      Size = 32
    end
    object Ins_MotorFullTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object Ins_MotorFullPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
  end
  object Accesories: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motor_accesories im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0064A34000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000005459504501000000
      0000040000004D414B450100000000000500000056414C55450100000000000A
      000000484F57435245415445440100000000000700000046554C4C5F49440100
      00000000}
    Master = Ins_MotorFull
    MasterFields = 'Id'
    DetailFields = 'full_id'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 200
    Top = 24
    object AccesoriesID: TFloatField
      FieldName = 'ID'
    end
    object AccesoriesTYPE: TStringField
      FieldName = 'TYPE'
      Size = 32
    end
    object AccesoriesMAKE: TStringField
      FieldName = 'MAKE'
      Size = 32
    end
    object AccesoriesVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object AccesoriesHOWCREATED: TStringField
      FieldName = 'HOWCREATED'
      Size = 32
    end
    object AccesoriesFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
  end
  object AccesoriesData: TDataSource
    DataSet = Accesories
    Left = 168
    Top = 24
  end
  object MoreThanOneData: TDataSource
    DataSet = MoreThanOne
    Left = 240
    Top = 24
  end
  object MoreThanOne: TOracleDataSet
    SQL.Strings = (
      'select im.rowid,im.* from INS_MOTORMORETHANONEDRIVER im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0064A34000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000020000004944010000000000040000004E414D4501000000
      0000070000005355524E414D450100000000000A0000004641544845524E414D
      45010000000000030000004147450100000000000A000000455850455249454E
      43450100000000000700000046554C4C5F494401000000000007000000484953
      544F5259010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 272
    Top = 24
    object MoreThanOneID: TFloatField
      FieldName = 'ID'
    end
    object MoreThanOneNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object MoreThanOneSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object MoreThanOneFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
    object MoreThanOneAGE: TIntegerField
      FieldName = 'AGE'
    end
    object MoreThanOneEXPERIENCE: TStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object MoreThanOneFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object MoreThanOneHISTORY: TStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 408
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax,c.contactperson from ins_cus' +
        'tomers c')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000004E414D4501000000
      00000B0000004D4F42494C4550484F4E45010000000000070000004144445245
      5353010000000000030000004641580100000000000D000000434F4E54414354
      504552534F4E010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 440
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object CustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object CustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object CustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object CustomersCONTACTPERSON: TStringField
      FieldName = 'CONTACTPERSON'
      Size = 256
    end
  end
  object Ins_ReportData: TDataSource
    DataSet = Ins_Report
    Left = 344
  end
  object Ins_Report: TOracleDataSet
    SQL.Strings = (
      
        'select id, PINS_FullMotor.returnName(kli_id) as name,Pins_FullMo' +
        'tor.returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(' +
        'kli_id) as phone,pins_fullmotor.returnFax(kli_id) as fax,contact' +
        '_person, banking_details,'
      '       profitid,insuredmodel,insuredtype,'
      '       insuredstatenum, insuredcolor,insuredoutputyear,'
      '      insurednumseats,insuredenginenum,insuredchassisnum,'
      '      insuredactualvalue,transmission_type,presence_alarm,'
      
        '      motor_usage,motorstorageplace,existingdamage,insurancegeog' +
        'raphicallimit'
      'from ins_motorfull'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000017000000020000004944010000000000040000004E414D4501000000
      00000E000000434F4E544143545F504552534F4E0100000000000F0000004241
      4E4B494E475F44455441494C530100000000000C000000494E53555245444D4F
      44454C0100000000000B000000494E5355524544545950450100000000000F00
      0000494E535552454453544154454E554D0100000000000C000000494E535552
      4544434F4C4F5201000000000011000000494E53555245444F55545055545945
      41520100000000000F000000494E53555245444E554D53454154530100000000
      0010000000494E5355524544454E47494E454E554D0100000000001100000049
      4E5355524544434841535349534E554D01000000000012000000494E53555245
      4441435455414C56414C5545010000000000110000005452414E534D49535349
      4F4E5F545950450100000000000E00000050524553454E43455F414C41524D01
      00000000000B0000004D4F544F525F5553414745010000000000110000004D4F
      544F5253544F52414745504C4143450100000000000E0000004558495354494E
      4744414D4147450100000000001A000000494E535552414E434547454F475241
      50484943414C4C494D49540100000000000500000050484F4E45010000000000
      0300000046415801000000000007000000414444524553530100000000000800
      000050524F4649544944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 376
    object Ins_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Ins_ReportNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object Ins_ReportADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object Ins_ReportPHONE: TStringField
      FieldName = 'PHONE'
      Size = 4000
    end
    object Ins_ReportFAX: TStringField
      FieldName = 'FAX'
      Size = 4000
    end
    object Ins_ReportBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_ReportINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object Ins_ReportINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object Ins_ReportINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_ReportINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_ReportINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_ReportINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_ReportINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_ReportINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_ReportINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_ReportTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_ReportPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_ReportMOTOR_USAGE: TStringField
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_ReportMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_ReportEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_ReportINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
  end
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 472
  end
  object INSWordExporter1: TINSWordExporter
    Left = 557
    Top = 104
  end
  object More_Report: TOracleDataSet
    SQL.Strings = (
      
        'select id,full_id,name||'#39'  '#39'||surname||'#39'  '#39'||fathername as name,' +
        'age,experience,history from INS_MOTORMORETHANONEDRIVER where ful' +
        'l_id = :full_id'
      '')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0040A34000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000040000004E414D4501000000000002000000494401000000
      00000700000046554C4C5F49440100000000000A000000455850455249454E43
      4501000000000007000000484953544F52590100000000000300000041474501
      0000000000}
    Master = Ins_Report
    MasterFields = 'ID'
    DetailFields = 'Full_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 56
    object More_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object More_ReportFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object More_ReportNAME: TStringField
      FieldName = 'NAME'
      Size = 388
    end
    object More_ReportEXPERIENCE: TStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object More_ReportHISTORY: TStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
    object More_ReportAGE: TIntegerField
      FieldName = 'AGE'
    end
  end
  object MoreReportData: TDataSource
    DataSet = More_Report
    Left = 96
    Top = 56
  end
  object PlgSuggest: TPlgModalContainer
    Left = 517
    Top = 104
  end
  object Suggestion: TOracleDataSet
    SQL.Strings = (
      'select  s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {
      0300000001000000060000003A4D4B5F49440400000008000000000000000064
      A34000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000050000004D4B5F4944010000
      0000000B0000005249534B4144445245535301000000000010000000494E5355
      52414E4345414D4D4F554E5401000000000007000000454E4444415445010000
      0000000600000052534B5F49440100000000000600000046525A5F4944010000
      00000007000000434E44545F49440100000000000600000056414C5F49440100
      000000000C000000494E535552414E434553554D010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 544
    object SuggestionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SuggestionMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object SuggestionRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 1024
    end
    object SuggestionINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object SuggestionENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object SuggestionRSK_ID: TFloatField
      FieldName = 'RSK_ID'
      Required = True
    end
    object SuggestionFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
      Required = True
    end
    object SuggestionCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
      Required = True
    end
    object SuggestionVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object SuggestionINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object SuggestionData: TDataSource
    DataSet = Suggestion
    Left = 512
  end
  object AgentsSource: TDataSource
    DataSet = ODSAgents
    Left = 513
    Top = 72
  end
  object ODSAgents: TOracleDataSet
    SQL.Strings = (
      
        'select a.id,a.name||'#39' '#39'||a.surname||'#39' '#39'||a.fathername as name fr' +
        'om ins_agents a')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E414D4501000000000002000000494401000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 553
    Top = 72
    object ODSAgentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAgentsNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
  end
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 512
    Top = 32
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
    Left = 544
    Top = 32
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
    Left = 522
    Top = 138
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 480
    Top = 85
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where blank_id = :blankid'
      'and type_id = 4')
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
    Left = 480
    Top = 56
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
end
