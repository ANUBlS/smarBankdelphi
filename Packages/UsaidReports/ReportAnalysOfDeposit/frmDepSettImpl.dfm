object frmDepSett: TfrmDepSett
  Left = 484
  Top = 115
  BorderIcons = [biSystemMenu]
  Caption = 'frmDepSett'
  ClientHeight = 462
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object BitBtn1: TBitBtn
    Left = 293
    Top = 431
    Width = 81
    Height = 28
    Caption = #1041#1072#1100#1083#1072
    DoubleBuffered = True
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 387
    Height = 428
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1052#1103#1085#1073#1103
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 379
        Height = 198
        Align = alTop
        DataSource = DSourceds
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Azl Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -12
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 204
          end>
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 198
        Width = 379
        Height = 201
        Align = alClient
        Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099
        TabOrder = 1
        object DBGridEh2: TDBGridEh
          Left = 2
          Top = 16
          Width = 375
          Height = 183
          Align = alClient
          DataSource = DSource_Bds
          FooterColor = clWindow
          FooterFont.Charset = RUSSIAN_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Azl Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyDown = DBGridEh1KeyDown
          OnKeyPress = DBGridEh2KeyPress
          Columns = <
            item
              EditButtons = <>
              FieldName = 'BAL_CN'
              Footers = <>
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 204
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1058#1080#1087
      ImageIndex = 2
      object DBGridEh5: TDBGridEh
        Left = 0
        Top = 0
        Width = 379
        Height = 198
        Align = alTop
        DataSource = DTypeds
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Azl Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -12
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 204
          end>
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 198
        Width = 379
        Height = 201
        Align = alClient
        Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099
        TabOrder = 1
        object DBGridEh6: TDBGridEh
          Left = 2
          Top = 16
          Width = 375
          Height = 183
          Align = alClient
          DataSource = DType_bds
          FooterColor = clWindow
          FooterFont.Charset = RUSSIAN_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Azl Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnKeyDown = DBGridEh1KeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'BAL_CN'
              Footers = <>
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 204
            end>
        end
      end
    end
  end
  object DSource: TOracleDataSet
    SQL.Strings = (
      'SELECT  rowid,id, name'
      '  FROM uaod_source  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 20
    Top = 56
    object DSourceID: TFloatField
      FieldName = 'ID'
    end
    object DSourceNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 320
    end
  end
  object DSource_B: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, sourceid, bal_cn'
      '  FROM uaod_source_bal '
      ''
      'where sourceid = :sourceid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0053004F005500520043004500490044000400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001000000053004F005500
      520043004500490044000100000000000C000000420041004C005F0043004E00
      010000000000}
    Master = DSource
    MasterFields = 'ID'
    DetailFields = 'SOURCEID'
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 20
    Top = 88
    object DSource_BID: TFloatField
      FieldName = 'ID'
    end
    object DSource_BSOURCEID: TFloatField
      FieldName = 'SOURCEID'
    end
    object DSource_BBAL_CN: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089
      FieldName = 'BAL_CN'
      Required = True
    end
  end
  object DPerson: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid, id,  name'
      '  FROM uaod_person  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 88
    Top = 57
    object DPersonID: TFloatField
      FieldName = 'ID'
    end
    object DPersonNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 200
    end
  end
  object DPerson_b: TOracleDataSet
    SQL.Strings = (
      'SELECT  rowid,id,  personid,  bal_cn'
      '  FROM uaod_person_bal  '
      ''
      'where personid = :personid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050004500520053004F004E00490044000400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000010000000500045005200
      53004F004E00490044000100000000000C000000420041004C005F0043004E00
      010000000000}
    Master = DPerson
    MasterFields = 'ID'
    DetailFields = 'PERSONID'
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 88
    Top = 89
    object DPerson_bID: TFloatField
      FieldName = 'ID'
    end
    object DPerson_bPERSONID: TFloatField
      FieldName = 'PERSONID'
      Required = True
    end
    object DPerson_bBAL_CN: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089
      FieldName = 'BAL_CN'
      Required = True
    end
  end
  object DType: TOracleDataSet
    SQL.Strings = (
      'SELECT  rowid,id,  name'
      '  FROM uaod_type  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 164
    Top = 56
    object DTypeID: TFloatField
      FieldName = 'ID'
    end
    object DTypeNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 320
    end
  end
  object DType_b: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid, id,  typeid,  bal_cn'
      '  FROM uaod_type_bal  '
      ''
      'where typeid = :typeid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00540059005000450049004400040000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000540059005000
      4500490044000100000000000C000000420041004C005F0043004E0001000000
      0000}
    Master = DType
    MasterFields = 'ID'
    DetailFields = 'TYPEID'
    Session = sboapiDataModule.SBSession
    AfterPost = DSourceAfterPost
    Left = 168
    Top = 88
    object DType_bID: TFloatField
      FieldName = 'ID'
    end
    object DType_bTYPEID: TFloatField
      FieldName = 'TYPEID'
      Required = True
    end
    object DType_bBAL_CN: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089
      FieldName = 'BAL_CN'
      Required = True
    end
  end
  object DSourceds: TDataSource
    DataSet = DSource
    Left = 52
    Top = 56
  end
  object DSource_Bds: TDataSource
    DataSet = DSource_B
    Left = 52
    Top = 88
  end
  object DPersonds: TDataSource
    DataSet = DPerson
    Left = 122
    Top = 59
  end
  object DPerson_bds: TDataSource
    DataSet = DPerson_b
    Left = 123
    Top = 88
  end
  object DTypeds: TDataSource
    DataSet = DType
    Left = 212
    Top = 56
  end
  object DType_bds: TDataSource
    DataSet = DType_b
    Left = 210
    Top = 88
  end
end
