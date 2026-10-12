object CourtFrm: TCourtFrm
  Left = 0
  Top = 0
  Caption = 'CourtFrm'
  ClientHeight = 594
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 113
    Height = 13
    Caption = 'Verilmi'#351' iddian'#305'n m'#601'bl'#601#287'i'
  end
  object Label2: TLabel
    Left = 16
    Top = 78
    Width = 72
    Height = 13
    Caption = 'H'#252'quqi statusu'
  end
  object Label3: TLabel
    Left = 16
    Top = 121
    Width = 117
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305'n tarixi'
  end
  object Label4: TLabel
    Left = 270
    Top = 32
    Width = 219
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305' q'#601'bul ed'#601'n m'#601'hk'#601'm'#601'nin ad'#305
  end
  object Label5: TLabel
    Left = 270
    Top = 78
    Width = 156
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305'n icra v'#601'ziyy'#601'ti'
  end
  object Label6: TLabel
    Left = 104
    Top = 217
    Width = 138
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305'n m'#601'zmunu'
  end
  object Label7: TLabel
    Left = 270
    Top = 121
    Width = 244
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305'n icras'#305' il'#601' ba'#287'l'#305' g'#246'r'#252'lm'#252#351' t'#601'dbirl'#601'r'
  end
  object Label8: TLabel
    Left = 536
    Top = 32
    Width = 320
    Height = 13
    Caption = 'Borc '#601'v'#601'zin'#601' m'#252'lkiyy'#601't'#601' v'#601' ya balansa g'#246't'#252'r'#252'lm'#252#351' '#601'mlaklar bar'#601'd'#601
    WordWrap = True
  end
  object Label9: TLabel
    Left = 536
    Top = 78
    Width = 59
    Height = 13
    Caption = #399'mlak'#305'n say'#305
  end
  object Label10: TLabel
    Left = 536
    Top = 121
    Width = 175
    Height = 13
    Caption = #304'stintaq orqanlar'#305'na m'#252'raci'#601't olunma'
  end
  object Label11: TLabel
    Left = 589
    Top = 217
    Width = 26
    Height = 13
    Caption = 'Qeyd'
  end
  object Label12: TLabel
    Left = 16
    Top = 167
    Width = 200
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'nda t'#601'sdiq edilmi'#351' m'#601'bl'#601#287' '
  end
  object Label13: TLabel
    Left = 536
    Top = 167
    Width = 225
    Height = 13
    Caption = 'M'#601'hk'#601'm'#601' q'#601'rar'#305'n'#305' icra ed'#601'n icra qurumunun ad'#305
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 51
    Width = 193
    Height = 21
    DataField = 'COURT_AMMOUNT'
    DataSource = Data_main_one
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 97
    Width = 193
    Height = 21
    DataField = 'COURT_STATUS'
    DataSource = DataMod.Data_main_one
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 270
    Top = 97
    Width = 193
    Height = 21
    DataField = 'COURT_LASTSTAT'
    DataSource = DataMod.Data_main_one
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 270
    Top = 51
    Width = 193
    Height = 21
    DataField = 'COURT_NAME'
    DataSource = DataMod.Data_main_one
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 16
    Top = 140
    Width = 193
    Height = 21
    DataField = 'COURT_DATE_NUM'
    DataSource = DataMod.Data_main_one
    TabOrder = 4
  end
  object DBRichEdit1: TDBRichEdit
    Left = 8
    Top = 236
    Width = 376
    Height = 305
    DataField = 'COURT_DESC'
    DataSource = DataMod.Data_main_one
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 536
    Top = 51
    Width = 193
    Height = 21
    DataField = 'COURT_REPLACE'
    DataSource = DataMod.Data_main_one
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 536
    Top = 97
    Width = 193
    Height = 21
    DataField = 'REPLACEMENT_COUNT'
    DataSource = DataMod.Data_main_one
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 536
    Top = 140
    Width = 193
    Height = 21
    DataField = 'INVESTIGATION_ORG'
    DataSource = DataMod.Data_main_one
    TabOrder = 8
  end
  object DBRichEdit2: TDBRichEdit
    Left = 400
    Top = 236
    Width = 376
    Height = 305
    DataField = 'INFOS'
    DataSource = DataMod.Data_main_one
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Button3: TButton
    Left = 688
    Top = 561
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 607
    Top = 561
    Width = 75
    Height = 25
    Caption = 'Yadda Saxla'
    TabOrder = 11
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 526
    Top = 561
    Width = 75
    Height = 25
    Caption = 'Yeni'
    TabOrder = 12
    OnClick = Button1Click
  end
  object DBEdit10: TDBEdit
    Left = 16
    Top = 186
    Width = 193
    Height = 21
    DataField = 'court_accepted_ammount'
    DataSource = DataMod.Data_main_one
    TabOrder = 13
  end
  object DBMemo1: TDBMemo
    Left = 270
    Top = 140
    Width = 193
    Height = 67
    DataField = 'COURT_MEASURE'
    DataSource = DataMod.Data_main_one
    TabOrder = 14
  end
  object DBEdit6: TDBEdit
    Left = 536
    Top = 186
    Width = 193
    Height = 21
    DataField = 'COURT_MANAGE'
    DataSource = DataMod.Data_main_one
    TabOrder = 15
  end
  object Maincrpt_one: TOracleDataSet
    SQL.Strings = (
      'select  crts.rowid,crts.* from accepted_cr_courts crts'
      'where crts.id=:prts'
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
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500052005400530004000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000001400000004000000490044000100000000001A00000043004F005500
      520054005F0041004D004D004F0055004E005400010000000000180000004300
      4F005500520054005F005300540041005400550053000100000000001C000000
      43004F005500520054005F0044004100540045005F004E0055004D0001000000
      00001400000043004F005500520054005F004E0041004D004500010000000000
      2C00000043004F005500520054005F0041004300430045005000540045004400
      5F0041004D004D004F0055004E0054000100000000001400000043004F005500
      520054005F0044004500530043000100000000001800000043004F0055005200
      54005F004D0041004E004100470045000100000000001C00000043004F005500
      520054005F004C0041005300540053005400410054000100000000001A000000
      43004F005500520054005F004D00450041005300550052004500010000000000
      1A00000043004F005500520054005F005200450050004C004100430045000100
      00000000220000005200450050004C004100430045004D0045004E0054005F00
      43004F0055004E0054000100000000002200000049004E005600450053005400
      490047004100540049004F004E005F004F00520047000100000000000A000000
      49004E0046004F00530001000000000010000000500052004F00500045005200
      5400590001000000000012000000500052004F0050005F004400450053004300
      01000000000018000000500052004F0050005F00410044004400520045005300
      53000100000000001A00000050004F00520050005F0050004100530053005000
      4F005200540001000000000014000000500052004F0050005F00500052004900
      4300450001000000000012000000500052004F0050005F0049004E0046004F00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 816
    Top = 192
    object Maincrpt_oneID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Maincrpt_oneCOURT_AMMOUNT: TWideStringField
      FieldName = 'COURT_AMMOUNT'
      Size = 4000
    end
    object Maincrpt_oneCOURT_STATUS: TWideStringField
      FieldName = 'COURT_STATUS'
      Size = 4000
    end
    object Maincrpt_oneCOURT_DATE_NUM: TWideStringField
      FieldName = 'COURT_DATE_NUM'
      Size = 4000
    end
    object Maincrpt_oneCOURT_NAME: TWideStringField
      FieldName = 'COURT_NAME'
      Size = 4000
    end
    object Maincrpt_oneCOURT_ACCEPTED_AMMOUNT: TWideStringField
      FieldName = 'COURT_ACCEPTED_AMMOUNT'
      Size = 4000
    end
    object Maincrpt_oneCOURT_DESC: TWideStringField
      FieldName = 'COURT_DESC'
      Size = 4000
    end
    object Maincrpt_oneCOURT_MANAGE: TWideStringField
      FieldName = 'COURT_MANAGE'
      Size = 4000
    end
    object Maincrpt_oneCOURT_LASTSTAT: TWideStringField
      FieldName = 'COURT_LASTSTAT'
      Size = 4000
    end
    object Maincrpt_oneCOURT_MEASURE: TWideStringField
      FieldName = 'COURT_MEASURE'
      Size = 4000
    end
    object Maincrpt_oneCOURT_REPLACE: TWideStringField
      FieldName = 'COURT_REPLACE'
      Size = 4000
    end
    object Maincrpt_oneREPLACEMENT_COUNT: TWideStringField
      FieldName = 'REPLACEMENT_COUNT'
      Size = 4000
    end
    object Maincrpt_oneINVESTIGATION_ORG: TWideStringField
      FieldName = 'INVESTIGATION_ORG'
      Size = 4000
    end
    object Maincrpt_oneINFOS: TWideStringField
      FieldName = 'INFOS'
      Size = 4000
    end
    object Maincrpt_onePROPERTY: TWideStringField
      FieldName = 'PROPERTY'
      Size = 4000
    end
    object Maincrpt_onePROP_DESC: TWideStringField
      FieldName = 'PROP_DESC'
      Size = 4000
    end
    object Maincrpt_onePROP_ADDRESS: TWideStringField
      FieldName = 'PROP_ADDRESS'
      Size = 4000
    end
    object Maincrpt_onePORP_PASSPORT: TWideStringField
      FieldName = 'PORP_PASSPORT'
      Size = 4000
    end
    object Maincrpt_onePROP_PRICE: TWideStringField
      FieldName = 'PROP_PRICE'
      Size = 4000
    end
    object Maincrpt_onePROP_INFO: TWideMemoField
      FieldName = 'PROP_INFO'
      BlobType = ftWideMemo
    end
  end
  object Data_main_one: TDataSource
    DataSet = Maincrpt_one
    Left = 816
    Top = 248
  end
end
