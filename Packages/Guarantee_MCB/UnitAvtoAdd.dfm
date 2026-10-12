object FormAfto: TFormAfto
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Avtomobil m'#601'lumatlar'#305
  ClientHeight = 332
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 137
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Marka'
    end
    object Label2: TLabel
      Left = 209
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Model'
    end
    object Label3: TLabel
      Left = 13
      Top = 48
      Width = 14
      Height = 13
      Caption = 'Tip'
    end
    object Label4: TLabel
      Left = 13
      Top = 80
      Width = 25
      Height = 13
      Caption = 'R'#601'ng'
    end
    object Label5: TLabel
      Left = 209
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Qeydiyyat ni'#351'ani'
    end
    object Label6: TLabel
      Left = 439
      Top = 47
      Width = 77
      Height = 13
      Caption = 'Qeydiyyat tarixi'
    end
    object Label7: TLabel
      Left = 439
      Top = 79
      Width = 48
      Height = 13
      Caption = 'Burax'#305'l'#305#351' ili'
    end
    object Label8: TLabel
      Left = 13
      Top = 109
      Width = 18
      Height = 13
      Caption = 'Ban'
    end
    object Label9: TLabel
      Left = 209
      Top = 80
      Width = 41
      Height = 13
      Caption = 'M'#252'h'#601'rrik'
    end
    object Label10: TLabel
      Left = 208
      Top = 109
      Width = 79
      Height = 13
      Caption = 'M'#252'h'#601'rrikin h'#601'cmi'
    end
    object Label41: TLabel
      Left = 42
      Top = 14
      Width = 8
      Height = 16
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 282
      Top = 14
      Width = 8
      Height = 16
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEditEh1: TDBEditEh
      Left = 71
      Top = 17
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 293
      Top = 13
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 71
      Top = 44
      Width = 121
      Height = 21
      Alignment = taRightJustify
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DBEditEh4: TDBEditEh
      Left = 293
      Top = 44
      Width = 121
      Height = 21
      Alignment = taRightJustify
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object DBEditEh5: TDBEditEh
      Left = 71
      Top = 74
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object DBEditEh7: TDBEditEh
      Left = 71
      Top = 104
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBEditEh8: TDBEditEh
      Left = 293
      Top = 74
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object DBEditEh10: TDBEditEh
      Left = 293
      Top = 104
      Width = 121
      Height = 21
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object DBDateTimeEditEh5: TDBDateTimeEditEh
      Tag = 1
      Left = 521
      Top = 75
      Width = 124
      Height = 21
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 8
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Tag = 1
      Left = 521
      Top = 44
      Width = 123
      Height = 21
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 9
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 295
    Width = 829
    Height = 37
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 466
    object Button1: TButton
      Left = 668
      Top = 3
      Width = 75
      Height = 33
      Caption = 'Q'#601'bul'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 749
      Top = 3
      Width = 75
      Height = 33
      Caption = 'Ba'#287'la'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 137
    Width = 829
    Height = 158
    Align = alClient
    DataSource = dsrc_avto
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AVTO_MODEL'
        Title.Caption = 'Model'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_MAKA'
        Title.Caption = 'Marka'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_TIP'
        Title.Caption = 'Tipi'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_NO'
        Title.Caption = 'Serya '#8470
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_RENG'
        Title.Caption = 'R'#601'ng'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_IL'
        Title.Caption = #304'li'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_MUHER_NO'
        Title.Caption = 'M'#252'h'#601'rrik '#8470
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_MUHER_HECM'
        Title.Caption = 'M'#252'h'#601'rrik h'#601'cmi'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_REGSTR_DAT'
        Title.Caption = 'Reqistrasiya tarixi'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVTO_BAN'
        Title.Caption = 'BAN '#8470
        Width = 80
        Visible = True
      end>
  end
  object ods_avto: TOracleDataSet
    SQL.Strings = (
      'select*from cm_guarantee_avto where guar_id=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000C00000004000000490044000100000000000E000000470055004100
      52005F0049004400010000000000140000004100560054004F005F004D004F00
      440045004C00010000000000120000004100560054004F005F004D0041004B00
      4100010000000000100000004100560054004F005F0054004900500001000000
      00000E0000004100560054004F005F004E004F00010000000000120000004100
      560054004F005F00520045004E0047000100000000000E000000410056005400
      4F005F0049004C000100000000001A0000004100560054004F005F004D005500
      4800450052005F004E004F000100000000001E0000004100560054004F005F00
      4D0055004800450052005F004800450043004D000100000000001E0000004100
      560054004F005F005200450047005300540052005F0044004100540001000000
      0000100000004100560054004F005F00420041004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 168
    object ods_avtoID: TFloatField
      FieldName = 'ID'
    end
    object ods_avtoGUAR_ID: TFloatField
      FieldName = 'GUAR_ID'
    end
    object ods_avtoAVTO_MODEL: TWideStringField
      FieldName = 'AVTO_MODEL'
      Size = 100
    end
    object ods_avtoAVTO_MAKA: TWideStringField
      FieldName = 'AVTO_MAKA'
      Size = 100
    end
    object ods_avtoAVTO_TIP: TWideStringField
      FieldName = 'AVTO_TIP'
      Size = 100
    end
    object ods_avtoAVTO_NO: TWideStringField
      FieldName = 'AVTO_NO'
      Size = 100
    end
    object ods_avtoAVTO_RENG: TWideStringField
      FieldName = 'AVTO_RENG'
      Size = 100
    end
    object ods_avtoAVTO_IL: TDateTimeField
      FieldName = 'AVTO_IL'
    end
    object ods_avtoAVTO_MUHER_NO: TWideStringField
      FieldName = 'AVTO_MUHER_NO'
      Size = 100
    end
    object ods_avtoAVTO_MUHER_HECM: TWideStringField
      FieldName = 'AVTO_MUHER_HECM'
      Size = 100
    end
    object ods_avtoAVTO_REGSTR_DAT: TDateTimeField
      FieldName = 'AVTO_REGSTR_DAT'
    end
    object ods_avtoAVTO_BAN: TWideStringField
      FieldName = 'AVTO_BAN'
      Size = 50
    end
  end
  object dsrc_avto: TDataSource
    DataSet = ods_avto
    Left = 120
    Top = 224
  end
end
