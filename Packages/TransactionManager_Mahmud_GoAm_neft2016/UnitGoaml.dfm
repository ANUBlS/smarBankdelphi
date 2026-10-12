object FormGo: TFormGo
  Left = 0
  Top = 0
  Caption = 'FormGo'
  ClientHeight = 429
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 990
    Height = 429
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select  i.report_code,i.transmode_code ,m."ID",m.DEBITBALANCE,m.' +
        'CREDITBALANCE,m.DEBITACCNO,m.CREDITACCNO,m.DEBITAMOUNT,m.CREDITA' +
        'MOUNT,m.DEBITRATE,m.CREDITRATE from MMMM m,mmx_transinfo  i wher' +
        'e m.id=i.transid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000B000000160000005200450050004F00520054005F0043004F004400
      45000100000000001C0000005400520041004E0053004D004F00440045005F00
      43004F0044004500010000000000040000004900440001000000000018000000
      44004500420049005400420041004C0041004E00430045000100000000001A00
      0000430052004500440049005400420041004C0041004E004300450001000000
      000014000000440045004200490054004100430043004E004F00010000000000
      160000004300520045004400490054004100430043004E004F00010000000000
      160000004400450042004900540041004D004F0055004E005400010000000000
      1800000043005200450044004900540041004D004F0055004E00540001000000
      0000120000004400450042004900540052004100540045000100000000001400
      00004300520045004400490054005200410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 64
    object OracleDataSet1REPORT_CODE: TWideStringField
      DisplayWidth = 38
      FieldName = 'REPORT_CODE'
      Size = 80
    end
    object OracleDataSet1TRANSMODE_CODE: TIntegerField
      DisplayWidth = 19
      FieldName = 'TRANSMODE_CODE'
    end
    object OracleDataSet1ID: TFloatField
      DisplayWidth = 12
      FieldName = 'ID'
    end
    object OracleDataSet1DEBITBALANCE: TFloatField
      DisplayWidth = 15
      FieldName = 'DEBITBALANCE'
    end
    object OracleDataSet1CREDITBALANCE: TFloatField
      DisplayWidth = 17
      FieldName = 'CREDITBALANCE'
    end
    object OracleDataSet1DEBITACCNO: TWideStringField
      DisplayWidth = 538
      FieldName = 'DEBITACCNO'
      Size = 448
    end
    object OracleDataSet1CREDITACCNO: TWideStringField
      DisplayWidth = 538
      FieldName = 'CREDITACCNO'
      Size = 448
    end
    object OracleDataSet1DEBITAMOUNT: TFloatField
      DisplayWidth = 15
      FieldName = 'DEBITAMOUNT'
    end
    object OracleDataSet1CREDITAMOUNT: TFloatField
      DisplayWidth = 16
      FieldName = 'CREDITAMOUNT'
    end
    object OracleDataSet1DEBITRATE: TFloatField
      DisplayWidth = 12
      FieldName = 'DEBITRATE'
    end
    object OracleDataSet1CREDITRATE: TFloatField
      DisplayWidth = 13
      FieldName = 'CREDITRATE'
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select*from mmx_reportcode')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 64
    object OracleDataSet2ID: TIntegerField
      FieldName = 'ID'
    end
    object OracleDataSet2NAME: TWideStringField
      FieldName = 'NAME'
    end
    object OracleDataSet2DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 600
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 40
    Top = 136
  end
end
