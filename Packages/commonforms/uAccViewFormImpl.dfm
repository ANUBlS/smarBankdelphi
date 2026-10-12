object frmAccInfo: TfrmAccInfo
  Left = 282
  Top = 306
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 248
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    650
    248)
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 0
    Top = 116
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1052#1094#1096#1090#1103#1088#1080
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 338
    Top = 13
    Width = 66
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1072#1093#1080#1083' '#1077#1076#1103#1085
    FocusControl = DBEdit4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 0
    Top = 13
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1065#1077#1089#1072#1073' '#8470
    FocusControl = DBEdit5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 0
    Top = 82
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1072#1083#1081#1091#1090#1072
    FocusControl = DBEdit6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 0
    Top = 185
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1040#1076#1099
    FocusControl = DBEdit8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 0
    Top = 47
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
    FocusControl = DBEdit9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 0
    Top = 151
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099
    FocusControl = DBEdit10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 342
    Top = 82
    Width = 60
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1060#1080#1083#1080#1072#1083
    FocusControl = DBEdit11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 0
    Top = 220
    Width = 87
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1040#1085#1072#1083#1080#1090#1080#1082' '#1082#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 220
    Top = 47
    Width = 59
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1057#1080#1084#1074#1086#1083#1083#1072#1088
    FocusControl = DBEdit15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 426
    Top = 47
    Width = 54
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1051#1080#1084#1080#1090
    FocusControl = DBEdit16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit2: TDBEdit
    Left = 90
    Top = 112
    Width = 53
    Height = 22
    Color = clBtnFace
    DataField = 'KLI_ID'
    DataSource = acc
    TabOrder = 10
  end
  object DBEdit3: TDBEdit
    Left = 151
    Top = 112
    Width = 494
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'CUSTNAME'
    DataSource = acc
    TabOrder = 11
  end
  object DBEdit4: TDBEdit
    Left = 409
    Top = 9
    Width = 236
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'USNAME'
    DataSource = acc
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 90
    Top = 9
    Width = 243
    Height = 22
    Color = clBtnFace
    DataField = 'ACC_NO'
    DataSource = acc
    TabOrder = 1
  end
  object DBEdit6: TDBEdit
    Left = 90
    Top = 78
    Width = 53
    Height = 22
    Color = clBtnFace
    DataField = 'VAL_ACC'
    DataSource = acc
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 151
    Top = 78
    Width = 156
    Height = 22
    Color = clBtnFace
    DataField = 'VALU_NAME'
    DataSource = acc
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 90
    Top = 181
    Width = 555
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'NAME'
    DataSource = acc
    TabOrder = 12
  end
  object DBEdit9: TDBEdit
    Left = 90
    Top = 43
    Width = 121
    Height = 22
    Color = clBtnFace
    DataField = 'OPEN_DAT'
    DataSource = acc
    TabOrder = 3
  end
  object DBEdit10: TDBEdit
    Left = 90
    Top = 146
    Width = 53
    Height = 22
    Color = clBtnFace
    DataField = 'BAL_CN1'
    DataSource = acc
    TabOrder = 13
  end
  object DBEdit11: TDBEdit
    Left = 409
    Top = 78
    Width = 69
    Height = 22
    Color = clBtnFace
    DataField = 'FID'
    DataSource = acc
    TabOrder = 8
  end
  object DBEdit12: TDBEdit
    Left = 487
    Top = 78
    Width = 158
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'FILIALNAME'
    DataSource = acc
    TabOrder = 9
  end
  object DBEdit14: TDBEdit
    Left = 90
    Top = 215
    Width = 213
    Height = 22
    Color = clBtnFace
    DataField = 'REPSYMB'
    DataSource = acc
    TabOrder = 15
  end
  object DBEdit15: TDBEdit
    Left = 289
    Top = 43
    Width = 120
    Height = 22
    Color = clBtnFace
    DataField = 'TIPACC'
    DataSource = acc
    TabOrder = 4
  end
  object DBEdit16: TDBEdit
    Left = 487
    Top = 43
    Width = 151
    Height = 22
    Color = clBtnFace
    DataField = 'LIMIT'
    DataSource = acc
    TabOrder = 5
  end
  object DBEdit17: TDBEdit
    Left = 151
    Top = 146
    Width = 494
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'BALNAME'
    DataSource = acc
    TabOrder = 14
  end
  object Button1: TButton
    Left = 564
    Top = 215
    Width = 81
    Height = 27
    Caption = #1041#1072#1100#1083#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object odsAcc: TOracleDataSet
    SQL.Strings = (
      
        'select a.id, kli_id, c.name custname, sb_aca.getuserbyid (a.op_i' +
        'd) usname,'
      
        '       acc_no, val_acc, v.valu_name, a.name, a.open_dat, bal_cn1' +
        ', f.id fid,'
      
        '       f.name filialname, sim_otcet, r.name repsymb, tipacc, a.l' +
        'imit, b.balname'
      
        '  from account a, customers c, avalute v, filial_t f, report_sym' +
        'bol r, bal_spr1 b'
      ' where a.kli_id = c.id'
      '   and a.val_acc = v.valute'
      '   and filial = f.id'
      '   and r.id(+) = sim_otcet'
      '   and bal_cn1=bal_cn'
      '   and a.id=:accid'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00410043004300490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000001100000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000001000000043005500530054004E0041004D004500
      0100000000000C000000550053004E0041004D0045000100000000000C000000
      4100430043005F004E004F000100000000000E000000560041004C005F004100
      4300430001000000000012000000560041004C0055005F004E0041004D004500
      010000000000080000004E0041004D004500010000000000100000004F005000
      45004E005F004400410054000100000000000E000000420041004C005F004300
      4E00310001000000000014000000460049004C00490041004C004E0041004D00
      450001000000000012000000530049004D005F004F0054004300450054000100
      000000000E000000520045005000530059004D0042000100000000000C000000
      5400490050004100430043000100000000000A0000004C0049004D0049005400
      010000000000060000004600490044000100000000000E000000420041004C00
      4E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 96
    object odsAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsAccKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object odsAccCUSTNAME: TWideStringField
      FieldName = 'CUSTNAME'
      Size = 90
    end
    object odsAccUSNAME: TWideStringField
      FieldName = 'USNAME'
      Size = 4000
    end
    object odsAccACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object odsAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object odsAccVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object odsAccNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object odsAccOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object odsAccBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object odsAccFID: TFloatField
      FieldName = 'FID'
      Required = True
    end
    object odsAccFILIALNAME: TWideStringField
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object odsAccSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object odsAccREPSYMB: TWideStringField
      FieldName = 'REPSYMB'
      Size = 256
    end
    object odsAccTIPACC: TWideStringField
      FieldName = 'TIPACC'
    end
    object odsAccLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object odsAccBALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object acc: TDataSource
    DataSet = odsAcc
    Left = 24
    Top = 96
  end
end
