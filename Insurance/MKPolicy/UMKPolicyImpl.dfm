object fmMKPolicy: TfmMKPolicy
  Left = 453
  Top = 197
  Width = 389
  Height = 405
  Caption = 'fmMKPolicy'
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
  object lbNonUnicode: TListBox
    Left = 17
    Top = 422
    Width = 131
    Height = 105
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ItemHeight = 15
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
    TabOrder = 0
    Visible = False
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 316
    Width = 389
    Height = 89
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      389
      89)
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 9
      Top = 9
      Width = 201
      Height = 22
      DataField = 'UNDERTABLE'
      DataSource = DSPolicy
      KeyField = 'TEMPLATE'
      ListField = 'NAME'
      ListSource = DSTemplates
      TabOrder = 0
      Visible = False
    end
    object btApply: TBitBtn
      Left = 64
      Top = 40
      Width = 70
      Height = 27
      Anchors = []
      Caption = '&Apply'
      DoubleBuffered = True
      Enabled = False
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
    object btPrint: TBitBtn
      Left = 137
      Top = 40
      Width = 71
      Height = 27
      Anchors = []
      Caption = #1063#1072#1087
      DoubleBuffered = True
      Enabled = False
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
      TabOrder = 2
      OnClick = btPrintClick
    end
    object btOk: TBitBtn
      Left = 213
      Top = 40
      Width = 70
      Height = 27
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
      TabOrder = 3
      OnClick = btOkClick
    end
    object btCancel: TBitBtn
      Left = 287
      Top = 41
      Width = 87
      Height = 26
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
      OnClick = btCancelClick
    end
    object BitBtn1: TBitBtn
      Left = 287
      Top = 6
      Width = 87
      Height = 27
      Anchors = []
      Caption = #1071#1083#1072#1074#1103'/'#1056#1077#1076#1072#1082#1090#1103
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 213
      Top = 6
      Width = 70
      Height = 27
      Anchors = []
      Caption = #1071#1083#1072#1074#1103#1083#1103#1088
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
  end
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 0
    Width = 389
    Height = 316
    Align = alClient
    Caption = 'N'#601'qliyyat vasit'#601'l'#601'rinin (KASKO) s'#305#287'orta '#351#601'had'#601'tnam'#601'si'
    TabOrder = 2
    object XFGroupBox2: TXFGroupBox
      Left = 2
      Top = 57
      Width = 385
      Height = 62
      Align = alTop
      Caption = 'S'#305#287'orta hadis'#601'si'
      TabOrder = 0
      object BitBtn4: TBitBtn
        Left = 283
        Top = 35
        Width = 93
        Height = 22
        Caption = #1057#1099#1100'.'#1082#1072#1088#1090#1099
        DoubleBuffered = True
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
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object BitBtn3: TBitBtn
        Left = 283
        Top = 8
        Width = 93
        Height = 23
        Caption = #1055#1086#1083#1080#1089#1103' '#1103#1083#1072#1074#1103
        DoubleBuffered = True
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
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object cbRisk: TXFCheckBox
        Left = 9
        Top = 18
        Width = 190
        Height = 17
        Caption = 'B'#252't'#252'n t'#601'minatlar '#252'zr'#601' fran'#351'izalar eynidir'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbRiskClick
      end
      object cbDifRisk: TXFCheckBox
        Left = 9
        Top = 39
        Width = 137
        Height = 17
        Caption = 'Fran'#351'izalar m'#252'xt'#601'lifdir'
        TabOrder = 3
        OnClick = cbDifRiskClick
      end
    end
    object XFPanel2: TXFPanel
      Left = 2
      Top = 16
      Width = 385
      Height = 41
      Align = alTop
      TabOrder = 1
      object XFLabel1: TXFLabel
        Left = 7
        Top = 11
        Width = 107
        Height = 14
        Caption = #350#601'had'#601'tnam'#601' n'#246'mr'#601'si'
      end
      object DBEdit7: TDBEdit
        Left = 148
        Top = 6
        Width = 191
        Height = 22
        Color = clScrollBar
        DataField = 'POLICY_NUM'
        DataSource = DSContracts
        Enabled = False
        TabOrder = 0
        OnKeyPress = DBEdit7KeyPress
      end
    end
    object gbGrid: TXFGroupBox
      Left = 2
      Top = 119
      Width = 385
      Height = 195
      Align = alClient
      TabOrder = 2
      object DBNavigator1: TDBNavigator
        Left = 2
        Top = 16
        Width = 381
        Height = 27
        DataSource = DSPolicy
        Align = alTop
        Flat = True
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 43
        Width = 381
        Height = 150
        Align = alClient
        DataSource = DSPolicy
        DrawingStyle = gdsGradient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
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
      Top = 119
      Width = 385
      Height = 195
      Align = alClient
      Caption = 'S'#305#287'orta t'#601'minatlar'#305
      TabOrder = 3
      object XFLabel2: TXFLabel
        Left = 9
        Top = 25
        Width = 52
        Height = 14
        Caption = 'O'#287'urlanma'
      end
      object XFLabel3: TXFLabel
        Left = 9
        Top = 48
        Width = 34
        Height = 14
        Caption = 'Yan'#287#305'n'
      end
      object XFLabel4: TXFLabel
        Left = 9
        Top = 76
        Width = 41
        Height = 14
        Caption = 'Partlay'#305#351
      end
      object XFLabel5: TXFLabel
        Left = 9
        Top = 100
        Width = 105
        Height = 14
        Caption = 'Yol n'#601'qliyyat hadis'#601'si'
      end
      object XFLabel6: TXFLabel
        Left = 9
        Top = 125
        Width = 102
        Height = 28
        Caption = 'H'#601'r hans'#305'  predmetl'#601' toqqu'#351'ma'
        WordWrap = True
      end
      object DBEdit5: TDBEdit
        Left = 146
        Top = 123
        Width = 217
        Height = 22
        DataField = 'IMPACTANYOBJECT'
        DataSource = DSPolicy
        TabOrder = 0
        OnKeyPress = DBEdit7KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 146
        Top = 97
        Width = 217
        Height = 22
        DataField = 'TRAFFICACCIDENT'
        DataSource = DSPolicy
        TabOrder = 1
        OnKeyPress = DBEdit7KeyPress
      end
      object DBEdit3: TDBEdit
        Left = 146
        Top = 71
        Width = 217
        Height = 22
        DataField = 'EXPLOSION'
        DataSource = DSPolicy
        TabOrder = 2
        OnKeyPress = DBEdit7KeyPress
      end
      object DBEdit2: TDBEdit
        Left = 146
        Top = 45
        Width = 217
        Height = 22
        DataField = 'FIRE'
        DataSource = DSPolicy
        TabOrder = 3
        OnKeyPress = DBEdit7KeyPress
      end
      object DBEdit1: TDBEdit
        Left = 146
        Top = 19
        Width = 217
        Height = 22
        DataField = 'THEFT'
        DataSource = DSPolicy
        TabOrder = 4
        OnKeyPress = DBEdit7KeyPress
      end
      object hbErrMsg: THintBox
        Left = 0
        Top = 170
        Width = 269
        Height = 19
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'hbErrMsg'
        TabOrder = 5
        Visible = False
        HintStyle = hsError
        Timeout = 4000
        BeepOnMessage = False
      end
    end
  end
  object ODSPolicy: TOracleDataSet
    SQL.Strings = (
      'select imp.rowid, imp.* from ins_mk_policy imp'
      'where '
      'imp.CID = :CID')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000C00000004000000490044000100000000000A000000540048004500
      4600540001000000000008000000460049005200450001000000000012000000
      4500580050004C004F00530049004F004E000100000000001E00000054005200
      410046004600490043004100430043004900440045004E005400010000000000
      1E00000049004D00500041004300540041004E0059004F0042004A0045004300
      54000100000000001C0000004E00410054004300410054004100530054005200
      4F005000480045000100000000001200000050004F004C004900430059004E00
      55004D000100000000001400000055004E004400450052005400410042004C00
      4500000000000000060000004300490044000100000000000A00000052004900
      53004B005300010000000000080000004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSPolicyAfterInsert
    AfterEdit = ODSPolicyAfterEdit
    Left = 272
    Top = 32
    object ODSPolicyID: TFloatField
      FieldName = 'ID'
    end
    object ODSPolicyTHEFT: TFloatField
      FieldName = 'THEFT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyFIRE: TFloatField
      FieldName = 'FIRE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyEXPLOSION: TFloatField
      FieldName = 'EXPLOSION'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyTRAFFICACCIDENT: TFloatField
      FieldName = 'TRAFFICACCIDENT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyIMPACTANYOBJECT: TFloatField
      FieldName = 'IMPACTANYOBJECT'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyNATCATASTROPHE: TFloatField
      FieldName = 'NATCATASTROPHE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ODSPolicyPOLICYNUM: TWideStringField
      FieldName = 'POLICYNUM'
    end
    object ODSPolicyUNDERTABLE: TBlobField
      FieldName = 'UNDERTABLE'
      BlobType = ftOraBlob
    end
    object ODSPolicyCID: TFloatField
      FieldName = 'CID'
    end
    object ODSPolicyRISKS: TFloatField
      FieldName = 'RISKS'
    end
    object ODSPolicyNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ODSPolicyrisk: TWideStringField
      FieldKind = fkLookup
      FieldName = 'risk'
      LookupDataSet = ODSRisk
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'NAME'
      Size = 256
      Lookup = True
    end
  end
  object DSPolicy: TDataSource
    DataSet = ODSPolicy
    Left = 240
    Top = 32
  end
  object DSAvalute: TDataSource
    Left = 216
    Top = 208
  end
  object INSWordExporter: TINSWordExporter
    Left = 224
    Top = 72
  end
  object ODSReport: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME,'
      
        '       ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME2,'
      
        '       ic.address insuredaddress,ic.mobilephone,ic.homephone,ins' +
        'uredtype, insuredcolor as inscolor,lower(insuredcolor)||'#39' ,'#39'||lo' +
        'wer(insuredtype)||'#39', '#39'||insuredoutputyear as insuredcolor, insur' +
        'edoutputyear,'
      
        '       insuredmark||'#39'  '#39'||  insuredmodel as insuredmodel, insure' +
        'dstatenum, underframenum, insuredbannum,'
      
        '       insuredenginenum,driveintended,numseats,extrafranshiz,im.' +
        'franshiz,'
      
        '       ins_pkg_motorkasco.getdraccesspeople(im.id) AS driveacces' +
        'spiople,'
      
        '       ins_pkg_motorkasco.getAccessoriesName(ict.id) AS accessor' +
        'iesname,'
      '       im.drivecost as avtocost, im.inssumm,  '
      '       to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate, '
      #9'to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate2, '
      '       to_char(ict.ins_date, '#39'dd/mm/yyyy'#39') insdate,'
      '       to_char(ict.end_date, '#39'dd/mm/yyyy'#39') enddate, '
      '       ict.policy_num policynum,ict.beneficiary,ict.conditions,'
      '       theft,fire, explosion,trafficaccident, impactanyobject,'
      '       im.ammount,ic.sex,'
      '       val.valu_name valute,val.val_name , '
      '       ia.surname||'#39' '#39'||ia.name||'#39' '#39'||ia.fathername as agent, '
      '       ict.loanacc_id, ict.curracc_id'
      '  FROM ins_contracts ict,'
      '       ins_motorkasco im,      '
      '       ins_mk_policy imp,'
      '       ins_customers ic,'
      '       avalute val,'
      '       ins_agents ia'
      ' WHERE '
      'ic.ID = ict.kli_id '
      'and ict.id = im.cid'
      'and ict.id = imp.cid  '
      'and ict.valute_id = val.valute(+)'
      'and ict.agent_id = ia.id(+)'
      'and ict.id = :CID'
      ''
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A0043004900440003000000040000002B010000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0500000029000000080000004E0041004D004500010000000000160000004900
      4E00530055005200450044005400590050004500010000000000180000004900
      4E005300550052004500440043004F004C004F00520001000000000022000000
      49004E00530055005200450044004F0055005400500055005400590045004100
      52000100000000001800000049004E00530055005200450044004D004F004400
      45004C000100000000001E00000049004E005300550052004500440053005400
      4100540045004E0055004D000100000000001A00000055004E00440045005200
      4600520041004D0045004E0055004D000100000000001A00000049004E005300
      5500520045004400420041004E004E0055004D00010000000000200000004900
      4E005300550052004500440045004E00470049004E0045004E0055004D000100
      0000000022000000440052004900560045004100430043004500530053005000
      49004F0050004C0045000100000000001200000042004500470049004E004400
      4100540045000100000000001200000050004F004C004900430059004E005500
      4D000100000000000A0000005400480045004600540001000000000008000000
      4600490052004500010000000000120000004500580050004C004F0053004900
      4F004E000100000000001E000000540052004100460046004900430041004300
      43004900440045004E0054000100000000001E00000049004D00500041004300
      540041004E0059004F0042004A004500430054000100000000000E0000004500
      4E00440044004100540045000100000000001400000042004500470049004E00
      44004100540045003200010000000000140000004C004F0041004E0041004300
      43005F0049004400010000000000140000004300550052005200410043004300
      5F00490044000100000000000C000000560041004C0055005400450001000000
      00000A0000004100470045004E0054000100000000000A0000004E0041004D00
      450032000100000000001E0000004100430043004500530053004F0052004900
      450053004E0041004D0045000100000000000E00000049004E00530044004100
      5400450001000000000016000000420045004E00450046004900430049004100
      52005900010000000000060000005300450058000100000000001A0000004400
      520049005600450049004E00540045004E004400450044000100000000001400
      000043004F004E0044004900540049004F004E00530001000000000010000000
      4E0055004D00530045004100540053000100000000001A000000450058005400
      520041004600520041004E005300480049005A00010000000000100000004600
      520041004E005300480049005A00010000000000100000004100560054004F00
      43004F00530054000100000000000E00000049004E005300530055004D004D00
      0100000000000E00000041004D004D004F0055004E0054000100000000001C00
      000049004E005300550052004500440041004400440052004500530053000100
      00000000160000004D004F00420049004C004500500048004F004E0045000100
      000000001200000048004F004D004500500048004F004E004500010000000000
      1000000049004E00530043004F004C004F005200010000000000100000005600
      41004C005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 152
    object ODSReportNAME: TWideStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSReportINSUREDTYPE: TWideStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSReportINSUREDCOLOR: TWideStringField
      FieldName = 'INSUREDCOLOR'
      Size = 128
    end
    object ODSReportINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSReportINSUREDMODEL: TWideStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSReportINSUREDSTATENUM: TWideStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSReportUNDERFRAMENUM: TWideStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSReportINSUREDBANNUM: TWideStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSReportDRIVEACCESSPIOPLE: TWideStringField
      FieldName = 'DRIVEACCESSPIOPLE'
      Size = 258
    end
    object ODSReportINSUREDENGINENUM: TWideStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSReportACCESSORIESNAME: TWideStringField
      FieldName = 'ACCESSORIESNAME'
      Size = 4000
    end
    object ODSReportBEGINDATE: TWideStringField
      FieldName = 'BEGINDATE'
      Size = 10
    end
    object ODSReportINSDATE: TWideStringField
      FieldName = 'INSDATE'
      Size = 10
    end
    object ODSReportENDDATE: TWideStringField
      FieldName = 'ENDDATE'
      Size = 10
    end
    object ODSReportPOLICYNUM: TWideStringField
      FieldName = 'POLICYNUM'
    end
    object ODSReportTHEFT: TFloatField
      FieldName = 'THEFT'
    end
    object ODSReportFIRE: TFloatField
      FieldName = 'FIRE'
    end
    object ODSReportTRAFFICACCIDENT: TFloatField
      FieldName = 'TRAFFICACCIDENT'
    end
    object ODSReportIMPACTANYOBJECT: TFloatField
      FieldName = 'IMPACTANYOBJECT'
    end
    object ODSReportEXPLOSION: TFloatField
      FieldName = 'EXPLOSION'
    end
    object ODSReportAGENT: TWideStringField
      FieldName = 'AGENT'
      Size = 386
    end
    object ODSReportVALUTE: TWideStringField
      DisplayWidth = 20
      FieldName = 'VALUTE'
      Size = 30
    end
    object ODSReportBENEFICIARY: TWideStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSReportLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSReportCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSReportDRIVEINTENDED: TWideStringField
      FieldName = 'DRIVEINTENDED'
      Size = 128
    end
    object ODSReportSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSReportavtointend: TWideStringField
      FieldKind = fkLookup
      FieldName = 'avtointend'
      LookupDataSet = ODSAvtoIntend
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'DRIVEINTENDED'
      Size = 32
      Lookup = True
    end
    object ODSReportNUMSEATS: TWideStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
    object ODSReportFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSReportEXTRAFRANSHIZ: TWideStringField
      FieldName = 'EXTRAFRANSHIZ'
      Size = 32
    end
    object ODSReportAVTOCOST: TFloatField
      FieldName = 'AVTOCOST'
    end
    object ODSReportINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSReportAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSReportINSUREDADDRESS: TWideStringField
      FieldName = 'INSUREDADDRESS'
      Size = 1024
    end
    object ODSReportMOBILEPHONE: TWideStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSReportHOMEPHONE: TWideStringField
      FieldName = 'HOMEPHONE'
      Size = 32
    end
    object ODSReportINSCOLOR: TWideStringField
      FieldName = 'INSCOLOR'
      Size = 32
    end
    object ODSReportVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 320
    Top = 112
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where ic.id =:CID'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400030000000000000000000000}
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
      50004E0055004D0001000000000016000000420045004E004500460049004300
      49004100520059000100000000000C000000420045004E005F00490044000100
      000000001400000043004F004E0044004900540049004F004E00530001000000
      00000C0000005300550047004E0055004D00010000000000}
    Session = sboapiDataModule.SBSession
    AfterEdit = ODSContractsAfterEdit
    Left = 216
    Top = 40
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
    object ODSContractsPOLICY_NUM: TWideStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object ODSContractsINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSContractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSContractsTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object ODSContractsSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object ODSContractsBENEFICIARY: TWideStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSContractsSUGNUM: TWideStringField
      FieldName = 'SUGNUM'
      Size = 32
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 240
    Top = 65528
  end
  object DSTemplates: TDataSource
    DataSet = ODSTemplates
    Left = 152
    Top = 200
  end
  object ODSTemplates: TOracleDataSet
    SQL.Strings = (
      'select ibt.rowid, ibt.* from INS_BLOB_TEMPLATES ibt')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      450001000000000010000000540045004D0050004C0041005400450000000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 184
    Top = 160
    object ODSTemplatesID: TFloatField
      FieldName = 'ID'
    end
    object ODSTemplatesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSTemplatesTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      BlobType = ftOraBlob
    end
  end
  object OPMKKASCO: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_PKG_MOTORKASCO'
    Left = 304
    Top = 72
  end
  object DSCustomers: TDataSource
    DataSet = ODSCustomers
    Left = 168
    Top = 112
  end
  object ODSCustomers: TOracleDataSet
    SQL.Strings = (
      
        'select rowid,id,sex,insured_typeid,name||'#39' '#39'||surname||'#39' '#39'||fath' +
        'ername as name from ins_customers where id=:kli_id')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004B004C0049005F0049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001C00000049004E005300
      55005200450044005F0054005900500045004900440001000000000008000000
      4E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 112
    object ODSCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustomersINSURED_TYPEID: TIntegerField
      FieldName = 'INSURED_TYPEID'
    end
    object ODSCustomersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
  object ODSMotorkasko: TOracleDataSet
    SQL.Strings = (
      'select mk.rowid, mk.* from ins_motorkasco mk '
      'where cid=:cid')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001C00000004000000490044000100000000001600000049004E005300
      550052004500440054005900500045000100000000001800000049004E005300
      550052004500440043004F004C004F0052000100000000002200000049004E00
      530055005200450044004F005500540050005500540059004500410052000100
      000000001E00000049004E005300550052004500440053005400410054004500
      4E0055004D000100000000001A00000055004E00440045005200460052004100
      4D0045004E0055004D000100000000001A00000049004E005300550052004500
      4400420041004E004E0055004D000100000000002000000049004E0053005500
      52004500440045004E00470049004E0045004E0055004D000100000000001A00
      00004400520049005600450049004E00540045004E0044004500440001000000
      0000120000004400520049005600450043004F00530054000100000000001200
      000042004500470049004E0044004100540045000100000000000E0000004500
      4E00440044004100540045000100000000000C00000054005900500045004900
      44000100000000001800000043004C004F00530045005F005000520045004600
      490058000100000000000E000000420041004E004B005F004900440001000000
      0000100000004D004F004E00540048005F004900440001000000000016000000
      49004E00530055005200450044004D00410052004B0001000000000018000000
      49004E00530055005200450044004D004F00440045004C000100000000000600
      00004300490044000100000000001400000043004C00410049004D005F004400
      4100540045000100000000001200000043004C00410049004D005F004E005500
      4D000100000000000800000041005200450041000100000000000E0000004100
      430054005F004E0055004D00010000000000100000004600520041004E005300
      480049005A000100000000000C00000054004100520049004600460001000000
      00000E00000049004E005300530055004D004D000100000000000E0000004100
      4D004D004F0055004E005400010000000000100000004E0055004D0053004500
      410054005300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 274
    Top = 156
    object ODSMotorkaskoID: TFloatField
      FieldName = 'ID'
    end
    object ODSMotorkaskoCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
    object ODSMotorkaskoINSUREDTYPE: TWideStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSMotorkaskoINSUREDCOLOR: TWideStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSMotorkaskoINSUREDSTATENUM: TWideStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSMotorkaskoUNDERFRAMENUM: TWideStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDBANNUM: TWideStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDENGINENUM: TWideStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSMotorkaskoDRIVEINTENDED: TWideStringField
      FieldName = 'DRIVEINTENDED'
      Size = 128
    end
    object ODSMotorkaskoDRIVECOST: TFloatField
      FieldName = 'DRIVECOST'
      currency = True
    end
    object ODSMotorkaskoBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSMotorkaskoENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSMotorkaskoTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ODSMotorkaskoCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object ODSMotorkaskoBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object ODSMotorkaskoMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object ODSMotorkaskoINSUREDMARK: TWideStringField
      FieldName = 'INSUREDMARK'
      Size = 32
    end
    object ODSMotorkaskoINSUREDMODEL: TWideStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSMotorkaskoCLAIM_DATE: TDateTimeField
      FieldName = 'CLAIM_DATE'
    end
    object ODSMotorkaskoCLAIM_NUM: TWideStringField
      FieldName = 'CLAIM_NUM'
      Size = 64
    end
    object ODSMotorkaskoAREA: TWideStringField
      FieldName = 'AREA'
      Size = 32
    end
    object ODSMotorkaskoFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSMotorkaskoTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object ODSMotorkaskoINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSMotorkaskoAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSMotorkaskoNUMSEATS: TWideStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
  end
  object ODSAvalute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute'
      'order by valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000001200000056004100
      4C0055005F004E0041004D00450001000000000014000000560041004C005500
      5F00530048004F0052005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 192
    object ODSAvaluteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSAvaluteVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSAvaluteVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSAvaluteVALU_SHORT: TWideStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object ODSAvtoIntend: TOracleDataSet
    SQL.Strings = (
      'select *from ins_dict_autointends order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 200
    object ODSAvtoIntendID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAvtoIntendNAME: TWideStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object ODSRisk: TOracleDataSet
    SQL.Strings = (
      'select ir.rowid,ir.* from ins_dict_risks ir')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 232
    object ODSRiskID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRiskNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ExtraODialog: TOpenDialog
    Left = 282
    Top = 253
  end
  object ODSCustTypes: TOracleDataSet
    SQL.Strings = (
      'select *from ins_dict_custtypes where id=:id'
      ' ')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 234
    Top = 245
    object ODSCustTypesID: TFloatField
      FieldName = 'ID'
    end
    object ODSCustTypesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object ODSOperkurs: TOracleDataSet
    SQL.Strings = (
      
        'select ic.valute_id,av.valute,av.val_name,ok.ostat from avalute ' +
        'av,operkurs partition(today) ok,ins_contracts ic where ic.valute' +
        '_id=av.valute'
      ' and ok.val_kod=av.valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000000A0000004F005300
      54004100540001000000000012000000560041004C005500540045005F004900
      4400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 64
    object ODSOperkursVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object ODSOperkursVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSOperkursVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSOperkursOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
  end
  object SB_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'Sb_aca'
    Left = 64
    Top = 64
  end
end
