object FormAdd: TFormAdd
  Left = 0
  Top = 0
  Caption = 'FormAdd'
  ClientHeight = 212
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 212
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 384
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 29
        Top = 4
        Width = 23
        Height = 16
        Alignment = taCenter
        Caption = 'BKT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 108
        Top = 3
        Width = 273
        Height = 21
        Alignment = taLeftJustify
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSBKTName
        TabOrder = 0
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 30
      Width = 384
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 29
        Top = 6
        Width = 20
        Height = 16
        Alignment = taCenter
        Caption = 'TIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 108
        Top = 1
        Width = 273
        Height = 21
        Alignment = taLeftJustify
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DSBKT
        TabOrder = 0
        Visible = True
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 58
      Width = 384
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label3: TLabel
        Left = 29
        Top = 6
        Width = 51
        Height = 16
        Alignment = taCenter
        Caption = 'BALANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 108
        Top = 3
        Width = 273
        Height = 21
        Alignment = taLeftJustify
        EditButtons = <>
        KeyField = 'BAL_CN'
        ListField = 'BAL_CN'
        ListSource = DSBalanas
        TabOrder = 0
        Visible = True
      end
    end
    object BitBtn1: TBitBtn
      Left = 152
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 243
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Imtina'
      DoubleBuffered = True
      Kind = bkNo
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 4
    end
  end
  object BKTName: TOracleDataSet
    SQL.Strings = (
      'select * from bkt_name'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 152
  end
  object DSBKTName: TDataSource
    DataSet = BKTName
    Left = 95
    Top = 154
  end
  object ODSBKT: TOracleDataSet
    SQL.Strings = (
      'select * from bkt1'
      'order by a'
      '  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000005000000040000004900440001000000000014000000470045004C00
      490052005F005800450052004300010000000000060000004900440044000100
      0000000002000000410001000000000016000000440045005300430052004900
      5000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 152
    object ODSBKTID: TFloatField
      FieldName = 'ID'
    end
    object ODSBKTDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 250
    end
  end
  object DSBKT: TDataSource
    DataSet = ODSBKT
    Left = 256
    Top = 152
  end
  object DSBalanas: TDataSource
    DataSet = ODSBalans
    Left = 96
    Top = 104
  end
  object ODSBalans: TOracleDataSet
    SQL.Strings = (
      'select bal_cn from bal_spr1'
      'union'
      'select bal_cn from out_bal_spr1')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000190000000C000000420041004C005F0043004E000100000000000C00
      0000540059005000450049004400010000000000200000004100440044004900
      540049004F004E0041004C005400590050004500490044000100000000001000
      0000410043004300470052004F00550050000100000000001000000041004300
      430043004C004100530053000100000000000A000000530041004C0044004F00
      0100000000000800000050004100520054000100000000000E00000042004100
      4C004E0041004D0045000100000000001800000043004C004F00530045004200
      41004C0041004E00430045000100000000001C00000052004100540045004400
      4900460046004500520045004E00430045000100000000002000000043005500
      5200520045004E004300590050004F0053004900540049004F004E0001000000
      000018000000430041005300480049004E0043004F004D0049004E0047000100
      0000000012000000460052004F004D005400520041004E005300010000000000
      06000000560041004C0001000000000006000000520045005A00010000000000
      1800000049004E005400450052005F00560041004C0055005400450001000000
      00001200000043005500530054005F0054005900500045000100000000001000
      00005200450053004900440045004E0054000100000000001400000047004F00
      5600450052004E004D0045004E00540001000000000008000000530059004D00
      4200010000000000100000005300460045005200410044004500590001000000
      0000100000004100430043005F0054005900500045000100000000000A000000
      47004F0041004D004C000100000000000C00000050004500520049004F004400
      0100000000001200000053004500430054004F0052005F004900440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 104
  end
  object prudensial: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'prudensial'
    Left = 320
    Top = 152
  end
end
