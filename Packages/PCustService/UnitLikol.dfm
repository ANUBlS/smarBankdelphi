object FormLikol: TFormLikol
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 326
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 285
    Align = alClient
    TabOrder = 0
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Tarix :'
      TabOrder = 0
      object DateTimePicker1: TDateTimePicker
        Left = 128
        Top = 7
        Width = 163
        Height = 21
        Date = 43641.476735543980000000
        Time = 43641.476735543980000000
        TabOrder = 0
        OnKeyPress = DateTimePicker1KeyPress
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 36
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Avtomobiliin '#8470' :'
      TabOrder = 1
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 128
        Top = 8
        Width = 163
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACCNO'
        ListSource = DataSource1
        TabOrder = 0
        Visible = True
        OnCloseUp = DBLookupComboboxEh1CloseUp
      end
      object Edit1: TEdit
        Left = 128
        Top = 8
        Width = 144
        Height = 21
        Enabled = False
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 106
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  YDM  '#8470' :'
      TabOrder = 2
      object Edit2: TEdit
        Left = 128
        Top = 8
        Width = 163
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit2KeyPress
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 141
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Region :'
      TabOrder = 3
      object Edit3: TEdit
        Left = 128
        Top = 8
        Width = 163
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit3KeyPress
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 176
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Yanacaq'#305'n tipi :'
      TabOrder = 4
      object Edit4: TEdit
        Left = 128
        Top = 8
        Width = 163
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit4KeyPress
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 211
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  1 L  qiym'#601'ti  :                                    Litr:'
      TabOrder = 5
      object CurrencyEdit2: TCurrencyEdit
        Left = 201
        Top = 6
        Width = 90
        Height = 21
        TabOrder = 1
        Text = '0'
        OnChange = CurrencyEdit2Change
        OnClick = CurrencyEdit2Click
        OnKeyPress = CurrencyEdit2KeyPress
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 76
        Top = 6
        Width = 90
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEdit1Change
        OnClick = CurrencyEdit1Click
        OnKeyPress = CurrencyEdit1KeyPress
      end
    end
    object Panel16: TPanel
      Left = 1
      Top = 246
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BiDiMode = bdLeftToRight
      Caption = '                    M'#601'bl'#601#287'  :'
      ParentBiDiMode = False
      TabOrder = 6
      object EditAmount: TCurrencyEdit
        Left = 128
        Top = 6
        Width = 120
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = '0'
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 71
      Width = 350
      Height = 35
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Yanacq  '#8470' :'
      TabOrder = 7
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 128
        Top = 8
        Width = 163
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataSource2
        TabOrder = 0
        Visible = True
        OnCloseUp = DBLookupComboboxEh2CloseUp
      end
      object Edit7: TEdit
        Left = 128
        Top = 8
        Width = 144
        Height = 21
        Enabled = False
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 285
    Width = 352
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 95
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 174
      Top = 8
      Width = 95
      Height = 25
      Caption = 'Yeni  '#399'm'#601'liyyat'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select id,kli_id,acc_no ,substr(acc_no,10,7) accno from account ' +
        'where close_dat is null and bal_cn1 in('#39'531'#39','#39'535'#39') and kli_id=:' +
        'v_kliid'
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
      0400000001000000100000003A0056005F004B004C0049004900440003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000C0000004100430043005F004E004F0001000000
      00000A0000004100430043004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 96
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1KLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object OracleDataSet1ACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object OracleDataSet1ACCNO: TWideStringField
      FieldName = 'ACCNO'
      Size = 112
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 296
    Top = 152
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      
        'select id,kli_id,acc_no  from account where close_dat is null an' +
        'd bal_cn1='#39'721'#39' '
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
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000C0000004100430043005F004E004F0001000000
      00000A0000004100430043004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 32
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'KLI_ID'
    end
    object WideStringField1: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 72
    Top = 120
  end
end
