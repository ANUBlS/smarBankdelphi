object FrmMsg: TFrmMsg
  Left = 435
  Top = 162
  Width = 465
  Height = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 339
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 297
      Top = 304
      Width = 74
      Height = 31
      Caption = 'Гябул'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333300333333333333333388F3333333333000033330440333333333333
        338338F3333333330000333044440333333333333833338F3333333300003304
        444440333333333383333338F3333333000030444C44440333333338F338F333
        8F33333300003444C3C4440333333338F3838F338F33333300003C4C333C4440
        33333338F83338F338F33333000033C33333C444033333338333338F338F3333
        0000333333333C444033333333333338F338F33300003333333333C444033333
        333333338F338F33000033333333333C444033333333333338F338F300003333
        33333333C444033333333333338F338F00003333333333333C44033333333333
        3338F38F000033333333333333C443333333333333338F830000333333333333
        333C333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 377
      Top = 303
      Width = 70
      Height = 32
      Caption = 'Имтина'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333C44833333C83333333388F333333F33330000333C4448333C44833333
        38F38F333F88F3330000333C444483C44448333338F338F3F8338F3300003333
        C44448444448333338F3338F833338F3000033333C44444444833333338F3338
        3333F8330000333333C44444483333333338F333333F83330000333333344444
        8333333333338F333338333300003333333C444483333333333338F333833333
        0000333333C444448333333333333833338F3333000033333C44484448333333
        33338333338F333300003333C44483C44483333333383338F338F33300003333
        C448333C44483333338F33838F338F33000033333C433333C4443333338FF833
        38F338F300003333333333333C4C333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 1
      Width = 223
      Height = 65
      Caption = 'Тарих '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object CBaValute: TCheckBox
        Left = 8
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Tяtbiq et'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 5
        Top = 17
        Width = 213
        Height = 21
        CalAlignment = dtaLeft
        Date = 40113.5973054051
        Time = 40113.5973054051
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 67
      Width = 221
      Height = 233
      Caption = 'Истифадячи гурупу'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object LookUsrGrp: TEvanescence
        Tag = 3112
        Left = 3
        Top = 31
        Width = 215
        Height = 200
        Color = clWhite
        Flat = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        DataSource = srcUsrGrp
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Щамсыны сеч'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 230
      Top = 1
      Width = 223
      Height = 65
      Caption = 'Боржаланын tipi'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object CBPersons: TCheckBox
        Left = 8
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Tяtbiq et'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object LCBPersons: TDBLookupComboBox
        Left = 5
        Top = 18
        Width = 211
        Height = 19
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = DataSrcPersonTypes
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 231
      Top = 67
      Width = 221
      Height = 233
      Caption = 'Mцшtяri tipi'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object LookPersonelType: TEvanescence
        Tag = 3112
        Left = 3
        Top = 31
        Width = 215
        Height = 200
        Color = clWhite
        Flat = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        DataSource = srcPersonelType
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object CheckBox1: TCheckBox
        Left = 6
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Щамсыны сеч'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
    end
  end
  object srcUsrGrp: TDataSource
    DataSet = UsrGrpDataSet
    Left = 184
    Top = 167
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Сыьорта'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 125
    Top = 164
  end
  object UsrGrpDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT id, description'
      '    FROM creditsmgr.cm_usergroups')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B0000004445534352495054
      494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 184
    Top = 119
  end
  object PersonelTypeDataSet: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT id, description'
      '  FROM creditsmgr.cm_categories')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B0000004445534352495054
      494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 280
    Top = 119
  end
  object PersonTypes: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID,'
      '  DESCRIPION'
      'from'
      '  CM_PERSONS'
      ''
      'order by id')
    Cursor = crHourGlass
    Session = CMDataModule.CMSession
    Left = 320
    Top = 40
  end
  object DataSrcPersonTypes: TDataSource
    DataSet = PersonTypes
    Left = 368
    Top = 40
  end
  object srcPersonelType: TDataSource
    DataSet = PersonelTypeDataSet
    Left = 275
    Top = 177
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select distinct'
      '  c.description,a.name,'
      '   CM_COMMON.get_CustCartIpNum(cipinf.idcust )as dd,'
      
        '   cipinf.name||'#39' '#39'|| cipinf.soname||'#39' '#39'||cipinf.lastname as  "B' +
        'irэe borc alan",'
      
        '  CREDITLINEAMOUNT,ROUND(months_between ( p.duedatefirstcontract' +
        ',p.dateofconclusion)) as period,'
      
        'numberofcredit,DATEOFCONCLUSION ,ic.description as in_descriptio' +
        'n,i.insuranceno,i.insurancedate,'
      '     ic.description  as "сыьорта ширкятин ады ",'
      '    i.INSURANCENO       as "Сыьорта полисинин нюмряси",'
      '   i.INSURANCEDATE     as "сыьорта полисинин тарихи",'
      '   i.INSURANCEAMOUNT   as "Сыьорта щаггынын мябляьи",'
      
        '   i.PLEDGEINSLASTDATE as "Э сыортасынын битмя вахты" ,h.rest "Г' +
        'алыг",ca.description "Мцштяринин типи"'
      ' from'
      
        'cm_ip_info i,CM_PORTFOLIO p,CM_USERGROUPS c, smart.customers a,c' +
        'm_ip_insurances ic,smart.customers cu,'
      'smart.custinfo cipinf,cm_history h,cm_categories ca'
      'where'
      'i.creditid=p.id and ca.id=p.customertype and'
      'p.usrgroup=c.id and'
      'p.boorowerid=a.id and'
      'i.insurancecompany=ic.id and'
      'i.INSURANCEDATE  between :dat and :dat+60 and'
      'cipinf.idcust = cu.id  and'
      'P.boorowerid= cu.id '
      'and p.id =h.creditid and h.hdate=:dat and h.rest+h.duerest>0'
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
      ''
      ''
      '')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000B0000004445534352495054494F4E010000000000040000
      004E414D45010000000000100000004352454449544C494E45414D4F554E5401
      000000000006000000504552494F440100000000000E0000004E554D4245524F
      4643524544495401000000000010000000444154454F46434F4E434C5553494F
      4E0100000000000E000000494E5F4445534352495054494F4E0100000000000B
      000000494E535552414E43454E4F0100000000000D000000494E535552414E43
      454441544501000000000002000000444401000000000005000000C3E0EBFBE3
      01000000000015000000F1FBFCEEF0F2E020F8E8F0EAFFF2E8ED20E0E4FB2001
      000000000019000000D1FBFCEEF0F2E020EFEEEBE8F1E8EDE8ED20EDFEECF0FF
      F1E801000000000018000000F1FBFCEEF0F2E020EFEEEBE8F1E8EDE8ED20F2E0
      F0E8F5E801000000000018000000D1FBFCEEF0F2E020F9E0E3E3FBEDFBED20EC
      FFE1EBFFFCE801000000000019000000DD20F1FBEEF0F2E0F1FBEDFBED20E1E8
      F2ECFF20E2E0F5F2FB0100000000000F000000CCF6F8F2FFF0E8EDE8ED20F2E8
      EFE8010000000000}
    Session = CMDataModule.CMSession
    Left = 8
    Top = 232
    object StringField1: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object StringField2: TStringField
      DisplayLabel = 'Мцштяри '
      FieldName = 'NAME'
      Size = 90
    end
    object OracleDataSet1DD: TFloatField
      DisplayLabel = 'Бирэя боржалан'
      FieldName = 'DD'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Кредит мябляьи'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Период'
      FieldName = 'PERIOD'
    end
    object StringField3: TStringField
      DisplayLabel = 'Мцгавиля №'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Верилмя тарихиN'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object StringField4: TStringField
      DisplayLabel = 'Сигорта ширкятинин ады'
      FieldName = 'IN_DESCRIPTION'
      Required = True
      Size = 127
    end
    object StringField5: TStringField
      DisplayLabel = 'Сигорта полисинин №-си'
      FieldName = 'INSURANCENO'
      Size = 25
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Сигорта полисинин тарихи'
      FieldName = 'INSURANCEDATE'
    end
    object OracleDataSet1DSDesigner2: TStringField
      FieldName = 'сыьорта ширкятин ады '
      Required = True
      Size = 127
    end
    object OracleDataSet1DSDesigner3: TStringField
      FieldName = 'Сыьорта полисинин нюмряси'
      Size = 25
    end
    object OracleDataSet1DSDesigner4: TDateTimeField
      FieldName = 'сыьорта полисинин тарихи'
    end
    object OracleDataSet1DSDesigner5: TFloatField
      FieldName = 'Сыьорта щаггынын мябляьи'
    end
    object OracleDataSet1DSDesigner6: TDateTimeField
      FieldName = 'Э сыортасынын битмя вахты'
    end
    object OracleDataSet1DSDesigner7: TStringField
      FieldName = 'Мцштяринин типи'
      Size = 128
    end
    object OracleDataSet1DSDesigner: TFloatField
      FieldName = 'Галыг'
      Required = True
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select distinct'
      
        ' c.description,a.name,CREDITLINEAMOUNT,ROUND(months_between ( p.' +
        'duedatefirstcontract,p.dateofconclusion)) as period,'
      
        'numberofcredit,DATEOFCONCLUSION ,ic.description as in_descriptio' +
        'n,i.insuranceno,i.insurancedate,'
      ''
      '   i.INSURANCENO       as "Сыьорта полисинин нюмряси",'
      '   i.INSURANCEDATE     as "сыьорта полисинин тарихи",'
      '   i.INSURANCEAMOUNT   as "Сыьорта щаггынын мябляьи",'
      
        '   i.PLEDGEINSLASTDATE as "Э сыортасынын битмя вахты" ,ca.descri' +
        'ption "Мцштяринин типи"'
      ' from '
      
        'cm_ip_info i,CM_PORTFOLIO p,CM_USERGROUPS c, smart.customers a,c' +
        'm_ip_insurances ic,smart.customers cu,'
      
        '(select custid,UNIQUEINSID,BB_INN,MONTHLYPROFIT,PASSTYPE,MARRIAG' +
        'E,INSPOLICNUM,INSPERIODID,insamount,INSCONTRACTDATE,INSCONTRACTP' +
        'REIOD,INSCONTRLASTDATE,bb_familystatus'
      ',INSURANCECOMP,cardid  from smart.custipinfo '
      'union'
      
        'select  custid,null as UNIQUEINSID, null as BB_INN,null as MONTH' +
        'LYPROFIT,null as PASSTYPE ,null as MARRIAGE,null as INSPOLICNUM,' +
        'null as bb_familystatus,'
      
        'null as insamount,null as INSCONTRACTDATE,null as INSCONTRLASTDA' +
        'TE, null as INSCONTRACTPREIOD,null as INSPERIODID,null as INSURA' +
        'NCECOMP, null as cardid'
      'from ('
      ' select id as custid from smart.customers'
      ' minus '
      ' select custid from smart.custipinfo '
      '))cipinf,cm_categories ca'
      'where'
      'i.creditid=p.id and ca.id=p.customertype and'
      'p.usrgroup=c.id and'
      'p.boorowerid=a.id and'
      'i.insurancecompany=ic.id and'
      'i.PLEDGEINSLASTDATE < (SELECT SYSDATE FROM DUAL)  and'
      'cipinf.custid = cu.id  and'
      'P.boorowerid= cu.id '
      'and  p.id  in('
      ' select creditid'
      ' from creditsmgr.cm_curr_state where '
      ' (REST<>0 or INTERESTREST<>0))'
      ''
      ''
      ''
      ''
      ''
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000B0000004445534352495054494F4E010000000000040000
      004E414D45010000000000100000004352454449544C494E45414D4F554E5401
      000000000006000000504552494F440100000000000E0000004E554D4245524F
      4643524544495401000000000010000000444154454F46434F4E434C5553494F
      4E0100000000000E000000494E5F4445534352495054494F4E0100000000000B
      000000494E535552414E43454E4F0100000000000D000000494E535552414E43
      454441544501000000000019000000D1FBFCEEF0F2E020EFEEEBE8F1E8EDE8ED
      20EDFEECF0FFF1E801000000000018000000F1FBFCEEF0F2E020EFEEEBE8F1E8
      EDE8ED20F2E0F0E8F5E801000000000018000000D1FBFCEEF0F2E020F9E0E3E3
      FBEDFBED20ECFFE1EBFFFCE801000000000019000000DD20F1FBEEF0F2E0F1FB
      EDFBED20E1E8F2ECFF20E2E0F5F2FB0100000000000F000000CCF6F8F2FFF0E8
      EDE8ED20F2E8EFE8010000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 232
    object OracleDataSet2DESCRIPTION: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object OracleDataSet2NAME: TStringField
      DisplayLabel = 'Мцштяри '
      FieldName = 'NAME'
      Size = 90
    end
    object OracleDataSet2CREDITLINEAMOUNT: TFloatField
      DisplayLabel = 'Кредит мябляьи'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object OracleDataSet2PERIOD: TFloatField
      DisplayLabel = 'Период'
      FieldName = 'PERIOD'
    end
    object OracleDataSet2NUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавиля №'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object OracleDataSet2DATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Верилмя тарихиN'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object OracleDataSet2IN_DESCRIPTION: TStringField
      DisplayLabel = 'Сигорта ширкятинин ады'
      FieldName = 'IN_DESCRIPTION'
      Required = True
      Size = 127
    end
    object OracleDataSet2INSURANCENO: TStringField
      DisplayLabel = 'Сигорта полисинин №-си'
      FieldName = 'INSURANCENO'
      Size = 25
    end
    object OracleDataSet2INSURANCEDATE: TDateTimeField
      DisplayLabel = 'Сигорта полисинин тарихи'
      FieldName = 'INSURANCEDATE'
    end
    object OracleDataSet2DSDesigner: TStringField
      FieldName = 'Сыьорта полисинин нюмряси'
      Size = 25
    end
    object OracleDataSet2DSDesigner2: TDateTimeField
      FieldName = 'сыьорта полисинин тарихи'
    end
    object OracleDataSet2DSDesigner3: TFloatField
      FieldName = 'Сыьорта щаггынын мябляьи'
    end
    object OracleDataSet2DSDesigner4: TDateTimeField
      FieldName = 'Э сыортасынын битмя вахты'
    end
    object OracleDataSet2DSDesigner5: TStringField
      FieldName = 'Мцштяринин типи'
      Size = 128
    end
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -13
    FontTitles.Name = 'Arial Az Lat'
    FontTitles.Style = []
    BorderTitles.Weight = bwThick
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    BorderData.Weight = bwThin
    BorderData.LineStyle = blLine
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummaryFields.Strings = (
      'выакввпспвап')
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 72
    Top = 192
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select * from smart.sysdat')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000054454B5F44415401000000000008000000505245
      445F444154010000000000070000004152435F44415901000000000005000000
      434C4F5345010000000000}
    Session = CMDataModule.CMSession
    Left = 336
    Top = 212
    object OracleDataSet1TEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      
        ' select rownum as "№",p.numberofcredit as "Мцгавиля №",c.descrip' +
        'tion as "МКТ",a.name as "Боръ аланын ады",'
      '  CM_COMMON.get_CustCartIpNum(cipinf.id )as "birge borc",'
      
        'cipinf.name||'#39' '#39'|| cipinf.soname||'#39' '#39'||cipinf.lastname as  "Birэ' +
        'e borc alan",'
      
        'i.ownername as "Ipoteka predmetinin adi",i.predaddress as " pred' +
        'metinin unvani",'
      '   ic.description  as "сыьорта ширкятин ады ",'
      '   i.INSURANCENO       as "Сыьорта полисинин нюмряси",'
      '   i.INSURANCEDATE     as "сыьорта полисинин тарихи",'
      '   i.INSURANCEAMOUNT   as "Сыьорта щаггынын мябляьи",'
      '   i.PLEDGEINSLASTDATE as "Э сыортасынын битмя вахты" ,'
      '  h.rest " Kreditin qalыьы",ca.description "Мцштяринин типи"'
      ''
      ''
      '  from '
      '  cm_active_credits p,'
      '  CM_USERGROUPS c,cm_history h,'
      '  smart.customers a,cm_ip_info i,cm_ip_insurances ic,'
      '   smart.custinfo cipinf,cm_categories ca'
      ',smart.customers cu'
      '  where '
      '  p.usrgroup=c.id   and '
      '  p.boorowerid=a.id and ca.id=p.customertype and'
      '  i.creditid=p.id   and'
      '  i.insurancecompany=ic.id and'
      '  cipinf.idcust = cu.id  and'
      '  P.boorowerid= cu.id and'
      
        '  h.creditid=p.id and h.hdate=(select tek_dat from smart.sysdat ' +
        ')'
      ''
      ''
      ''
      ''
      '  /*33*/'
      '  /*34*/'
      ' '
      ' '
      '')
    Session = CMDataModule.CMSession
    Left = 75
    Top = 233
  end
  object OracleDataSet5: TOracleDataSet
    SQL.Strings = (
      ' select rownum ,p.numberofcredit,c.description,a.name,'
      
        '  CM_COMMON.get_CustCartIpNum(cipinf.cardid )as dd,/*i.ownername' +
        ',i.predaddress,*/'
      '   ic.description   as "сыьорта ширкятин ады ",'
      '   cipinf.INSPOLICNUM       as "Сыьорта полисинин нюмряси",'
      '   cipinf.insamount         as "Сыьорта мябляьи",'
      '   cipinf.INSCONTRACTDATE   as "Сыьорта мцгавилясинин тарихи",'
      '   cipinf.INSCONTRLASTDATE  as "Сыьорта мцга битмя тарихи" ,'
      '   cipinf.INSCONTRACTPREIOD as "Сыьорта мцгавилясинин мцддяти",'
      '  h.rest " Kreditin qalыьы",ca.description "Мцштяринин типи"'
      '  from '
      '  cm_active_credits p,'
      '  CM_USERGROUPS c,cm_history h,'
      '  smart.customers a,cm_ip_info i,cm_ip_insurances ic,'
      
        '  (select custid,UNIQUEINSID,BB_INN,MONTHLYPROFIT,PASSTYPE,MARRI' +
        'AGE,INSPOLICNUM,INSPERIODID,insamount,INSCONTRACTDATE,INSCONTRAC' +
        'TPREIOD,INSCONTRLASTDATE,bb_familystatus'
      ',INSURANCECOMP,cardid  from smart.custipinfo'
      'union'
      
        'select  custid,null as UNIQUEINSID, null as BB_INN,null as MONTH' +
        'LYPROFIT,null as PASSTYPE ,null as MARRIAGE,null as INSPOLICNUM,' +
        'null as bb_familystatus,'
      
        'null as insamount,null as INSCONTRACTDATE,null as INSCONTRLASTDA' +
        'TE, null as INSCONTRACTPREIOD,null as INSPERIODID,null as INSURA' +
        'NCECOMP, null as cardid'
      'from ('
      ' select id as custid from smart.customers'
      ' minus'
      ' select custid from smart.custipinfo'
      '))cipinf'
      ',smart.customers cu,cm_categories ca'
      '  where '
      
        '  p.usrgroup=c.id   and i.insurancecompany=ic.id and  i.creditid' +
        '=p.id  and'
      '  p.boorowerid=a.id and ca.id=p.customertype and'
      '  cipinf.custid = cu.id  and'
      '  P.boorowerid= cu.id and'
      
        '  h.creditid=p.id and h.hdate=(select tek_dat from smart.sysdat)' +
        '  '
      ''
      ''
      ''
      ''
      ''
      ''
      ' /*31*/'
      'order by rownum '
      '/*32*/ ')
    QBEDefinition.QBEFieldDefs = {
      040000000C00000006000000524F574E554D0100000000000E0000004E554D42
      45524F464352454449540100000000000B0000004445534352495054494F4E01
      0000000000040000004E414D4501000000000002000000444401000000000015
      000000F1FBFCEEF0F2E020F8E8F0EAFFF2E8ED20E0E4FB200100000000001900
      0000D1FBFCEEF0F2E020EFEEEBE8F1E8EDE8ED20EDFEECF0FFF1E80100000000
      000F000000D1FBFCEEF0F2E020ECFFE1EBFFFCE80100000000001C000000D1FB
      FCEEF0F2E020ECF6E3E0E2E8EBFFF1E8EDE8ED20F2E0F0E8F5E8010000000000
      19000000D1FBFCEEF0F2E020ECF6E3E020E1E8F2ECFF20F2E0F0E8F5E8010000
      0000001D000000D1FBFCEEF0F2E020ECF6E3E0E2E8EBFFF1E8EDE8ED20ECF6E4
      E4FFF2E801000000000010000000204B7265646974696E2071616CFBFCFB0100
      00000000}
    Session = CMDataModule.CMSession
    Left = 117
    Top = 236
  end
  object OracleDataSet6: TOracleDataSet
    SQL.Strings = (
      
        ' select rownum as "№",p.numberofcredit as "Мцгавиля №",c.descrip' +
        'tion as "МКТ",a.name as "Боръ аланын ады",'
      
        '  CM_COMMON.get_CustCartIpNum(cipinf.cardid )as dd,/*i.ownername' +
        ',i.predaddress,*/'
      '   ic.description     as "сыьорта ширкятин ады ",'
      '   cipinf.INSPOLICNUM       as "Сыьорта полисинин нюмряси",'
      '   cipinf.insamount         as "Сыьорта мябляьи",'
      '   cipinf.INSCONTRACTDATE   as "Сыьорта мцгавилясинин тарихи",'
      '   cipinf.INSCONTRLASTDATE  as "Сыьорта мцга битмя тарихи" ,'
      '   cipinf.INSCONTRACTPREIOD as "Сыьорта мцгавилясинин мцддяти",'
      '  h.rest " Kreditin qalыьы",ca.description "Мцштяринин типи"'
      '  from '
      '  cm_active_credits p,'
      '  CM_USERGROUPS c,cm_history h,'
      '  smart.customers a,cm_ip_info i,cm_ip_insurances ic,'
      
        '  (select custid,UNIQUEINSID,BB_INN,MONTHLYPROFIT,PASSTYPE,MARRI' +
        'AGE,INSPOLICNUM,INSPERIODID,insamount,INSCONTRACTDATE,INSCONTRAC' +
        'TPREIOD,INSCONTRLASTDATE,bb_familystatus'
      ',INSURANCECOMP,cardid  from smart.custipinfo'
      'union'
      
        'select  custid,null as UNIQUEINSID, null as BB_INN,null as MONTH' +
        'LYPROFIT,null as PASSTYPE ,null as MARRIAGE,null as INSPOLICNUM,' +
        'null as bb_familystatus,'
      
        'null as insamount,null as INSCONTRACTDATE,null as INSCONTRLASTDA' +
        'TE, null as INSCONTRACTPREIOD,null as INSPERIODID,null as INSURA' +
        'NCECOMP, null as cardid'
      'from ('
      ' select id as custid from smart.customers'
      ' minus'
      ' select custid from smart.custipinfo'
      '))cipinf,cm_categories ca '
      ',smart.customers cu'
      '  where '
      
        '  p.usrgroup=c.id   and cipinf.INSCONTRLASTDATE  between :dat an' +
        'd :dat+60 and'
      '  p.boorowerid=a.id and  ca.id=p.customertype and'
      '  i.creditid=p.id   and'
      '  i.insurancecompany=ic.id and'
      '  cipinf.custid = cu.id  and'
      '  P.boorowerid= cu.id and'
      
        '  h.creditid=p.id and h.hdate=(select tek_dat from smart.sysdat ' +
        ')'
      '/*33*/'
      ''
      '/*34*/'
      ''
      ' ')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 149
    Top = 236
  end
  object OracleDataSet7: TOracleDataSet
    SQL.Strings = (
      
        ' select rownum as "№",p.numberofcredit as "Мцгавиля №",c.descrip' +
        'tion as "МКТ",a.name as "Боръ аланын ады",'
      
        '  CM_COMMON.get_CustCartIpNum(cipinf.cardid )as dd,/*i.ownername' +
        ',i.predaddress,*/'
      '   ic.description   as "сыьорта ширкятин ады ",'
      '   cipinf.INSPOLICNUM       as "Сыьорта полисинин нюмряси",'
      '   cipinf.insamount         as "Сыьорта мябляьи",'
      '   cipinf.INSCONTRACTDATE   as "Сыьорта мцгавилясинин тарихи",'
      '   cipinf.INSCONTRLASTDATE  as "Сыьорта мцга битмя тарихи" ,'
      '   cipinf.INSCONTRACTPREIOD as "Сыьорта мцгавилясинин мцддяти",'
      '  h.rest " Kreditin qalыьы",ca.description "Мцштяринин типи"'
      '  from'
      '  cm_active_credits p,'
      '  CM_USERGROUPS c,cm_history h,'
      '  smart.customers a,cm_ip_info i,cm_ip_insurances ic,'
      
        '  (select custid,UNIQUEINSID,BB_INN,MONTHLYPROFIT,PASSTYPE,MARRI' +
        'AGE,INSPOLICNUM,INSPERIODID,insamount,INSCONTRACTDATE,INSCONTRAC' +
        'TPREIOD,INSCONTRLASTDATE,bb_familystatus'
      ',INSURANCECOMP,cardid  from smart.custipinfo'
      'union'
      
        'select  custid,null as UNIQUEINSID, null as BB_INN,null as MONTH' +
        'LYPROFIT,null as PASSTYPE ,null as MARRIAGE,null as INSPOLICNUM,' +
        'null as bb_familystatus,'
      
        'null as insamount,null as INSCONTRACTDATE,null as INSCONTRLASTDA' +
        'TE, null as INSCONTRACTPREIOD,null as INSPERIODID,null as INSURA' +
        'NCECOMP, null as cardid'
      'from ('
      ' select id as custid from smart.customers'
      ' minus'
      ' select custid from smart.custipinfo'
      '))cipinf,cm_categories ca '
      ',smart.customers cu'
      '  where'
      '  p.usrgroup=c.id   and ca.id=p.customertype and'
      
        '  p.boorowerid=a.id and cipinf.INSCONTRLASTDATE<(select tek_dat ' +
        'from smart.sysdat ) and'
      '  i.creditid=p.id   and'
      '  i.insurancecompany=ic.id and'
      '  cipinf.custid = cu.id  and'
      '  P.boorowerid= cu.id and'
      
        '  h.creditid=p.id and h.hdate=(select tek_dat from smart.sysdat ' +
        ') '
      ' /*33*/'
      ''
      ' /*34*/'
      '')
    Session = CMDataModule.CMSession
    Left = 189
    Top = 236
  end
end
