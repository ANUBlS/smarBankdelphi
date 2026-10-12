object Bali: TBali
  Left = 379
  Top = 194
  ClientHeight = 75
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 75
    Align = alTop
    BevelOuter = bvLowered
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    object Label10: TLabel
      Left = 122
      Top = 3
      Width = 37
      Height = 13
      Caption = #1057'.'#1040'.'#1040':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 365
      Top = 4
      Width = 14
      Height = 13
      Caption = #1048#1044
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 48
      Width = 57
      Height = 22
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 398
      Top = 47
      Width = 59
      Height = 23
      Caption = 'close'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Edit1: TEdit
      Left = 3
      Top = 20
      Width = 279
      Height = 19
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 296
      Top = 22
      Width = 161
      Height = 19
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit2Exit
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select rownum, p.id,p.numberofcredit,b.boorowerid,b.name,v.val_n' +
        'ame,b.guarantorsalary,b.guarantorname,p.creditlineamount,credits' +
        'mgr.CM_AK_REPORTS.Get_zamin(b.BOOROWERID)as d'
      
        ' from creditsmgr.cm_active_credits p,creditsmgr.CM_BOOROWERINFO ' +
        'b,smart.avalute_t v'
      'where p.id=b.creditid and '
      'p.currency=v.valute --and rownum=1'
      ''
      ''
      'order by rownum'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000A0000000C00000052004F0057004E0055004D000100000000001C00
      00004E0055004D004200450052004F0046004300520045004400490054000100
      000000001400000042004F004F0052004F005700450052004900440001000000
      0000080000004E0041004D00450001000000000010000000560041004C005F00
      4E0041004D0045000100000000001E000000470055004100520041004E005400
      4F005200530041004C004100520059000100000000001A000000470055004100
      520041004E0054004F0052004E0041004D004500010000000000200000004300
      520045004400490054004C0049004E00450041004D004F0055004E0054000100
      000000000400000049004400010000000000020000004400010000000000}
    Session = CMDataModule.CMSession
    Top = 40
    object OracleDataSet1ROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1NUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object OracleDataSet1BOOROWERID: TWideStringField
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet1VAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OracleDataSet1GUARANTORSALARY: TWideStringField
      FieldName = 'GUARANTORSALARY'
      Size = 80
    end
    object OracleDataSet1GUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 64
    end
    object OracleDataSet1CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object OracleDataSet1D: TWideStringField
      FieldName = 'D'
      Size = 4000
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 33
    Top = 41
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      
        'select rownum,p.id, p.numberofcredit,b.boorowerid,b.name,v.val_n' +
        'ame,b.guarantorsalary,b.guarantorname,h.rest as creditlineamount' +
        ','
      
        'b.guarantorname2,b.guarantorsalary2,p.dateofconclusion,p.duedate' +
        'firstcontract,b.phonenumber,b.salary,b.zaminwork1,'
      'b.zamintel1'
      
        ' from creditsmgr.cm_active_credits p,creditsmgr.CM_BOOROWERINFO ' +
        'b,smart.avalute_t v,creditsmgr.cm_history h'
      
        'where p.id=b.creditid and h.creditid=p.id and h.hdate =(select t' +
        'ek_dat from smart.sysdat) and'
      'p.currency=v.valute '
      'and p.id=:pid'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00500049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000110000000C00000052004F0057004E0055004D000100000000001C00
      00004E0055004D004200450052004F0046004300520045004400490054000100
      000000001400000042004F004F0052004F005700450052004900440001000000
      0000080000004E0041004D00450001000000000010000000560041004C005F00
      4E0041004D0045000100000000001E000000470055004100520041004E005400
      4F005200530041004C004100520059000100000000001A000000470055004100
      520041004E0054004F0052004E0041004D004500010000000000200000004300
      520045004400490054004C0049004E00450041004D004F0055004E0054000100
      000000001C000000470055004100520041004E0054004F0052004E0041004D00
      4500320001000000000020000000470055004100520041004E0054004F005200
      530041004C004100520059003200010000000000200000004400410054004500
      4F00460043004F004E0043004C005500530049004F004E000100000000002800
      000044005500450044004100540045004600490052005300540043004F004E00
      5400520041004300540001000000000016000000500048004F004E0045004E00
      55004D004200450052000100000000000C000000530041004C00410052005900
      010000000000140000005A0041004D0049004E0057004F0052004B0031000100
      00000000120000005A0041004D0049004E00540045004C003100010000000000
      0400000049004400010000000000}
    Master = OracleDataSet1
    MasterFields = 'id'
    DetailFields = 'pid'
    Session = CMDataModule.CMSession
    Left = 89
    Top = 41
    object OracleDataSet2ROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet2NUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object OracleDataSet2BOOROWERID: TWideStringField
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object OracleDataSet2NAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet2VAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OracleDataSet2GUARANTORSALARY: TWideStringField
      FieldName = 'GUARANTORSALARY'
      Size = 80
    end
    object OracleDataSet2GUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 64
    end
    object OracleDataSet2CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object OracleDataSet2GUARANTORNAME2: TWideStringField
      FieldName = 'GUARANTORNAME2'
      Size = 80
    end
    object OracleDataSet2GUARANTORSALARY2: TWideStringField
      FieldName = 'GUARANTORSALARY2'
      Size = 80
    end
    object OracleDataSet2DATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object OracleDataSet2DUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
    end
    object OracleDataSet2PHONENUMBER: TWideStringField
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object OracleDataSet2SALARY: TWideStringField
      FieldName = 'SALARY'
      Size = 80
    end
    object OracleDataSet2ZAMINWORK1: TWideStringField
      FieldName = 'ZAMINWORK1'
      Size = 80
    end
    object OracleDataSet2ZAMINTEL1: TWideStringField
      FieldName = 'ZAMINTEL1'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 121
    Top = 41
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 177
    Top = 41
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      
        'select rownum, c.* from creditsmgr.CM_ZaminID c where c.guaranto' +
        'rid is not null'
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000120000000C00000052004F0057004E0055004D000100000000000400
      00004900440001000000000016000000470055004100520041004E0054004F00
      5200490044000100000000001C0000004E0055004D004200450052004F004600
      4300520045004400490054000100000000001400000042004F004F0052004F00
      57004500520049004400010000000000080000004E0041004D00450001000000
      000010000000560041004C005F004E0041004D0045000100000000001E000000
      470055004100520041004E0054004F005200530041004C004100520059000100
      000000001A000000470055004100520041004E0054004F0052004E0041004D00
      4500010000000000200000004300520045004400490054004C0049004E004500
      41004D004F0055004E0054000100000000001C00000047005500410052004100
      4E0054004F0052004E0041004D00450032000100000000002000000047005500
      4100520041004E0054004F005200530041004C00410052005900320001000000
      00002000000044004100540045004F00460043004F004E0043004C0055005300
      49004F004E000100000000002800000044005500450044004100540045004600
      490052005300540043004F004E00540052004100430054000100000000001600
      0000500048004F004E0045004E0055004D004200450052000100000000000C00
      0000530041004C00410052005900010000000000140000005A0041004D004900
      4E0057004F0052004B003100010000000000120000005A0041004D0049004E00
      540045004C003100010000000000}
    Session = CMDataModule.CMSession
    Left = 225
    Top = 41
    object OracleDataSet3ROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object OracleDataSet3ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet3GUARANTORID: TWideStringField
      FieldName = 'GUARANTORID'
      Size = 80
    end
    object OracleDataSet3NUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object OracleDataSet3BOOROWERID: TWideStringField
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object OracleDataSet3NAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet3VAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OracleDataSet3GUARANTORSALARY: TWideStringField
      FieldName = 'GUARANTORSALARY'
      Size = 80
    end
    object OracleDataSet3GUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 64
    end
    object OracleDataSet3CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object OracleDataSet3GUARANTORNAME2: TWideStringField
      FieldName = 'GUARANTORNAME2'
      Size = 80
    end
    object OracleDataSet3GUARANTORSALARY2: TWideStringField
      FieldName = 'GUARANTORSALARY2'
      Size = 80
    end
    object OracleDataSet3DATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object OracleDataSet3DUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
    end
    object OracleDataSet3PHONENUMBER: TWideStringField
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object OracleDataSet3SALARY: TWideStringField
      FieldName = 'SALARY'
      Size = 80
    end
    object OracleDataSet3ZAMINWORK1: TWideStringField
      FieldName = 'ZAMINWORK1'
      Size = 80
    end
    object OracleDataSet3ZAMINTEL1: TWideStringField
      FieldName = 'ZAMINTEL1'
      Size = 30
    end
  end
end
