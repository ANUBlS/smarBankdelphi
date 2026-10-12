object FrmMKSuggestion: TFrmMKSuggestion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'T'#601'klifnam'#601
  ClientHeight = 457
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 396
    Width = 455
    Height = 61
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      455
      61)
    object btPrint: TBitBtn
      Left = 36
      Top = 9
      Width = 69
      Height = 30
      Anchors = []
      Caption = #1063#1072#1087
      DoubleBuffered = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btPrintClick
    end
    object btApply: TBitBtn
      Left = 119
      Top = 9
      Width = 69
      Height = 30
      Anchors = []
      Caption = 'Apply'
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btApplyClick
    end
    object btOk: TBitBtn
      Left = 202
      Top = 9
      Width = 69
      Height = 30
      Anchors = []
      Caption = 'OK'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btOkClick
    end
    object btPolicy: TBitBtn
      Left = 287
      Top = 10
      Width = 69
      Height = 28
      Anchors = []
      Caption = #1055#1086#1083#1080#1089
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7770777777
        77FFFF777807777777FFFF777700777777FFFF77770B077777FFFF770000B077
        77FFFF770BBBBB0777FFFF7770FB000077FFFF7770BBB07777FFFF00000BFB07
        77FFFF0FBBBFBBB077FFFF70FBFB000007FFFF70BFBFB07777FFFF770BFBFB07
        77FFFF770FFFFFF077FFFF7770FBFFBF07FFFF777000000000FF}
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btPolicyClick
    end
    object BitBtn2: TBitBtn
      Left = 365
      Top = 9
      Width = 71
      Height = 30
      Anchors = []
      Cancel = True
      Caption = 'Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
  object lbNonUnicode: TListBox
    Left = 76
    Top = 208
    Width = 131
    Height = 104
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      #1095
      #1103
      #1100
      #1099
      #1102
      #1094
      #1096
      #1072
      #1073
      #1078
      #1076
      #1077
      #1092
      #1101
      #1097
      #1093
      #1080
      #1098
      #1082
      #1075
      #1083
      #1084
      #1085
      #1086
      #1087
      #1088
      #1089
      #1090
      #1091
      #1074
      #1081
      #1079
      #1063
      #1071
      #1068
      #1067
      #1070
      #1062
      #1064
      #1040
      #1041
      #1046
      #1044
      #1045
      #1060
      #1069
      #1065
      #1061
      #1048
      #1066
      #1050
      #1043
      #1051
      #1052
      #1053
      #1054
      #1055
      #1056
      #1057
      #1058
      #1059
      #1042
      #1049
      #1047)
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object Panel2: TXFPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 396
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object XFPanel3: TXFPanel
      Left = 1
      Top = 1
      Width = 453
      Height = 72
      Align = alTop
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object XFLabel1: TXFLabel
        Left = 11
        Top = 16
        Width = 69
        Height = 14
        Caption = 'S'#305#287'orta n'#246'v'#252
      end
      object XFLabel2: TXFLabel
        Left = 11
        Top = 44
        Width = 46
        Height = 14
        Caption = 'S'#305#287'orta'#231#305
        Visible = False
      end
      object DBEdit1: TDBEdit
        Left = 121
        Top = 37
        Width = 293
        Height = 22
        Color = clInactiveBorder
        DataField = 'BANK'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Visible = False
      end
      object Edit1: TEdit
        Left = 121
        Top = 9
        Width = 293
        Height = 22
        Color = clScrollBar
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = 'N'#601'qliyyat vasit'#601'l'#601'rinin kasko s'#305#287'ortas'#305
      end
    end
    object XFGroupBox1: TXFGroupBox
      Left = 1
      Top = 73
      Width = 453
      Height = 78
      Align = alTop
      Caption = 'M'#252#351't'#601'ri haqq'#305'nda m'#601'lumat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object XFLabel3: TXFLabel
        Left = 11
        Top = 21
        Width = 80
        Height = 14
        Caption = 'S'#305#287'orta etdir'#601'n'
      end
      object XFLabel4: TXFLabel
        Left = 11
        Top = 50
        Width = 34
        Height = 14
        Caption = #220'nvan'
      end
      object DBEdit2: TDBEdit
        Left = 121
        Top = 17
        Width = 293
        Height = 22
        Color = clInactiveBorder
        DataField = 'NAME'
        DataSource = DMMKSuggestion.DSCusts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 121
        Top = 43
        Width = 293
        Height = 22
        Color = clInactiveBorder
        DataField = 'ADDRESS'
        DataSource = DMMKSuggestion.DSCusts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object XFGroupBox2: TXFGroupBox
      Left = 1
      Top = 151
      Width = 453
      Height = 244
      Align = alClient
      Caption = 'T'#601'klifnam'#601
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object cbRisk: TCheckBox
        Left = 11
        Top = 17
        Width = 271
        Height = 16
        Caption = 'B'#252't'#252'n T'#601'minatlar '#252'zr'#601' fran'#351'izalar eynidir'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = cbRiskClick
        OnKeyPress = DBEdit5KeyPress
      end
      object cbDifRisk: TCheckBox
        Left = 11
        Top = 39
        Width = 271
        Height = 16
        Caption = 'Fran'#351'izalar m'#252'xt'#601'lifdir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = cbDifRiskClick
        OnKeyPress = DBEdit5KeyPress
      end
      object gbGrid: TXFPanel
        Left = 2
        Top = 81
        Width = 419
        Height = 161
        BevelInner = bvLowered
        TabOrder = 2
        object DBNavigator1: TDBNavigator
          Left = 6
          Top = 8
          Width = 240
          Height = 18
          DataSource = DMMKSuggestion.DSPolicy
          Flat = True
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 32
          Width = 415
          Height = 127
          Align = alBottom
          DataSource = DMMKSuggestion.DSPolicy
          DrawingStyle = gdsGradient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'risk'
              Title.Caption = #1057#1099#1100#1086#1088#1090#1072' '#1090#1103#1084#1080#1085#1072#1090#1099
              Title.Color = clNavy
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RISKS'
              Title.Caption = #1060#1088#1072#1085#1096#1080#1079#1072
              Title.Color = clNavy
              Visible = True
            end>
        end
      end
      object gbSame: TXFGroupBox
        Left = 2
        Top = 70
        Width = 449
        Height = 172
        Align = alBottom
        Caption = 'S'#305#287'orta t'#601'minatlar'#305
        TabOrder = 3
        object XFLabel5: TXFLabel
          Left = 9
          Top = 26
          Width = 58
          Height = 14
          Caption = 'O'#287'urlanma'
        end
        object XFLabel6: TXFLabel
          Left = 9
          Top = 52
          Width = 37
          Height = 14
          Caption = 'Yan'#287#305'n'
        end
        object XFLabel7: TXFLabel
          Left = 9
          Top = 78
          Width = 43
          Height = 14
          Caption = 'Partlay'#305#351
        end
        object XFLabel8: TXFLabel
          Left = 9
          Top = 104
          Width = 112
          Height = 14
          Caption = 'Yol n'#601'qliyyat hadis'#601'si'
        end
        object XFLabel9: TXFLabel
          Left = 10
          Top = 124
          Width = 49
          Height = 14
          Caption = 'H'#601'r-hans'#305
        end
        object XFLabel10: TXFLabel
          Left = 10
          Top = 136
          Width = 124
          Height = 14
          Caption = 'predmentl'#601' toqqu'#351'ma '
        end
        object DBEdit9: TDBEdit
          Left = 182
          Top = 123
          Width = 230
          Height = 22
          DataField = 'IMPACTANYOBJECT'
          DataSource = DMMKSuggestion.DSPolicy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
        object DBEdit8: TDBEdit
          Left = 182
          Top = 97
          Width = 230
          Height = 22
          DataField = 'TRAFFICACCIDENT'
          DataSource = DMMKSuggestion.DSPolicy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
        object DBEdit7: TDBEdit
          Left = 182
          Top = 71
          Width = 230
          Height = 22
          DataField = 'EXPLOSION'
          DataSource = DMMKSuggestion.DSPolicy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
        object DBEdit6: TDBEdit
          Left = 182
          Top = 45
          Width = 230
          Height = 22
          DataField = 'FIRE'
          DataSource = DMMKSuggestion.DSPolicy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 182
          Top = 19
          Width = 230
          Height = 22
          DataField = 'THEFT'
          DataSource = DMMKSuggestion.DSPolicy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = DBEdit5Change
          OnKeyPress = DBEdit5KeyPress
        end
      end
    end
  end
  object SuggestionReport: TINSWordExporter
    Left = 304
    Top = 205
  end
end
