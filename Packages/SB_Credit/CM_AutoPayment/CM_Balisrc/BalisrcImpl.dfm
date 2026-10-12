object Bali: TBali
  Left = 379
  Top = 194
  Caption = 'Axar'#305#351
  ClientHeight = 100
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 325
    Height = 124
    Align = alTop
    BevelOuter = bvLowered
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 194
      Top = 72
      Width = 57
      Height = 22
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 255
      Top = 72
      Width = 59
      Height = 23
      Caption = 'close'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 35
      Height = 13
      Caption = 'Harada'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 21
      Height = 13
      Caption = 'N'#601'yi'
    end
    object Edit1: TEdit
      Left = 51
      Top = 46
      Width = 260
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
    object ComboBox1: TComboBox
      Left = 51
      Top = 10
      Width = 263
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Items.Strings = (
        'Ad'#305'.Soyad'#305'.Atas'#305'n'#305'n ad'#305
        'ID-si'
        'PinKodu')
    end
    object Edit2: TEdit
      Left = 8
      Top = 21
      Width = 57
      Height = 19
      TabOrder = 2
      Visible = False
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select rownum, p.id,p.numberofcredit,b.boorowerid,b.name,v.val_n' +
        'ame,b.guarantorsalary,b.guarantorname,p.creditlineamount,h.rest+' +
        'h.duerest rest,h.interestrest,'
      
        ' (select description from cm_usergroups where id=usrgroup) exp f' +
        'rom smart.cm_active_credits p,CM_BOOROWERINFO b,smart.avalute_t ' +
        'v,cm_curr_state h'
      'where p.id=b.creditid and p.id=h.creditid and'
      'p.currency=v.valute --and rownum=1'
      ''
      ''
      'order by rownum'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000C0000000C00000052004F0057004E0055004D000100000000001C00
      00004E0055004D004200450052004F0046004300520045004400490054000100
      000000001400000042004F004F0052004F005700450052004900440001000000
      0000080000004E0041004D00450001000000000010000000560041004C005F00
      4E0041004D0045000100000000001E000000470055004100520041004E005400
      4F005200530041004C004100520059000100000000001A000000470055004100
      520041004E0054004F0052004E0041004D004500010000000000200000004300
      520045004400490054004C0049004E00450041004D004F0055004E0054000100
      0000000004000000490044000100000000000800000052004500530054000100
      000000001800000049004E005400450052004500530054005200450053005400
      01000000000006000000450058005000010000000000}
    Session = sboapiDataModule.SBSession
    Top = 73
    object OracleDataSet1ROWNUM: TFloatField
      FieldName = 'ROWNUM'
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
    object OracleDataSet1CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1REST: TFloatField
      FieldName = 'REST'
    end
    object OracleDataSet1INTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
    end
    object OracleDataSet1EXP: TWideStringField
      FieldName = 'EXP'
      Size = 256
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 33
    Top = 74
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      
        'select rownum,p.id, p.numberofcredit,b.boorowerid,b.name,v.val_n' +
        'ame,b.guarantorsalary,b.guarantorname,h.rest as creditlineamount' +
        ','
      
        'b.guarantorname2,b.guarantorsalary2,p.dateofconclusion,p.duedate' +
        'firstcontract,b.phonenumber,b.salary,b.zaminwork1,'
      'b.zamintel1'
      
        ' from smart.cm_active_credits p,CM_BOOROWERINFO b,smart.avalute_' +
        't v,cm_history h'
      
        'where p.id=b.creditid and h.creditid=p.id and h.hdate =(select t' +
        'ek_dat from smart.sysdat) and'
      'p.currency=v.valute '
      'and p.id=:pid'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00500049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000120000000C00000052004F0057004E0055004D000100000000001C00
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
      1200000052004500530045005200560045004900440001000000000004000000
      49004400010000000000}
    Master = OracleDataSet1
    MasterFields = 'id'
    DetailFields = 'pid'
    Session = sboapiDataModule.SBSession
    Left = 89
    Top = 74
    object OracleDataSet2ROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object OracleDataSet2NUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object OracleDataSet2VAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OracleDataSet2CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
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
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 121
    Top = 74
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 177
    Top = 74
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      
        'select rownum, B.* from smart.CM_ZaminID B where B.boorowerid is' +
        ' not null'
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000130000000C00000052004F0057004E0055004D000100000000000400
      0000490044000100000000001C0000004E0055004D004200450052004F004600
      4300520045004400490054000100000000001400000042004F004F0052004F00
      57004500520049004400010000000000080000004E0041004D00450001000000
      000010000000560041004C005F004E0041004D0045000100000000001E000000
      470055004100520041004E0054004F005200530041004C004100520059000100
      000000001A000000470055004100520041004E0054004F0052004E0041004D00
      4500010000000000200000004300520045004400490054004C0049004E004500
      41004D004F0055004E0054000100000000002000000044004100540045004F00
      460043004F004E0043004C005500530049004F004E0001000000000028000000
      44005500450044004100540045004600490052005300540043004F004E005400
      520041004300540001000000000016000000500048004F004E0045004E005500
      4D004200450052000100000000000C000000530041004C004100520059000100
      00000000140000005A0041004D0049004E0057004F0052004B00310001000000
      0000120000005A0041004D0049004E00540045004C0031000100000000000E00
      0000500049004E0043004F004400450001000000000008000000520045005300
      54000100000000001800000049004E0054004500520045005300540052004500
      530054000100000000001000000043005500530054004E0041004D0045000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 249
    Top = 74
    object OracleDataSet3ROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object OracleDataSet3ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet3BOOROWERID: TWideStringField
      FieldName = 'BOOROWERID'
      Size = 256
    end
    object OracleDataSet3NUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 128
    end
    object OracleDataSet3NAME: TWideStringField
      FieldName = 'NAME'
      Size = 256
    end
    object OracleDataSet3VAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 160
    end
    object OracleDataSet3GUARANTORSALARY: TWideStringField
      FieldName = 'GUARANTORSALARY'
      Size = 320
    end
    object OracleDataSet3GUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 256
    end
    object OracleDataSet3CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object OracleDataSet3DATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object OracleDataSet3DUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
    end
    object OracleDataSet3PHONENUMBER: TWideStringField
      FieldName = 'PHONENUMBER'
      Size = 1020
    end
    object OracleDataSet3SALARY: TWideStringField
      FieldName = 'SALARY'
      Size = 320
    end
    object OracleDataSet3ZAMINWORK1: TWideStringField
      FieldName = 'ZAMINWORK1'
      Size = 320
    end
    object OracleDataSet3PINCODE: TWideStringField
      FieldName = 'PINCODE'
      Size = 28
    end
    object OracleDataSet3REST: TFloatField
      FieldName = 'REST'
    end
    object OracleDataSet3INTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
    end
    object OracleDataSet3ZAMINTEL1: TWideStringField
      FieldName = 'ZAMINTEL1'
      Size = 320
    end
    object OracleDataSet3CUSTNAME: TWideStringField
      FieldName = 'CUSTNAME'
      Size = 360
    end
  end
end
