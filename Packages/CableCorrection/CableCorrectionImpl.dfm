object CableCorrect: TCableCorrect
  Left = 259
  Top = 224
  Width = 933
  Height = 640
  Caption = 'CableCorrect'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 925
    Height = 572
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        EditButtons = <>
        FieldName = 'ABONENT'
        Footers = <>
        Width = 192
      end
      item
        Color = clBtnFace
        EditButtons = <>
        FieldName = 'PACKAGENAME'
        Footers = <>
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'CONTRACT_NUM'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'CARD_NUM'
        Footers = <>
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'AMOUNT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'LASTCALCDATE'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'REST'
        Footers = <>
        Width = 133
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 572
    Width = 925
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Button1: TButton
      Left = 840
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Йениля'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select rowid, id, cable_pack.getabonname (abn_id) abonent, cable' +
        '_pack.getpackname(pack_num) packagename, contract_num,'
      
        '       card_num, inst_date, serie, works_num, cable_length, amou' +
        'nt, discount, discount_desc,'
      '        rest, lastcalcdate, exp_date'
      '  from bb_contracts'
      ''
      'order by 3')
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000200000049440100000000000700000041424F4E454E5401
      00000000000B0000005041434B4147454E414D450100000000000C000000434F
      4E54524143545F4E554D01000000000008000000434152445F4E554D01000000
      000009000000494E53545F444154450100000000000500000053455249450100
      0000000009000000574F524B535F4E554D0100000000000C0000004341424C45
      5F4C454E47544801000000000006000000414D4F554E54010000000000080000
      00444953434F554E540100000000000D000000444953434F554E545F44455343
      01000000000004000000524553540100000000000C0000004C41535443414C43
      44415445010000000000080000004558505F44415445010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 232
    Top = 152
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1ABONENT: TStringField
      DisplayLabel = 'Абонент'
      FieldName = 'ABONENT'
      Size = 4000
    end
    object OracleDataSet1PACKAGENAME: TStringField
      DisplayLabel = 'Пакет'
      FieldName = 'PACKAGENAME'
      Size = 4000
    end
    object OracleDataSet1CONTRACT_NUM: TStringField
      DisplayLabel = 'Мцгавиля №'
      FieldName = 'CONTRACT_NUM'
    end
    object OracleDataSet1CARD_NUM: TStringField
      DisplayLabel = 'Карт №'
      FieldName = 'CARD_NUM'
    end
    object OracleDataSet1INST_DATE: TDateTimeField
      FieldName = 'INST_DATE'
    end
    object OracleDataSet1SERIE: TStringField
      FieldName = 'SERIE'
      Size = 25
    end
    object OracleDataSet1WORKS_NUM: TStringField
      FieldName = 'WORKS_NUM'
      Size = 25
    end
    object OracleDataSet1CABLE_LENGTH: TFloatField
      FieldName = 'CABLE_LENGTH'
    end
    object OracleDataSet1AMOUNT: TFloatField
      DisplayLabel = 'Гиймяти'
      FieldName = 'AMOUNT'
    end
    object OracleDataSet1DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object OracleDataSet1DISCOUNT_DESC: TStringField
      FieldName = 'DISCOUNT_DESC'
      Size = 25
    end
    object OracleDataSet1REST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
    end
    object OracleDataSet1LASTCALCDATE: TDateTimeField
      DisplayLabel = 'Сон щес. тарихи'
      FieldName = 'LASTCALCDATE'
    end
    object OracleDataSet1EXP_DATE: TDateTimeField
      FieldName = 'EXP_DATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 200
    Top = 152
  end
end
