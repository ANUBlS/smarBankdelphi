object ConstructionPolicy: TConstructionPolicy
  Left = 192
  Top = 107
  Width = 365
  Height = 161
  Caption = 'Policy'
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 357
    Height = 101
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 101
      Height = 13
      Caption = 'Шящадятнамянин Н-си'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 54
      Width = 28
      Height = 13
      Caption = 'Аэент'
    end
    object Label2: TLabel
      Left = 8
      Top = 78
      Width = 60
      Height = 13
      Caption = 'Сыьорта нювц'
    end
    object ENum: TDBEdit
      Left = 136
      Top = 21
      Width = 209
      Height = 21
      DataField = 'POLICY_NUM'
      DataSource = DSContracts
      TabOrder = 0
      OnChange = ENumChange
      OnKeyPress = ENumKeyPress
    end
    object Edit1: TEdit
      Left = 136
      Top = 72
      Width = 209
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'Иншаат сыьортасы'
      OnChange = ENumChange
      OnKeyPress = ENumKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 136
      Top = 48
      Width = 209
      Height = 21
      DataField = 'AGENTID'
      DataSource = ConstPolicyData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = AgentSource
      TabOrder = 2
      OnClick = ENumChange
      OnKeyPress = ENumKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 101
    Width = 357
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object btPrint: TBitBtn
      Left = 29
      Top = 5
      Width = 75
      Height = 24
      Caption = 'Чап'
      DragCursor = crArrow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 181
      Top = 5
      Width = 79
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      DragCursor = crArrow
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 261
      Top = 5
      Width = 75
      Height = 24
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Имтина'
      DragCursor = crArrow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object btApply: TBitBtn
      Left = 105
      Top = 5
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
      TabOrder = 3
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
  object ODSConstPolicy: TOracleDataSet
    SQL.Strings = (
      'select icp.rowid, icp.* from ins_constructionpolicy icp'
      'where icp.cs_id= :cs_id')
    Variables.Data = {0300000001000000060000003A43535F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000200000049440100000000000500000043535F4944010000
      00000009000000504F4C4943594E554D010000000000070000004147454E5449
      44010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    OnNewRecord = ODSConstPolicyNewRecord
    Left = 304
    Top = 40
    object ODSConstPolicyID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSConstPolicyCS_ID: TFloatField
      FieldName = 'CS_ID'
      Required = True
    end
    object ODSConstPolicyPOLICYNUM: TStringField
      FieldName = 'POLICYNUM'
      Size = 32
    end
    object ODSConstPolicyAGENTID: TFloatField
      FieldName = 'AGENTID'
    end
  end
  object ConstPolicyData: TDataSource
    DataSet = ODSConstPolicy
    Left = 272
    Top = 40
  end
  object ODSCONSTSUGGEST: TOracleDataSet
    SQL.Strings = (
      'SELECT  S.ROWID,S.* FROM INS_CONSTRUCTIONSUGGEST S '
      'WHERE CID=:CID')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D000000020000004944010000000000030000004349440100000000
      000600000046525A5F494401000000000007000000434E44545F494401000000
      0000060000004D4C494D495401000000000007000000524D4C494D4954010000
      0000000A0000004956414C55454D41494E010000000000070000005250455249
      4F4401000000000007000000524956414C554501000000000007000000454E44
      44415445010000000000070000005246525A5F49440100000000000600000056
      414C5F494401000000000008000000494E5445525F4944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 309
    Top = 72
    object ODSCONSTSUGGESTID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSCONSTSUGGESTCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
    object ODSCONSTSUGGESTFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
      Required = True
    end
    object ODSCONSTSUGGESTCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
      Required = True
    end
    object ODSCONSTSUGGESTMLIMIT: TFloatField
      FieldName = 'MLIMIT'
    end
    object ODSCONSTSUGGESTRMLIMIT: TFloatField
      FieldName = 'RMLIMIT'
    end
    object ODSCONSTSUGGESTIVALUEMAIN: TFloatField
      FieldName = 'IVALUEMAIN'
    end
    object ODSCONSTSUGGESTRPERIOD: TStringField
      FieldName = 'RPERIOD'
      Size = 10
    end
    object ODSCONSTSUGGESTRIVALUE: TFloatField
      FieldName = 'RIVALUE'
    end
    object ODSCONSTSUGGESTENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSCONSTSUGGESTRFRZ_ID: TFloatField
      FieldName = 'RFRZ_ID'
    end
    object ODSCONSTSUGGESTVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object ODSCONSTSUGGESTINTER_ID: TFloatField
      FieldName = 'INTER_ID'
    end
  end
  object CONSTSUGGESTData: TDataSource
    DataSet = ODSCONSTSUGGEST
    Left = 277
    Top = 72
  end
  object PolicyExporter: TINSWordExporter
    Left = 16
    Top = 124
  end
  object PINS_CONSTRUCTION: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_CONSTRUCTION'
    ParameterMode = pmNamed
    Left = 56
    Top = 126
  end
  object ODSConstruction: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.*from ins_construction c where c.id=:id')
    Variables.Data = {
      0300000001000000030000003A49440400000008000000000000000030724000
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
    Left = 200
    Top = 8
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
  object ConstData: TDataSource
    DataSet = ODSConstruction
    Left = 232
    Top = 8
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax,c.contactperson,c.contactper' +
        'sonphone from ins_customers c')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      00000B0000004D4F42494C4550484F4E45010000000000070000004144445245
      5353010000000000030000004641580100000000000D000000434F4E54414354
      504552534F4E01000000000012000000434F4E54414354504552534F4E50484F
      4E45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 40
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
    object CustomersCONTACTPERSONPHONE: TStringField
      FieldName = 'CONTACTPERSONPHONE'
      Size = 32
    end
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 208
    Top = 40
  end
  object ODSRisks: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_risks idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 172
    Top = 4
    object ODSRisksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRisksNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object RisksData: TDataSource
    DataSet = ODSRisks
    Left = 172
    Top = 36
  end
  object Franshiz: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_franshiz idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 69
    object FranshizID: TFloatField
      FieldName = 'ID'
    end
    object FranshizNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object FranshizData: TDataSource
    DataSet = Franshiz
    Left = 208
    Top = 69
  end
  object Conditions: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_conditions idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 136
    Top = 5
    object ConditionsID: TFloatField
      FieldName = 'ID'
    end
    object ConditionsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ConditionsData: TDataSource
    DataSet = Conditions
    Left = 136
    Top = 37
  end
  object ODSConstructionR: TOracleDataSet
    SQL.Strings = (
      
        'select PINS_FullMotor.returnName(kli_id) as name,Pins_FullMotor.' +
        'returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(kli_' +
        'id) as phone,pins_fullmotor.returnFax(kli_id) as fax,c.*from ins' +
        '_construction c where c.id=:id'
      '')
    Variables.Data = {0300000001000000030000003A494403000000040000006A01000000000000}
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
    Left = 60
    Top = 4
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
  object ConstReportSource: TDataSource
    DataSet = ODSConstructionR
    Left = 92
    Top = 4
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
    Left = 96
    Top = 40
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
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 56
    Top = 40
  end
  object AgentSource: TDataSource
    DataSet = ODSAgent
    Left = 56
    Top = 72
  end
  object ODSAgent: TOracleDataSet
    SQL.Strings = (
      
        'select ia.rowid,ia.id,ia.name||'#39' '#39'||ia.surname||'#39' '#39'||ia.fatherna' +
        'me as name from ins_agents ia')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E414D4501000000000002000000494401000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 72
    object ODSAgentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAgentNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
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
    Left = 136
    Top = 72
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
    Left = 168
    Top = 69
  end
  object AValute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 304
    Top = 8
    object AValuteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object AValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AValuteVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object AValuteVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object AValuteData: TDataSource
    DataSet = AValute
    Left = 272
    Top = 8
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 24
    Top = 8
  end
end
