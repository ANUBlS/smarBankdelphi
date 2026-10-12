object OutForm: TOutForm
  Left = 615
  Top = 320
  BorderStyle = bsDialog
  Caption = 'P_OutForm'
  ClientHeight = 391
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 658
    Height = 125
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 654
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          Text = 'ƒ≈Ѕ≈“'
          Width = 327
        end
        item
          ImageIndex = -1
          Text = ' –≈ƒ»“'
          Width = 360
        end>
      Style = hsFlat
    end
    object Panel1: TPanel
      Left = 2
      Top = 32
      Width = 326
      Height = 92
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
          end
          object d_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'd_ostat'
            Visible = False
          end
          object d_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'd_pok_ostat'
            Visible = False
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 321
          Height = 21
          Enabled = False
          KeyField = 'NAME'
          ListField = 'NAME'
          TabOrder = 0
          OnClick = DBLookupComboBox1Click
        end
        object DBEdit1: TDBEdit
          Left = 0
          Top = 0
          Width = 301
          Height = 21
          Color = clSilver
          DataField = 'NAME'
          Enabled = False
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 168
          Top = 0
          Width = 153
          Height = 21
          Enabled = False
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          ListSource = DebitAccs
          TabOrder = 0
          OnClick = DBLookupComboBox2Click
        end
        object DBEdit2: TDBEdit
          Left = 169
          Top = 0
          Width = 133
          Height = 21
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = DebitAccs
          Enabled = False
          TabOrder = 1
        end
        object DebtAccSearchEdit: TSearchEdit
          Left = 0
          Top = 0
          Width = 169
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = DebtAccSearchEditChange
          DataSource = DebitAccs
          SearchField = 'acc_no'
        end
        object acc_id_: TEdit
          Left = 80
          Top = 0
          Width = 88
          Height = 21
          TabStop = False
          TabOrder = 3
          Visible = False
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object ValCode: TEdit
          Left = 0
          Top = 0
          Width = 81
          Height = 21
          Enabled = False
          TabOrder = 0
          OnChange = ValCodeChange
        end
        object editvalute: TComboBox
          Left = 80
          Top = 0
          Width = 145
          Height = 21
          Color = clSilver
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          OnChange = editvaluteChange
        end
        object editrate: TEdit
          Left = 223
          Top = 0
          Width = 95
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 2
          Text = '1'
        end
      end
    end
    object Panel2: TPanel
      Left = 329
      Top = 33
      Width = 326
      Height = 92
      BevelInner = bvLowered
      TabOrder = 2
      object Panel7: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
          end
          object c_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'c_ostat'
          end
          object c_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'c_pok_ostat'
          end
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 321
          Height = 21
          TabOrder = 0
          OnClick = DBLookupComboBox3Click
        end
        object DBEdit3: TDBEdit
          Left = 0
          Top = 0
          Width = 305
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 1
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 157
          Top = 0
          Width = 165
          Height = 21
          Enabled = False
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          ListSource = CreditAccs
          TabOrder = 0
          OnClick = DBLookupComboBox4Click
        end
        object DBEdit5: TDBEdit
          Left = 159
          Top = 0
          Width = 144
          Height = 21
          Color = clSilver
          DataSource = CreditAccs
          Enabled = False
          TabOrder = 1
        end
        object CreditAccSearchEdit: TSearchEdit
          Left = 0
          Top = 0
          Width = 159
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = CreditAccSearchEditChange
          DataSource = CreditAccs
          SearchField = 'acc_no'
        end
        object acc_id: TEdit
          Left = 80
          Top = 0
          Width = 73
          Height = 21
          TabOrder = 3
          Visible = False
          OnChange = acc_idChange
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object ValCode_: TEdit
          Left = 0
          Top = 0
          Width = 77
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = '0'
          OnChange = ValCode_Change
        end
        object editvalute_: TComboBox
          Left = 79
          Top = 0
          Width = 149
          Height = 21
          Color = clSilver
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          OnChange = editvalute_Change
        end
        object editrate_: TEdit
          Left = 226
          Top = 0
          Width = 93
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 2
          Text = '1'
        end
        object Edit1: TEdit
          Left = 88
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 3
          Text = 'Edit1'
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 658
    Height = 64
    Align = alTop
    Caption = 'ћ€бл€ьл€р'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'ƒебет м€бл€ь'
      TabOrder = 0
      object DebtValue: TCurrencyEdit
        Tag = 1
        Left = 79
        Top = 2
        Width = 241
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = DebtValueChange
        OnKeyPress = DebtValueKeyPress
      end
    end
    object Panel12: TPanel
      Left = 328
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  редит м€бл€ь'
      TabOrder = 1
      object CreditValue: TCurrencyEdit
        Tag = 2
        Left = 80
        Top = 0
        Width = 241
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = DebtValueChange
        OnKeyPress = CreditValueKeyPress
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 38
      Width = 652
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' ћилли валйутада еквивалент'
      TabOrder = 2
      object Ekv: TCurrencyEdit
        Tag = 3
        Left = 196
        Top = 1
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = '0'
        OnChange = DebtValueChange
        OnKeyPress = EkvKeyPress
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 219
    Width = 658
    Height = 64
    Align = alTop
    Caption = 'ћ€луматлар'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  онвертасийа т€йинаты'
      TabOrder = 1
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = CO_DataMod.ConvertationSymbolsData
        TabOrder = 0
        TabStop = False
        OnCloseUp = ConvertationSymbolLookUpCloseUp
      end
      object SearchEdit2: TSearchEdit
        Left = 118
        Top = 0
        Width = 73
        Height = 21
        TabOrder = 1
        OnChange = SearchEdit2Change
        DataSource = CO_DataMod.ConvertationSymbolsData
        SearchField = 'ID'
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  асса символу'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        ListSource = CO_DataMod.CashSymbolsData
        TabOrder = 0
        TabStop = False
        OnCloseUp = CashSymbolLookUpCloseUp
        OnEnter = SearchEdit3Enter
      end
      object SearchEdit3: TSearchEdit
        Left = 118
        Top = 0
        Width = 72
        Height = 21
        TabOrder = 1
        OnChange = SearchEdit3Change
        OnEnter = SearchEdit3Enter
        DataSource = CO_DataMod.CashSymbolsData
        SearchField = 'SYMBOL'
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 282
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' ям€лиййатын т€йинаты'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 194
      Top = 0
      Width = 460
      Height = 21
      KeyField = 'NAME'
      ListField = 'NAME'
      ListSource = CO_DataMod.Trdestinationdata
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 195
      Top = 0
      Width = 441
      Height = 21
      DataField = 'NAME'
      DataSource = CO_DataMod.Trdestinationdata
      TabOrder = 1
    end
    object SearchEdit1: TSearchEdit
      Left = 120
      Top = 0
      Width = 74
      Height = 21
      TabOrder = 2
      DataSource = CO_DataMod.Trdestinationdata
      SearchField = 'id'
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 658
    Height = 30
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 77
      Height = 13
      Caption = 'ям€лиййатын тарихи'
    end
    object Label6: TLabel
      Left = 216
      Top = 9
      Width = 67
      Height = 13
      Caption = 'ям€лиййатын є'
    end
    object Label7: TLabel
      Left = 383
      Top = 9
      Width = 61
      Height = 13
      Caption = 'ям€лиййат типи'
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 38125.6610020023
      Time = 38125.6610020023
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DBEditOperationNo: TDBEdit
      Left = 287
      Top = 7
      Width = 78
      Height = 21
      DataField = 'OPERATIONNO'
      Enabled = False
      TabOrder = 1
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 504
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'NAME'
      ListField = 'NAME'
      TabOrder = 2
    end
    object DBEdit9: TDBEdit
      Left = 505
      Top = 8
      Width = 127
      Height = 21
      DataField = 'NAME'
      Enabled = False
      TabOrder = 3
    end
    object SearchEdit4: TSearchEdit
      Left = 448
      Top = 8
      Width = 56
      Height = 21
      Enabled = False
      TabOrder = 4
      SearchField = 'ID'
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 356
    Width = 658
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object ButtonApply: TButton
      Left = 421
      Top = 4
      Width = 75
      Height = 25
      Caption = '&√€бул'
      TabOrder = 0
      OnClick = ButtonApplyClick
    end
    object ButtonCancel: TButton
      Left = 501
      Top = 4
      Width = 75
      Height = 25
      Caption = '&»мтина'
      Enabled = False
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
    object ButtonClose: TButton
      Left = 581
      Top = 4
      Width = 75
      Height = 25
      Caption = '„ыхыш'
      TabOrder = 2
      OnClick = ButtonCloseClick
    end
    object Button1: TButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = '“ам йенил€'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object commission_id: TEdit
    Left = 40
    Top = 305
    Width = 121
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object Panel19: TPanel
    Left = 0
    Top = 328
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' ёлк€'
    TabOrder = 7
    object CountrIDDBEdit: TEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 21
      TabOrder = 0
      OnChange = CountrIDDBEditChange
    end
    object CountrIDLookUp: TDBLookupComboBox
      Left = 194
      Top = 1
      Width = 462
      Height = 21
      DataField = 'COUNTRID'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CO_DataMod.CntriesData
      TabOrder = 1
      OnCloseUp = CountrIDLookUpCloseUp
    end
  end
  object Panel18: TPanel
    Left = 0
    Top = 305
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' Hesabатын т€йинаты'
    TabOrder = 8
    object ReportIDDBEdit: TEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 21
      TabOrder = 0
      OnChange = ReportIDDBEditChange
    end
    object ReportIDLookUp: TDBLookupComboBox
      Left = 194
      Top = 1
      Width = 462
      Height = 21
      DataField = 'REPORTID'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CO_DataMod.ReportDescsData
      TabOrder = 1
      OnCloseUp = ReportIDLookUpCloseUp
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 184
    Top = 306
  end
  object DebitAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      'ORDER BY ACC_NO'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000060000004143435F4E4F0100
      000000000700000056414C5F414343010000000000040000004E414D45010000
      0000000E000000495343414348454143434F554E54010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 79
    Top = 37
    object DebitAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebitAccDataACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object DebitAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object DebitAccDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object DebitAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
  end
  object DebitAccs: TDataSource
    DataSet = DebitAccData
    Left = 114
    Top = 37
  end
  object CreditAccs: TDataSource
    DataSet = CreditAccData
    Left = 114
    Top = 69
  end
  object CreditAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE  '
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      ''
      'ORDER BY ACC_NO')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000060000004143435F4E4F0100
      000000000700000056414C5F414343010000000000040000004E414D45010000
      0000000E000000495343414348454143434F554E54010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 82
    Top = 61
    object CreditAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditAccDataACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object CreditAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object CreditAccDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CreditAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
  end
end
