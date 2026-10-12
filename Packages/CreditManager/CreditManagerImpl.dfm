object FrmCreditManager: TFrmCreditManager
  Left = 1
  Top = 129
  Width = 1016
  Height = 533
  ActiveControl = ContractsViewer
  Caption = 'Credit Managment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 533
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter: TSplitter
      Left = 171
      Top = 51
      Width = 2
      Height = 482
      Color = clSilver
      ParentColor = False
      ExplicitHeight = 494
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1016
      Height = 51
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 0
      object MainToolBar: TToolBar
        Left = 2
        Top = 2
        Width = 1012
        Height = 47
        Align = alClient
        ButtonHeight = 37
        ButtonWidth = 100
        Color = clScrollBar
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Images = ImageList1
        ParentColor = False
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
        object TBNew: TToolButton
          Left = 0
          Top = 0
          Caption = '  '#1049#1077#1085#1080' '#1050#1086#1085#1090#1088#1072#1082#1090'   '
          ImageIndex = 0
          OnClick = miInsertClick
        end
        object ToolButton2: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object TBEdit: TToolButton
          Left = 108
          Top = 0
          Caption = '  '#1056#1077#1076#1072#1082#1090#1103'  '
          ImageIndex = 1
          OnClick = miEditContractClick
        end
        object ToolButton4: TToolButton
          Left = 208
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object TBRefresh: TToolButton
          Left = 216
          Top = 0
          Caption = ' '#1049#1077#1085#1080#1083#1103#1084#1103#1082
          ImageIndex = 2
          OnClick = TBRefreshClick
        end
        object ToolButton11: TToolButton
          Left = 316
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object TBOperation: TToolButton
          Left = 324
          Top = 0
          Caption = ' '#1071#1084#1103#1083#1080#1081#1081#1072#1090' '
          DropdownMenu = DropDownMenu
          ImageIndex = 4
          Style = tbsDropDown
        end
        object ToolButton6: TToolButton
          Left = 437
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object TBBalance: TToolButton
          Left = 445
          Top = 0
          Caption = #1060#1072#1080#1079#1083#1103#1088#1080' '#1065#1077#1089#1072#1073
          ImageIndex = 3
          OnClick = miConvertSelectedClick
        end
        object ToolButton8: TToolButton
          Left = 545
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object TBReferences: TToolButton
          Left = 553
          Top = 0
          Caption = #1057#1077#1095#1084#1103#1083#1103#1088
          ImageIndex = 5
          OnClick = TBReferencesClick
        end
        object ToolButton1: TToolButton
          Left = 653
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object TBFilter: TToolButton
          Left = 661
          Top = 0
          Caption = #1060#1080#1083#1090#1077#1088
          ImageIndex = 6
          Style = tbsCheck
          OnClick = TBFilterClick
        end
      end
    end
    object FilterPanel: TPanel
      Left = 0
      Top = 51
      Width = 171
      Height = 482
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 1
      Visible = False
      object GroupBox1: TGroupBox
        Left = 1
        Top = 20
        Width = 169
        Height = 461
        Align = alClient
        Caption = #1060#1080#1083#1090'&'#1077#1088' '#1087#1072#1085#1077#1083#1080
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 2
          Top = 16
          Width = 165
          Height = 82
          Align = alTop
          Caption = #1042#1072#1083#1081#1091#1090#1072' '#1060#1080#1083#1090#1077#1088#1080
          TabOrder = 0
          object CBCurrency: TCheckBox
            Left = 4
            Top = 60
            Width = 152
            Height = 18
            Caption = #1042#1072#1083#1081#1091#1090#1072' '#1092#1080#1083#1090#1077#1088#1080#1085#1076#1103#1085' '#1080#1089#1090#1080#1092#1072#1076#1103
            TabOrder = 0
            OnClick = FilterActionExecute
          end
        end
        object GroupBox4: TGroupBox
          Left = 2
          Top = 98
          Width = 165
          Height = 82
          Align = alTop
          Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1090#1080#1087#1080
          TabOrder = 1
          object CBContractType: TCheckBox
            Left = 4
            Top = 60
            Width = 152
            Height = 18
            Caption = #1058#1080#1087' '#1060#1080#1083#1090#1077#1088#1080#1085#1076#1103#1085' '#1048#1089#1090#1080#1092#1072#1076#1103
            TabOrder = 0
            OnClick = FilterActionExecute
          end
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 180
          Width = 165
          Height = 82
          Align = alTop
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1058#1080#1087#1083#1103#1088#1080
          TabOrder = 2
          object CBClientType: TCheckBox
            Left = 4
            Top = 60
            Width = 152
            Height = 18
            Caption = #1052#1094#1096#1090'.'#1058#1080#1087#1103#1088#1080#1085#1076#1103#1085' '#1048#1089#1090#1080#1092#1072#1076#1103' '
            TabOrder = 0
            OnClick = FilterActionExecute
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 262
          Width = 165
          Height = 197
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 3
          object Image1: TImage
            Left = 5
            Top = 71
            Width = 19
            Height = 18
            Center = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300000000000000000000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020202020
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF2020DF202020FFFFFF20209F3030AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF2020DF8080800000FF4040BF
              30303020209F3030AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060DF00007F0000
              7F0000FF0000FF0000FF0000FF0000BF2020DF0000FF00007FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF5050500000FF0000FF0000FF0000FF00FFFF00FFFF00007F
              0000FF0000FF00007F505050404040FFFFFFFFFFFF3030304040400000FF0000
              FF0000FF0000FF00FFFF00FFFF00007F0000FF0000FF0000FF0000FF40407FFF
              FFFF4040400000FF0000FF0000FF0000FF0000FF0000FF007FFF007FFF0000BF
              0000FF0000FF0000FF0000BFFFFFFFFFFFFFFFFFFF00003F2020DF0000FF0000
              FF0000FF0000FF00FFFF00FFFF00007F0000FF0000FF0000FF0000BF00003FFF
              FFFFFFFFFF20205F2020DF0000FF0000FF0000FF0000FF00FFFF00FFFF00007F
              0000FF0000FF0000FF0000FF0000FF50508F20205F0000FF0000FF0000FF0000
              FF0000FF0000FF00FFFF00FFFF00007F0000FF0000FF0000FF20209F303030FF
              FFFFFFFFFFFFFFFF50508F0000FF0000FF0000FF0000FF00FFFF00FFFF00007F
              0000FF0000FF0000FF3030EFFFFFFFFFFFFFFFFFFFFFFFFF20209F0000FF0000
              FF0000FF0000FF00FFFF00FFFF0000BF0000FF0000FF0000FF0000FF20209FFF
              FFFFFFFFFF3030302020DF3030AF0000BF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF00007F00007F20205FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              7F0000FF0000DF0000BF0000FF3030EF3030EF0000FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF20205F3030EF0000205050500000FF505050
              FFFFFF20205F303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030
              30FFFFFFFFFFFFFFFFFF8080BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Stretch = True
          end
          object Image2: TImage
            Left = 4
            Top = 48
            Width = 19
            Height = 19
            Center = True
            Picture.Data = {
              07544269746D617042010000424D420100000000000076000000280000001100
              0000110000000100040000000000CC0000000000000000000000100000001000
              0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF007777777777777777700000007777777777777777700000007777777774F7
              77777000000077777777444F77777000000077777774444F7777700000007000
              00444F44F7777000000070FFF444F0744F777000000070F8884FF0774F777000
              000070FFFFFFF07774F77000000070F88888F077774F7000000070FFFFFFF077
              7774F000000070F88777F07777774000000070FFFF00007777777000000070F8
              8707077777777000000070FFFF00777777777000000070000007777777777000
              0000777777777777777770000000}
            Stretch = True
          end
          object Image3: TImage
            Left = 4
            Top = 26
            Width = 19
            Height = 18
            Center = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              0000100000000100180000000000000300000000000000000000000000000000
              0000FFFFFFFFFFFF606060808080808080808080808080808080808080808080
              808080808080808080808080808080202020002020009F9F007F7F007F7F007F
              7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F50505080808080
              808000BFBF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF30EFEF40404080808000BFBF00FFFF00FFFF00FFFF00FF
              FF00FFFF30AFAF00000030AFAF00FFFF00FFFF00FFFF00FFFF30EFEF40404040
              404000404000FFFF00FFFF00FFFF00FFFF00FFFF30AFAF00000030AFAF00FFFF
              00FFFF00FFFF00FFFF306F6F808080FFFFFFFFFFFF00BFBF00FFFF00FFFF00FF
              FF00FFFF00FFFF00BFBF00FFFF00FFFF00FFFF00FFFF30EFEF404040404040FF
              FFFFFFFFFF00404000FFFF00FFFF00FFFF00FFFF30CFCF30505000FFFF00FFFF
              00FFFF00FFFF306F6F808080FFFFFFFFFFFFFFFFFFFFFFFF00BFBF00FFFF00FF
              FF00FFFF306F6F00000030EFEF00FFFF00FFFF30EFEF404040404040FFFFFFFF
              FFFFFFFFFFFFFFFF00404000FFFF00FFFF00FFFF002020000000009F9F00FFFF
              00FFFF306F6F808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BFBF00FF
              FF00FFFF000000000000007F7F00FFFF30EFEF404040404040FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF00404000FFFF00FFFF000000000000007F7F00FFFF
              306F6F808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BF
              BF00FFFF30AFAF007F7F30EFEF30EFEF404040404040FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF00404000FFFF00FFFF00FFFF00FFFF306F6F
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00BFBF00FFFF00FFFF30EFEF404040404040FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00404000FFFF00FFFF306F6F606060
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF007F7F30AFAF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Stretch = True
          end
          object CBNotCalculated: TCheckBox
            Tag = -9
            Left = 29
            Top = 73
            Width = 136
            Height = 19
            Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1084#1099#1096#1083#1072#1088
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = FilterActionExecute
          end
          object CBCalcStopped: TCheckBox
            Tag = -11
            Left = 29
            Top = 26
            Width = 131
            Height = 18
            Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1089#1099' '#1044#1072#1081#1072#1085'.'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = FilterActionExecute
          end
          object CBCalculated: TCheckBox
            Tag = -10
            Left = 29
            Top = 48
            Width = 136
            Height = 19
            Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1099#1096#1083#1072#1088
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = FilterActionExecute
          end
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 169
        Height = 19
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 1
        object Panel5: TPanel
          Left = 152
          Top = 2
          Width = 15
          Height = 15
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object BtnCloseFilterPanel: TButton
            Left = 0
            Top = 0
            Width = 15
            Height = 15
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = BtnCloseFilterPanelClick
          end
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 173
      Top = 51
      Width = 843
      Height = 482
      Align = alClient
      Caption = #1050#1088#1077#1076#1080#1090#1083#1103#1088
      TabOrder = 2
      object ContractsViewer: TDBGrid
        Left = 2
        Top = 16
        Width = 839
        Height = 404
        Align = alClient
        DataSource = MainDataModule.DataSrcContracts
        FixedColor = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        PopupMenu = MainMenu
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = ContractsViewerDrawColumnCell
        OnDblClick = miEditContractClick
        OnTitleClick = ContractsViewerTitleClick
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Color = clNavy
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CONTRACTNO'
            Title.Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470
            Title.Color = clNavy
            Width = 93
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            Title.Color = clNavy
            Width = 20
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'OPENDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = #1040#1095#1099#1083#1084#1072' '#1058'.'
            Title.Color = clNavy
            Width = 72
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CLOSEDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = #1041#1072#1100#1083#1072#1085#1084#1072' '#1058'.'
            Title.Color = clNavy
            Width = 74
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'MONTHDAY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = #1070'.'#1058'.'
            Title.Color = clNavy
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CONTRACTACCNO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = #1057#1057#1091#1076#1072' '#1065#1077#1089#1072#1073' '#8470
            Title.Color = clNavy
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRACTACCNAME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = #1065#1077#1089#1072#1073#1099#1085' '#1040#1076#1099
            Title.Color = clNavy
            Width = 155
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'CONTRACTCURRENCY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '   $'
            Title.Color = clNavy
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESIDUARYAMOUNT'
            Title.Caption = '    '#1043#1072#1083#1084#1099#1096' '#1052#1103#1083#1103#1100
            Title.Color = clNavy
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FACTICALDEBT'
            Title.Caption = #1046#1072#1088#1080'  '#1041#1086#1088#1078
            Title.Color = clNavy
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FACTICALINTERESTDEBT'
            Title.Caption = #1046#1072#1088#1080' '#1041#1086#1088#1078'%'
            Title.Color = clNavy
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OVERDUEDEBT'
            Title.Caption = #1052#1094#1076#1076#1103#1090#1080' '#1050#1077#1095'. '#1041#1086#1088#1078
            Title.Color = clNavy
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OVERDUEINTERESTDEBT'
            Title.Caption = #1052#1094#1076#1076#1103#1090#1080' '#1050#1077#1095'. '#1041#1086#1088#1078'%'
            Title.Color = clNavy
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERESTBALANCE'
            Title.Caption = #1060#1072#1080#1079' '#1065#1077#1089'. '#1043#1072#1083#1099#1075
            Title.Color = clNavy
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTBALANCE'
            Title.Caption = #1046#1072#1088#1080' '#1065#1077#1089'. '#1043#1072#1083#1099#1075
            Title.Color = clNavy
            Width = 99
            Visible = True
          end>
      end
      object SearchPanel: TGroupBox
        Left = 2
        Top = 420
        Width = 839
        Height = 60
        Align = alBottom
        Caption = #1040#1093#1090#1072#1088#1099#1096' '#1055#1072#1085#1077#1083#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
        object Panel3: TPanel
          Left = 2
          Top = 17
          Width = 148
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object StaticText1: TStaticText
            Left = 1
            Top = 1
            Width = 146
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditContractNo: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
        object Panel7: TPanel
          Left = 150
          Top = 17
          Width = 147
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object StaticText2: TStaticText
            Left = 1
            Top = 1
            Width = 145
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1057#1057#1091#1076#1072' '#1065#1077#1089#1072#1073' '#8470
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditContractAccNo: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
        object Panel8: TPanel
          Left = 297
          Top = 17
          Width = 148
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object StaticText3: TStaticText
            Left = 1
            Top = 1
            Width = 146
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1060#1072#1080#1079' '#1065#1077#1089#1072#1073' '#8470
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditInterestAccNo: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
        object Panel9: TPanel
          Left = 445
          Top = 17
          Width = 147
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object StaticText4: TStaticText
            Left = 1
            Top = 1
            Width = 145
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditContractAccName: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
        object Panel10: TPanel
          Left = 592
          Top = 17
          Width = 148
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object StaticText5: TStaticText
            Left = 1
            Top = 1
            Width = 146
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1046#1072#1088#1080' '#1041#1086#1088#1078
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditFacticalDebt: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
        object Panel11: TPanel
          Left = 740
          Top = 17
          Width = 147
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object StaticText6: TStaticText
            Left = 1
            Top = 1
            Width = 145
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = #1069#1077#1078#1080#1082#1076#1080#1088#1080#1083#1084#1080#1096' '#1073#1086#1088#1078
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EditOverdueDebt: TEdit
            Left = 2
            Top = 17
            Width = 143
            Height = 23
            TabOrder = 1
            OnExit = EditContractNoExit
            OnKeyPress = EditContractNoKeyPress
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 424
    Top = 168
    Bitmap = {
      494C010109000B00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FFF7FFF7F
      FF7FE07FE07FE07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042E07FFF7FFF7F
      FF7FE07FE07FE07FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07FE07F
      E07FFF7FFF7FFF7FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07F0000E07FE07F
      E07FFF7FFF7FFF7FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000010421042E07FE07F
      E003FF0300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF03E00300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E003FF0300000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008C310821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E71C08210821000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07F00420000
      000000000000000000000000000000000000000000001042FF7FFF7FFF7F0000
      1042FF7FFF7FFF7F000000000000000000000000000000000000000000008410
      E71C000008210821000000000000000000000000000000000000000000001042
      0000000000000000000000000000000000000042E07FFF7F0000000000000042
      004200000000104218631042000000000000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F00000000000000000000000000000000000008218C310821
      B556000008211042104208210000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07F00420000
      000010421863186310420000104210420000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F000000000000000000000000000000008410AD35B5560000
      00000000B556AD35082110428C31000000000000104200000000000000001042
      00000000000000000000E07FE07F000000000042E07FFF7F0000000000000042
      004200001042104218631042000000001042000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F0000000000000000000000000000E71CBD77000000000000
      0000000000000000BD776B2D10428C3100000000104218630000000000000000
      000000000000E07FE07FE07F000000000000000000000000FF7FE07FE07F0000
      000010421863186310420000104210420000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F0000000000000000000000006B2D0000000000000000BD56
      1F00BD5600000000000000006B2D104208210000000000001863000000000000
      104210420000E07FE07F00000000000000000042E07FFF7FFF7FFF7FE07FE07F
      E07F00001042104218631042000000001042000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F000000000000000000000821BD770000000000000000BD56
      1F00BD560000000000000000BD77082110420000000000001042FF7F00001042
      E07FE07FE07FE07F00000000000000000000000000420042E07FE07FFF7F0042
      004210421863186310420000104210420000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F00000000000000000000B556000000000000000000000000
      FF3D000000000000000000000000AD35104200000000000000000000FF7FE07F
      E07FE07FE07F0000000000000000000000000000000000000042004200421042
      186318631042104218631042000000001042000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F00000000000000000000F75E000000000000000000000000
      1F00BD5600000000000000000000EF3D104200000000000000000000FF7F1042
      10420000E07F0000000000000000000000000000000000000000104218631863
      104210421863186310420000104210420000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F00000000000000000000F75E0000000000000000BD56BD56
      BD351F00FF5E0000000000000000EF3D8C31000000000000000000001042FF7F
      1042E07F00000000000000000000000000000000000000000000186310421042
      1863186310421042FF7FFF7F000000001042000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F00000000000000000000CE3900000000000000001F001F00
      BD771F001F0000000000000000004A2984100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104218631863
      10421042FF7FFF7F186318631863FF7F0000000000001042E07FE07FFF7F0000
      1042E07FE07FFF7F0000000000000000000084103967000000000000DD18BD77
      FF5E1F00DD18000000000000B556000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186310421042
      FF7F1863FF7F10021863FF7F10421042000000000000104210421042FF7F0000
      104210421042FF7F00000000000000000000000084107B6F00000000BD77FF3D
      FF3DFF3DBD7700000000F75E0000000000000000000000000000000000000000
      00000000186300000000000000000000000000000000000000001042FF7F1863
      186318631002FF7F104210420000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008410B556BD7700000000
      000000000000BD77B55684100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      FF7FFF7F10421042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000821CE39F75E
      F75EF75ECE390821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186318631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017001700FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      1042186318631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1700170017001700FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186310421863
      1863104218631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631042
      1863186318631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000000000001000104200000000
      0000000000000000000000000000000000000000000000000000104218631863
      1042186318631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F000000000000000010421000000000000000
      0000000010001000100010001000000000000000000000000000186310421863
      1863104218631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F00000000000010000000000000000000
      0000000000001000100010001000000000000000000000000000186318631042
      18631863186310420000000000000000000000000000000000001F001F001F00
      1F001F001F001F000000000000000000000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F0000000010000000000000000000
      0000000000000000100010001000000000000000000000000000104218631863
      1042186318631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000017000000000010000000000000000000
      0000000000001000000010001000000000000000000000000000186310421863
      1863FF7F18631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000010421000000000000000
      000010001000000000000000100000000000000000000000000018631863FF7F
      FF03FF0318631042000000000000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000001042100010001000
      10000000000000000000000000000000000000000000000000001863FF03FF03
      FF03FF0318631042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001863FF03FF03
      10421863FF7F1042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186310421863
      FF7F186318631042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001863FF7F1863
      1863104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001042FF7F1042
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      C00F000000000000C00F000000000000C00F000000000000C00F000000000000
      C007000000000000C007000000000000C01F000000000000F317000000000000
      FF87000000000000FFC7000000000000FF87000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFF9FFFFFE3FFFFFFFF1FFEFF80E7
      C21FFC9FFC7F0001C21FF087DE738000C21FE3838C630000C21FCFE186478000
      C21FBC78E00F0000C21F3C78E01F8000C21F7EFCF81FE000C21F7E7CF83FF000
      C21F783CF83FF000C21F783CFBFFF000C21F3839FBFFF001C21F9833FDBFF007
      FFFFC7C7FFFFF81FFFFFF01FFFFFFE7FFFFFFFFFFFFFFFBFFFFFFF9FFFFFFE0F
      FFFFFF0FFFFFF80FFFFFFE0FFFFFF00FFC7F8007FFFFF00FFC7F8023E7FFF00F
      FC7F8033CF83F00FE00F8039DFC3F00FE00F803CDFE3F00FE00F803EDFD3F00F
      FC7F873FCF3BF00FFC7F803FE0FFF00FFC7F857FFFFFF00FFFFF80FFFFFFF01F
      FFFF81FFFFFFF07FFFFFFFFFFFFFF1FF00000000000000000000000000000000
      000000000000}
  end
  object DropDownMenu: TPopupMenu
    Images = ImageList1
    Left = 338
    Top = 115
    object miTranch: TMenuItem
      Caption = #1058#1088#1072#1085#1096
      ShortCut = 16468
      OnClick = miTranchClick
      OnDrawItem = miContractStateDrawItem
    end
    object miOverdue: TMenuItem
      Caption = #1069#1077#1078#1080#1082#1076#1080#1088#1080#1083#1084#1103
      ShortCut = 16453
      OnClick = miOverdueClick
      OnDrawItem = miContractStateDrawItem
    end
    object miPayment: TMenuItem
      Caption = #1070#1076#1103#1084#1103
      ShortCut = 16464
      OnClick = miPaymentClick
      OnDrawItem = miContractStateDrawItem
    end
    object miProlongation: TMenuItem
      Caption = #1055#1088#1086#1083#1086#1085#1075#1072#1089#1080#1081#1072
      ShortCut = 16462
      OnClick = miProlongationClick
      OnDrawItem = miContractStateDrawItem
    end
  end
  object MainMenu: TPopupMenu
    Images = ImageList1
    OwnerDraw = True
    Left = 433
    Top = 311
    object miContractState: TMenuItem
      Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1044#1102#1074#1088#1094#1081#1081#1103#1083#1103#1088#1080
      ShortCut = 112
      OnClick = miContractStateClick
      OnDrawItem = miContractStateDrawItem
    end
    object N8: TMenuItem
      Caption = #1070#1076#1103#1084#1103' '#1087#1083#1072#1085#1099
      ShortCut = 114
      OnClick = N8Click
      OnDrawItem = miContractStateDrawItem
    end
    object N3: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object miInsert: TMenuItem
      Caption = #1049#1077#1085#1080' '
      ImageIndex = 0
      ShortCut = 45
      OnClick = miInsertClick
      OnDrawItem = miContractStateDrawItem
    end
    object miEditContract: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1103
      Default = True
      ImageIndex = 1
      ShortCut = 49221
      OnClick = miEditContractClick
      OnDrawItem = miContractStateDrawItem
    end
    object miEnableDisableCalculation: TMenuItem
      Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1085#1099' '#1044#1072#1081#1072#1085#1076#1099#1088#1084#1072#1075' / '#1044#1072#1074#1072#1084' '#1077#1090#1076#1080#1088#1084#1103#1082' ...'
      ShortCut = 16452
      OnClick = miEnableDisableCalculationClick
      OnDrawItem = miContractStateDrawItem
    end
    object miRefresh: TMenuItem
      Caption = #1049#1077#1085#1080#1083#1103#1084#1103#1082
      ImageIndex = 2
      ShortCut = 116
      OnDrawItem = miContractStateDrawItem
    end
    object N1: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object miConvertSelected: TMenuItem
      Caption = #1060#1072#1080#1079#1080'('#1083#1103#1088#1080') '#1097#1077#1089#1072#1073#1083#1072
      ImageIndex = 3
      ShortCut = 16456
      OnClick = miConvertSelectedClick
      OnDrawItem = miContractStateDrawItem
    end
    object N4: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object Trach1: TMenuItem
      Caption = #1058#1088#1072#1085#1096
      ShortCut = 16468
      OnClick = miTranchClick
      OnDrawItem = miContractStateDrawItem
    end
    object Expire1: TMenuItem
      Caption = #1069#1077#1078#1080#1082#1076#1080#1088#1080#1083#1084#1103
      ShortCut = 16453
      OnClick = miOverdueClick
      OnDrawItem = miContractStateDrawItem
    end
    object Payment1: TMenuItem
      Caption = #1070#1076#1103#1084#1103
      ShortCut = 16464
      OnClick = miPaymentClick
      OnDrawItem = miContractStateDrawItem
    end
    object Prolongation1: TMenuItem
      Caption = #1055#1088#1086#1083#1086#1085#1075#1072#1089#1080#1081#1072
      ShortCut = 16462
      OnClick = miProlongationClick
      OnDrawItem = miContractStateDrawItem
    end
    object miReserveCont: TMenuItem
      Caption = #1050#1088#1077#1076#1080#1090#1103' '#1072#1081#1088#1099#1083#1072#1085' '#1077#1097#1090#1080#1081#1072#1090#1083#1072#1088#1099#1085' '#1081#1077#1085#1080#1083#1103#1085#1084#1103#1089#1080
      OnClick = miReserveContClick
      OnDrawItem = miContractStateDrawItem
    end
    object N7: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object miExport: TMenuItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' ...'
      OnClick = miExportClick
      OnDrawItem = miContractStateDrawItem
    end
    object N9: TMenuItem
      Caption = #1040#1088#1093#1080#1074' ...'
      OnClick = N9Click
      OnDrawItem = miContractStateDrawItem
    end
    object N5: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object miPanelofFilter: TMenuItem
      Caption = #1060#1080#1083#1090#1077#1088' '#1087#1072#1085#1077#1083#1080
      ImageIndex = 6
      ShortCut = 16454
      OnClick = miPanelofFilterClick
      OnDrawItem = miContractStateDrawItem
    end
    object miFilter: TMenuItem
      Caption = #1060#1080#1083#1090#1077#1088
      SubMenuImages = StatusImages
      OnDrawItem = miContractStateDrawItem
      object miCalculateds: TMenuItem
        Tag = -10
        Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1099#1096#1083#1072#1088
        Checked = True
        ImageIndex = 1
        OnClick = miCalculatedsClick
        OnDrawItem = miContractStateDrawItem
      end
      object miCalculationStopped: TMenuItem
        Tag = -11
        Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1089#1099' '#1076#1072#1081#1072#1085#1076#1099#1088#1099#1083#1084#1099#1096#1083#1072#1088
        Checked = True
        ImageIndex = 2
        OnClick = miCalculationStoppedClick
        OnDrawItem = miContractStateDrawItem
      end
      object miNotCalculated: TMenuItem
        Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1084#1099#1096#1083#1072#1088
        Checked = True
        ImageIndex = 0
        OnClick = miNotCalculatedClick
        OnDrawItem = miContractStateDrawItem
      end
    end
    object miSearchPanel: TMenuItem
      Caption = #1040#1093#1090#1072#1088#1099#1096' '#1087#1072#1085#1077#1083#1080
      ImageIndex = 8
      ShortCut = 49235
      OnClick = miSearchPanelClick
      OnDrawItem = miContractStateDrawItem
    end
    object N6: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object CloseCurrentContract1: TMenuItem
      Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080' '#1041#1072#1100#1083#1072#1084#1072#1075' '
      ShortCut = 119
      OnClick = CloseCurrentContract1Click
      OnDrawItem = miContractStateDrawItem
    end
    object N2: TMenuItem
      Caption = '-'
      OnDrawItem = miContractStateDrawItem
    end
    object miSelectAll: TMenuItem
      Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
      ShortCut = 16449
      OnClick = miSelectAllClick
      OnDrawItem = miContractStateDrawItem
    end
  end
  object StatusImages: TImageList
    Left = 489
    Top = 144
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000841084100000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C311042104210421042
      1042104210421042104210421042104284100000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000846C8410
      0000844CC6540000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000008010604EE03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03D4A29104210420000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000007C846C
      1042007C085DC618844CC6540000000000000000000000000000000000000000
      0000170017001700FF7F0000000000000000E05EE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FA677082110420000000000000000000000000000
      000000000000000000000000000000000000000000008C6D003C003C007C007C
      007C007C005C846C007C003C0000000000000000000000000000000000000000
      1700170017001700FF7F0000000000000000E05EE07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA677082108210000000000000000000000000000
      000000000000000000000000000000000000000000004A29007C007C007C007C
      E07FE07F003C007C007C003C4A29082100000000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000021E07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA635104200000000000000000000000000000000
      0000000000000000000000000000000000000000C6180821007C007C007C007C
      E07FE07F003C007C007C007C007C083D000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000E05EE07FE07FE07FE07FE07F
      E05EE07FE07FE07FE07FA6770821082100000000000000000000000000000000
      0000000000000000000000000000000000000821007C007C007C007C007C007C
      E07DE07D005C007C007C007C005C0000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F0000000000000021E07FE07FE07FE07F2667
      4629E07FE07FE07FE07FA6351042000000000000000000000000000000000000
      0000000000000000000000000000000000000000001C846C007C007C007C007C
      E07FE07F003C007C007C007C005C001C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F000000000000E05EE07FE07FE07FA635
      0000A677E07FE07FA67708210821000000000000000000000000000000000000
      0000000000000000000000000000000000000000842C846C007C007C007C007C
      E07FE07F003C007C007C007C007C007C4A4500000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F000000000021E07FE07FE07F8010
      0000604EE07FE07FA63510420000000000000000000000000000000000000000
      000000000000000000000000000000000000842C007C007C007C007C007C007C
      E07FE07F003C007C007C007C844CC618000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000000000001700000000000000E05EE07FE07F0000
      0000E03DE07FA677082108210000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A45007C007C007C007C
      E07FE07F003C007C007C007CC6740000000000000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000000000021E07FE07F0000
      0000E03DE07FA635104200000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844C007C007C007C007C
      E07FE07F005C007C007C007C007C844C000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000E05EE07FA656
      E03DA677A6770821082100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000C618846CC654005C007C007C
      007C007C007C007C007C003C003C842C000000000000FF7F1042104200000000
      00000000000000000000000000000000000000000000000000000021E07FE07F
      E07FE07FA6351042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003C007C006C
      005C007CC674C674007C000000000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000E05EE07F
      E07FA67708210821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000842CC6740010
      4A29007C4A290000842CC6180000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000021E07F
      E07FA6358C310000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C61800000000
      0000105E00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E03D
      A656000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF3FFFFFC0000000F93FFF9F00000000
      F807FF0F00000000C007FE0F00000000C0018007000100008001802380010000
      000380338003000080018039C00300008000803CC00700000001803EE0070000
      C003873FE00F0000C001803FF00F00008001857FF01F0000F00F80FFF81F0000
      F02781FFF83F0000F77FFFFFFC7F000000000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Left = 561
    Top = 159
    object FilterAction: TAction
      OnExecute = FilterActionExecute
    end
    object SearchAction: TAction
      OnExecute = SearchActionExecute
    end
  end
end
