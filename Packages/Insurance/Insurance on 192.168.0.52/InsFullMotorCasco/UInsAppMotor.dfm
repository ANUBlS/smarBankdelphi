object FullCascoForm: TFullCascoForm
  Left = 286
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Blank'
  ClientHeight = 264
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MotorAppPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 241
    ActivePage = TabSheet6
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
      Caption = '—€щиф€1'
      ParentShowHint = False
      ShowHint = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 595
        Height = 215
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
          Top = 22
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
        object Label4: TLabel
          Left = 8
          Top = 46
          Width = 52
          Height = 13
          Caption = 'ћ€сул ш€хс'
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
          Caption = 'Ѕанк реквизитл€ри'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 94
          Width = 65
          Height = 13
          Caption = '‘айдаэютцр€н'
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
          Caption = 'јэент'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 141
          Width = 88
          Height = 13
          Caption = '—игнализасийа вармы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 216
          Top = 144
          Width = 179
          Height = 13
          Caption = 'јвтомобилин истифад€ характери (эюст€рин)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 8
          Top = 168
          Width = 93
          Height = 13
          Caption = 'ƒиэ€рл€ри (гейд един)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 280
          Top = 184
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
          Left = 368
          Top = 168
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
          Left = 486
          Top = 168
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
        object DBEditBanking: TDBEdit
          Left = 208
          Top = 64
          Width = 385
          Height = 21
          DataField = 'BANKING_DETAILS'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 1
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 208
          Top = 16
          Width = 385
          Height = 21
          DataField = 'KLI_ID'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleFullMotor.CustomersData
          ParentFont = False
          TabOrder = 0
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 208
          Top = 112
          Width = 385
          Height = 21
          DataField = 'BROKER'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleFullMotor.AgentsSource
          ParentFont = False
          TabOrder = 3
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 208
          Top = 88
          Width = 385
          Height = 21
          DataField = 'PROFITID'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleFullMotor.BeneficiarySource
          ParentFont = False
          TabOrder = 2
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBComboBox2: TDBComboBox
          Left = 104
          Top = 139
          Width = 97
          Height = 21
          DataField = 'PRESENCE_ALARM'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'Ѕ€ли'
            '’ейр')
          ParentFont = False
          TabOrder = 4
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBComboBox3: TDBComboBox
          Left = 408
          Top = 140
          Width = 185
          Height = 21
          DataField = 'MOTOR_USAGE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'Ў€хси'
            '»шэцзар : сцрцжц ил€'
            '»шэцзар : сцрцжцсцз'
            '»жар€ : сцрцжц ил€'
            '»жар€: сцрцжцсцз'
            '»жтимаи н€глиййат : такси'
            '»жтимаи н€глиййат : микроавтобус'
            '»жтимаи н€глиййат : автобус')
          ParentFont = False
          TabOrder = 5
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 184
          Width = 249
          Height = 21
          Color = clInfoBk
          DataField = 'MOTOR_USAGE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 6
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object edBeginDate: TDateTimePicker
          Left = 368
          Top = 184
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
          TabOrder = 7
          OnChange = edBeginDateChange
        end
        object edEndDate: TDateTimePicker
          Left = 485
          Top = 184
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
          TabOrder = 8
          OnChange = edBeginDateChange
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 385
          Height = 21
          DataField = 'KLI_ID'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'CONTACTPERSON'
          ListSource = DataModuleFullMotor.CustomersData
          ParentFont = False
          TabOrder = 9
          OnKeyPress = DBEditContactPersonKeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '—€щиф€2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 595
        Height = 209
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
          Top = 24
          Width = 78
          Height = 13
          Caption = 'ћарка в€ модели'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 52
          Width = 17
          Height = 13
          Caption = '“ипи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 8
          Top = 78
          Width = 55
          Height = 13
          Caption = 'ƒювл€т є-си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 102
          Width = 28
          Height = 13
          Caption = '–€нэи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 126
          Width = 47
          Height = 13
          Caption = 'Ѕурахылыш или'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 150
          Width = 84
          Height = 13
          Caption = 'ќтуражагларын сайы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 280
          Top = 24
          Width = 70
          Height = 13
          Caption = 'ћцщ€ррикин єси'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 280
          Top = 52
          Width = 46
          Height = 13
          Caption = 'Ўасси єси'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 280
          Top = 78
          Width = 99
          Height = 13
          Caption = 'ўазырки д€й€ри (јЅЎ$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 280
          Top = 102
          Width = 94
          Height = 13
          Caption = '—цр€т гутусунун типи'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 280
          Top = 126
          Width = 40
          Height = 13
          Caption = 'Ѕан єси'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 168
          Width = 215
          Height = 13
          Caption = 'јвтомобил истифад€ олунмадыгда сахланылдыьы йер'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 280
          Top = 150
          Width = 88
          Height = 13
          Caption = 'ћювжуд олан з€д€'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 280
          Top = 168
          Width = 158
          Height = 13
          Caption = '—ыьорта т€минатынын жоьрафи €щат€си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEditModel: TDBEdit
          Left = 104
          Top = 24
          Width = 150
          Height = 21
          DataField = 'INSUREDMODEL'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 0
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditType: TDBEdit
          Left = 104
          Top = 48
          Width = 150
          Height = 21
          DataField = 'INSUREDTYPE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 1
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit1StateNum: TDBEdit
          Left = 104
          Top = 72
          Width = 150
          Height = 21
          DataField = 'INSUREDSTATENUM'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 2
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditColor: TDBEdit
          Left = 104
          Top = 96
          Width = 150
          Height = 21
          DataField = 'INSUREDCOLOR'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 3
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditOutputYear: TDBEdit
          Left = 104
          Top = 120
          Width = 150
          Height = 21
          DataField = 'INSUREDOUTPUTYEAR'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 4
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditSeatCount: TDBEdit
          Left = 104
          Top = 144
          Width = 150
          Height = 21
          DataField = 'INSUREDNUMSEATS'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 5
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditEnginNum: TDBEdit
          Left = 432
          Top = 24
          Width = 150
          Height = 21
          DataField = 'INSUREDENGINENUM'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 7
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditChassisNum: TDBEdit
          Left = 432
          Top = 48
          Width = 150
          Height = 21
          DataField = 'INSUREDCHASSISNUM'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 8
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditActualValue: TDBEdit
          Left = 432
          Top = 72
          Width = 150
          Height = 21
          DataField = 'INSUREDACTUALVALUE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 9
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEditTransmission: TDBEdit
          Left = 432
          Top = 96
          Width = 150
          Height = 21
          DataField = 'TRANSMISSION_TYPE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 10
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 432
          Top = 120
          Width = 150
          Height = 21
          DataField = 'INSUREDBODY'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 11
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit22: TDBEdit
          Left = 8
          Top = 184
          Width = 249
          Height = 21
          DataField = 'MOTORSTORAGEPLACE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 6
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 432
          Top = 144
          Width = 151
          Height = 21
          DataField = 'EXISTINGDAMAGE'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 12
          OnKeyPress = DBEditContactPersonKeyPress
        end
        object DBEdit4: TDBEdit
          Left = 280
          Top = 184
          Width = 305
          Height = 21
          DataField = 'INSURANCEGEOGRAPHICALLIMIT'
          DataSource = DataModuleFullMotor.Ins_MotorFullData
          TabOrder = 13
          OnKeyPress = DBEditContactPersonKeyPress
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '—€щиф€3'
      ImageIndex = 4
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 213
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
            'јксессуарлар в€ €лав€ аваданлыглар (типи,маркасы,д€й€ри в€ гураш' +
            'дырылмаьы):'
        end
        object Label22: TLabel
          Left = 8
          Top = 104
          Width = 497
          Height = 13
          Caption = 
            'яэ€р автомобил бирд€н чох сцрцжц т€р€финд€н идар€ едил€ж€кс€,щ€р' +
            ' бир сцрцжц щаггында м€лумат (ады,сойады'
        end
        object Label23: TLabel
          Left = 8
          Top = 120
          Width = 175
          Height = 13
          Caption = ',атасынын ады,йашы,сцрцжцлцк т€жрцб€си)'
        end
        object AccesoriesDBGrid: TDBGrid
          Left = 1
          Top = 40
          Width = 592
          Height = 61
          DataSource = DataModuleFullMotor.AccesoriesData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyPress = DBEditContactPersonKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'TYPE'
              Title.Caption = '“ипи'
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
              Title.Caption = 'ћаркасы'
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
              FieldName = 'VALUE'
              Title.Caption = 'ƒ€й€ри'
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
                '»стещсалчы гурашдыран'
                '—онрадан гурашдырылан')
              Title.Caption = 'Ќеж€ гурашдырылыб'
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
          Left = 1
          Top = 142
          Width = 592
          Height = 65
          DataSource = DataModuleFullMotor.MoreThanOneData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyPress = DBEditContactPersonKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'јды'
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
              Title.Caption = '—ойады'
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
              Title.Caption = 'јтасынын ады'
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
              FieldName = 'AGE'
              Title.Caption = '…ашы'
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
              Title.Caption = '“€жрцб€си'
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
              Title.Caption = 'ўадис€л€р щаггында м€лум€т'
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
        object DBNavigator1: TDBNavigator
          Left = 348
          Top = 18
          Width = 240
          Height = 18
          DataSource = DataModuleFullMotor.AccesoriesData
          Hints.Strings = (
            'Ѕиринжи'
            'явв€лки'
            '—онракы'
            'јхырынжы'
            'ялав€'
            'Ћ€ьв'
            '–едакт€'
            '“€сдиг етм€к'
            '»мтина'
            '…енил€м€к')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object DBNavigator2: TDBNavigator
          Left = 348
          Top = 120
          Width = 240
          Height = 18
          DataSource = DataModuleFullMotor.MoreThanOneData
          Hints.Strings = (
            'Ѕиринжи'
            'явв€лки'
            '—онракы'
            'јхырынжы'
            'ялав€'
            'Ћ€ьв'
            '–едакт€'
            '“€сдиг етм€к'
            '»мтина'
            '…енил€м€к')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = '—€щиф€4'
      ImageIndex = 5
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 213
        Align = alClient
        Caption = '“€л€б ќлунан —ыьорта “€минатлары'
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
          Caption = '“€минат нювц'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 144
          Top = 24
          Width = 59
          Height = 13
          Caption = '“€л€б олунур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 240
          Top = 24
          Width = 67
          Height = 13
          Caption = '“€л€б олунмур'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 336
          Top = 24
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
        object Label49: TLabel
          Left = 480
          Top = 24
          Width = 39
          Height = 13
          Caption = '‘раншиза'
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
          Caption = '1. аско сыьортасы'
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
          Caption = '2.ялав€ т€минатлар'
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
          Caption = '3.÷чцнжц ш€хсл€р гаршысында '
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
          Caption = 'м€сулийй€т сыьортасы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 8
          Top = 160
          Width = 115
          Height = 13
          Caption = '4.—црцжц в€ с€рнишинл€рин'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 8
          Top = 176
          Width = 87
          Height = 13
          Caption = 'ф€рди г€за сыьортасы'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 408
          Top = 128
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
        object Label57: TLabel
          Left = 336
          Top = 144
          Width = 61
          Height = 13
          Caption = 'јдам башына'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 480
          Top = 144
          Width = 59
          Height = 13
          Caption = '√€за башына'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit6: TDBEdit
          Left = 144
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 240
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 336
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 480
          Top = 40
          Width = 89
          Height = 21
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 144
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 240
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 5
        end
        object DBEdit12: TDBEdit
          Left = 336
          Top = 70
          Width = 97
          Height = 21
          TabOrder = 6
        end
        object DBEdit13: TDBEdit
          Left = 480
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 7
        end
        object DBEdit14: TDBEdit
          Left = 144
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 8
        end
        object DBEdit15: TDBEdit
          Left = 240
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 9
        end
        object DBEdit16: TDBEdit
          Left = 336
          Top = 96
          Width = 97
          Height = 21
          TabOrder = 10
        end
        object DBEdit17: TDBEdit
          Left = 480
          Top = 96
          Width = 89
          Height = 21
          TabOrder = 11
        end
        object DBEdit18: TDBEdit
          Left = 144
          Top = 168
          Width = 89
          Height = 21
          TabOrder = 12
        end
        object DBEdit19: TDBEdit
          Left = 240
          Top = 168
          Width = 89
          Height = 21
          TabOrder = 13
        end
        object DBEdit20: TDBEdit
          Left = 336
          Top = 168
          Width = 97
          Height = 21
          TabOrder = 14
        end
        object DBEdit21: TDBEdit
          Left = 480
          Top = 168
          Width = 89
          Height = 21
          TabOrder = 15
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 234
    Width = 601
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Back: TBitBtn
      Left = 126
      Top = 3
      Width = 89
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
      Left = 216
      Top = 3
      Width = 89
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
      Left = 396
      Top = 3
      Width = 89
      Height = 24
      Caption = '»мтина'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonCancelClick
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
      Left = 306
      Top = 3
      Width = 89
      Height = 24
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButtonCommitClick
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
  end
end
