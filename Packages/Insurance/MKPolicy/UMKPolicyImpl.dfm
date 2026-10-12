object fmMKPolicy: TfmMKPolicy
  Left = 453
  Top = 197
  Width = 363
  Height = 382
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
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 355
    Height = 283
    Align = alClient
    Caption = 'Няглиййат васитяляринин (КАСКО) сыьорта шящадятнамяси'
    TabOrder = 0
    object Bevel1: TBevel
      Left = 1
      Top = 34
      Width = 327
      Height = 10
      Shape = bsBottomLine
    end
    object Label2: TLabel
      Left = 8
      Top = 36
      Width = 80
      Height = 13
      Caption = 'Сыьорта щадисяляри'
    end
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 13
      Caption = 'Шящадятнамя нюмряси'
    end
    object SpeedButton1: TSpeedButton
      Left = 120
      Top = 16
      Width = 23
      Height = 22
      Caption = '№'
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object DBEdit7: TDBEdit
      Left = 144
      Top = 16
      Width = 177
      Height = 21
      Color = clScrollBar
      DataField = 'POLICY_NUM'
      DataSource = DSContracts
      Enabled = False
      TabOrder = 0
      OnKeyPress = DBEdit7KeyPress
    end
    object cbRisk: TCheckBox
      Left = 8
      Top = 54
      Width = 257
      Height = 17
      Caption = 'Бцтцн тяминатлар цзря франшиза ейнидир'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = cbRiskClick
    end
    object gbGrid: TGroupBox
      Left = 0
      Top = 88
      Width = 353
      Height = 193
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 2
        Top = 40
        Width = 345
        Height = 153
        DataSource = DSPolicy
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'risk'
            Title.Caption = 'Сыьорта тяминаты'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RISKS'
            Title.Caption = 'Франшиза'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 13
        Width = 240
        Height = 25
        DataSource = DSPolicy
        Flat = True
        TabOrder = 1
      end
      object gbSame: TGroupBox
        Left = 2
        Top = 13
        Width = 349
        Height = 180
        Caption = 'Сыьорта тяминатлары'
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Оьурланма'
        end
        object Label5: TLabel
          Left = 8
          Top = 42
          Width = 33
          Height = 13
          Caption = 'Йаньын'
        end
        object Label6: TLabel
          Left = 8
          Top = 66
          Width = 39
          Height = 13
          Caption = 'Парtлайыш'
        end
        object Label7: TLabel
          Left = 8
          Top = 90
          Width = 100
          Height = 13
          Caption = 'Йол няглиййат щадисяси'
        end
        object Label8: TLabel
          Left = 8
          Top = 110
          Width = 97
          Height = 26
          Caption = 'Щяр щансы предметля тоггушма'
          WordWrap = True
        end
        object DBEdit1: TDBEdit
          Left = 136
          Top = 18
          Width = 201
          Height = 21
          DataField = 'THEFT'
          DataSource = DSPolicy
          TabOrder = 0
          OnKeyPress = DBEdit7KeyPress
        end
        object DBEdit2: TDBEdit
          Left = 136
          Top = 42
          Width = 201
          Height = 21
          DataField = 'FIRE'
          DataSource = DSPolicy
          TabOrder = 1
          OnKeyPress = DBEdit7KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 136
          Top = 66
          Width = 201
          Height = 21
          DataField = 'EXPLOSION'
          DataSource = DSPolicy
          TabOrder = 2
          OnKeyPress = DBEdit7KeyPress
        end
        object DBEdit4: TDBEdit
          Left = 136
          Top = 90
          Width = 201
          Height = 21
          DataField = 'TRAFFICACCIDENT'
          DataSource = DSPolicy
          TabOrder = 3
          OnKeyPress = DBEdit7KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 136
          Top = 114
          Width = 201
          Height = 21
          DataField = 'IMPACTANYOBJECT'
          DataSource = DSPolicy
          TabOrder = 4
          OnKeyPress = DBEdit7KeyPress
        end
      end
    end
    object cbDifRisk: TCheckBox
      Left = 8
      Top = 70
      Width = 145
      Height = 17
      Caption = 'Франшизалар мцхтялифдир'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cbDifRiskClick
    end
    object BitBtn3: TBitBtn
      Left = 248
      Top = 43
      Width = 83
      Height = 25
      Caption = 'Полися ялавя'
      TabOrder = 4
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 248
      Top = 68
      Width = 83
      Height = 25
      Caption = 'Сыь.карты'
      TabOrder = 5
      OnClick = BitBtn4Click
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 283
    Width = 355
    Height = 65
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object btOk: TBitBtn
      Left = 146
      Top = 34
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 1
      OnClick = btOkClick
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
    end
    object btCancel: TBitBtn
      Left = 264
      Top = 34
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btCancelClick
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
    end
    object btPrint: TBitBtn
      Left = 77
      Top = 34
      Width = 66
      Height = 25
      Caption = 'Чап'
      Enabled = False
      TabOrder = 3
      OnClick = btPrintClick
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
    object btApply: TBitBtn
      Left = 10
      Top = 34
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Apply'
      Enabled = False
      TabOrder = 0
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
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 8
      Width = 204
      Height = 21
      DataField = 'UNDERTABLE'
      DataSource = DSPolicy
      KeyField = 'TEMPLATE'
      ListField = 'NAME'
      ListSource = DSTemplates
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 263
      Top = 6
      Width = 81
      Height = 25
      Caption = 'Ялавя/Редактя'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 214
      Top = 6
      Width = 47
      Height = 53
      Caption = 'Ялавяляр'
      TabOrder = 6
      OnClick = BitBtn2Click
    end
  end
  object hbErrMsg: THintBox
    Left = -8
    Top = 256
    Width = 249
    Height = 18
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'hbErrMsg'
    TabOrder = 2
    Visible = False
    HintStyle = hsError
    Timeout = 4000
    BeepOnMessage = False
  end
  object lbNonUnicode: TListBox
    Left = 16
    Top = 392
    Width = 121
    Height = 97
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'ч'
      'я'
      'ь'
      'ы'
      'ю'
      'ц'
      'ш'
      'а'
      'б'
      'ж'
      'д'
      'е'
      'ф'
      'э'
      'щ'
      'х'
      'и'
      'ъ'
      'к'
      'г'
      'л'
      'м'
      'н'
      'о'
      'п'
      'р'
      'с'
      'т'
      'у'
      'в'
      'й'
      'з'
      'Ч'
      'Я'
      'Ь'
      'Ы'
      'Ю'
      'Ц'
      'Ш'
      'А'
      'Б'
      'Ж'
      'Д'
      'Е'
      'Ф'
      'Э'
      'Щ'
      'Х'
      'И'
      'Ъ'
      'К'
      'Г'
      'Л'
      'М'
      'Н'
      'О'
      'П'
      'Р'
      'С'
      'Т'
      'У'
      'В'
      'Й'
      'З')
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object tlbUnicode: TTntListBox
    Left = 176
    Top = 384
    Width = 121
    Height = 97
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 14
    Items.WideStrings = (
      'c'
      '?'
      'g'
      '?'
      'o'
      'u'
      's'
      'a'
      'b'
      'c'
      'd'
      'e'
      'f'
      'g'
      'h'
      'x'
      'i'
      'j'
      'k'
      'q'
      'l'
      'm'
      'n'
      'o'
      'p'
      'r'
      's'
      't'
      'u'
      'v'
      'y'
      'z'
      'C'
      '?'
      'G'
      'I'
      'O'
      'U'
      'S'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'X'
      'I'
      'J'
      'K'
      'Q'
      'L'
      'M'
      'N'
      'O'
      'P'
      'R'
      'S'
      'T'
      'U'
      'V'
      'Y'
      'Z')
    Items.WideStrings_UTF7 = (
      '+AOc'
      '+Alk'
      '+AR8'
      '+ATE'
      '+APY'
      '+APw'
      '+AV8'
      'a'
      'b'
      'c'
      'd'
      'e'
      'f'
      'g'
      'h'
      'x'
      'i'
      'j'
      'k'
      'q'
      'l'
      'm'
      'n'
      'o'
      'p'
      'r'
      's'
      't'
      'u'
      'v'
      'y'
      'z'
      '+AMc'
      '+AY8'
      '+AR4'
      'I'
      '+ANY'
      '+ANw'
      '+AV4'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'G'
      'H'
      'X'
      '+ATA'
      'J'
      'K'
      'Q'
      'L'
      'M'
      'N'
      'O'
      'P'
      'R'
      'S'
      'T'
      'U'
      'V'
      'Y'
      'Z')
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object ODSPolicy: TOracleDataSet
    SQL.Strings = (
      'select imp.rowid, imp.* from ins_mk_policy imp'
      'where '
      'imp.CID = :CID')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000020000004944010000000000050000005448454654010000
      0000000400000046495245010000000000090000004558504C4F53494F4E0100
      000000000F000000545241464649434143434944454E540100000000000F0000
      00494D50414354414E594F424A4543540100000000000E0000004E4154434154
      415354524F50484501000000000009000000504F4C4943594E554D0100000000
      000A000000554E4445525441424C450000000000000300000043494401000000
      0000050000005249534B53010000000000040000004E414D45010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSPolicyAfterInsert
    AfterEdit = ODSPolicyAfterEdit
    Left = 304
    Top = 8
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
    object ODSPolicyPOLICYNUM: TStringField
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
    object ODSPolicyNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ODSPolicyrisk: TStringField
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
    Left = 272
    Top = 8
  end
  object DSAvalute: TDataSource
    Left = 64
    Top = 8
  end
  object INSWordExporter: TINSWordExporter
    Left = 424
    Top = 88
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
    Variables.Data = {
      0300000001000000040000003A43494403000000040000002B01000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000029000000040000004E414D450100000000000B000000494E53555245
      44545950450100000000000C000000494E5355524544434F4C4F520100000000
      0011000000494E53555245444F5554505554594541520100000000000C000000
      494E53555245444D4F44454C0100000000000F000000494E5355524544535441
      54454E554D0100000000000D000000554E4445524652414D454E554D01000000
      00000D000000494E535552454442414E4E554D01000000000010000000494E53
      55524544454E47494E454E554D01000000000011000000445249564541434345
      535350494F504C4501000000000009000000424547494E444154450100000000
      0009000000504F4C4943594E554D010000000000050000005448454654010000
      0000000400000046495245010000000000090000004558504C4F53494F4E0100
      000000000F000000545241464649434143434944454E540100000000000F0000
      00494D50414354414E594F424A45435401000000000007000000454E44444154
      450100000000000A000000424547494E44415445320100000000000A0000004C
      4F414E4143435F49440100000000000A000000435552524143435F4944010000
      0000000600000056414C555445010000000000050000004147454E5401000000
      0000050000004E414D45320100000000000F0000004143434553534F52494553
      4E414D4501000000000007000000494E53444154450100000000000B00000042
      454E4546494349415259010000000000030000005345580100000000000D0000
      004452495645494E54454E4445440100000000000A000000434F4E444954494F
      4E53010000000000080000004E554D53454154530100000000000D0000004558
      5452414652414E5348495A010000000000080000004652414E5348495A010000
      000000080000004156544F434F535401000000000007000000494E5353554D4D
      01000000000007000000414D4D4F554E540100000000000E000000494E535552
      4544414444524553530100000000000B0000004D4F42494C4550484F4E450100
      0000000009000000484F4D4550484F4E4501000000000008000000494E53434F
      4C4F520100000000000800000056414C5F4E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 40
    object ODSReportNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSReportINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSReportINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 128
    end
    object ODSReportINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSReportINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSReportINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSReportUNDERFRAMENUM: TStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSReportINSUREDBANNUM: TStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSReportDRIVEACCESSPIOPLE: TStringField
      FieldName = 'DRIVEACCESSPIOPLE'
      Size = 258
    end
    object ODSReportINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSReportACCESSORIESNAME: TStringField
      FieldName = 'ACCESSORIESNAME'
      Size = 4000
    end
    object ODSReportBEGINDATE: TStringField
      FieldName = 'BEGINDATE'
      Size = 10
    end
    object ODSReportINSDATE: TStringField
      FieldName = 'INSDATE'
      Size = 10
    end
    object ODSReportENDDATE: TStringField
      FieldName = 'ENDDATE'
      Size = 10
    end
    object ODSReportPOLICYNUM: TStringField
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
    object ODSReportAGENT: TStringField
      FieldName = 'AGENT'
      Size = 386
    end
    object ODSReportVALUTE: TStringField
      DisplayWidth = 20
      FieldName = 'VALUTE'
      Size = 30
    end
    object ODSReportBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSReportLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSReportCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSReportDRIVEINTENDED: TStringField
      FieldName = 'DRIVEINTENDED'
      Size = 128
    end
    object ODSReportSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSReportavtointend: TStringField
      FieldKind = fkLookup
      FieldName = 'avtointend'
      LookupDataSet = ODSAvtoIntend
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'DRIVEINTENDED'
      Size = 32
      Lookup = True
    end
    object ODSReportNUMSEATS: TStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
    object ODSReportFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSReportEXTRAFRANSHIZ: TStringField
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
    object ODSReportINSUREDADDRESS: TStringField
      FieldName = 'INSUREDADDRESS'
      Size = 1024
    end
    object ODSReportMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSReportHOMEPHONE: TStringField
      FieldName = 'HOMEPHONE'
      Size = 32
    end
    object ODSReportINSCOLOR: TStringField
      FieldName = 'INSCOLOR'
      Size = 32
    end
    object ODSReportVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 424
    Top = 120
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where ic.id =:CID'
      'and type_id = 1')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001600000002000000494401000000000007000000545950455F494401
      000000000008000000494E535F444154450100000000000A000000424547494E
      5F4441544501000000000008000000454E445F44415445010000000000090000
      0056414C5554455F494401000000000007000000414D4D4F554E540100000000
      000C000000434C4F53455F505245464958010000000000060000004B4C495F49
      440100000000000A0000004C4F414E4143435F49440100000000000A00000043
      5552524143435F49440100000000000A000000504F4C4943595F4E554D010000
      00000007000000494E5353554D4D010000000000080000004652414E5348495A
      0100000000000600000054415249464601000000000005000000535441544501
      0000000000080000004147454E545F494401000000000004000000504E554D01
      00000000000B00000042454E4546494349415259010000000000060000004245
      4E5F49440100000000000A000000434F4E444954494F4E530100000000000600
      00005355474E554D010000000000}
    Session = sboapiDataModule.SBSession
    AfterEdit = ODSContractsAfterEdit
    Left = 216
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
    object ODSContractsPOLICY_NUM: TStringField
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
    object ODSContractsBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSContractsSUGNUM: TStringField
      FieldName = 'SUGNUM'
      Size = 32
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 184
  end
  object DSTemplates: TDataSource
    DataSet = ODSTemplates
    Left = 16
    Top = 88
  end
  object ODSTemplates: TOracleDataSet
    SQL.Strings = (
      'select ibt.rowid, ibt.* from INS_BLOB_TEMPLATES ibt')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000800000054454D504C415445000000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 88
    object ODSTemplatesID: TFloatField
      FieldName = 'ID'
    end
    object ODSTemplatesNAME: TStringField
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
    Left = 376
    Top = 112
  end
  object DSCustomers: TDataSource
    DataSet = ODSCustomers
    Left = 200
    Top = 88
  end
  object ODSCustomers: TOracleDataSet
    SQL.Strings = (
      
        'select rowid,id,sex,insured_typeid,name||'#39' '#39'||surname||'#39' '#39'||fath' +
        'ername as name from ins_customers where id=:kli_id')
    Variables.Data = {0300000001000000070000003A4B4C495F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000E000000494E53555245445F
      545950454944010000000000040000004E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 88
    object ODSCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustomersINSURED_TYPEID: TIntegerField
      FieldName = 'INSURED_TYPEID'
    end
    object ODSCustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
  object ODSMotorkasko: TOracleDataSet
    SQL.Strings = (
      'select mk.rowid, mk.* from ins_motorkasco mk '
      'where cid=:cid')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C0000000200000049440100000000000B000000494E535552454454
      5950450100000000000C000000494E5355524544434F4C4F5201000000000011
      000000494E53555245444F5554505554594541520100000000000F000000494E
      535552454453544154454E554D0100000000000D000000554E4445524652414D
      454E554D0100000000000D000000494E535552454442414E4E554D0100000000
      0010000000494E5355524544454E47494E454E554D0100000000000D00000044
      52495645494E54454E444544010000000000090000004452495645434F535401
      000000000009000000424547494E4441544501000000000007000000454E4444
      415445010000000000060000005459504549440100000000000C000000434C4F
      53455F5052454649580100000000000700000042414E4B5F4944010000000000
      080000004D4F4E54485F49440100000000000B000000494E53555245444D4152
      4B0100000000000C000000494E53555245444D4F44454C010000000000030000
      004349440100000000000A000000434C41494D5F444154450100000000000900
      0000434C41494D5F4E554D010000000000040000004152454101000000000007
      0000004143545F4E554D010000000000080000004652414E5348495A01000000
      00000600000054415249464601000000000007000000494E5353554D4D010000
      00000007000000414D4D4F554E54010000000000080000004E554D5345415453
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 138
    Top = 44
    object ODSMotorkaskoID: TFloatField
      FieldName = 'ID'
    end
    object ODSMotorkaskoCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
    object ODSMotorkaskoINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSMotorkaskoINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSMotorkaskoINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSMotorkaskoUNDERFRAMENUM: TStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDBANNUM: TStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSMotorkaskoDRIVEINTENDED: TStringField
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
    object ODSMotorkaskoINSUREDMARK: TStringField
      FieldName = 'INSUREDMARK'
      Size = 32
    end
    object ODSMotorkaskoINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSMotorkaskoCLAIM_DATE: TDateTimeField
      FieldName = 'CLAIM_DATE'
    end
    object ODSMotorkaskoCLAIM_NUM: TStringField
      FieldName = 'CLAIM_NUM'
      Size = 64
    end
    object ODSMotorkaskoAREA: TStringField
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
    object ODSMotorkaskoNUMSEATS: TStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
  end
  object ODSAvalute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute'
      'order by valute')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 24
    Top = 8
    object ODSAvaluteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSAvaluteVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSAvaluteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSAvaluteVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object ODSAvtoIntend: TOracleDataSet
    SQL.Strings = (
      'select *from ins_dict_autointends order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 88
    object ODSAvtoIntendID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAvtoIntendNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object ODSRisk: TOracleDataSet
    SQL.Strings = (
      'select ir.rowid,ir.* from ins_dict_risks ir')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 56
    Top = 136
    object ODSRiskID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRiskNAME: TStringField
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
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 98
    Top = 133
    object ODSCustTypesID: TFloatField
      FieldName = 'ID'
    end
    object ODSCustTypesNAME: TStringField
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
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D45010000000000050000004F535441540100000000000900000056414C
      5554455F4944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 208
    Top = 40
    object ODSOperkursVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object ODSOperkursVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSOperkursVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSOperkursOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
  end
end
