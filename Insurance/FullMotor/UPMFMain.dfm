object PMFMain: TPMFMain
  Left = 107
  Top = 102
  Width = 1163
  Height = 753
  Caption = 'PMFMain'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1163
    Height = 38
    ButtonHeight = 37
    ButtonWidth = 107
    Caption = 'ToolBar1'
    Color = clBtnFace
    DrawingStyle = dsGradient
    Images = ImageList
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActionInsert
    end
    object ToolButton3: TToolButton
      Left = 107
      Top = 0
      Action = ActionEdit
    end
    object ToolButton5: TToolButton
      Left = 214
      Top = 0
      Action = ActionRefresh
    end
    object ToolButton8: TToolButton
      Left = 321
      Top = 0
      Action = ActionDelete
    end
    object ToolButton2: TToolButton
      Left = 428
      Top = 0
      Action = Report
    end
    object ToolButton4: TToolButton
      Left = 535
      Top = 0
      Action = ActionSuggestion
    end
    object ToolButton6: TToolButton
      Left = 642
      Top = 0
      Action = ActionPolicy
    end
    object ToolButton9: TToolButton
      Left = 749
      Top = 0
      Action = ActionSearch
      Caption = 'Filter'
    end
    object ToolButton7: TToolButton
      Left = 856
      Top = 0
      Action = ActionExtra
    end
    object ToolButton10: TToolButton
      Left = 963
      Top = 0
      Caption = 'Excel'
      ImageIndex = 13
      OnClick = ToolButton10Click
    end
  end
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 38
    Width = 158
    Height = 715
    Align = alLeft
    Caption = 'Filter'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    object RGContract: TXFRadioGroup
      Left = 2
      Top = 16
      Width = 154
      Height = 59
      Align = alTop
      Caption = 'M'#252'qavil'#601'nin statusu'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'Aktiv m'#252'qavil'#601'l'#601'r'
        'Ba'#287'l'#305' m'#252'qavil'#601'l'#601'r')
      ParentFont = False
      TabOrder = 0
      OnClick = RGContractClick
    end
    object XFGroupBox2: TXFGroupBox
      Left = 2
      Top = 75
      Width = 154
      Height = 48
      Align = alTop
      Caption = 'M'#252#351't'#601'ri'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 4
        Top = 18
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME1'
        ListSource = DSRIns_cust
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object XFCheckBox1: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox1Click
      end
    end
    object XFGroupBox11: TXFGroupBox
      Left = 2
      Top = 123
      Width = 154
      Height = 51
      Align = alTop
      Caption = 'M'#252#351't'#601'ri qrupu'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 4
        Top = 18
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSRcutomers
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object XFCheckBox9: TXFCheckBox
        Left = 131
        Top = -1
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox9Click
      end
    end
    object XFGroupBox3: TXFGroupBox
      Left = 2
      Top = 174
      Width = 154
      Height = 48
      Align = alTop
      Caption = 'Agent'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 4
        Top = 18
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSRins_agents
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object XFCheckBox2: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox2Click
      end
    end
    object XFGroupBox4: TXFGroupBox
      Left = 2
      Top = 222
      Width = 154
      Height = 48
      Align = alTop
      Caption = 'Avto.marka'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 4
        Top = 18
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSRins_dict_marks
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object XFCheckBox3: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox3Click
      end
    end
    object XFGroupBox7: TXFGroupBox
      Left = 2
      Top = 270
      Width = 154
      Height = 51
      Align = alTop
      Caption = 'Avto.model'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Visible = False
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 4
        Top = 18
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object XFCheckBox4: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
      end
    end
    object XFGroupBox8: TXFGroupBox
      Left = 2
      Top = 321
      Width = 154
      Height = 48
      Align = alTop
      Caption = 'Avto.tip'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 4
        Top = 17
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSRAUtoType
        ParentFont = False
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object XFCheckBox5: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox5Click
      end
    end
    object XFGroupBox5: TXFGroupBox
      Left = 2
      Top = 369
      Width = 154
      Height = 49
      Align = alTop
      Caption = 'Fran'#351'iza'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Edit1: TEdit
        Left = 4
        Top = 17
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnChange = Edit1Change
      end
      object XFCheckBox6: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = XFCheckBox6Click
      end
    end
    object XFGroupBox9: TXFGroupBox
      Left = 2
      Top = 418
      Width = 154
      Height = 48
      Align = alTop
      Caption = 'S'#305#287'orta m'#601'bl'#601#287'i'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
      object Edit2: TEdit
        Left = 5
        Top = 20
        Width = 145
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
      end
      object XFCheckBox7: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
      end
    end
    object XFGroupBox10: TXFGroupBox
      Left = 2
      Top = 466
      Width = 154
      Height = 50
      Align = alTop
      Caption = 'S'#305#287'orta haqq'#305
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      Visible = False
      object Edit3: TEdit
        Left = 4
        Top = 17
        Width = 144
        Height = 22
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
      end
      object XFCheckBox8: TXFCheckBox
        Left = 131
        Top = 0
        Width = 14
        Height = 17
        TabOrder = 1
      end
    end
  end
  object XFPanel4: TXFPanel
    Left = 158
    Top = 38
    Width = 1005
    Height = 715
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 2
    object XFPanel5: TXFPanel
      Left = 2
      Top = 680
      Width = 997
      Height = 29
      Align = alBottom
      TabOrder = 0
      object EditPOLICY_NUM: TEdit
        Left = 4
        Top = 4
        Width = 90
        Height = 22
        TabOrder = 0
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditNAME: TEdit
        Left = 94
        Top = 4
        Width = 150
        Height = 22
        TabOrder = 1
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditAGENT: TEdit
        Left = 245
        Top = 4
        Width = 130
        Height = 22
        TabOrder = 2
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditMARKA: TEdit
        Left = 375
        Top = 4
        Width = 80
        Height = 22
        TabOrder = 3
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditINSUREDSTATENUM: TEdit
        Left = 456
        Top = 4
        Width = 80
        Height = 22
        TabOrder = 4
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditFRANSHIZ: TEdit
        Left = 537
        Top = 4
        Width = 75
        Height = 22
        TabOrder = 5
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditINSSUMM: TEdit
        Left = 613
        Top = 4
        Width = 75
        Height = 22
        TabOrder = 6
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditAMMOUNT: TEdit
        Left = 689
        Top = 4
        Width = 75
        Height = 22
        TabOrder = 7
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditINSUREDACTUALVALUE: TEdit
        Left = 765
        Top = 4
        Width = 94
        Height = 22
        TabOrder = 8
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
      object EditTARIFF: TEdit
        Left = 860
        Top = 4
        Width = 75
        Height = 22
        TabOrder = 9
        OnExit = EditPOLICY_NUMExit
        OnKeyPress = EditPOLICY_NUMKeyPress
      end
    end
    object PanelAcc: TXFPanel
      Left = 2
      Top = 410
      Width = 997
      Height = 270
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object GridMore: TDBGrid
        Left = 2
        Top = 160
        Width = 993
        Height = 108
        Align = alBottom
        DataSource = MoreThanOneData
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = ActionEditExecute
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #1040#1076#1099
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SURNAME'
            Title.Caption = #1057#1086#1081#1072#1076#1099
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FATHERNAME'
            Title.Caption = #1040#1090#1072#1089#1099#1085#1099#1085' '#1072#1076#1099
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGE'
            Title.Caption = #1049#1072#1096#1099
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXPERIENCE'
            Title.Caption = #1057#1094#1088#1094#1078#1094#1083#1094#1082' '#1090#1103#1078#1088#1094#1073#1103#1089#1080
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORY'
            Title.Caption = #1057#1086#1085' 5 '#1080#1083' '#1103#1088#1079#1080#1085#1076#1103' '#1073#1072#1096' '#1074#1077#1088#1084#1080#1096' '#1097#1072#1076#1080#1089#1103#1083#1103#1088
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 300
            Visible = True
          end>
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 27
        Width = 993
        Height = 109
        Align = alClient
        DataSource = AccesoriesData
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = ActionEditExecute
        Columns = <
          item
            Expanded = False
            FieldName = 'TYPE'
            Title.Caption = #1058#1080#1087#1080
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAKE'
            Title.Caption = #1052#1072#1088#1082#1072#1089#1099' '
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUE'
            Title.Caption = #1044#1103#1081#1103#1088#1080
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOWCREATED'
            Title.Caption = #1053#1077#1078#1103' '#1075#1091#1088#1072#1096#1076#1099#1088#1099#1083#1099#1073
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 287
            Visible = True
          end>
      end
      object XFPanel1: TXFPanel
        Left = 2
        Top = 2
        Width = 993
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object XFLabel1: TXFLabel
          Left = 9
          Top = 7
          Width = 105
          Height = 14
          Caption = #399'lav'#601' aksesuarlar'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object XFPanel2: TXFPanel
        Left = 2
        Top = 136
        Width = 993
        Height = 24
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        object XFLabel2: TXFLabel
          Left = 9
          Top = 5
          Width = 585
          Height = 14
          Caption = 
            #399'g'#601'r avtomobil bird'#601'n '#231'ox s'#252'r'#252'c'#252' t'#601'r'#601'find'#601'n idar'#601' edil'#601'c'#601'ks'#601', h'#601 +
            'r bir s'#252'r'#252'c'#252' haqq'#305'nda m'#601'lumat'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 997
      Height = 408
      Align = alClient
      TabOrder = 2
      object GridMotor: TDBGrid
        Left = 2
        Top = 16
        Width = 993
        Height = 390
        Align = alClient
        DataSource = Ins_MotorFullData
        DrawingStyle = gdsGradient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = ActionEditExecute
        OnTitleClick = GridMotorTitleClick
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'POLICY_NUM'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #1057#1099#1100#1086#1088#1090#1072' '#1077#1090#1076#1080#1088#1103#1085
            Title.Color = clNavy
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGENT'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARKA'
            Title.Caption = #1052#1072#1088#1082#1072
            Title.Color = clNavy
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDSTATENUM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = #1044#1102#1074#1083#1103#1090' '#8470
            Width = 80
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'FRANSHIZ'
            Width = 75
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'INSSUMM'
            Width = 75
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'AMMOUNT'
            Width = 75
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'INSUREDACTUALVALUE'
            Width = 94
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'TARIFF'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BEGIN_DATE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'END_DATE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDOUTPUTYEAR'
            Title.Caption = #1041#1091#1088#1072#1093#1099#1083#1099#1096' '#1080#1083#1080
            Title.Color = clNavy
            Visible = False
          end>
      end
      object Memo1: TMemo
        Left = 176
        Top = 236
        Width = 321
        Height = 188
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
        Visible = False
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 400
    Top = 122
    object N2: TMenuItem
      Action = ActionInsert
      OnDrawItem = N1DrawItem
    end
    object N3: TMenuItem
      Action = ActionEdit
      OnDrawItem = N1DrawItem
    end
    object N4: TMenuItem
      Action = ActionDelete
      OnDrawItem = N1DrawItem
    end
    object N5: TMenuItem
      Action = Report
      OnDrawItem = N1DrawItem
    end
    object N6: TMenuItem
      Action = ActionSuggestion
      OnDrawItem = N1DrawItem
    end
    object N9: TMenuItem
      Action = ActionPolicy
      Caption = #1055#1086#1083#1080#1078#1081
      OnDrawItem = N1DrawItem
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = ActionRefresh
      OnDrawItem = N1DrawItem
    end
    object N10: TMenuItem
      Action = ActionFullRefresh
      OnDrawItem = N1DrawItem
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 456
    Top = 114
    object N1: TMenuItem
      Action = ActionFullRefresh
      OnDrawItem = N1DrawItem
    end
  end
  object ImageList: TImageList
    Left = 497
    Top = 122
    Bitmap = {
      494C010112001400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001001000000000000028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008C310821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000E71C08210821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000008410
      E71C000008210821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008218C310821
      B556000008211042104208210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000008410AD35B5560000
      00000000B556AD35082110428C31000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EFF7FF75EFF7FF75EFF7F
      F75EFF7FF75EFF7FF75EFF7F007CFF7F000000000000E71CBD77000000000000
      0000000000000000BD776B2D10428C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E000000006B2D0000000000000000BD56
      1F00BD5600000000000000006B2D104208210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000821BD770000000000000000BD56
      1F00BD560000000000000000BD77082110420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000B556000000000000000000000000
      FF3D000000000000000000000000AD3510420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000FF7F0000FF7F0000000000000000F75E000000000000000000000000
      1F00BD5600000000000000000000EF3D10420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000F75E0000000000000000BD56BD56
      BD351F00FF5E0000000000000000EF3D8C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      FF7F00000000000000000000000000000000CE3900000000000000001F001F00
      BD771F001F0000000000000000004A2984100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000FF7FFF7F0000000000000000000084103967000000000000DD18BD77
      FF5E1F00DD18000000000000B556000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F0000F75E
      FF7F0000FF7F000000000000000000000000000084107B6F00000000BD77FF3D
      FF3DFF3DBD7700000000F75E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000008410B556BD7700000000
      000000000000BD77B55684100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000821CE39F75E
      F75EF75ECE390821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186300001863
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000018631863186310420000
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000004000400040004000400000
      0000000000000000000000000000000000000000000000000000000000000000
      10420000FF7F0000104200000000000000000000000018631863186318630000
      0000186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000004000400000000000400000
      0000000000001042000000000000000000000000000000000000000018631863
      18631863FF7F1863186300001042000000000000000018631863186318630000
      E07F000018631863186318631863000000000000000000000000000000020002
      0000100010000000004000400000000000000000000000000040000000000000
      000000001042000000001042000000000000000000001863FF7FFF7FFF7FFF7F
      10420000FF7F1042104218631863000000000000000018631863000000000000
      0000E07F00001863186318631863000000000000000000400000000000020002
      0000100010000000004000400000000000000000000000000000004000000000
      0000000000000000000000000000000000001042FF7FFF7FFF7FFF7F10420000
      FF7FFF7F1042FF7F1863186318630000000000000000186318630000E07FE07F
      E07FE07FE07F0000186318631863000000000000000000000000000000020002
      0000100010000000004000400000000000000000004000000000004000400000
      00000000000000000000000000000000000000000000000010420000FF7FFF7F
      104210421042FF7F104218631863000000000000000018631863186300000000
      E07F000000000000000018631863000000000000000000400000000000020002
      0000100010000000004000400000000000000000004000400040004000400000
      0000000000000000000000000000000000000000000000000000FF7F1042E07F
      1042000000000000FF7F1042186300000000000000001863186318630000E07F
      E07FE07F00001863186318631863000000000000000000000000000000020002
      0000100010000000004000400000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104218630000
      0000000010421863FF7F1042FF7F000000000000000000000000000000000000
      E07F0000E07F0000186318631863000000000000000000400000000000000000
      0000100010000000004000400000000000000000100010001000100010001000
      0000000000000000000000000000000000000000000000000000000010420000
      10421863FF7F0000FF7F00000000000000000000000000000000E07FE07FE07F
      0000E07FE07FE07F000018631863000000000000000000000000000000000000
      0000100010000000004000400000000000000000104210000000000010001042
      0000000000000000000000000000000000000000000000000000000000001042
      FF7F0000FF7FFF7F0000FF7F00000000000000000000186300000000E07F0000
      E07F000000000000000000001863000000000000000000400000000000000000
      0000100010000000000000000000000000000000000010001000100010000000
      0000000000000000000000000000000000000000000000000000000000001042
      FF7FFF7F0000FF7F0000FF7F0000000000000000000018630000E07F0000E07F
      0000E07F00001863186318631863000000000000000000000000000000000000
      0000100010000000000000000000000000000000000000001000100000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7F0000FF7FFF7FFF7FFF7F0000000000000000186318630000E07F0000
      E07F0000E07F0000186318631863000000000000000000400000000000000000
      0000000000000000000000000000000000000000000000001042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042FF7FFF7FFF7FFF7FFF7F1042000000000000000018631863000000000000
      0000000000000000000018631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7F104200000000000000000000000018631863186300000000
      E07F00000000E07F000000001863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000018631863186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C311042104210421042
      10421042104210421042104210421042841000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008010604EE03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03D4A2910421042000000000000FF7FFF7F00000000
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FA6770821104200000000FF7F0000000000001000
      000010000000100000000000FF7F000000000000000000420042000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA677082108210000FF7F00001000100010000000
      1000000010000000100000000000FF7F00000000000018630042004200000000
      0000000000000000000000000000000000000000000000000000000000001042
      1000104200000000000000000000000000000021E07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA635104200000000FF7F10001000100010001863
      1863FF7FFF7F1000000010000000FF7F00000000000000421863004200421042
      0000000000000000000000000000000000000000000000000000104210001000
      1042000000000000000000000000000000000000E05EE07FE07FE07FE07FE07F
      E05EE07FE07FE07FE07FA677082108210000FF7F100010001000100010001000
      1863FF7F100010001000000000000000FF7F0000000000000042186300420000
      1042104210421042104200000000000000000000000000000000100010001042
      00000000000000000000000000000000000000000021E07FE07FE07FE07F2667
      4629E07FE07FE07FE07FA635104200000000FF7F100010001000100010001F00
      1863FF7F100010001000000010000000FF7F0000000000000000000000420042
      0042104218631863104200001042000000000000000000001042100010420000
      00000000000000000000000000000000000000000000E05EE07FE07FE07FA635
      0000A677E07FE07FA6770821082100000000FF7F100010001F0010001F001000
      1863FF7F100010001000100000000000FF7F0000000000000000000000000042
      1042FF7F18631863186310420000000000000000000000001000100000000000
      000000000000000000000000000000000000000000000021E07FE07FE07F8010
      0000604EE07FE07FA6351042000000000000FF7F1000100010001F0010001F00
      1863FF7F100010001000000010000000FF7F0000000000000000000000001042
      FF7F1F001F001F001F0018631042104200000000000000001000100000000000
      000010001000100010001000000000000000000000000000E05EE07FE07F0000
      0000E03DE07FA67708210821000000000000FF7F100010001F0010001F001863
      186318631F0010001000100000000000FF7F00000000000000001F000000FF7F
      18631F00186318631F00186318631F0000000000000000001000100010420000
      0000000010421000100010000000000000000000000000000021E07FE07F0000
      0000E03DE07FA63510420000000000000000FF7F10001F0010001F001F001F00
      1F001000100010001000000010000000FF7F00000000000000001F000000FF7F
      18631F00FF7F1F00FF7F18631863000000000000000000001042100010001042
      0000104210001000100010000000000000000000000000000000E05EE07FA656
      E03DA677A6770821082100000000000000000000FF7F10001F0010001F001F00
      1863FF7F1F001000100010000000FF7F0000000000000000000000001F001042
      FF7F1F001F001F001863FF7F10421F0000000000000000000000100010001000
      10001000100010001042100000000000000000000000000000000021E07FE07F
      E07FE07FA6351042000000000000000000000000FF7F100010001F0010001000
      1863186310001000100010000000FF7F00000000000000000000000000000000
      1042FF7F18631863FF7F10420000000000000000000000000000000010421000
      10001000104200000000100000000000000000000000000000000000E05EE07F
      E07FA677082108210000000000000000000000000000FF7F1000100010001F00
      100010001000100010000000FF7F000000000000000000000000000000000000
      00001042FF7FFF7F104200000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000021E07F
      E07FA6358C31000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E03D
      A6560000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001042000000000000000000000000000000000000FF7FFF7F
      1042000000000000000000000000000000000000000000000000000000000000
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F000010420000000000000000000000000000000000000000FF7F
      1042000000000000000000000000000000000000000000000000000000001000
      0002100000000000000000000000000000000000000000000000104210420000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      00000000FF7F000010420000000000000000000000000000000000000000FF7F
      1042000000000000000000000000000000000000000000000000000010000002
      0002000200000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000FF7FFF7F0000
      000000000000000010420000000000000000000000000000000000000000FF7F
      1042000000000000000000000000000000000000000000000000100000020002
      0002000210000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000FF7F10420000
      000000000000000010420000000000000000000000000000000000000000FF7F
      104200000000000000000000000000000000000000000000000000020002E003
      E003000200021000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      FF7F0000000000001042000000000000000000000000000000000000FF7FFF7F
      10420000000000000000000000000000000000000000000000000002E0030000
      0000E00300020002100000000000000000000000000010421042104218631042
      1042000000000000000000000000000000000000000000000000FF7F0000FF7F
      FF7FFF7F0000000010420000000000000000000000000000000000000000FF7F
      1042000000000000000000000000000000000000000000000000E00300000000
      0000000000020002000200000000000000000000000000001042FF7F18631042
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000000000001042000000000000000000000000000000000000FF7FFF7F
      1863000000000000000000000000000000000000000000000000000000000000
      00000000E0030002000210000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000010420000000000000000000000000000FF7FFF7FFF7F
      FF7F186300000000000000000000000000000000000000000000000000000000
      0000000000000000E00300020002100000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000104200000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F10420000000000000000000000000000000000000000000000000000
      0000000000000000000000020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000104200000000000000000000FF7FFF7F0000FF7F
      0000FF7F10420000000000000000000000000000000000000000000000000000
      00000000000000000000E0030002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00001042
      0000186300000000000000000000000000000000000000000000000000000000
      000000000000000000000000E003000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      1863000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000000000001042FF7F18631042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010421042104218631042
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF008001FF9F000000000000FF1F00000000
      0000FC9F000000000000F087000000000000E383000000000000CFE100000000
      0000BC780000000000003C7800000000E0077EFC00000000E0077E7C00000000
      E007783C00000000E007783C00000000E00F383900000000E01F983300000000
      E03FC7C700000000E07FF01F00000000FFFFFFFFC003FFFFFFFFFF1FC003FFFF
      83EFFC07C003C0019BCFE003C003F927EF878001C003D927F7870001C003F927
      B3EFE001C203D92783EFF001C003F927FFEFF001C083DF2781EFF807D103FF27
      99EFFC07CA03DF3FC3EFFC03C503FF3FE7EFFE01C283DFFFE7EFFE03C7E3FFFF
      FFEFFF0FC2D3FFFFFFFFFFBFC003FFFFC000F81FFFFFFFFF0000E007FFFFFFFF
      0000C003C3FFFFFF00008001C3FFFC7F00018001C1FFF0FF80010000E00FF1FF
      80030000F803E3FFC0030000FC03E7FFC0070000FC01E707E0070000F401E387
      E00F0000F403E107F00F8001F801F007F01F8001FC03F837F81FC003FE07FFFF
      F83FE007FFFFFFFFFC7FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFF
      FFFFE00FF8FFFEFFFFFFE00FF8FFFC7FF1FFE00FF8FFF87FF1FFE00FF8FFF03F
      F1FFE00FF8FFF01FF1FFE00FF8FFF30FC07FE00FF8FFF78FE0FFE00FF07FFF87
      F1FFE007E03FFFE1FBFFE047E03FFFF1FFFFFFE3E03FFFF1FFFFFFF3E03FFFF9
      FFFFFFFFF07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFF
      FDFFFFFFF3FFFFFFF8FFFFFFE1F9FFFFF0FFFC7FE1F3FBFFE67FFD7FF0E3F1FF
      CE7FFD7FF847E0FFFF3FE10FFC0FC07FFFBFEFEFFE1FF1FFFFDFE10FFC0FF1FF
      FFDFFD7FF84FF1FFFFEFFD7FE0E3F1FFFFF7FC7FC1F1FFFFFFFBFFFFC7F8FFFF
      FFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 536
    Top = 122
    object ActionInsert: TAction
      Category = 'Event'
      Caption = #1049#1077#1085#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionInsertExecute
    end
    object ActionEdit: TAction
      Category = 'Event'
      Caption = #1056#1077#1076#1072#1082#1090#1103
      ImageIndex = 5
      ShortCut = 16453
      OnExecute = ActionEditExecute
    end
    object ActionRefresh: TAction
      Category = 'Extra'
      Caption = #1049#1077#1085#1080#1083#1103#1084#1103#1082
      ImageIndex = 11
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionFullRefresh: TAction
      Category = 'Extra'
      Caption = #1058#1072#1084' '#1081#1077#1085#1080#1083#1103#1084#1103#1082
      ImageIndex = 11
      ShortCut = 117
      OnExecute = ActionFullRefreshExecute
    end
    object ActionSearch: TAction
      Category = 'Search'
      Caption = #1040#1093#1090#1072#1088#1099#1096
      ImageIndex = 10
      OnExecute = ActionSearchExecute
    end
    object ActionSpeedSearch: TAction
      Category = 'Search'
      Caption = 'ActionSpeedSearch'
    end
    object ActionDelete: TAction
      Category = 'Event'
      Caption = #1041#1072#1100#1083#1072#1084#1072#1075
      ImageIndex = 2
      ShortCut = 46
      OnExecute = ActionDeleteExecute
    end
    object Report: TAction
      Caption = #1065#1077#1089#1072#1073#1072#1090
      ImageIndex = 16
      ShortCut = 113
      OnExecute = ReportExecute
    end
    object ActionSuggestion: TAction
      Caption = #1058#1103#1082#1083#1080#1092#1085#1072#1084#1103
      ImageIndex = 15
      ShortCut = 16468
      OnExecute = ActionSuggestionExecute
    end
    object ActionPolicy: TAction
      Caption = 'Policy'
      ImageIndex = 14
      ShortCut = 16464
      OnExecute = ActionPolicyExecute
    end
    object ActionExtra: TAction
      Caption = #1071#1083#1072#1074#1103' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088
      ImageIndex = 17
      OnExecute = ActionExtraExecute
    end
  end
  object INSWordExporter1: TINSWordExporter
    Left = 576
    Top = 118
  end
  object Ins_MotorFullData: TDataSource
    DataSet = Ins_MotorFull
    Left = 264
    Top = 208
  end
  object Ins_MotorFull: TOracleDataSet
    SQL.Strings = (
      'select '
      
        'im.rowid,im.*,im.insuredmark||'#39' '#39'||im.insuredmodel as marka,ic.p' +
        'olicy_num,iag.surname||'#39' '#39'||iag.name||'#39' '#39'||iag.fathername as age' +
        'nt,inc.surname||'#39' '#39'||inc.name||'#39' '#39'||inc.fathername as name,'
      
        'ic.begin_date,ic.end_date, ic.franshiz,im.INSUREDACTUALVALUE,ic.' +
        'INSSUMM,ic.TARIFF,ic.AMMOUNT from '
      
        'ins_motorfull im,ins_contracts ic,ins_customers inc ,ins_agents ' +
        'iag'
      'WHERE '
      'ic.id=im.cid '
      ''
      '--and im.CLOSE_PREFIX=0 '
      'and inc.id=im.kli_id  and iag.id=ic.agent_id'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '--ORDER BY  im.:title')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000003500000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000001C00000043004F004E0054004100430054005F00
      50004500520053004F004E000100000000001E000000420041004E004B004900
      4E0047005F00440045005400410049004C005300010000000000180000004900
      4E00530055005200450044004D004F00440045004C0001000000000016000000
      49004E005300550052004500440054005900500045000100000000001E000000
      49004E0053005500520045004400530054004100540045004E0055004D000100
      000000001800000049004E005300550052004500440043004F004C004F005200
      0100000000002200000049004E00530055005200450044004F00550054005000
      5500540059004500410052000100000000001E00000049004E00530055005200
      450044004E0055004D0053004500410054005300010000000000200000004900
      4E005300550052004500440045004E00470049004E0045004E0055004D000100
      000000002200000049004E005300550052004500440043004800410053005300
      490053004E0055004D000100000000002400000049004E005300550052004500
      4400410043005400550041004C00560041004C00550045000100000000002200
      00005400520041004E0053004D0049005300530049004F004E005F0054005900
      500045000100000000001C000000500052004500530045004E00430045005F00
      41004C00410052004D00010000000000160000004D004F0054004F0052005F00
      55005300410047004500010000000000220000004D004F0054004F0052005300
      54004F00520041004700450050004C004100430045000100000000001C000000
      4500580049005300540049004E004700440041004D0041004700450001000000
      00003400000049004E0053005500520041004E0043004500470045004F004700
      52004100500048004900430041004C004C0049004D0049005400010000000000
      0C000000420052004F004B00450052000100000000001600000049004E005300
      550052004500440042004F00440059000100000000000C000000540059005000
      45004900440001000000000010000000500052004F0046004900540049004400
      0100000000001800000043004C004F00530045005F0050005200450046004900
      5800010000000000080000004E0041004D004500010000000000140000004200
      4500470049004E005F0044004100540045000100000000001000000045004E00
      44005F0044004100540045000100000000001600000049004E00530055005200
      450044004D00410052004B000100000000000A0000004D00410052004B004100
      010000000000100000004D004F004E00540048005F0049004400010000000000
      06000000430049004400010000000000260000005200450051005F004B004100
      53004B004F005F0049004E0053005F0053004500430055005200010000000000
      340000005200450051005F004B00410053004B004F005F0049004E0053005F00
      530045004300550052005F0041004D004F0055004E0054000100000000002C00
      00005200450051005F004B00410053004B004F005F0049004E0053005F005300
      45004300550052005F0046005200010000000000360000005200450051005F00
      4100440044004900540049004F004E0041004C005F0049004E0053005F005300
      45004300550052004900540059000100000000003C0000005200450051005F00
      4100440044004900540049005F0049004E0053005F0053004500430055005200
      4900540059005F0041004D004F0055004E005400010000000000340000005200
      450051005F004100440044004900540049005F0049004E0053005F0053004500
      4300550052004900540059005F00460052000100000000003C00000052004500
      51005F0052004500530050004F004E0053004900420049004C00490054005900
      5F0049004E0053005F0053004500430055005200490054000100000000003400
      00005200450051005F0052004500530050005F0049004E0053005F0053004500
      430055005200490054005F0041004D004F00550054000100000000002E000000
      5200450051005F0052004500530050005F0049004E0053005F00530045004300
      55005200490054005F0046005200010000000000280000005200450051005F00
      5000450052005F004100430043004900440045004E0054005F0049004E005300
      010000000000360000005200450051005F005000450052005F00410043004300
      4900440045004E0054005F0049004E0053005F0041004D004F0055004E005400
      0100000000002E0000005200450051005F005000450052005F00410043004300
      4900440045004E0054005F0049004E0053005F00460052000100000000001000
      00004D00410052004B0041005F0049004400010000000000100000004D004F00
      440045004C005F00490044000100000000001000000043004F004C004F005200
      5F00490044000100000000001400000050004F004C004900430059005F004E00
      55004D000100000000000A0000004100470045004E0054000100000000001000
      00004600520041004E005300480049005A000100000000002800000049004E00
      53005500520045004400410043005400550041004C00560041004C0055004500
      5F0031000100000000000E00000049004E005300530055004D004D0001000000
      00000C0000005400410052004900460046000100000000000E00000041004D00
      4D004F0055004E005400010000000000}
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 184
    object Ins_MotorFullPOLICY_NUM: TWideStringField
      DisplayLabel = 'Polis'
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object Ins_MotorFullNAME: TWideStringField
      DisplayLabel = 'S'#305#287'orta etdir'#601'n'
      FieldName = 'NAME'
      Size = 1538
    end
    object Ins_MotorFullAGENT: TWideStringField
      DisplayLabel = 'Agent'
      FieldName = 'AGENT'
      Size = 1538
    end
    object Ins_MotorFullMARKA: TWideStringField
      FieldName = 'MARKA'
      Size = 65
    end
    object Ins_MotorFullINSUREDSTATENUM: TWideStringField
      DisplayLabel = 'D'#246'vl'#601't '#8470
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_MotorFullFRANSHIZ: TFloatField
      DisplayLabel = 'Fran'#351'iza'
      FieldName = 'FRANSHIZ'
    end
    object Ins_MotorFullINSSUMM: TFloatField
      DisplayLabel = 'S'#305#287'orta m'#601'bl'#601#287'i'
      FieldName = 'INSSUMM'
    end
    object Ins_MotorFullAMMOUNT: TFloatField
      DisplayLabel = 'S'#305#287'orta haqq'#305
      FieldName = 'AMMOUNT'
    end
    object Ins_MotorFullINSUREDACTUALVALUE: TFloatField
      DisplayLabel = 'Avtomobilin d'#601'y'#601'ri'
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_MotorFullTARIFF: TFloatField
      DisplayLabel = 'Tarif'
      FieldName = 'TARIFF'
    end
    object Ins_MotorFullBEGIN_DATE: TDateTimeField
      DisplayLabel = 'Ba'#351'lanma tarixi'
      FieldName = 'BEGIN_DATE'
    end
    object Ins_MotorFullEND_DATE: TDateTimeField
      DisplayLabel = 'Bitm'#601' tarixi'
      FieldName = 'END_DATE'
    end
    object Ins_MotorFullBANKING_DETAILS: TWideStringField
      DisplayLabel = 'Bank rekvizitl'#601'ri'
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_MotorFullINSUREDMODEL: TWideStringField
      DisplayLabel = 'Model'
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object Ins_MotorFullINSUREDMARK: TWideStringField
      DisplayLabel = 'Marka'
      FieldName = 'INSUREDMARK'
      Size = 32
    end
    object Ins_MotorFullINSUREDCOLOR: TWideStringField
      DisplayLabel = 'R'#601'ngi'
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField
      DisplayLabel = 'Burax'#305'l'#305#351' ili'
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_MotorFullINSUREDENGINENUM: TWideStringField
      DisplayLabel = 'M'#252'h'#601'rrikin '#8470'si'
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDNUMSEATS: TIntegerField
      DisplayLabel = 'Ortacaqlar'#305'n say'#305
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_MotorFullINSUREDCHASSISNUM: TWideStringField
      DisplayLabel = #350'assi  '#8470'si'
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_MotorFullTRANSMISSION_TYPE: TWideStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_MotorFullPRESENCE_ALARM: TWideStringField
      DisplayLabel = 'S'#305'qnalizasiya varm'#305
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_MotorFullMOTOR_USAGE: TWideStringField
      DisplayLabel = 'Avtomobilin istifad'#601' xarakteri'
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_MotorFullMOTORSTORAGEPLACE: TWideStringField
      DisplayLabel = 'Avtomobil istifad'#601' olunmad'#305'qda saxland'#305#287#305' yer'
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_MotorFullEXISTINGDAMAGE: TWideStringField
      DisplayLabel = 'M'#246'vcud olan z'#601'd'#601
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TWideStringField
      DisplayLabel = 'S'#305#287'orta t'#601'minat'#305'n'#305'n co'#287'rafi '#601'hat'#601'si'
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_MotorFullINSUREDBODY: TWideStringField
      DisplayLabel = 'Ban '#8470'si'
      FieldName = 'INSUREDBODY'
      Size = 32
    end
    object Ins_MotorFullREQ_KASKO_INS_SECUR: TWideStringField
      DisplayLabel = 'Kasko s'#305#287'ortas'#305
      FieldName = 'REQ_KASKO_INS_SECUR'
      Size = 120
    end
    object Ins_MotorFullREQ_KASKO_INS_SECUR_AMOUNT: TFloatField
      DisplayLabel = 'Kasko s'#305#287'ortas'#305' s'#305#287'.m'#601'bl'#601#287
      FieldName = 'REQ_KASKO_INS_SECUR_AMOUNT'
    end
    object Ins_MotorFullREQ_KASKO_INS_SECUR_FR: TFloatField
      DisplayLabel = 'Kasko s'#305#287'ortas'#305' s'#305#287'.fran'#351'iza'
      FieldName = 'REQ_KASKO_INS_SECUR_FR'
    end
    object Ins_MotorFullREQ_ADDITIONAL_INS_SECURITY: TWideStringField
      DisplayLabel = #399'lav'#601' t'#601'minatlar'
      FieldName = 'REQ_ADDITIONAL_INS_SECURITY'
      Size = 120
    end
    object Ins_MotorFullREQ_ADDITI_INS_SECURITY_AMOUNT: TFloatField
      DisplayLabel = #399'lav'#601' t'#601'minatlar s'#305#287'. m'#601'bl'#601#287'i'
      FieldName = 'REQ_ADDITI_INS_SECURITY_AMOUNT'
    end
    object Ins_MotorFullREQ_ADDITI_INS_SECURITY_FR: TFloatField
      DisplayLabel = #399'lav'#601' t'#601'minatlar s'#305#287'. fran'#351'iza'
      FieldName = 'REQ_ADDITI_INS_SECURITY_FR'
    end
    object Ins_MotorFullREQ_RESPONSIBILITY_INS_SECURIT: TWideStringField
      DisplayLabel = '.'#220#231#252'nc'#252' s'#601'xs qar'#351#305's'#305'nda t.'
      FieldName = 'REQ_RESPONSIBILITY_INS_SECURIT'
      Size = 120
    end
    object Ins_MotorFullREQ_RESP_INS_SECURIT_AMOUT: TFloatField
      DisplayLabel = #220#231#252'nc'#252' s'#601'xs qar'#351#305's'#305'nda t. m'#601'bl'#601#287'i'
      FieldName = 'REQ_RESP_INS_SECURIT_AMOUT'
    end
    object Ins_MotorFullREQ_RESP_INS_SECURIT_FR: TFloatField
      DisplayLabel = #220#231#252'nc'#252' s'#601'xs qar'#351#305's'#305'nda t. fran'#351'iza'
      FieldName = 'REQ_RESP_INS_SECURIT_FR'
    end
    object Ins_MotorFullREQ_PER_ACCIDENT_INS: TWideStringField
      DisplayLabel = 'S'#252'r.s'#601'rni'#351' F'#601'rdi q'#601'za s'#305#287'.'
      FieldName = 'REQ_PER_ACCIDENT_INS'
      Size = 120
    end
    object Ins_MotorFullREQ_PER_ACCIDENT_INS_AMOUNT: TFloatField
      DisplayLabel = 'S'#252'r.s'#601'rni'#351' F'#601'rdi q'#601'za s'#305#287'. m'#601'bl'#601#287'i'
      FieldName = 'REQ_PER_ACCIDENT_INS_AMOUNT'
    end
    object Ins_MotorFullREQ_PER_ACCIDENT_INS_FR: TFloatField
      DisplayLabel = 'S'#252'r.s'#601'rni'#351' F'#601'rdi q'#601'za s'#305#287'. fran'#351'iza'
      FieldName = 'REQ_PER_ACCIDENT_INS_FR'
    end
    object Ins_MotorFullMARKA_ID: TFloatField
      FieldName = 'MARKA_ID'
      Visible = False
    end
    object Ins_MotorFullCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
      Visible = False
    end
    object Ins_MotorFullINSUREDTYPE: TFloatField
      FieldName = 'INSUREDTYPE'
      Visible = False
    end
    object Ins_MotorFullCID: TFloatField
      FieldName = 'CID'
      Required = True
      Visible = False
    end
    object Ins_MotorFullMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
      Visible = False
    end
    object Ins_MotorFullCONTACT_PERSON: TWideStringField
      FieldName = 'CONTACT_PERSON'
      Visible = False
      Size = 128
    end
    object Ins_MotorFullTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Visible = False
    end
    object Ins_MotorFullBROKER: TFloatField
      FieldName = 'BROKER'
      Visible = False
    end
    object Ins_MotorFullPROFITID: TFloatField
      FieldName = 'PROFITID'
      Visible = False
    end
    object Ins_MotorFullMODEL_ID: TFloatField
      FieldName = 'MODEL_ID'
      Visible = False
    end
    object Ins_MotorFullCOLOR_ID: TFloatField
      FieldName = 'COLOR_ID'
      Visible = False
    end
    object Ins_MotorFullKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Visible = False
    end
    object Ins_MotorFullID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
  end
  object MoreThanOneData: TDataSource
    DataSet = MoreThanOne
    Left = 360
    Top = 224
  end
  object MoreThanOne: TOracleDataSet
    SQL.Strings = (
      'select im.rowid,im.* from INS_MOTORMORETHANONEDRIVER im'
      ''
      'where full_id = :full_id order by name')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00460055004C004C005F004900440004000000
      080000000000000000003D4000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000400000049004400010000000000080000004E0041004D00
      45000100000000000E0000005300550052004E0041004D004500010000000000
      140000004600410054004800450052004E0041004D0045000100000000000600
      0000410047004500010000000000140000004500580050004500520049004500
      4E00430045000100000000000E000000460055004C004C005F00490044000100
      000000000E00000048004900530054004F0052005900010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 216
    object MoreThanOneID: TFloatField
      FieldName = 'ID'
    end
    object MoreThanOneNAME2: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
    object MoreThanOneSURNAME: TWideStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object MoreThanOneFATHERNAME: TWideStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
    object MoreThanOneAGE: TIntegerField
      FieldName = 'AGE'
    end
    object MoreThanOneEXPERIENCE: TWideStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object MoreThanOneFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object MoreThanOneHISTORY: TWideStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
  end
  object Accesories: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motor_accesories im'
      ''
      'where full_id = :full_id order by value ')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00460055004C004C005F004900440004000000
      080000000000000000003D4000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000040000004900440001000000000008000000540059005000
      4500010000000000080000004D0041004B0045000100000000000A0000005600
      41004C00550045000100000000001400000048004F0057004300520045004100
      5400450044000100000000000E000000460055004C004C005F00490044000100
      00000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 416
    Top = 264
    object AccesoriesID: TFloatField
      FieldName = 'ID'
    end
    object AccesoriesTYPE: TWideStringField
      FieldName = 'TYPE'
      Size = 32
    end
    object AccesoriesMAKE: TWideStringField
      FieldName = 'MAKE'
      Size = 32
    end
    object AccesoriesVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object AccesoriesHOWCREATED: TWideStringField
      FieldName = 'HOWCREATED'
      Size = 32
    end
    object AccesoriesFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
  end
  object AccesoriesData: TDataSource
    DataSet = Accesories
    Left = 288
    Top = 272
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax,c.contactperson from ins_cus' +
        'tomers c')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000060000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004D004F00420049004C004500500048004F004E00
      45000100000000000E0000004100440044005200450053005300010000000000
      060000004600410058000100000000001A00000043004F004E00540041004300
      540050004500520053004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 168
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 386
    end
    object CustomersADDRESS: TWideStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object CustomersMOBILEPHONE: TWideStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object CustomersFAX: TWideStringField
      FieldName = 'FAX'
      Size = 32
    end
    object CustomersCONTACTPERSON: TWideStringField
      FieldName = 'CONTACTPERSON'
      Size = 256
    end
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 480
    Top = 168
  end
  object SuggestionData: TDataSource
    DataSet = Suggestion
    Left = 480
    Top = 280
  end
  object Suggestion: TOracleDataSet
    SQL.Strings = (
      'select s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A004D004B005F00490044000400000008000000
      0000000000003D4000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000A00000004000000490044000100000000000A0000004D004B005F00
      49004400010000000000160000005200490053004B0041004400440052004500
      530053000100000000002000000049004E0053005500520041004E0043004500
      41004D004D004F0055004E0054000100000000000E00000045004E0044004400
      4100540045000100000000000C000000520053004B005F004900440001000000
      00000C000000460052005A005F00490044000100000000000E00000043004E00
      440054005F00490044000100000000000C000000560041004C005F0049004400
      0100000000001800000049004E0053005500520041004E004300450053005500
      4D00010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 592
    Top = 280
    object SuggestionID: TFloatField
      FieldName = 'ID'
    end
    object SuggestionMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object SuggestionRISKADDRESS: TWideStringField
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
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 480
    Top = 240
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select * from ins_beneficiary')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000080000004E0041004D00
      45000100000000000E0000004100440044005200450053005300010000000000
      0A000000500048004F004E0045000100000000001E000000420041004E004B00
      49004E0047005F00440045005400410049004C005300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 600
    Top = 232
    object ODSBeneficiaryID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBeneficiaryNAME: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSBeneficiaryADDRESS: TWideStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object ODSBeneficiaryPHONE: TWideStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object ODSBeneficiaryBANKING_DETAILS: TWideStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 610
    Top = 122
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where ic.id = :cid'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001600000004000000490044000100000000000E000000540059005000
      45005F00490044000100000000001000000049004E0053005F00440041005400
      45000100000000001400000042004500470049004E005F004400410054004500
      0100000000001000000045004E0044005F004400410054004500010000000000
      12000000560041004C005500540045005F00490044000100000000000E000000
      41004D004D004F0055004E0054000100000000001800000043004C004F005300
      45005F005000520045004600490058000100000000000C0000004B004C004900
      5F0049004400010000000000140000004C004F0041004E004100430043005F00
      490044000100000000001400000043005500520052004100430043005F004900
      44000100000000001400000050004F004C004900430059005F004E0055004D00
      0100000000000E00000049004E005300530055004D004D000100000000001000
      00004600520041004E005300480049005A000100000000000C00000054004100
      52004900460046000100000000000A0000005300540041005400450001000000
      0000100000004100470045004E0054005F004900440001000000000008000000
      50004E0055004D000100000000000C000000420045004E005F00490044000100
      0000000016000000420045004E00450046004900430049004100520059000100
      000000001400000043004F004E0044004900540049004F004E00530001000000
      00000C0000005300550047004E0055004D00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 224
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
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
    object ODSContractsPOLICY_NUM: TWideStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 480
    Top = 205
  end
  object PlgBlank: TPlgModalContainer
    Left = 264
    Top = 94
  end
  object Policy: TOracleDataSet
    SQL.Strings = (
      'select  imp.rowid, imp.* from ins_mf_policy imp'
      'where imp.ms_id= :ms_id')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A004D0053005F00490044000400000008000000
      0000000000D89B4000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000A0000004D0053005F00
      490044000100000000001200000050004F004C004900430059004E0055004D00
      010000000000180000005300550042004A00450043005400560041004C005500
      4500010000000000}
    MasterFields = 'ID'
    DetailFields = 'MS_ID'
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 152
    object PolicyID: TFloatField
      FieldName = 'ID'
    end
    object PolicyMS_ID: TFloatField
      FieldName = 'MS_ID'
    end
    object PolicyPOLICYNUM: TWideStringField
      FieldName = 'POLICYNUM'
    end
    object PolicySUBJECTVALUE: TFloatField
      FieldName = 'SUBJECTVALUE'
    end
  end
  object PolicyData: TDataSource
    DataSet = Policy
    Left = 248
    Top = 136
  end
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 704
    Top = 160
  end
  object More_Report: TOracleDataSet
    SQL.Strings = (
      
        'select id,full_id,name||'#39'  '#39'||surname||'#39'  '#39'||fathername as name,' +
        'age,experience,history from INS_MOTORMORETHANONEDRIVER where ful' +
        'l_id = :full_id'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00460055004C004C005F004900440004000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000000400000049004400010000000000080000004E0041004D00
      4500010000000000060000004100470045000100000000001400000045005800
      500045005200490045004E00430045000100000000000E000000460055004C00
      4C005F00490044000100000000000E00000048004900530054004F0052005900
      010000000000}
    MasterFields = 'ID'
    DetailFields = 'Full_ID'
    Session = sboapiDataModule.SBSession
    Left = 648
    Top = 320
    object More_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object More_ReportFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object More_ReportNAME: TWideStringField
      FieldName = 'NAME'
      Size = 388
    end
    object More_ReportAGE: TIntegerField
      FieldName = 'AGE'
    end
    object More_ReportEXPERIENCE: TWideStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object More_ReportHISTORY: TWideStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
  end
  object MoreReportData: TDataSource
    DataSet = More_Report
    Left = 480
    Top = 320
  end
  object ODSAgents: TOracleDataSet
    SQL.Strings = (
      
        'select a.id,a.name||'#39' '#39'||a.surname||'#39' '#39'||a.fathername as name fr' +
        'om ins_agents a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 728
    Top = 248
    object ODSAgentsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSAgentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object AgentsSource: TDataSource
    DataSet = ODSAgents
    Left = 672
    Top = 248
  end
  object ODSAutoTypes: TOracleDataSet
    SQL.Strings = (
      'select at.rowid,at.* from ins_dict_auto_types at')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 312
    object ODSAutoTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAutoTypesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object DSAutoTypes: TDataSource
    DataSet = ODSAutoTypes
    Left = 344
    Top = 312
  end
  object DSIns_cust: TOracleDataSet
    SQL.Strings = (
      
        'select rowid,surname||'#39' '#39'||name||'#39' '#39'||fathername as name1,id fro' +
        'm ins_customers where close_prefix=0 order by name1')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000000A0000004E0041004D00
      45003100010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 840
    Top = 89
    object DSIns_custID: TIntegerField
      FieldName = 'ID'
    end
    object DSIns_custNAME1: TWideStringField
      FieldName = 'NAME1'
      Size = 1538
    end
  end
  object DSRIns_cust: TDataSource
    DataSet = DSIns_cust
    Left = 936
    Top = 89
  end
  object DScutomers: TOracleDataSet
    SQL.Strings = (
      'select rowid,id ,name from customers'
      'where close_dat is  null'
      
        'and id in (SELECT cust_id  FROM ins_customers where close_prefix' +
        '=0)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 840
    Top = 137
  end
  object DSRcutomers: TDataSource
    DataSet = DScutomers
    Left = 936
    Top = 137
  end
  object DSins_agents: TOracleDataSet
    SQL.Strings = (
      
        'select rowid,id,surname||'#39' '#39'||name||'#39' '#39'||fathername as name from' +
        ' ins_agents ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 840
    Top = 185
    object DSins_agentsID: TFloatField
      FieldName = 'ID'
    end
    object DSins_agentsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1538
    end
  end
  object DSRins_agents: TDataSource
    DataSet = DSins_agents
    Left = 936
    Top = 185
  end
  object DSins_dict_marks: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.id, a.name, a.state_id, a.calcoptions'
      '  FROM ins_dict_marks a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      450001000000000010000000530054004100540045005F004900440001000000
      000016000000430041004C0043004F005000540049004F004E00530001000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 840
    Top = 232
    object DSins_dict_marksID: TFloatField
      FieldName = 'ID'
    end
    object DSins_dict_marksNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1024
    end
    object DSins_dict_marksSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object DSins_dict_marksCALCOPTIONS: TIntegerField
      FieldName = 'CALCOPTIONS'
    end
  end
  object DSRins_dict_marks: TDataSource
    DataSet = DSins_dict_marks
    Left = 936
    Top = 232
  end
  object DSAUtoType: TOracleDataSet
    SQL.Strings = (
      'select a.rowid,a.*from ins_dict_auto_types a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 840
    Top = 288
    object DSAUtoTypeID: TFloatField
      FieldName = 'ID'
    end
    object DSAUtoTypeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
  object DSRAUtoType: TDataSource
    DataSet = DSAUtoType
    Left = 944
    Top = 288
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 408
    Top = 72
  end
  object SB_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'Sb_aca'
    Left = 760
    Top = 320
  end
end
